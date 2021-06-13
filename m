Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E772FB2
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 10:22:44 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id g24so8102853pji.4
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aehKclAHtGCY3s2LfMz0LAWp7wfIb7LtluGt6xb+CcQ=;
        b=PKhC3CwVQqjokDG93gYrvScBDYIIbhJtq3fc0Y8mND84+JLQ5tl9KgRyqdFrT+qydn
         FEjmmYABLXTBS9Pw+XMcGgcdr1chjWF/b8AoOjLkXIaDZdEOtxrnN1rqIb1jz1R5ffMo
         o2xbLeNw7pGIaPyH7m8hnY/7J7/V5NAuVYlqGOv2M6VFk7JhzMU7TFxelccFhJu61SiI
         InYa2/k9Y6NhWaarh3tPu+6ZJUb5awXD3gsy5RYRv4wPtHmcT2DzUMrK6gYNi2OIaHKP
         61fq6ornHi0kISvuHsF3uPYC0aAV7jaJyZvaih59gzM7neCkhNrWjRDyLjzZe6A++VeJ
         sYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aehKclAHtGCY3s2LfMz0LAWp7wfIb7LtluGt6xb+CcQ=;
        b=QP+3buXLfct/rrsxJPB96gRup+8xSlLUUaHwMKmmPG6N+uBeCFcJxaXRzRtc3g9VuY
         +dFkZws1wc738dzAwbG45FsbP3U8K+cCRxtkT1dPgYazw03xAWEe8Poq2pcBktz9RbZx
         9/TrItSF6BXOAKujesuiHtp2Av5SOS/kSwVC4TUsxJSK6UvmoQyuExzJInrOVvVaLQKz
         4m2BD/40SNoQNb5UOhQ0P+4+JJR7LClNUSVCgMiRVszYif6/j56DQSn1lSg07c8n5cPo
         50zS69cAf+q5H0gY1mSt27Msj7kNX98hU379ctIihG2luqUGobi9dh5hKUP2X1I4IjvY
         3Xsw==
X-Gm-Message-State: AOAM533VusSQ4zZZXAG9GwghZsSK8HosCM0hthA6v5hOTuy9bZ0WP57C
	JDBb6MD6sMJTdKGoi+OY2UI=
X-Google-Smtp-Source: ABdhPJwbRh/9JpJYi8QZHOlOtdnBQ7gWwiO8y36o/5VvPe1f55bE3zXweG2lpt3bpo4paqw8rc0KMA==
X-Received: by 2002:a17:90a:ff12:: with SMTP id ce18mr13293599pjb.215.1623579763802;
        Sun, 13 Jun 2021 03:22:43 -0700 (PDT)
Received: from jm.lan (1-171-209-173.dynamic-ip.hinet.net. [1.171.209.173])
        by smtp.gmail.com with ESMTPSA id t62sm1260983pfc.189.2021.06.13.03.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 03:22:43 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>
Subject: [PATCH] rtw_security: fix cast to restricted __le32
Date: Sun, 13 Jun 2021 18:22:29 +0800
Message-Id: <20210613102229.1424495-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the sparse warning of fix cast to restricted __le32.

Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..2f4da67e31c6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+		*((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload, length - 4));
 
 	}
 }
@@ -618,7 +618,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			arc4_setkey(ctx, rc4key, 16);
 			arc4_crypt(ctx, payload, payload, length);
 
-			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+			*((u32 *)crc) = le32_to_cpu((__force __le32)~crc32_le(~0, payload,
+						length - 4));
 
 			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
 			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
-- 
2.25.1

