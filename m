Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495972
	for <linux-staging@lists.linux.dev>; Sun,  4 Jul 2021 10:31:22 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id g24so9622633pji.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Jul 2021 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+SXNSKNXxwDQN76TM6wDWq/ftkeMMK3jqq9zEGt0hFM=;
        b=JMAikmignRUYOBEAmbBVjl+bbUk+nba5qUl7BN+8MCpdgx6e0zWAeywPyR6jN1Hf9b
         ULIN4mF46SaV9uF5+GXae9HodwzuMs7FUv96Or3gZvjOhV2o5FJeE8zqoE2WJDCT3pnE
         tNeQV9yJWBEtJGMRxNGEk2BapT7ZqANUVcGgx2ZKHzZbTAHcBqIXwenHHYkWWzPWkdXh
         20Mhf7ap2EISghwCuezij7oWHdFTnmkXELLflQ94eHOX28VeMfyftq/hlzWDBox8YlVj
         TMI+WW1IgrzeiFvkXZq7CFP4yduSojFOuffwjg47ennTLXHEzvJGsKWWAzdSRn5JGHoi
         GV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+SXNSKNXxwDQN76TM6wDWq/ftkeMMK3jqq9zEGt0hFM=;
        b=mBt8uLbZz9GU3gnahQTrt8wFkh7dg3tviaHvslQ+whtmn6GEY9HfGfzLtNXBZlxSUJ
         BTrCWlyOGi/aFDVHguJ7YS0+f8etjxVtkzcJ2ZWXvCSFinyRt8z5Nqxa+jobcNOUqDp7
         9CilgCSu+Lm1+0+J+gF0hlL/DhivgacX43Oxa81BKlbR0kc6IcJWtZSpX24X2EI8iH41
         002BOgRWThKvOYVVLOaQkKzwwkEMCVsBx2k0qOOmcdAx8FZIQwx6i/4yz2UtyEdHLzgc
         NNKJ1LxC3vhM17hoKFsPN/s6mamJ0DRFMVGGHAQHBHOWwqvEv5jRKn2CVUDB6gN1LBvP
         E4ZQ==
X-Gm-Message-State: AOAM531AqjT3j3bmJdAizSc+qTku85JWUmp48H/EXs3taBRS2Mh1kpg9
	A43jXVKhFVaxf1RHmS3t0BI=
X-Google-Smtp-Source: ABdhPJz/UxDItUXUfG3cyyO+lMba00LMTVVmCZdt4vrPO0gOe3sbipB/RzLAL1M8ypsnH5OBgme3zw==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr7674359plq.42.1625394681931;
        Sun, 04 Jul 2021 03:31:21 -0700 (PDT)
Received: from jm.lan (1-171-225-21.dynamic-ip.hinet.net. [1.171.225.21])
        by smtp.gmail.com with ESMTPSA id g204sm9142636pfb.206.2021.07.04.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 03:31:21 -0700 (PDT)
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
Date: Sun,  4 Jul 2021 18:31:12 +0800
Message-Id: <20210704103112.76962-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bdc0c31a7d28426995d229eb9014cd2b@AcuMS.aculab.com>
References: <bdc0c31a7d28426995d229eb9014cd2b@AcuMS.aculab.com>
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

