Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB81F71
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 07:53:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id g24so7016816pji.4
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 00:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1bpEKkPGaDRZ2i2zElzyPvoyYFZBlfMCpVCs6DcykY0=;
        b=DdJE62WiwKorwacDUxAbgWndliyBUKIrtL8f5f0Fs2hO0dT1wTLLccDVmi1ILjGcFE
         CYZY+cKWN/XRxINF5rAaz6x3pvJLRCnJtkGOfJK2+R0vtbhjG+kBzlBiB1lMT8WKqVJd
         eOxKubzcktWAnox6dgYmlYsCV5jh2S2zfjtXrlOZuNiXbHQgxqEo/JilkSBdBEF3tRc9
         A5avTHPOwYvaF5TS3RyvTU+7eLwrO2v7pMUUxwHacTfjWrH37+UiLTx+vLBQf3SWUDME
         vcaai/JWvNTU3TmYJQ8f9hhX+gfxhju4m4d1ZEvIQ7rU9fwbNvQBK3pF5fxUoQby3AO6
         jfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1bpEKkPGaDRZ2i2zElzyPvoyYFZBlfMCpVCs6DcykY0=;
        b=ioJVnW/SfUYxGYdwns+OebUNz1oNCvtIhHEK7uzW6RuQQXlNKvY9ajaPFpCiRFQAd5
         E933NcKgfwcCksywo5lc3S7knpKNEYjkATN2mHceSwqYXGf2zFjm94+B4j9pRq/C/2lE
         BzEGrs+bOBrBGWUic9ZRDFftxA+1hF0m3wD8KMTj5fmygHfoR0DnxMY/mnS7Fs5piFTT
         nXl+VmUBjPhnKN9geuyqu+AV+ZgX0/jHZ49jn6pOhnSpkPc+wNMDeuFmr0Wuul42qYy8
         66nuNUhOc06XdNaMBsDgPUDMaMy3zCRNznZh4biN3hMponayfeEp5ZfKJ1V+lFdLV/D/
         bP9A==
X-Gm-Message-State: AOAM530RyM06rrssf3fCNGNr88tr2YbVO+wOVWuDy4oUAV7a3uRf48Sk
	jz/8na2HHrQeySNsQRHfvJ4=
X-Google-Smtp-Source: ABdhPJxtd5AFAzs6L7dqBzpaNYoW3iIwPMQTDTFaiRcViLVcc5d6prdTsDbkRgetxV0pwPjXZ2msLQ==
X-Received: by 2002:a17:902:f784:b029:ef:8e2f:430e with SMTP id q4-20020a170902f784b02900ef8e2f430emr8447935pln.28.1624089183086;
        Sat, 19 Jun 2021 00:53:03 -0700 (PDT)
Received: from jm.lan (1-171-85-235.dynamic-ip.hinet.net. [1.171.85.235])
        by smtp.gmail.com with ESMTPSA id x13sm9433189pjh.30.2021.06.19.00.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 00:53:02 -0700 (PDT)
From: Jhih-Ming Huang <fbihjmeric@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	maqianga@uniontech.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jhih-Ming Huang <fbihjmeric@gmail.com>
Subject: [PATCH v4] rtw_security: fix cast to restricted __le32
Date: Sat, 19 Jun 2021 15:52:55 +0800
Message-Id: <20210619075255.107807-1-fbihjmeric@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk>
References: <YMz0DH0+v39xsCYU@zeniv-ca.linux.org.uk>
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
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..3a2711e21a0f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -92,7 +92,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 {
 	/*  exclude ICV */
-	u8 crc[4];
+	__le32 crc;
 	signed int	length;
 	u32 keylength;
 	u8 *pframe, *payload, *iv, wepkey[16];
@@ -121,7 +121,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
-		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
+		crc = cpu_to_le32(~crc32_le(~0, payload, length - 4));
 
 	}
 }
@@ -537,7 +537,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	u32 pnh;
 	u8   rc4key[16];
 	u8   ttkey[16];
-	u8 crc[4];
+	__le32 crc;
 	signed int			length;
 
 	u8 *pframe, *payload, *iv, *prwskey;
@@ -618,10 +618,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
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
2.32.0.288.g62a8d224e6-goog

