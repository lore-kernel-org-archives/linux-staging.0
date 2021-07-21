Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99262FB2
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 11:01:06 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id h8so1867093eds.4
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fcJkR5Zxpqb3xet/tE7gmdtBw2VTR3bkSSoPiQJ8c+g=;
        b=BuJBgfO1hH9KAclLZMCRPfKxFwbz4EyFar6FGWEC2FIJWPas/bukSjttYYPBkbBmbB
         DoSRiRKgWOzcgjyf32D9qWsOznOvmMC+yF8jX8W5DmQ3qTa6Xr+mw8fkCCCwikqFh0hh
         DEDsbPU3YUf6hy5H1hOFBLjxmhQP/+1nOq/YEN1L+UBCAoRU555otAmpH+o8kEP+QKFg
         V5gNxQWQPLns6P5C/O+It3MZbskljY/KIXiM1OY4Xw02J+qo7QnlmzkFqmG0padsdDxE
         pcj9Tg//zCgAKaufIJoNZ7i8jHPvEdHQo8FuGBnUgMgKLKmMof2U1nN4moTzri+xuPae
         GIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fcJkR5Zxpqb3xet/tE7gmdtBw2VTR3bkSSoPiQJ8c+g=;
        b=FEt6ymjYw2bg523BBCv3M+D5ieE82sYC8BBvnKufJdIGWMslJVOXZGfbnmYu1IwePO
         9pbZ0Z7DFvgEpnHWEMnfugAHMUr4ve9k0euZqmjfMchRZMYC9zd2pAhrU9w4gwhzLEra
         SqS0jJXMxYY2j4FVTWAmEhIKL1Cg1/mbzlTOH6QjH6aStVgLsA5UWQnkJq9Gx0SWGPin
         rbwKSOAjSogixdBDh/FF7fdEKBKGKrmimu/dgZkplg6OI6h4t36JzOtcSMCjq6+XEidY
         p6O8UDF2Qx3JjiduwdaDQ4DA3WNn29LnpWE2YkyFj8eWnr+hdaXmF1XCqDIFi26hDFY8
         oCUg==
X-Gm-Message-State: AOAM530UYgky/J9+ly/rLhbGY8R73mi9pgCgHqpAChPn6xai8rFwM+Jf
	yTsSwo4ynlGOZVxI/3AoxOf9/rEEQVE=
X-Google-Smtp-Source: ABdhPJy+mu2ZBgTCZ2SpSsajNh9R4BJG/O9dgMAJtQk6mZHxB7wdIKLXeiFbHjMmYwB8mk8fjvhxtQ==
X-Received: by 2002:a05:6402:74c:: with SMTP id p12mr47105613edy.153.1626865265131;
        Wed, 21 Jul 2021 04:01:05 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id f5sm8102482ejj.45.2021.07.21.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 04:01:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8188eu: Remove no more used functions and variables
Date: Wed, 21 Jul 2021 13:00:52 +0200
Message-Id: <20210721110052.26376-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721110052.26376-1-fmdefrancesco@gmail.com>
References: <20210721110052.26376-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the functions and variables from rtw_security.c that are no more
necessary since the patch (1/2) that replaces getcrc32() with
crc32_le().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2 --> v3:
Join two related patches in a series because they must be applied in 
order (first 1/2, then 2/2). Rebase to the current Greg K-H's tree and resend.

v1 -> v2:
Update the commit message with the URL of v2 of the above-mentioned
patch.

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

