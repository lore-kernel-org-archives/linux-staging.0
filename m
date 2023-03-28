Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD3A21;
	Tue, 28 Mar 2023 03:27:36 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id o11so10409483ple.1;
        Mon, 27 Mar 2023 20:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679974056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qEOnn9V+haHpi4gx9r41dBqurJXahLxYuWxGui8I4M=;
        b=RAey/ZPZPborfJl/AjwFJMjM2GqtkqXGLsvi/VjmJO7EdUrXpV5clalfKPwLT+Mxe0
         px0Q2FlPIwP+lD3QzjW+7Fdo/8VrYDcymIJeRRkrJbXHvaY8QGNRoDQW2oXb2i3ZTGRh
         cmUcTdka0wybcvWjMrE/1QWhSz4+5Oe4lpEiBcTYmRYtPlcOh5pNlPFQlu76r3BWLgOj
         o0mErqQEEQlYfMvuX8F1H2gjTTZyHXS1Zr0BeR6e3DnqoGJyKwlsGYIAVp4lrKJHqHWA
         6me7U6ItP0dwpWV72Cve+P+YvIh2eg209AKtiIEckrNd2l0bXKq06yETMvDboSMJTd8f
         TXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679974056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qEOnn9V+haHpi4gx9r41dBqurJXahLxYuWxGui8I4M=;
        b=hWR2RHzsqST5iwDgPBGdYvPr11vuR8uZp7LEALt+SXVejgoGed86nzW1+dCYfJ7HzR
         1JzWqWv50ADrKK8FuU/TTPBz74yBjWdZgkjo1PPjXdYdhOhzayKnYJc1Jg2UfdghWPe0
         kChrl6XdywmUyssp3RVFFDhl6A4aQ6TQMJwRDlZBe3W7hNJ5Q24+Mo4RsoNJTfCTqZxg
         7DXgeoeAA1GD5DpTn3VR0Ihl2D3a6+3SMSStPzWO8G+u/Go+zGOyfjGj1B0fUc6RCxzH
         p9usi090FFF8IR0aLyqVgy8IUbcNTgXHSSRxHByby4poDyApYss+sUiNxzc9F0d/S5La
         qlyg==
X-Gm-Message-State: AAQBX9e/gmqJ6uhtLgwZPYz282eGdXqLZVHaZMXaYkdcM5B+FkWoUSyT
	spQJnrQf1jfwoKeVHyNj9DA=
X-Google-Smtp-Source: AKy350akeDbsY5HRhIcTm9Wx7fIPF3lZ5L64NaLgHXTfzUxG81amG4sBIHf8OcE7sNJ8wRJZRyKDeg==
X-Received: by 2002:a17:902:c952:b0:1a2:22df:8597 with SMTP id i18-20020a170902c95200b001a222df8597mr15425422pla.57.1679974055863;
        Mon, 27 Mar 2023 20:27:35 -0700 (PDT)
Received: from debian.me (subs10b-223-255-225-224.three.co.id. [223.255.225.224])
        by smtp.gmail.com with ESMTPSA id jl1-20020a170903134100b0019cc3d0e1basm19845850plb.112.2023.03.27.20.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:27:35 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 92B3E10673E; Tue, 28 Mar 2023 10:27:32 +0700 (WIB)
Date: Tue, 28 Mar 2023 10:27:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jerry Chuang <jerry-chuang@realtek.com>
Subject: Re: [PATCH v3 4/4] staging: rtl8192u: add '*/' on separate line in
 block comments
Message-ID: <ZCJepCj9JcOQqp0Z@debian.me>
References: <cover.1679945728.git.kamrankhadijadj@gmail.com>
 <140e0928531e61dc7396271a5b16a6be17514c76.1679945728.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZPiWNrCsQ5A9+mu"
Content-Disposition: inline
In-Reply-To: <140e0928531e61dc7396271a5b16a6be17514c76.1679945728.git.kamrankhadijadj@gmail.com>


--mZPiWNrCsQ5A9+mu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 12:49:09AM +0500, Khadija Kamran wrote:
> Linux kernel coding style uses '*/' on a separate line at the end of
> multi line comments.
>=20
> Fix block comments by moving '*/' at the end of block comments on a
> separate line as reported by checkpatch.pl script.
>=20
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_dm.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl81=
92u/r8192U_dm.c
> index dd9903719c20..cbae852478ea 100644
> --- a/drivers/staging/rtl8192u/r8192U_dm.c
> +++ b/drivers/staging/rtl8192u/r8192U_dm.c
> @@ -244,7 +244,8 @@ void init_rate_adaptive(struct net_device *dev)
>   * Output:		NONE
>   *
>   * Return:		NONE
> - *----------------------------------------------------------------------=
-----*/
> + *----------------------------------------------------------------------=
-----
> + */
> <snipped>...
>  void dm_rf_pathcheck_workitemcallback(struct work_struct *work)
>  {
>  	struct delayed_work *dwork =3D to_delayed_work(work);
> @@ -2407,7 +2413,8 @@ static void dm_rxpath_sel_byrssi(struct net_device =
*dev)
>   * Output:		NONE
>   *
>   * Return:		NONE
> - *----------------------------------------------------------------------=
-----*/
> + *----------------------------------------------------------------------=
-----
> + */

While at above can you please turn these comments above into kernel-doc
comments (see Documentation/doc-guide/kernel-doc.rst for how to write
one)? This requires a placeholder doc where you can write e.g. overview
of the driver and how it is used. The doc should be in
Documentation/driver-api/staging/ (since this is staging driver).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--mZPiWNrCsQ5A9+mu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCJepAAKCRD2uYlJVVFO
o+FQAQDMl/J+gFP+4xNeKSzItnPBFzbnTtJnn2qwy947+Bz2LQEAhnVUn981rPih
2UT0lH6pKJTjVLdzymKa8qwsyvdfcgA=
=g5Rv
-----END PGP SIGNATURE-----

--mZPiWNrCsQ5A9+mu--
