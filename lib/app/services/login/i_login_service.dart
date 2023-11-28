abstract class ILoginService {

  Future<void> execute({
    required String email,
    required String password,
  });
}