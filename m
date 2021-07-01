Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC570
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 16:41:22 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id n25so9302336edw.9
        for <linux-staging@lists.linux.dev>; Thu, 01 Jul 2021 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DCSwQLY+NfDp0ULVgf7KjIIvSKnf6ogeaknPu37X59I=;
        b=kGFx2li/6H4JCmHo3g8pTtSz4fjFMdPEpS9U4RC9ftI1xrn8LHjooOmG7/TRSCV8Pw
         c8IIDTyv7cxEs8w2Z/AOKdboB29vlb5CYLak8phL/2g+2NXtExD39ewrk5pfOvoRFn8n
         4V4lGbH+X5ctsYD74w3KK1TalvHXKwAicjir+JMBDzCus3LM7wwzaA2vijKbuUIiDllH
         sIEb8zYWlow9JmnD3wvez2A4EhmCoDeXzd7NWdFSUCKx5JQjz8BaWauJnQlkiA4/tND0
         LoC1g5wAG2myuRaAXUEe7dMX9+MHLR6gCJoM9wknKOt2/5/KCIkDwZrZu96HDtzupDj2
         KDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DCSwQLY+NfDp0ULVgf7KjIIvSKnf6ogeaknPu37X59I=;
        b=Yxhj9b7S0LkKI1rTIdFkFnQqssJBRCcnqnYhDSMBRzRnSZ87Cuso0/uobza8tnP7wn
         whJOu98P/1V2OfYTBQXWiPR2vgQOXEKQGWwycXnYGLa7W6+U6u6NqJqrYDaH7H4afz6h
         JbYYBC/l/qasy31yMIVxlpyvsPsptdcc9yjnwp1Gir/jYS+cdO1iAUEwDQgYBLYoBIrV
         e0TfGencA6s42fHaRhEuB2se1YtPuIjNN6FsYORTSoNyL0t9JDJfmQoplbO/SABCLo1o
         aguwQ4EZ7C9y3OW5NwTKWc5eDjRPFQF95Qxx/VSvDt0jd+LzPh+uRc88e9SORcKImjlP
         wZEA==
X-Gm-Message-State: AOAM531JcN728/Tv815Yt203F7eIUCbwP3O88Qz3IiPuCEr6a1PHPLVp
	BXvl7FX3aF0jBgyrZ4NeX98Lwk1KLuk0Bg==
X-Google-Smtp-Source: ABdhPJzGQ4SCTTq2zBeYEmGpLKuL7z1Vl7V7/amaLMdL8TZ5Yl3Gq7yhmhXX6vJaZlFYZlnSQ5UbnA==
X-Received: by 2002:a05:6402:1c1a:: with SMTP id ck26mr1010591edb.230.1625157680886;
        Thu, 01 Jul 2021 09:41:20 -0700 (PDT)
Received: from linux.local (host-80-181-152-252.retail.telecomitalia.it. [80.181.152.252])
        by smtp.gmail.com with ESMTPSA id em20sm120160ejc.70.2021.07.01.09.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 09:41:20 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: rtl8188eu: Remove no more used functions and variables
Date: Thu,  1 Jul 2021 18:41:15 +0200
Message-Id: <20210701164115.4288-1-fmdefrancesco@gmail.com>
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
https://lore.kernel.org/lkml/20210701133809.26534-1-fmdefrancesco@gmail.com/

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Please, apply after the above-mentioned patch to make the code build
with no errors.

 drivers/staging/rtl8188eu/core/rtw_security.c | 36 -------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index 5f010cb66970..ce2d31287ee2 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -75,42 +75,6 @@ static void arcfour_encrypt(struct arc4context *parc4ctx, u8 *dest, u8 *src, u32
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

