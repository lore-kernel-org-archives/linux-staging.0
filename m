Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE470
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 19:04:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id hd33so14711594ejc.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 12:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RRHnqgTDleVFG5NcQlSkXobdxLX8J2tzmW5qrxaqAB8=;
        b=Xdi05Fm4oIRff4UVzx1er5Cq+7tg+KuRGe6A7JK2alkLfWTlO/oy/ByAsCNBU+3wMu
         IHVsR3ZlA/UP2c0f1MWe/J/x3kmL8OyoACCTsQNwoYWGlMyLOjUDc3w/VO+iYgA25XKJ
         kmWLAn1zl6jkHg6PuKrp1PG9hfOzs5xh9YLlpp8F79e/xBvatxEVIyi1F0dOE7+lvk+V
         T1FeLUYm/P9j/M0rxzhhk1LpOvbkjcc7coFKWqKXJeiNYnFdgZAK4pM/PSbBqk2+btmo
         ZyJx5VK6ZDjXpONyvMSYst9IwugA0vIjdiHx3mq/bsuVlvjS6xw7Fa2uOICDO1jtVesn
         BKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RRHnqgTDleVFG5NcQlSkXobdxLX8J2tzmW5qrxaqAB8=;
        b=KR+emU7uyVfwizgTds58lNYPNO9+ejTYccRrUJvTu309goakjcpAFsb9KKlcVRIWA7
         BFO9va1sWcMtxrIeBQXdXeDA6whtnswGBr3w0OunC0KIFrcKYF20Ocu/z8L2OY0qTPQY
         OqI10YY79dPGT6hQKJYsMoV7r6xjjUUCSur+gQLWFHtk1KEwrtn2GVsK/jSHoQbz/q8X
         DIGhfA7ZPIJDLI3NrEVWHSqGjBwDrJ8r+LwWu2f/Py7FCHrou0j/MOmk9mQk9ioF+qsB
         IYnBMYEQztA7iCdLauRsEPhwkXwJ5y+P2AhFXJ5qvmqpLh8JFif7qy6AZk3kTP4UW5G4
         QkcA==
X-Gm-Message-State: AOAM533+YOFsQcwOoAJioDI/dbd5jPIiJ0ykuuwmdIrzOxnKZNsAZm0V
	AkHuxxOFivvq6RORCf8BWms=
X-Google-Smtp-Source: ABdhPJz7otacVuB2JTm1gosl7q2fM5LVZfUIJ+w17cg59HUTB6KjvdvIWAV8N63GbhIXpstezhiY3A==
X-Received: by 2002:a17:907:988e:: with SMTP id ja14mr7444582ejc.173.1626203042308;
        Tue, 13 Jul 2021 12:04:02 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id g23sm10045807edp.90.2021.07.13.12.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 12:04:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fabioaiuto83@gmail.com
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: rtl8188eu: Remove no more used functions and variables
Date: Tue, 13 Jul 2021 21:03:58 +0200
Message-Id: <20210713190358.11864-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the functions and variables from rtw_security.c that are no more
necessary since the patch that replaces getcrc32() with crc32_le():
https://lore.kernel.org/lkml/20210713184629.7358-1-fmdefrancesco@gmail.com/

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1 -> v2:
Update the commit message with the URL of v2 of the above-mentioned
patch.

Please, apply this patch after the above-mentioned one to make the 
code build with no errors.


 drivers/staging/rtl8188eu/core/rtw_security.c | 36 -------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index e9de61afe881..8ec0b897ba3b 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -76,42 +76,6 @@ static void arcfour_encrypt(struct arc4context *parc4ctx, u8 *dest, u8 *src, u32
 		dest[i] = src[i] ^ (unsigned char)arcfour_byte(parc4ctx);
 }
 
-static int bcrc32initialized;
-static u32 crc32_table[256];
-
-static u8 crc32_reverseBit(u8 data)
-{
-	return (u8)((data << 7) & 0x80) | ((data << 5) & 0x40) | ((data << 3) & 0x20) |
-		   ((data << 1) & 0x10) | ((data >> 1) & 0x08) | ((data >> 3) & 0x04) |
-		   ((data >> 5) & 0x02) | ((data >> 7) & 0x01);
-}
-
-static void crc32_init(void)
-{
-	int i, j;
-	u32 c;
-	u8 *p = (u8 *)&c, *p1;
-	u8 k;
-
-	if (bcrc32initialized == 1)
-		return;
-
-	c = 0x12340000;
-
-	for (i = 0; i < 256; ++i) {
-		k = crc32_reverseBit((u8)i);
-		for (c = ((u32)k) << 24, j = 8; j > 0; --j)
-			c = c & 0x80000000 ? (c << 1) ^ CRC32_POLY : (c << 1);
-		p1 = (u8 *)&crc32_table[i];
-
-		p1[0] = crc32_reverseBit(p[3]);
-		p1[1] = crc32_reverseBit(p[2]);
-		p1[2] = crc32_reverseBit(p[1]);
-		p1[3] = crc32_reverseBit(p[0]);
-	}
-	bcrc32initialized = 1;
-}
-
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-- 
2.32.0

