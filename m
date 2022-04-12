Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EAA1FA2
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 06:53:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1649746435; h=Content-Type: MIME-Version: Message-ID:
 Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=CrnCIOfBYIadE7ysir0roGXoerEsn51pLccKc9in+ho=; b=SfBgpv9S8r0zXcRtRbgNngZrwv5X9ZmrtOTB49ItuqzYCMUh+QGoJS9aOof2203ezNYJ1jbq
 pDl+WznNvSqthIYaHaIAZPoE584VzwCeHWYBLyB4heW36k60weTvXZZT5fIDRNiCTX8LzQ7X
 /aTULZGmnz/lTeCq0WNJv+GytaWdWAp0JaCG94dtgFGIL+lAzNMqJxAeAelQFAYQxwID6nIU
 HoG3krrgxJ6WJDwlYjWHRyAXeStkfBfk1kA1G10tdKjpZEMGGRwV5mrSnpEugNHzbbQZqIkC
 J/qeTpmn3OZuzL0aty6DIE44lNX9gaSqY/SmprcFigD9zjYVDnjbZQ==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 62552202225c469082002d63 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 12 Apr 2022 06:53:54 GMT
Sender: codeagain@codeagain.dev
Date: Tue, 12 Apr 2022 03:53:46 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v2 0/3] staging: vme: Restructuring menuconfig and tree
Message-ID: <cover.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mnzhopgrmzo5kgdj"
Content-Disposition: inline


--mnzhopgrmzo5kgdj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch series modify the vme_user driver's place in
menuconfig (1/3), fixes a missing `depends on` line in a Kconfig file
(2/3), and rearrages the directory tree for the driver allowing a more
straightforward comprehension of its contents (3/3).

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>

Bruno Moreira-Guedes (3):
  staging: vme: Adjusted VME_USER in Kconfig
  staging: vme: Fix missing `depends on` at KConfig
  staging: vme: "drivers/staging/vme" tree cleanup

 MAINTAINERS                                          | 2 +-
 drivers/staging/Kconfig                              | 2 ++
 drivers/staging/Makefile                             | 2 +-
 drivers/staging/vme/Makefile                         | 2 --
 drivers/staging/{vme/devices =3D> vme_user}/Kconfig    | 2 +-
 drivers/staging/{vme/devices =3D> vme_user}/Makefile   | 0
 drivers/staging/{vme/devices =3D> vme_user}/vme_user.c | 0
 drivers/staging/{vme/devices =3D> vme_user}/vme_user.h | 0
 drivers/vme/Kconfig                                  | 2 --
 9 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 drivers/staging/vme/Makefile
 rename drivers/staging/{vme/devices =3D> vme_user}/Kconfig (93%)
 rename drivers/staging/{vme/devices =3D> vme_user}/Makefile (100%)
 rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.c (100%)
 rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.h (100%)

--=20
2.35.1


--mnzhopgrmzo5kgdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYlUh+gAKCRAZtd3tyEY2
kpMsAP9wfC+zTcnd/S0kjFyUc8rojGzBJsHhIx8Rwq6YXQIMKAD/R7hm08SbS5TE
/RoiuhqA54lIdJKL4fT/SqEMEvMtpwo=
=SnJU
-----END PGP SIGNATURE-----

--mnzhopgrmzo5kgdj--
