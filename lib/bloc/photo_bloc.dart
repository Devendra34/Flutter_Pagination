
import 'package:pagination/models/photo.dart';
import 'package:pagination/models/photos.dart';
import 'package:pagination/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PhotosBloc {

  final _repository = Repository();
  final _photosFetcher = PublishSubject<Photos>();

  final _photoList = List<Photo>();


  Observable<Photos> get photos => _photosFetcher.stream;

  fetchPhotos(int page) async {
    Photos itemModel = await _repository.fetchPhotos(page);
    _photoList.addAll(itemModel.photo);
    itemModel.photo = _photoList;
    _photosFetcher.sink.add(itemModel);
  }

  dispose() {
    _photosFetcher.close();
  }

}

final bloc = PhotosBloc();
