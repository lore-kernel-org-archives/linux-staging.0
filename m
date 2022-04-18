Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D9A3D61
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 23:30:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650324632; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=EwsT33pUVnuEsrNDQMK2HIpchqoo7809zU3be87TZK4=; b=M23lnmaDH6dRBMpSNibxxYnzM0y1kiUGHUjFxA2NN6PZs5Zzcfugo+ci2i7f1p7in44KPX1t
 sUv+6czvlkA6yUpDiC08X+NPggNAVisuPA6vhFpmB/7CR7lmmYAGWocIEHkckEhJh++mlb6N
 SzDpD7tgiuTLhpi4/18FtTOIBx6GzJL7UbJ4Bc+9oU12YiU+CLMFlj7EkW3mhn/J+IXQvD+g
 SFsDV74IaYV3o85RT40LuTWU67E/2mCYENUrEgaZIY3ekm37TkF5hQ6t3BPngUg1g+EWd9oM
 HZyIQ9fO0P717J8R8HwDOTd0MyhQDu7/jVKC/3XCDALPmqVSmzDV0Q==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 625df49877e17d301dfc5d9d (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 18 Apr 2022 23:30:32 GMT
Sender: codeagain@codeagain.dev
Date: Mon, 18 Apr 2022 20:30:26 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v3 1/3] staging: vme: Move vme_user to staging KConfig
Message-ID: <f6e6d1d2b02385f11848022f154007ef191181c1.1650321310.git.codeagain@codeagain.dev>
References: <cover.1650321310.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ko7y2xunhwulay2h"
Content-Disposition: inline
In-Reply-To: <cover.1650321310.git.codeagain@codeagain.dev>


--ko7y2xunhwulay2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, the VME_USER driver is in the staging tree Kconfig, unlike
other VME drivers already moved to the main portions of the kernel tree.
Its configuration is, however, nested into the VME_BUS config option,
which might be misleading.

Since the staging tree "[...] is used to hold stand-alone drivers and
filesystem that are not ready to be merged into the main portion of the
Linux kernel tree [...]"(from=20
https://lore.kernel.org/all/20090320172502.GA14647@kroah.com/T/),
staging drivers should appear nested into the Main Menu -> Device
Drivers -> Staging Drivers to make sure the user don't pick it without
being fully aware of its staging status as it could be the case in
Menu -> Device Drivers -> VME bridge support (the current location).

With this change menuconfig users will clearly know this is not a driver
in the main portion of the kernel tree and decide whether to build it or
not with that clearly in mind.

This change goes into the same direction of commit
<4b4cdf3979c32fa3d042d150f49449c74d048553> ("STAGING: Move staging
drivers back to staging-specific menu")

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 drivers/staging/Kconfig | 2 ++
 drivers/vme/Kconfig     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index fc274737053d..e4dcf411030d 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -87,4 +87,6 @@ source "drivers/staging/fieldbus/Kconfig"
 source "drivers/staging/qlge/Kconfig"
=20
=20
+source "drivers/staging/vme/devices/Kconfig"
+
 endif # STAGING
diff --git a/drivers/vme/Kconfig b/drivers/vme/Kconfig
index 936392ca3c8c..c13dd9d2a604 100644
--- a/drivers/vme/Kconfig
+++ b/drivers/vme/Kconfig
@@ -15,6 +15,4 @@ source "drivers/vme/bridges/Kconfig"
=20
 source "drivers/vme/boards/Kconfig"
=20
-source "drivers/staging/vme/devices/Kconfig"
-
 endif # VME
--=20
2.35.3
=20

--ko7y2xunhwulay2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl30kgAKCRAZtd3tyEY2
kqpYAQDVAKKyckdRSKCGBHnP8fVN6mP2Gj0q7nrpyryF38y3fgD+O5vZedtKgOcQ
fzsS2B0wlSgeSjCE5aEAkVsWqKAaKg4=
=i9W+
-----END PGP SIGNATURE-----

--ko7y2xunhwulay2h--
