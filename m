Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F570
	for <linux-staging@lists.linux.dev>; Sat, 24 Jul 2021 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1627145673;
	bh=wSYHYXjQ8tY2LuOVqUnrRReY9Qkro14biYwp5qK9Qbg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L+tQhJdM8xwferGORR21neTgmRxe/Guw+NJ4eh+UMFI37GVhv9GN839nFHvjt/wk8
	 20gTx6DxdNAHQ0Mxi4wcFWuA1dzEEIDcvP1KAqiYxwUIBeyySdX/f9xOHgbXXoUZmi
	 Q5ZK5JT8vYy2KWFAkpBMeHB5o+cbaVLS/rIDqyAw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MQe5k-1lkjZG48YQ-00NjkY; Sat, 24 Jul 2021 18:54:33 +0200
From: Len Baker <len.baker@gmx.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Len Baker <len.baker@gmx.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Phil Reid <preid@electromag.com.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging/fbtft: Remove unnecessary variable initialization
Date: Sat, 24 Jul 2021 17:14:10 +0200
Message-Id: <20210724151411.9531-3-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724151411.9531-1-len.baker@gmx.com>
References: <20210724151411.9531-1-len.baker@gmx.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rSb/1rkm96QKJVkdD088liE9MP7SztbliVsYvbYCK+YrW7iDYYq
 HU/dJvRyII6cTTHQZQzwVy+75Zu0HmH2G2Mkk/z/F1vReW8xpIJrWi8B99CCqSZtb8v2KzN
 l6OZ/SfERY4L+rKQwlMpHXX0qK2BHDILB+LoYCMpGlG1FBo1CUGM9EGumIV+/GGmeyChCce
 eGgevo9c/bPR7Odcw86ow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b2MJHBGWTlQ=:OXq0MS/8hkj1BxEsUVhVYM
 oBHhsBJmTHlO0M/pOFx3QclSI1wUBCigQ4s9Sa7A1CjQmoTKhtdJ/oyVrPClFgKT/w/tAnz7a
 vRALzoO3n2hbnKZM0tR9ari1BjovUUXmnAqajK8ToAaTVOLQ4Zg/FvR5/+oEknEraf6u6Zvck
 Hdin+nf9wErG/apNrynfWeO760O6HQPccPI8CYz9rtf6ogAKkdK77oNh88UM9t9VC+SkXR6a3
 W6wltemJVs9NA0Duzi6p7ba5ewPdlZWp25ZkDBG741ss7pzFrR48DPDJTTQPlouLWHgy7tbtJ
 oHPkFAkHVuMuNAnOAmvXj/ynO5v6Ajqy0eheCupmMHgT5Xn3vd1qyi/t65kGWSXrvR9euRoq2
 ZtXF5YJRrUL7CcK+HWzMvhaId1QNq3HgBWhM2JZgFzwDHNbK7Ife8IRBt9lCtfEfEK20ms71i
 FiK4HTMcjZmR6mI7CbiyAG9iJdjJCqElaZNjptitm8mezKiII4lclDjMNjntszWRp25dYiECp
 dX7JWF5P0bRKZrjK/mMHBGPDcqcaVJ165i/VkMJsD9xeCNv00CTiDXsUDAYGuAJPoNWQaa/Qr
 13I5aORe/YJZt1lE05Yo7C/G/Xs3UzFMR7sfK++dNmw2q/I//GegiNuWI9hkGJM0nNALgZOM1
 Qm7A6IpL+ROx+NDNDD++g2nc8Q5rwdzMWNPhzEi5n1KV2g6+t4Ubq2Oh2fxqAMrakNven2k80
 TymJFe2CS+SS9o+JGcPE1CXShLzrvxvgKXrA5xEwlRe/+ZHXrnDzf0hxm7vn45inf28wGtCzu
 4hjSwmi7Nd++7HgBXzZ/IVBmELmB9VKM7QcQvIRka77E+ZUrKRflpOr3jUFXQgtKjLKDVugi9
 ci/7cykY2ChbIG/RYSaqXCEu2BkaWsqtlnwd3hOH4r0TeSrJI74+rIjsVhlwnbiqruuIAGfnS
 2GGVOoWJMO7SONvjcjypKGWzHBPwoO3j52bPpd2oVeRfJu9yeyBTNqY50ieqLn/cCTTkccGKa
 ZUulqmK+IC4CIWw+t/edPCA6XGE8f8gIcCf9sgZ40Q1mJ8PxeY1xxsExx5JIoMRTm/pJgwiq6
 pxrVzx3VTlMSXCUv4di8MCQ5u0g2s1zyfpy

Remove the initialization of the variable "i" since it is written a few
lines later.

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fb=
tft-core.c
index be20da3c4a5c..cc2bee22f7ad 100644
=2D-- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -992,7 +992,7 @@ static int fbtft_init_display_from_property(struct fbt=
ft_par *par)
 int fbtft_init_display(struct fbtft_par *par)
 {
 	int buf[64];
-	int i =3D 0;
+	int i;
 	int j;

 	/* sanity check */
=2D-
2.25.1

