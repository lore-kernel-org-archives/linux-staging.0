Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B32CA9
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y196so14629325wmc.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UWYtJJBsa0LLLZRoFXWiICK8It/s64t7LfobsR7d4kA=;
        b=EoLYu7UrfWuEECfodtsBV6dRc4ZWw3wP1d2U+PETqSM2bMXzttgdgy/Uua7i+BB9gn
         ctespFvmt74uAPf3DxYTt1jHERuSpp7idcolqLysFGmcCj5Xjmjcm1mjGu1MXn/yyF1R
         l8DzKPIbOmaBprMAbWxCWPHSkqlHSsbPP9jxVfLtHEMZrnv77HxT/QVSssWXLDkANuJr
         mO/UVzPTL1h9mgCRcUlcvXdRPMtHGXjtRjDxLph7ZXuNIfAh5KTzaLlMfwAQ6wQnQ3jR
         tJgt+dBKoYoOEktOUu76hjEDSi/H/xdizIBzOsfEH65rrGn6mWXXnzJ2zXyLoZPdd6a5
         nXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UWYtJJBsa0LLLZRoFXWiICK8It/s64t7LfobsR7d4kA=;
        b=4awbgaaYHJafJYyxEsV0zdSCsqyaqFhSgUogcZkXtUiv1MVXC6D3v0G53K9Gck16Ut
         mlcaQ5Zk4j0J+bdlREjUaw8v7CJKiLlIMwZdWTjgfmlR1I0q+ZnV/tDlIdfVVT3RYo0e
         2FgRVjCVXkoZyms5fpugTVzXnFw4UOW0nibkd3IKu4pBB0/X4NT53ormURGbDRqs35U9
         sC2AH9sDB7ugaIZhIheY1TbYuQ3VMzGuF+CJpjZQi9QA67rZK/NmjYjFwiuZnK6IMCH+
         dMfabaKGFhDTKfHqpmzWSpK96qWOmVOShmWMqMw0NmjqygnAPEUxQWtlRRn2ZBJEI/S/
         4QMQ==
X-Gm-Message-State: AOAM530snLn1JK/BkDe5EAiC0cw9dARBc0G83rhgEDXRDqRftdhJOjfm
	0+tcs2XAeggWgvf5vI1dHuAoTA==
X-Google-Smtp-Source: ABdhPJzPLZE0PqbYXIioP2UpsgERidaQz1L0B50wH1vp5+pcv0LlJw/R0RApXnewr2UT68g0nTwzWw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr8236047wmc.89.1639498604343;
        Tue, 14 Dec 2021 08:16:44 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:44 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 03/18] staging: media: zoran: rename debug module parameter
Date: Tue, 14 Dec 2021 16:16:21 +0000
Message-Id: <20211214161636.1886900-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All zoran module will be merged, so to prevent conflict, the debug
module parameter need to be renamed

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c |  8 ++++----
 drivers/staging/media/zoran/zr36016.c    | 12 ++++++------
 drivers/staging/media/zoran/zr36050.c    |  8 ++++----
 drivers/staging/media/zoran/zr36060.c    |  9 ++++-----
 4 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 28031d3fd757..31019b5f377e 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -26,13 +26,13 @@
 
 #include "videocodec.h"
 
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int videocodec_debug;
+module_param(videocodec_debug, int, 0);
+MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (videocodec_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 9b350a885879..50605460a44b 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -22,14 +22,14 @@
 /* amount of chips attached via this driver */
 static int zr36016_codecs;
 
-/* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36016_debug;
+module_param(zr36016_debug, int, 0);
+MODULE_PARM_DESC(zr36016_debug, "Debug level (0-4)");
+
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36016_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
@@ -120,7 +120,7 @@ static u8 zr36016_read_version(struct zr36016 *ptr)
 
 static int zr36016_basic_test(struct zr36016 *ptr)
 {
-	if (debug) {
+	if (zr36016_debug) {
 		int i;
 
 		zr36016_writei(ptr, ZR016I_PAX_LO, 0x55);
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index c62af27f2683..4dc7927fefc3 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -32,13 +32,13 @@
 static int zr36050_codecs;
 
 /* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36050_debug;
+module_param(zr36050_debug, int, 0);
+MODULE_PARM_DESC(zr36050_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36050_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 1c3af11b5f24..7904d5b1f402 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -34,14 +34,13 @@ static bool low_bitrate;
 module_param(low_bitrate, bool, 0);
 MODULE_PARM_DESC(low_bitrate, "Buz compatibility option, halves bitrate");
 
-/* debugging is available via module parameter */
-static int debug;
-module_param(debug, int, 0);
-MODULE_PARM_DESC(debug, "Debug level (0-4)");
+static int zr36060_debug;
+module_param(zr36060_debug, int, 0);
+MODULE_PARM_DESC(zr36060_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (debug >= num) \
+		if (zr36060_debug >= num) \
 			printk(format, ##args); \
 	} while (0)
 
-- 
2.32.0

