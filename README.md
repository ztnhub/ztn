# Ztn Hub Installation Documentation

This repository contains documentation and scripts for installing and configuring Wireguard VPN.

## About

Wireguard is a modern VPN protocol that is easy to configure and offers high performance and security. This documentation provides step-by-step instructions for installing and setting up Wireguard on various platforms.

## Hugo Documentation Website

//TODO:
The documentation is hosted using Hugo, a fast and flexible static site generator. The Hugo documentation website is located in the "/docs" folder of this repository.

### Installing Hugo

To run the Hugo documentation website locally or build the website, you need to install Hugo. Follow these steps to install Hugo:

1. **Download Hugo**: 
   - Visit the [Hugo Releases](https://github.com/gohugoio/hugo/releases) page.
   - Download the appropriate version of Hugo for your operating system.
   - Extract the downloaded file to a location on your system.

2. **Add Hugo to PATH (optional)**:
   - If you want to use Hugo globally from the command line, add the directory containing the Hugo executable to your system's PATH.

### Running Hugo Documentation Website Locally

After installing Hugo, you can run the Hugo documentation website locally to preview changes or test new content. Follow these steps:

1. **Navigate to the "/docs" folder**:

```bash
cd ./docs
```

2. **Run Hugo server**:

```bash
hugo server
```

3. **View the website**:
Open your web browser and navigate to `http://localhost:1313` to view the Hugo documentation website.

### Building the Hugo Documentation Website

To build the static files for the Hugo documentation website, follow these steps:

1. **Navigate to the "/docs" folder**:

```bash
cd ./docs
```

2. **Build the website**:
    
```bash
hugo ./
```

3. **Static files**:
After running the `hugo` command, the static files for the documentation website will be generated in the "/docs/public" folder.

## Contributing

If you would like to contribute to the documentation or report an issue, please see the [Contributing Guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).