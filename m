Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E56071
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 09:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25C0C6144A;
	Fri, 23 Apr 2021 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619169026;
	bh=T1FMrfZRjJR2z6yAggNFi78L9C7Xe8lmTb8JsXewe74=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Je8HKpz+8jxYnnmSDqVuEvtNDYiVtacU1EDMWcIABO6KSObG6+UnCwpyTa1X0TlG9
	 J3qTfI+/HQaOtB6USoujzpRuWfU1YGV0ienWpO5vDa7Pn4ySWRup2ciZDvy/Cz6X6G
	 dy11veKr08XhJEjP9m+S/Rj0KdrTkUaDXmcs01y4hrYQygdsOq74exhTVD83DnPIba
	 uRRiktp+A+5I23uv0NSudaoIpNrJ4/D5I+DyIuj0/h5QQf4hI+i7vWoOCZaRZo7rDn
	 zr2hirRr1gCFVjZE94G0ndW3un0ei3JactiTeev8YNZk5mNcsmyZyvvnCMqVAVe2DW
	 1tvqG7JuCgh9Q==
Message-ID: <66c1f2bc615d5c40ba129d54e05bf7d785851b68.camel@kernel.org>
Subject: Re: [PATCH 02/10] staging: vchiq_core: break early in
 vchiq_close_service_internal
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Date: Fri, 23 Apr 2021 11:10:22 +0200
In-Reply-To: <1619122076-31785-3-git-send-email-stefan.wahren@i2se.com>
References: <1619122076-31785-1-git-send-email-stefan.wahren@i2se.com>
	 <1619122076-31785-3-git-send-email-stefan.wahren@i2se.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RwTyxXl/DtAukT84Uxtk"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-RwTyxXl/DtAukT84Uxtk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-04-22 at 22:07 +0200, Stefan Wahren wrote:
> The logic in VCHIQ_SRVSTATE_OPEN* is unnecessary complex. Handle the erro=
r
> case of queue_message() first makes it easier to read.
>=20
> Btw we get the rid of the checkpatch warning:
> WARNING: else is not generally useful after a break or return
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks!
Nicolas

--=-RwTyxXl/DtAukT84Uxtk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQFGBAABCAAwFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmCCjv4SHG5zYWVuekBr
ZXJuZWwub3JnAAoJEJX2Zh56PMf+Mv0H/1JqB2nvoTwPMxjMo26r7fV0anHuV3/0
McPa9O+5gEYvrrb060UsAdCGzzk8nwcE0fIL2nzWLdKhtcfjkdtnVZ8YLPAcpC3F
Z1BnOadncx3hNnX3XcrFRL8bvrVUYRzUJRvUy3mtbGTGD+aaev8NpuhgBGGiD818
OpVSJRDcvyFSUvf8UgBs8swUptOqU4nD3VRf8JIaFRfwv1c6xX7dERK8V+b6d4gx
rgr41PiwM8hkQgBoryb+FPYS8MmaglpZnpaYcxFhbLkhKsdxJr4XsKDEy1KYOYlT
+LRHXcwmjuEzYvYCcHVA02LlsION38d2qn+gYG3DWyBKp6NoB0BtFeA=
=MWgH
-----END PGP SIGNATURE-----

--=-RwTyxXl/DtAukT84Uxtk--

