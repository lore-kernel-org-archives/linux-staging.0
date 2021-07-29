Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58870
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 09:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 055C461076;
	Thu, 29 Jul 2021 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627552696;
	bh=jU/mVxIYzVpDQbC61+5+mpAlihguu9WTIumYgAJw8Dw=;
	h=From:To:Cc:Subject:Date:From;
	b=waM/KqvyOq+yOCVb4Y7Movu+Gw2kQRd8sEn7qKGl2Fb3gdPojP0dyQg7aEuCyy1tf
	 3yoPeCsmXz1m2HTn5W9OrWeigDeEINSk0ciadtW/Vg+SXAUTTCBu7Mo7lnqBwTUwaz
	 0cG8lejnJeg4hCEgS9pV/CwEy5z4erfQPK+Pv1CY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: forest@alittletooquiet.net,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] staging: vt665X: remove unused CONFIG_PATH
Date: Thu, 29 Jul 2021 11:58:12 +0200
Message-Id: <20210729095812.1693061-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386; h=from:subject; bh=jU/mVxIYzVpDQbC61+5+mpAlihguu9WTIumYgAJw8Dw=; b=owGbwMvMwCRo6H6F97bub03G02pJDIlM1Rv/c/FLbX+pVXeyU1FIjnli5P/Ovq0qR/vN/8TPWS6n WVDcEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABMxm8OwYMmT8EWdxcxybnE7Z+66Mr viSkDxJoa58nIOz/5c6lPz7Hsf0Bon/XC+8dE9AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The vt6655 and vt6656 drivers have an unused CONFIG_PATH define floating
around in the code, but it is never used.  Remove it as drivers should
never be reading from config files anyway, even if these were valid
files.

Reported-by: Joe Perches <joe@perches.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/vt6655/device_cfg.h | 3 ---
 drivers/staging/vt6656/device.h     | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/vt6655/device_cfg.h b/drivers/staging/vt6655/device_cfg.h
index db0304f6e21c..2d647a3619ba 100644
--- a/drivers/staging/vt6655/device_cfg.h
+++ b/drivers/staging/vt6655/device_cfg.h
@@ -38,9 +38,6 @@
 
 #include <linux/fs.h>
 #include <linux/fcntl.h>
-#ifndef CONFIG_PATH
-#define CONFIG_PATH            "/etc/vntconfiguration.dat"
-#endif
 
 #define PKT_BUF_SZ          2390
 
diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
index 947530fefe94..2c93a2e66c8a 100644
--- a/drivers/staging/vt6656/device.h
+++ b/drivers/staging/vt6656/device.h
@@ -77,8 +77,6 @@
 #define FIRMWARE_NAME			"vntwusb.fw"
 #define FIRMWARE_CHUNK_SIZE		0x400
 
-#define CONFIG_PATH			"/etc/vntconfiguration.dat"
-
 #define MAX_UINTS			8
 #define OPTION_DEFAULT			{ [0 ... MAX_UINTS - 1] = -1}
 
-- 
2.32.0

