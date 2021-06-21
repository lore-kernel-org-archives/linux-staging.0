Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5C71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 08:19:44 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso1222336pjv.4
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77hf/T8lwDKu+LOBcDl7pOZpmghmTiN2GKRCSb96Rx8=;
        b=DY4YWQUf04XklvK2k1UJkaX/mFPv5j/WzVzLuU4pgdzbOhzY1ZSQ8g4GV1bG/BNJFz
         /3Wv/ZRnqVvTvR0RhyzX43rm0uiQ8SjPK5z6v+HvTXnemGQycjwZzIzNvCFnDVi1EqMv
         CEoaaxrOSq609fK/fH9XUO6Q8GrTCb65a++MkgO1/eAjplkFlPL7c6eh2DwqkaY3qmCr
         lvsFEnUgfz80XY/+E8sd5LeU239VqUJpUdAi/b8mRMVJKk/KHrMLoQqDrpp9zA+UuX1q
         P5jCag4SYP9hnzjF6qW4VbpIDQczTqKq193OEEAaRATB5+vl/vPEcz0st/3nRNLQfkzd
         qJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77hf/T8lwDKu+LOBcDl7pOZpmghmTiN2GKRCSb96Rx8=;
        b=YGB0zZOt9Y9ZfSOZi4gefloMmfOtEG+KE1+1GqfvNegHq3/QlCh9w/4GkyiTHQHfMM
         p6C/LbnZlA6QeFKuuGj9jQ8R3ctMcGx7+SKmtqEG4BS2WOM92tjw+2ESPtlMllH5MAcs
         LbqDlKGY/sfR2ctEvT+jXzhsZxTh8tlTBZA9ZNgGx08YXA4n8pJUEtc3NLp2mAzsJElD
         qx5mrqd33FfdnujDBbtILB1WlG6t+g3497jEmh+jv0IrwmGLDJGLHezEWpZF0xXtH6H2
         1ytOtLGUzBpGRYKsaExoXgK6pRd0pcK6ggYwH+RDvNNQFbuIc+Be1Kpx6J3Q9nVJar9b
         XXVw==
X-Gm-Message-State: AOAM531yh5STKpR0uO7Ur9oADZeO2u0fKFrMfkHgWmhiZgPMc0yqnHJG
	gywzi+n0j3ZVQesPxsdZOGw=
X-Google-Smtp-Source: ABdhPJwmTtMRPENxKEKo5otLMCyugFRQtTECBJzwX0OindmT7C4PaS0PZJARgPsf4hnCNGXhvJr9+Q==
X-Received: by 2002:a17:90a:4410:: with SMTP id s16mr24872989pjg.25.1624263583815;
        Mon, 21 Jun 2021 01:19:43 -0700 (PDT)
Received: from jm.lan (36-229-229-123.dynamic-ip.hinet.net. [36.229.229.123])
        by smtp.gmail.com with ESMTPSA id u1sm14384584pfu.160.2021.06.21.01.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 01:19:43 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>
Subject: [PATCH v5] rtw_security: fix cast to restricted __le32
Date: Mon, 21 Jun 2021 16:19:28 +0800
Message-Id: <20210621081928.145203-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619075255.107807-1-fbihjmeric@gmail.com>
References: <20210619075255.107807-1-fbihjmeric@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the sparse warning of fix cast to restricted __le32.

There was a change for replacing private CRC-32 routines with in kernel
ones.
However, the author used le32_to_cpu to convert crc32_le(), and we
should cpu_to_le32.

Ths commit also fixes the payload checking by memcmp instead of checking element
by element and removes the unused variable.

Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..8dc6a976b487 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -92,7 +92,6 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 {
 	/*  exclude ICV */
-	u8 crc[4];
 	signed int	length;
 	u32 keylength;
 	u8 *pframe, *payload, *iv, wepkey[16];
@@ -119,10 +118,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		/* decrypt payload include icv */
 		arc4_setkey(ctx, wepkey, 3 + keylength);
 		arc4_crypt(ctx, payload, payload,  length);
-
-		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
-
 	}
 }
 
@@ -537,7 +532,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	u32 pnh;
 	u8   rc4key[16];
 	u8   ttkey[16];
-	u8 crc[4];
+	__le32 crc;
 	signed int			length;
 
 	u8 *pframe, *payload, *iv, *prwskey;
@@ -618,10 +613,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			arc4_setkey(ctx, rc4key, 16);
 			arc4_crypt(ctx, payload, payload, length);
 
-			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+			crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
 
-			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
-			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
+			if (memcmp(&crc, payload + length - 4, 4) != 0)
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.32.0

