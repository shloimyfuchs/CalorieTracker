import SwiftUI

struct InputBarView: View {
    @Binding var searchText: String
    var isFocused: FocusState<Bool>.Binding
    var onSubmit: () -> Void
    var onCameraTap: () -> Void
    var onMicTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Camera button
            Button(action: onCameraTap) {
                Image(systemName: "camera")
                    .font(.system(size: 18))
                    .foregroundStyle(isFocused.wrappedValue ? .primary : .secondary)
                    .frame(width: 36, height: 36)
            }
            .buttonStyle(.borderless)
            .frame(minWidth: 44, minHeight: 44)
            .accessibilityLabel("Take photo")

            // Text field with mic
            HStack {
                TextField(
                    isFocused.wrappedValue ? "Search a food" : "Log / search",
                    text: $searchText
                )
                .focused(isFocused)
                .submitLabel(.search)
                .onSubmit(onSubmit)

                Button(action: onMicTap) {
                    Image(systemName: "mic")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.borderless)
                .frame(minWidth: 44, minHeight: 44)
                .accessibilityLabel("Voice input")
            }

            // Submit button (visible when focused)
            if isFocused.wrappedValue {
                Button(action: onSubmit) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 36, height: 36)
                        .background(.primary)
                        .clipShape(Circle())
                }
                .frame(minWidth: 44, minHeight: 44)
                .accessibilityLabel("Search")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .glassEffect(.regular.interactive(), in: .capsule)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
