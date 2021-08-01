Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8593484
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 15:52:02 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ca5so21976303pjb.5
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xHYz6uN9LUWOmvY1GgfHO4Y8UXl1Yz9tQPohZSg/xdA=;
        b=DIVTihfQx7ZoyF6uyVetp28JcN9ffC3/WRCuobr8y+uj5C1IXeaj0tGzXnLZQdyIzz
         Q2Ia91APyDM+kAiL4nO6TNczvhaRF9BDpPA/Dcw2ZpcwKd0TsJwPceAKJDCSS8UfP3FB
         nBpJFPR91l/Efd3YBzYgI0JANeJ+Kxr34XT4d98rvgKJynnsuREKt8bWit600vIbaIjW
         RuC6fUrTgkKpkXKKvnHGnhVJFVUzqHjMBVGILSDgcyRNFj8weeGGgWixNoVg2x5SUOvU
         RuTJuQ7w64Qxy/hEUaH9pB1w4d6PjA91W47m/Nq6QawzpIrtqx+0sDEdENvLM8dBIfMe
         glLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xHYz6uN9LUWOmvY1GgfHO4Y8UXl1Yz9tQPohZSg/xdA=;
        b=kp5O+OD2yl45rlunmLIDr94E4Si01UlZzRxvJug2/JouOgukKLf4dfbIpF4Efxl/Zl
         F2cg8kZ22emM+UIVGmOKvEvvYYZwN2i7RASOeiwmnZf7NM+AaWdRm4v8rjIYPqvnexGu
         O9CZUPMIe7GWE/2q4Jme7Oeuh95nTA7J5HCRfAA9361fl36C3TI99hXLFPmYE+iN9ngp
         vBcieLFiBtJuQoCSRyk0fBpOXm5YkeLJY3HirCgf5s9lHQV/7ZnrVFKZ1Bn9coKp/hLQ
         W8L/kxg0r0nmuldn9z6HQqe2Q177YTME0OU1zrSGvz6wVa5/XcbcV8F4aNrqD9fyFXER
         UV4g==
X-Gm-Message-State: AOAM533jowL5dtAqWXWq2L4KosTrfu6nnv66GTCiye3znt6LgxFesQdA
	RS5jz/P9aBeeY/F+o2sGXTg=
X-Google-Smtp-Source: ABdhPJzRpZdLWngsKXPlPYXZ3ycUcVxOFOUrjpmiy1xtLZie17+yQVXoPRofZuvjmKHrUthDPtyLWg==
X-Received: by 2002:a62:3342:0:b029:3b7:6395:a93 with SMTP id z63-20020a6233420000b02903b763950a93mr5305787pfz.71.1627833121661;
        Sun, 01 Aug 2021 08:52:01 -0700 (PDT)
Received: from jm.lan (1-171-223-196.dynamic-ip.hinet.net. [1.171.223.196])
        by smtp.gmail.com with ESMTPSA id n33sm9579563pgm.55.2021.08.01.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 08:52:00 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7] rtw_security: fix cast to restricted __le32
Date: Sun,  1 Aug 2021 23:51:52 +0800
Message-Id: <20210801155152.242089-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YOIGbc2ymnWrThVK@kroah.com>
References: <YOIGbc2ymnWrThVK@kroah.com>
Precedence: bulk
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
should use cpu_to_le32.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
---
 changes from v6:
   using get_unaligned_le32 to get the value and comparing it with crc,
   instead of using memcmp with raw pointers.

 drivers/staging/rtl8723bs/core/rtw_security.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..ff79e1aacd1a 100644
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
+			if (crc != get_unaligned_le32(payload + length - 4))
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.32.0

