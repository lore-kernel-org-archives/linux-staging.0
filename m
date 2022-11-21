Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D263D1
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 16:06:22 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4NGBrg55brz4x1C4
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 16:58:43 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:4821:1ba5:2638:5c3a])
	by laurent.telenet-ops.be with bizsmtp
	id n3yb2800D5WXlCv013ybwv; Mon, 21 Nov 2022 16:58:35 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ox9Bq-0019GF-Nt; Mon, 21 Nov 2022 16:58:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1ox9Bp-00BRbY-Vb; Mon, 21 Nov 2022 16:58:33 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] media: staging: stkwebcam: Restore MEDIA_{USB,CAMERA}_SUPPORT dependencies
Date: Mon, 21 Nov 2022 16:58:33 +0100
Message-Id: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By moving support for the USB Syntek DC1125 Camera to staging, the
dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.

Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
index 4450403dff41fb64..7234498e634ac61c 100644
--- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
+++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_STKWEBCAM
 	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
 	depends on VIDEO_DEV
-	depends on USB
+	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
 	help
 	  Say Y here if you want to use this type of camera.
 	  Supported devices are typically found in some Asus laptops,
-- 
2.25.1

