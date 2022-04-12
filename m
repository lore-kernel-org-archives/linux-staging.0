Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDDA1FA1
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 06:55:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1649746530; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=AiF//WsDF45djMQx3YL7cf1DqVbLJ96Fuowq5Sohtcs=; b=JvzmfPWoDR/Pl0ZT2Y3zlZ615xqAG9wrFztrAK4YVYeBiSsYMnKpzv/9C/ofHhRJW/qoog8U
 t3yYadiC0QxoqmTBqCI39FTnDpaH94pwJePx66ZOi0ITpCTLBxyF9lWe4S1TKgqO7R30Zcqm
 yfp9i9d0L9Bwjz31bFyxZBPFIE3D/Dvn58P23Tcg/NI5ntFzTf7enXpnXirGQDj5Xp8vqXKR
 SPmR4bioufG6pzG+qgyuJmapT9jZqDt2sxTtYW3L90lK2gEH48B+MBC+S1eULEFw34iq0R+r
 bMFtGstdHtN/0QjXSJVfE8bez3OxoLDnYsLn61BIBRmb4+1Scl2P0Q==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 62552261c172fc50663e09b0 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 12 Apr 2022 06:55:29 GMT
Sender: codeagain@codeagain.dev
Date: Tue, 12 Apr 2022 03:55:21 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v2 1/3] staging: vme: Adjusted VME_USER in Kconfig
Message-ID: <cfd7014e7f70cb928aa957f56bb31d8f514c2446.1649721450.git.codeagain@codeagain.dev>
References: <cover.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k7jdtsdktb7p5dg6"
Content-Disposition: inline
In-Reply-To: <cover.1649721450.git.codeagain@codeagain.dev>


--k7jdtsdktb7p5dg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, the VME_USER driver is in the staging tree Kconfig, unlike
other VME drivers already moved to the main portions of the kernel tree.
Its configuration is, however, nested into the VME_BUS config option,
which might be misleading.

Since the staging tree "[...] is used to hold stand-alone[1] drivers and
filesystem that are not ready to be merged into the main portion of the
Linux kernel tree [...]"[1], IMHO all staging drivers should appear
nested into the Main Menu -> Device Drivers -> Staging Drivers to make
sure the user don't pick it without being fully aware of its staging
status as it could be the case in Menu -> Device Drivers -> VME bridge
support (the current location).

With this change menuconfig users will clearly know this is not a driver
in the main portion of the kernel tree and decide whether to build it or
not with that clearly in mind.

This change goes into the same direction of commit 4b4cdf3979c3
("STAGING: Move staging drivers back to staging-specific menu")

CHANGELOG
v1:
 - Sourced "drivers/staging/vme/devices/Kconfig" in
   "drivers/staging/Kconfig" and unsourced in "drivers/vme/Kconfig".

v2:
- Turned into a patchset to (1) fix missing "depends on" missing entry
  in config VME_USER at "drivers/staging/vme/devices/Kconfig",
  affecting the behavior of this patch, and (2) fix unnecessary
  remaining files from the time the whole vme subtree was in staging.

REFERENCES
[1] https://lkml.org/lkml/2009/3/18/314

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 drivers/staging/Kconfig | 2 ++
 drivers/vme/Kconfig     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 932acb4e8cbc..0545850eb2ff 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -88,4 +88,6 @@ source "drivers/staging/qlge/Kconfig"
=20
 source "drivers/staging/wfx/Kconfig"
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
2.35.1


--k7jdtsdktb7p5dg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYlUiWQAKCRAZtd3tyEY2
kpxJAP9hu/i4d9Z8AbbgwkQWiib5YTG002x5B+eV30eRlzxbaQEAjDgQoeYmJy3v
4JHNz9sr3f3NQzeAHgF0Smo48q1HzQA=
=Mbz3
-----END PGP SIGNATURE-----

--k7jdtsdktb7p5dg6--
