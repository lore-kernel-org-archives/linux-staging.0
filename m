Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D6046AA
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 07:12:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1649747550; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=NgB4J145WK0eAdmQZ6KKPhAtsa67dfOsSoag6jWRVUs=; b=f+rjNN9oE7EGpCk0GLeXFon0eAYh2+Vm1RrTPKCS3SaqPJx+gZZt+csI9/tQq6L2ATVffgzr
 gR1k4XmOkOkzju2kOAFeZ5udbq+GKBtfHFkssry7k/7k+yu2gUyJ3ivE15nr300ztjpHjleZ
 6+O+bxeWrQHfXJnwssnxAIG2HdpNu+Ccq6dI2VpPrem4Tv28TmROSYSPvKphknDDIEXPiQTg
 m6FdZXtByqq2PrJwHdAPyrEc3hwysUkWT8JmMc1B9HUjjk5wcWfIYXRsjXLzF84biol90fOX
 2RV+CcJVpvAMMS3kQxld6fgjy1iY95jCQH43t9RnqH3BfbQl6V1tDg==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6255265d77e17d301dacc648 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 12 Apr 2022 07:12:29 GMT
Sender: codeagain@codeagain.dev
Date: Tue, 12 Apr 2022 04:12:19 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Cc: Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 0/3] staging: vme: Restructuring menuconfig and tree
Message-ID: <20220412071219.rapvtaxvoz2yerr5@AN5Bruno>
References: <cover.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a4cxoghgp7wwa5tg"
Content-Disposition: inline
In-Reply-To: <cover.1649721450.git.codeagain@codeagain.dev>


--a4cxoghgp7wwa5tg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please, disconsider some small errors in the commit message. I have sent
the patch files generated befor updating some information, so two of the
patches will be updated

On Tue, Apr 12, 2022 at 03:53:46AM -0300, Bruno Moreira-Guedes wrote:
> This patch series modify the vme_user driver's place in
> menuconfig (1/3), fixes a missing `depends on` line in a Kconfig file
> (2/3), and rearrages the directory tree for the driver allowing a more
> straightforward comprehension of its contents (3/3).
>=20
> Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
>=20
> Bruno Moreira-Guedes (3):
>   staging: vme: Adjusted VME_USER in Kconfig
This is fine as far as I noticed.

>   staging: vme: Fix missing `depends on` at KConfig
This one refers to VME_BRIDGE somewhere, when it's actually VME_BUS.
I'll fix it.

>   staging: vme: "drivers/staging/vme" tree cleanup
Some changes aren't properly mentioned in the commit message here.

>=20
>  MAINTAINERS                                          | 2 +-
I missed to mention this update on MAINTAINERS, due to changes in the
directory structure.

>  drivers/staging/Kconfig                              | 2 ++
>  drivers/staging/Makefile                             | 2 +-
>  drivers/staging/vme/Makefile                         | 2 --
>  drivers/staging/{vme/devices =3D> vme_user}/Kconfig    | 2 +-
>  drivers/staging/{vme/devices =3D> vme_user}/Makefile   | 0
>  drivers/staging/{vme/devices =3D> vme_user}/vme_user.c | 0
>  drivers/staging/{vme/devices =3D> vme_user}/vme_user.h | 0
>  drivers/vme/Kconfig                                  | 2 --
>  9 files changed, 5 insertions(+), 7 deletions(-)
>  delete mode 100644 drivers/staging/vme/Makefile
>  rename drivers/staging/{vme/devices =3D> vme_user}/Kconfig (93%)
>  rename drivers/staging/{vme/devices =3D> vme_user}/Makefile (100%)
>  rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.c (100%)
>  rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.h (100%)
>=20
> --=20
> 2.35.1
>=20


--a4cxoghgp7wwa5tg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYlUmUwAKCRAZtd3tyEY2
kpYTAP4veEOxVUWkbDbgVB46nEao+xSYla9M8a2WC697U2jzeAEAsCrz3rvRG13O
Eg2WgitpLBPqjykBczHhrBWvpfEIVgo=
=iBz5
-----END PGP SIGNATURE-----

--a4cxoghgp7wwa5tg--
