Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647263483
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 10:37:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y7so10249292eda.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLnKGJ4zU6EShY9oN7ziimVIk/9qsj11+Ck6qmbE50I=;
        b=InwobTsdCpBUyM5f+nITEbSMaSKS+etexul+GEBCofQ2Sk4G8Zh07/F/qsrCb8XJAt
         iLvexW2X2d+YqsTv0f3ZH5hGdNIm2NYRbXMVI1gq1ZYAeYk1E0ouunlcXJo302cceEnQ
         U/8S6+2d2Xoo0Hcvrj0dEjKMdImZvBVFxHYr7g/R2cFOoxX/fCjsODQdDeaDhdhmv9JB
         YMTxJaK20b9yaOG1xraRfRLrx8Sst/Vs33euhisrr+ZFhZmQ7k+AWJY/9gXLp5cJApPL
         ynFsXZx8Ys0f8eQqDWO9yPjlZqUpVcJCuZdudT8xeO9/jXcqR1jYm+XbdLz2CYIjbtKi
         ec8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLnKGJ4zU6EShY9oN7ziimVIk/9qsj11+Ck6qmbE50I=;
        b=T9Q/kQEoXJAVlLmJDos9e9TlJPx+I1J0YrK4KQ8zJvIGTAFTf6ybluhgBT1FOV0hfs
         sIf3AAGoADw7ME/qPtoAjGhL2vB/1jH44EHPGBi5XmufCktK/aXOZ9hbva1rAiT+Ie4R
         Uo9PLrjrf1lKh31iNAA/AyGlhuVn7bIFuMUBhppt6ovWqBcjfiR08xn+R319HYnRk69i
         aAAYidtY4MBu0y81wyZ+IYlP95KT2hftmeRo73Ae5q101J1FgoR0lIZ9slleWAFoXs9Q
         rqrsorAAKm3HnjXfR0ZU7Vf3sbX4PkNIeIFnRl1+tBQtgj5zZ+mMvOyjIjUt354WwjEe
         eEoA==
X-Gm-Message-State: AOAM533a5DpcrQpGZ0cMtRWcO3yx42k1WhoGOPoI56gLQQPRI2gskM5w
	VHRSJWQkOmV81zuxWz5mPx0=
X-Google-Smtp-Source: ABdhPJz1bJU2z/R42BUYF+1Ym2zOekoMO52zqLtsfY5oRH+UdSi2RStrqOHLrnWZ7LMdlH9w14P8Dw==
X-Received: by 2002:a05:6402:b83:: with SMTP id cf3mr2165940edb.12.1627641472810;
        Fri, 30 Jul 2021 03:37:52 -0700 (PDT)
Received: from localhost.localdomain (host-79-26-32-124.retail.telecomitalia.it. [79.26.32.124])
        by smtp.gmail.com with ESMTPSA id v17sm493436edc.47.2021.07.30.03.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:37:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: Remove no more used functions and variables
Date: Fri, 30 Jul 2021 12:37:16 +0200
Message-Id: <20210730103716.27210-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730103716.27210-1-fmdefrancesco@gmail.com>
References: <20210730103716.27210-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the functions and variables from rtw_security.c that are no more
necessary since the patch that replaces getcrc32() with crc32_le().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_security.c | 37 ---------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 9625beea4b3c..136ba1e61dca 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -74,43 +74,6 @@ static void arcfour_encrypt(struct arc4context *parc4ctx, u8 *dest, u8 *src, u32
 
 }
 
-static int bcrc32initialized;
-static u32 crc32_table[256];
-
-static u8 crc32_reverseBit(u8 data)
-{
-	return (u8)((data<<7)&0x80) | ((data<<5)&0x40) | ((data<<3)&0x20) |
-		   ((data<<1)&0x10) | ((data>>1)&0x08) | ((data>>3)&0x04) |
-		   ((data>>5)&0x02) | ((data>>7)&0x01);
-}
-
-static void crc32_init(void)
-{
-	if (bcrc32initialized == 1) {
-		return;
-	} else {
-		int i, j;
-		u32 c;
-		u8 *p = (u8 *)&c, *p1;
-		u8 k;
-
-		c = 0x12340000;
-
-		for (i = 0; i < 256; ++i) {
-			k = crc32_reverseBit((u8)i);
-			for (c = ((u32)k) << 24, j = 8; j > 0; --j)
-				c = c & 0x80000000 ? (c << 1) ^ CRC32_POLY : (c << 1);
-			p1 = (u8 *)&crc32_table[i];
-
-			p1[0] = crc32_reverseBit(p[3]);
-			p1[1] = crc32_reverseBit(p[2]);
-			p1[2] = crc32_reverseBit(p[1]);
-			p1[3] = crc32_reverseBit(p[0]);
-		}
-		bcrc32initialized = 1;
-	}
-}
-
 /*
 	Need to consider the fragment  situation
 */
-- 
2.32.0

