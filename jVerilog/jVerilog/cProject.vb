Public Class cProject
    Private mName As String
    Private mLocation As String
    Private mFiles As List(Of String)

    Sub New(ByVal Name As String, ByVal Location As String)
        mName = Name
        mLocation = Location
    End Sub

    Public Property Name As String
        Get
            Return mName
        End Get
        Set(ByVal value As String)
            mName = value
        End Set
    End Property

    Public Property Location As String
        Get
            Return mLocation
        End Get
        Set(ByVal value As String)
            mLocation = value
        End Set
    End Property


End Class
