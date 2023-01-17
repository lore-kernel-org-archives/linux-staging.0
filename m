Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA9128EC
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 16:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C81C433D2;
	Tue, 17 Jan 2023 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673974735;
	bh=xnRyzXW91e2r6suRzGxVFkiG622vIDzIB8fw1t4QyPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=q3PWjkxKD6ijz8S4Vw7qAo20AF6nDHny8xZF2t4X7TEy9S4061CByav8X6uU4K+lF
	 +bd07EpXSAz4pDB4U3lOx1V47s8ZONryHeBebaojMs3/nGd1ovMTtE7sTqsRDHwwy/
	 8/DXhUJBYQgSBy4rKjWipOVoZaKw7oXCOAHOUXyB5IuSCOMgD4ErAvejPaZTBuj5yN
	 gXNd77zP4pNnYD6iG7BmrlTj1AfDA8qNMK1EULLPvoA6ELc3WNW3szwyBDo5GL2/IM
	 K6y3+onEIMAik9UpiILbfFIHOyXQlsQuvTbriQ71tXQwE9OWskPcMfSmFpFXqpQMtA
	 kAKe/ox8cvmtA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: stkwebcam: add USB dependency
Date: Tue, 17 Jan 2023 17:58:42 +0100
Message-Id: <20230117165851.2300111-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Before the move, this driver had implicit dependencies on both
CONFIG_USB and MEDIA_SUPPORT, which can be =m even in combination
with CONFIG_MEDIA_USB_SUPPORT=y, so without the dependency we
get a link failure when USB is a loadable module but stkwebcam
is built-in:

arm-linux-gnueabi-ld: drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: in function `stk_camera_probe':
stk-webcam.c:(.text+0xcbc): undefined reference to `usb_get_dev'
arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xccc): undefined reference to `usb_get_intf'
arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xd68): undefined reference to `usb_put_intf'
arm-linux-gnueabi-ld: stk-webcam.c:(.text+0xd70): undefined reference to `usb_put_dev'
arm-linux-gnueabi-ld: drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: in function `stk_prepare_iso':
stk-webcam.c:(.text+0xfcc): undefined reference to `usb_free_urb'
arm-linux-gnueabi-ld: stk-webcam.c:(.text+0x1010): undefined reference to `usb_alloc_urb'
arm-linux-gnueabi-ld: stk-webcam.c:(.text+0x10d8): undefined reference to `usb_kill_urb'

Add back the original dependency.

Fixes: 1943fb1e50d1 ("media: staging/media: add a STAGING_MEDIA_DEPRECATED option")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/deprecated/stkwebcam/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
index 7234498e634a..e4ebee3c628a 100644
--- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
+++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_STKWEBCAM
 	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
 	depends on VIDEO_DEV
 	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
+	depends on USB && MEDIA_SUPPORT
 	help
 	  Say Y here if you want to use this type of camera.
 	  Supported devices are typically found in some Asus laptops,
-- 
2.39.0

