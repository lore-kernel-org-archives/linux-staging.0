Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2E93D66
	for <linux-staging@lists.linux.dev>; Mon, 18 Apr 2022 23:36:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650324965; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: To: To: From: From: Date:
 Sender: Sender; bh=kMG8sFH31a0X0raOtVjkeRqHkhxX2+EF44xf1squ1AU=; b=sA4KVZ0YoKQyosjQFQl8Xm1D4EmakoM+J+f9/ATZmjTdAbYpA2KMrxjJy+t6Q36OeDfzu2mU
 l9LDANP2mKrhAV+d0+zonDEeUXOchG8xp+2CnyLwzqg0ZuWEd72lvglgBIWrSItw1P2vPS2a
 JvH06R0/8ZClEY/i5o2dWzGkMrLr3F6h88Q0sJHtLT8I+fRv/DxLw5hS02g9wpDURQqjUBbm
 8kkp6b7cneJ6dFmox0/5zaoq/O+0XSouEcwhK2aYD0Sdq1i5EGeW0YI5fvIvZCAd2opxOXMG
 7hwfTLJHqjdBLS92UyJQP4Z6nQZBt3AqZMVxEOF2SCgWCoYsQa0A4A==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyI4MTlhZCIsICJsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiIsICJiZTljNmQiXQ==
Received: from AN5Bruno (186-250-90-1.mhnet.com.br [186.250.90.1]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 625df5e3487c9ee854f9ac24 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 18 Apr 2022 23:36:03 GMT
Sender: codeagain@codeagain.dev
Date: Mon, 18 Apr 2022 20:35:58 -0300
From: Bruno Moreira-Guedes <codeagain@codeagain.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: [PATCH v3 2/3] staging: vme: Add VME_BUS dependency to Kconfig
Message-ID: <00de5644d7c2f8c8878eccf86b761e0602732089.1650321310.git.codeagain@codeagain.dev>
References: <cover.1650321310.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrwrexl5pnrjq3vj"
Content-Disposition: inline
In-Reply-To: <cover.1650321310.git.codeagain@codeagain.dev>


--yrwrexl5pnrjq3vj
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


--yrwrexl5pnrjq3vj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYl313gAKCRAZtd3tyEY2
kjTxAQC4E3fMmO6NuNr+ZjnKdvVLMMu7bxef7GU+Z24BXR39JAD+OaIcogcphT/P
jxrp/1urNRHFV0DPz3faSKbQlehAZQY=
=e2hd
-----END PGP SIGNATURE-----

--yrwrexl5pnrjq3vj--
