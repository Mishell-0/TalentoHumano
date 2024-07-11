function changeEstado(id) {
    if (confirm("¿Está seguro que desea cambiar el estado?")) {
        $.ajax({
            url: cambiarEstadoUrl,
            type: 'POST',
            data: { id: id },
            success: function () {
                location.reload(); // Recargar la página después de cambiar el estado
            },
            error: function () {
                alert('Error al cambiar el estado.');
            }
        });
    }
}
