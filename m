Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152851B283
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 2F84A186AD7D;
	Thu,  2 Nov 2023 17:11:54 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Mit1H4cav2aX; Thu,  2 Nov 2023 17:11:53 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id D32D0186AD9B;
	Thu,  2 Nov 2023 17:11:53 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CEjmqHfM5iRG; Thu,  2 Nov 2023 17:11:53 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.237.131])
	by mail.astralinux.ru (Postfix) with ESMTPSA id E2B80186AD86;
	Thu,  2 Nov 2023 17:11:51 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 4/4] Remove redundant return value check
Date: Thu,  2 Nov 2023 17:11:35 +0300
Message-Id: <20231102141135.369-4-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
References: <20231102141135.369-1-adiupina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

media_entity_pads_init() will not return 0 only if the
2nd parameter >=3D MEDIA_ENTITY_MAX_PADS (512), but 1 is
passed, so checking the return value is redundant

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 2ec5bfe0c24a ("media: atomisp: gc0310: Switch over to ACPI powerma=
nagement")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
index 9a11793f34f7..62550504b68c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -660,11 +660,7 @@ static int gc0310_probe(struct i2c_client *client)
 		return ret;
 	}
=20
-	ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret) {
-		gc0310_remove(client);
-		return ret;
-	}
+	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
=20
 	ret =3D v4l2_async_register_subdev_sensor(&dev->sd);
 	if (ret) {
--=20
2.30.2

