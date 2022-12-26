Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7B7E3
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 10:07:27 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NgXxm0YrKz16Lpf;
	Mon, 26 Dec 2022 17:47:08 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 26 Dec 2022 17:48:21 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
	<hverkuil-cisco@xs4all.nl>, <ribalda@chromium.org>,
	<neil.armstrong@linaro.org>, <cuigaosheng1@huawei.com>,
	<geert+renesas@glider.be>
CC: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: [PATCH -next] media: staging: stkwebcam: Fix the build error with stkwebcam
Date: Mon, 26 Dec 2022 17:48:20 +0800
Message-ID: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

When I am building the kernel on arm64, set config CONFIG_USB=m &&
CONFIG_VIDEO_STKWEBCAM=y, I get some error reports as follows:
  drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
    function `stk_v4l_dev_release':
  stk-webcam.c:(.text+0x3e0): undefined reference to `usb_put_intf'
  stk-webcam.c:(.text+0x3e8): undefined reference to `usb_put_dev'
  drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
  function `stk_clean_iso':
  stk-webcam.c:(.text+0xb0c): undefined reference to `usb_kill_urb'
  stk-webcam.c:(.text+0xb14): undefined reference to `usb_free_urb'

Fix it by add dependency option on USB for VIDEO_STKWEBCAM.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
index 7234498e634a..083fadab232d 100644
--- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
+++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_STKWEBCAM
 	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
 	depends on VIDEO_DEV
-	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
+	depends on USB && MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
 	help
 	  Say Y here if you want to use this type of camera.
 	  Supported devices are typically found in some Asus laptops,
-- 
2.25.1

