Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963E1FC0
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 14:59:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650553189; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=2FfySmyUi61V40qd9e4vY+mMpu2WKzNDDsFY/pOvwG8=; b=CoP7FV8GEcbnnPBp8MueVz4Lbj0Fa8LEgZVqUYdriPe5TSblTh49MyAuevMBPOSZCriaUQ99
 LT8MguhMdvdFgtcsh1C1saMI8R07xiqQFJFcg3ySRBIx/Yg6sdfhw9ewzzAT152bBdFOsHsb
 6v3xYJ7EyURaHtyvFcQ7i09bg56/qI9HLwQ4rqZzoSE400x19RVmk4aPIPgBlr5oFXO+n2+M
 45Z2qbdHrpQWGoA8RkDwXNFRdvjHTLpavlKVaLie+IQIYyjFxeWH75Iwe4MUUx4x6sTAskaQ
 +3eHSUvh8ZuN22iWoOz+BafYq5/AK9PBldu5ZiUBx+MHYhNmD5EPIQ==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6261715ab77b16c56e3e69e0 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 21 Apr 2022 14:59:38 GMT
Sender: codeagain@codeagain.dev
Date: Thu, 21 Apr 2022 11:59:34 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v4 3/3] staging: vme: Move 'vme/devices/' to 'vme_user/'
Message-ID: <2cd7de9a426c443a5ea618682d605ecfd751d798.1650544175.git.codeagain@codeagain.dev>
References: <cover.1650544175.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysqdnui3ra2l3lsk"
Content-Disposition: inline
In-Reply-To: <cover.1650544175.git.codeagain@codeagain.dev>


--ysqdnui3ra2l3lsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In <db3b9e990e75573402cda22faf933760f076c033> ("Staging: VME: move VME=20
drivers out of staging") the vme code, board and bridge drivers were
moved out of the staging tree, remaining only the VME user device=20
driver.

Since this driver is the only one remaining in staging, such multi-level
structure confuses more than helps. The current structure is as follows:

 - drivers/staging/vme/
                       Makefile
                       devices/
                               Kconfig
                               Makefile
                               vme_user.c
                               vme_user.h

The top-level Makefile has the only function of calling another Makefile
into the devices/ subdirectory. This latter only compiles the vme_user=20
driver, since there is no other in the staging tree.

This patch removes the unnecessary Makefile from the 'vme/' dir, move
the contents of 'vme/devices' into the 'vme/' dir, and renames it to
'vme_user/' (the driver name), allowing a straightforward understanding
of this driver's contents. Furthermore, it updates the MAINTAINERS file
to properly reflect the new paths.

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 MAINTAINERS                                          | 2 +-
 drivers/staging/Kconfig                              | 3 +--
 drivers/staging/Makefile                             | 2 +-
 drivers/staging/vme/Makefile                         | 2 --
 drivers/staging/{vme/devices =3D> vme_user}/Kconfig    | 0
 drivers/staging/{vme/devices =3D> vme_user}/Makefile   | 0
 drivers/staging/{vme/devices =3D> vme_user}/vme_user.c | 0
 drivers/staging/{vme/devices =3D> vme_user}/vme_user.h | 0
 8 files changed, 3 insertions(+), 6 deletions(-)
 delete mode 100644 drivers/staging/vme/Makefile
 rename drivers/staging/{vme/devices =3D> vme_user}/Kconfig (100%)
 rename drivers/staging/{vme/devices =3D> vme_user}/Makefile (100%)
 rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.c (100%)
 rename drivers/staging/{vme/devices =3D> vme_user}/vme_user.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed62dcd144e..efc38961f792 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21010,7 +21010,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
 F:	Documentation/driver-api/vme.rst
-F:	drivers/staging/vme/
+F:	drivers/staging/vme_user/
 F:	drivers/vme/
 F:	include/linux/vme*
=20
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index e4dcf411030d..e117811ec832 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -86,7 +86,6 @@ source "drivers/staging/fieldbus/Kconfig"
=20
 source "drivers/staging/qlge/Kconfig"
=20
-
-source "drivers/staging/vme/devices/Kconfig"
+source "drivers/staging/vme_user/Kconfig"
=20
 endif # STAGING
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 65e317922e3f..db7287de0faf 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -14,7 +14,7 @@ obj-$(CONFIG_OCTEON_ETHERNET)	+=3D octeon/
 obj-$(CONFIG_OCTEON_USB)	+=3D octeon-usb/
 obj-$(CONFIG_VT6655)		+=3D vt6655/
 obj-$(CONFIG_VT6656)		+=3D vt6656/
-obj-$(CONFIG_VME_BUS)		+=3D vme/
+obj-$(CONFIG_VME_BUS)		+=3D vme_user/
 obj-$(CONFIG_IIO)		+=3D iio/
 obj-$(CONFIG_FB_SM750)		+=3D sm750fb/
 obj-$(CONFIG_USB_EMXX)		+=3D emxx_udc/
diff --git a/drivers/staging/vme/Makefile b/drivers/staging/vme/Makefile
deleted file mode 100644
index cf2f686ccffe..000000000000
--- a/drivers/staging/vme/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-y				+=3D devices/
diff --git a/drivers/staging/vme/devices/Kconfig b/drivers/staging/vme_user=
/Kconfig
similarity index 100%
rename from drivers/staging/vme/devices/Kconfig
rename to drivers/staging/vme_user/Kconfig
diff --git a/drivers/staging/vme/devices/Makefile b/drivers/staging/vme_use=
r/Makefile
similarity index 100%
rename from drivers/staging/vme/devices/Makefile
rename to drivers/staging/vme_user/Makefile
diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme_u=
ser/vme_user.c
similarity index 100%
rename from drivers/staging/vme/devices/vme_user.c
rename to drivers/staging/vme_user/vme_user.c
diff --git a/drivers/staging/vme/devices/vme_user.h b/drivers/staging/vme_u=
ser/vme_user.h
similarity index 100%
rename from drivers/staging/vme/devices/vme_user.h
rename to drivers/staging/vme_user/vme_user.h
--=20
2.35.3
=20

--ysqdnui3ra2l3lsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYmFxVgAKCRAZtd3tyEY2
krlvAQDDn7lzGOuuR0sliolPWkeZtxB1Nst95cgEgmdl85zMYQD9E9OZC1NeH2NY
/pqn13eWXlOs9OWZWrKcf26A/h57QwU=
=JZHj
-----END PGP SIGNATURE-----

--ysqdnui3ra2l3lsk--
