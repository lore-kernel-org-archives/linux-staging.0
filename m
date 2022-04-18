Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31B3D61
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 23:31:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650324712; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=8x4EIBktaep8KLV7xYfWOqCNjJ4iQEpx8+XIrD81NpQ=; b=Vj82usBGSwO6675/QK1sEMLIokjrnnIkdNRLlSPZaWEbJnUtNlzPjZAZKNkwMswdIZKzuFFD
 CHnJzlSjfciednpMqPAkbFyPwocx68pDFCtyGJa4n10d4DIVUX3kN1N2dJ6durlhZVwkuggW
 hdSDCJrfQeRyx8Q8ScJpWioIRXnHg0w1B/Snv5SU8e8oxyo8KOxvFyJqVXvZf2aJ0OSyFz3P
 O0G/66ztSTEogRY8E2sC/ty7+24XYG5a4LarSfx5wxspggxk9hgu+tjUUjTIuKBio5sbn0no
 hmOBIZqNpGfgQyfh3QLZY+PNhczxr1NXdWp3WdbFznY4xjiPsEUi8Q==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 625df4e7514839a819a976e2 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 18 Apr 2022 23:31:51 GMT
Sender: codeagain@codeagain.dev
Date: Mon, 18 Apr 2022 20:31:47 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v3 3/3] staging: vme: Move 'vme/devices' to 'vme_user/'
Message-ID: <2cd7de9a426c443a5ea618682d605ecfd751d798.1650321310.git.codeagain@codeagain.dev>
References: <cover.1650321310.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7wzwr7dd4vsi3qs"
Content-Disposition: inline
In-Reply-To: <cover.1650321310.git.codeagain@codeagain.dev>


--h7wzwr7dd4vsi3qs
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

--h7wzwr7dd4vsi3qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl304wAKCRAZtd3tyEY2
kgNmAPwLh3EkpG84T97NtaG8gqOBkJU+EGzJaOKh5x6SkgcIJwEA47aCj+qjQsoj
MXoDbCPMt9F5PzXqj+auLgSaUGZgRQg=
=76Yv
-----END PGP SIGNATURE-----

--h7wzwr7dd4vsi3qs--
