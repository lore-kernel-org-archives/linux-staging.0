Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672B71
	for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 18:18:11 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id w31so8424528pga.6
        for <linux-staging@lists.linux.dev>; Fri, 18 Jun 2021 11:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DoEdXh/VaJ+mbzDRuncceAoCRUlb0lvwPS0zh9/WG+I=;
        b=rm2SiL72/vhadlYZz1wnHDoZbZbCMgU/Gry+VpWLCPiFNvsIUcjKcBBqY/ojvhCCHz
         sZACEvqbm+arlZrxNyFsySDYOObUU9gTFPMq++Z0wOKR0OH6/gXxPfVlgQIyprJmlwIN
         pmMeDrLfHt/biZ0uCf5Wi0mYaRbiYR0I+nQnmrBdNNeTTewruhJTyXJylM83R1bn4tVQ
         Qh+cYaZQh0V/i6ZqItGa/1A+c6uRE870zu0ETARSMBDVPI7+oSMnSv44yLGXyWkH0Bxf
         xM2z0ANFrWbghlp12ss/eAubl9kTv6Oj2QSg/p4F4/C1fxEti/cHX59gyCo22ECkk23y
         YITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DoEdXh/VaJ+mbzDRuncceAoCRUlb0lvwPS0zh9/WG+I=;
        b=WIZ4VzdpR0tYmSteDJ47dCU/cuuQI6uQwFzI2KC4IX6O5btCcecdwhiaEFBf48wG9d
         y2vPqgtrLrglnCmcnlZQYLiZjSoxfbxqYPzq6nGi4CpMWSVjP/6uKYU92ZLksWLw9mvZ
         d21/QKqaJgogLV9aAnuqvXz85M7wjFh1xAq5uvsNK51NllyZUjkiZ+Hmj/c66V28Kron
         V+F5DD5P8ArDUtQIP8Ah/IBSafeTFiq1s1+646Ad9vGqMS84zlrfmpx02BX+Di9Qt+8x
         RccuiIvT8EIehZG/Ua0Uvf/KDa70PgUoNaEvgyhIr35ugfZgETIwtB/vCX7GzV6yNG5+
         SwXA==
X-Gm-Message-State: AOAM531VdXDip6eCt0be7e4lFV7M97/b9k46O9A2+KyIcAXE54Wwizx/
	duSLsMjDACudYHXcDNJaMcs=
X-Google-Smtp-Source: ABdhPJxxLzRZKmYzjmg30+asLiYN9SPrEQ4JMEgRRucb6cPGRBHBqhr5QKYIm3jJLR5lzV2iaMzS9w==
X-Received: by 2002:a63:d053:: with SMTP id s19mr11271566pgi.326.1624040291117;
        Fri, 18 Jun 2021 11:18:11 -0700 (PDT)
Received: from jm.lan (1-171-85-235.dynamic-ip.hinet.net. [1.171.85.235])
        by smtp.gmail.com with ESMTPSA id t193sm984195pfc.166.2021.06.18.11.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:18:10 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>
Subject: [PATCH v3] rtw_security: fix cast to restricted __le32
Date: Sat, 19 Jun 2021 02:17:51 +0800
Message-Id: <20210618181751.95967-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
References: <YMeL7PjstV601pbN@zeniv-ca.linux.org.uk>
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
by element.

Signed-off-by: Jhih-Ming Huang <fbihjmeric@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..97a7485f8f58 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+		*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
 
 	}
 }
@@ -618,10 +618,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			arc4_setkey(ctx, rc4key, 16);
 			arc4_crypt(ctx, payload, payload, length);
 
-			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+			*crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
 
-			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
-			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
+			if (memcmp(&crc, payload + length - 4, 4) != 0)
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.32.0.288

