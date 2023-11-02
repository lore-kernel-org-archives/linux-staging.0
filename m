Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C45211185
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 85B50186AD92;
	Thu,  2 Nov 2023 17:11:50 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 360raSQFcQ7t; Thu,  2 Nov 2023 17:11:50 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 2C583186AD72;
	Thu,  2 Nov 2023 17:11:50 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g0_ELJrllrsB; Thu,  2 Nov 2023 17:11:50 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.237.131])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 42ED2186AD74;
	Thu,  2 Nov 2023 17:11:47 +0300 (MSK)
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
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 2/4] Remove redundant return value check
Date: Thu,  2 Nov 2023 17:11:33 +0300
Message-Id: <20231102141135.369-2-adiupina@astralinux.ru>
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

Fixes: 34009bffc1c6 ("media: i2c: Add RDACM20 driver")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/media/i2c/rdacm20.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index f4e2e2f3972a..ed249ade54e0 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -611,9 +611,7 @@ static int rdacm20_probe(struct i2c_client *client)
=20
 	dev->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 	dev->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
-	ret =3D media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret < 0)
-		goto error_free_ctrls;
+	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
=20
 	ret =3D v4l2_async_register_subdev(&dev->sd);
 	if (ret)
--=20
2.30.2

