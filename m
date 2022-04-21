Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666481FC2
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 14:59:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650553148; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=jxjD/BGpP33jL+RkZPJr5Lov9+ps4iGN0RwXmAZSh/4=; b=IpHmuKZ/BDsjjfWG1abuQ8M7A07yB6JQE2qtdIv3V65KzR7vAcRUcb5NBWE+4NepBHy4Xhx0
 X2KwTsHtVZpctZ/aSzA7S0twTdS4+iJQ6aQiEdODPZ5aQ0RO5Xvf1feXng6c+eGhOt6y+bLL
 cuB7CIZCtNbhsIIkiqwrhzuYjq3GllRjaOW2eVk1sBe5CupYjjJklF2aV2Ss/aGfHvgQSP9H
 lAhuU9+IlFDbo1YnSKtUHkSFYgNlal74+NjKo0ICszg7RAD05BDsxhf80joiBH50LSQUR2al
 zFseFxXBMXUuF85v+3zNx21pGBuhf0rdiItw+wyXORLEm+H/0Baqxw==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6261713b2491c3e6d5b0d3a4 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 21 Apr 2022 14:59:07 GMT
Sender: codeagain@codeagain.dev
Date: Thu, 21 Apr 2022 11:59:02 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v4 2/3] staging: vme: Add VME_BUS dependency to Kconfig
Message-ID: <00de5644d7c2f8c8878eccf86b761e0602732089.1650544175.git.codeagain@codeagain.dev>
References: <cover.1650544175.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ohvy3oop3iuwcwi5"
Content-Disposition: inline
In-Reply-To: <cover.1650544175.git.codeagain@codeagain.dev>


--ohvy3oop3iuwcwi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The KConfig file for VME_USER ('drivers/staging/vme/devices/Kconfig')
sourced at "drivers/vme/boards/KConfig" misses a `depends on` line for
VME_BUS, which is unnoticeable for menuconfig users who aren't be able
to select it through this interface without setting the CONFIG_VME_BUS
option because it's nested on VME_BUS menu entry.

A patch to move appropriately this driver to the "Staging" submenu
([PATCH 1/3], originally sent as a single patch submitted at
https://lore.kernel.org/linux-staging/3fbc5325e94b9ae0666a1f5a56a4e5372bfce=
a1d.camel@codeagain.dev/T/#t),
however, unveiled this missing `depends on` line, since it moved the
`source` line for VME_USER's KConfig to somewhere else, allowing it to
be compiled without the support for VME_BUS. While it compiles fine and
seems to initialize the driver fine (tested both as module and as built-
in), it seems to make no sense having VME_USER without VME_BUS.

This patches addresses it by adding the VME_BUS to the `depends on` line
at "drivers/staging/vme/devices/Kconfig".

Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
---
 drivers/staging/vme/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme/devices/Kconfig b/drivers/staging/vme/devi=
ces/Kconfig
index 5651bb16b28b..e8b4461bf27f 100644
--- a/drivers/staging/vme/devices/Kconfig
+++ b/drivers/staging/vme/devices/Kconfig
@@ -3,7 +3,7 @@ comment "VME Device Drivers"
=20
 config VME_USER
 	tristate "VME user space access driver"
-	depends on STAGING
+	depends on STAGING && VME_BUS
 	help
 	  If you say Y here you want to be able to access a limited number of
 	  VME windows in a manner at least semi-compatible with the interface
--=20
2.35.3


--ohvy3oop3iuwcwi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYmFxNgAKCRAZtd3tyEY2
krkrAP9vWAmZIIj6NA8HbLw+GMYp9wQ5BlflzgrnP/2yy93TqQD/QQNtmFw6kXlN
QcKpNPAPEMDwVfroXGiVaqvlYxgj1Ac=
=TL3i
-----END PGP SIGNATURE-----

--ohvy3oop3iuwcwi5--
