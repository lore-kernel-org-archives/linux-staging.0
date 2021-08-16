Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8B6D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 17:35:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id e15so21495388plh.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shshp+f6owMomFz5kbGuNE9NZBaJdb72qeBwnp8hDC8=;
        b=snG0N+LZ3BeGB4xeF7DAqkGpoE5hlsvN23oaaFzyby4vWBY7MsXHKRqnr/gMqzJmBe
         /n6f27K/hQtMFGFIzlwFv7Jbe5/KsNu0bcoxR8FcflSKyCJrNCPwtRTyDFkSjCN8G3m2
         w16lT/tLHF4k0HDQGIIXigNK5vKZucgoRkDhtcTG5HIos3v8dO+34Zhrm2YmOTHRhdrn
         4kq3yhsMBmxqi55qY1Yi8xn/HlMFdMzGNIk8T+lXwgPMQPWYFE855zCm11fYY7tNrOwI
         MQ30QoAKEN1/umzqPthtMFmZ4lW1EACufxslXsEApH4EiCEuwyPJy4GApla7UF6JqCOr
         i2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=shshp+f6owMomFz5kbGuNE9NZBaJdb72qeBwnp8hDC8=;
        b=IkRoQg9mfXIZnCno0pLK+VZnZOnvNn0Y3OaimAtzLikv74BRbYqktf536GdcYscv+Y
         vQ08PML/DQ68EFOYKk+09BkAVbLqtmHWOiQPDu8NhlXSVyKqqDVVOceD3dnqJEz4ZEOJ
         J/O0MELW90VcRUci11EwTeMR+9CSODS+8aJAQnx8+T5hgvnTZaKQOizeq+PMaHdZgCCG
         uPQrhzWdjaJwocKOY86fsjp9YJMPBre1XkP/UcQ8OySOO1kvQMuvZ7w6HQIT7Vvo4QJY
         TrE55lDTxncU8+TNmc88U/vSUAMDNLgztV/jvx5VEtTFVKy9qMZ7uJUhunExTWwTQisS
         Nhuw==
X-Gm-Message-State: AOAM53158TDkN5iPwXJUlQZUN7F2HhFNKSNpHoQfmxq8wkih5u9xujKH
	8a/6C/5pez6rXwVrXac6tH4=
X-Google-Smtp-Source: ABdhPJyQGwNqXxd0CSV8vm/Q/+9RvOBtY+AGz5gr7kNng4MCzaiALd2lN229sfuX9/697AonPTeT8Q==
X-Received: by 2002:a63:ff5e:: with SMTP id s30mr17302398pgk.390.1629135335273;
        Mon, 16 Aug 2021 10:35:35 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u10sm14030pgj.48.2021.08.16.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 10:35:34 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bjorn@helgaas.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8732bs: incorrect type in assignment
Date: Mon, 16 Aug 2021 23:05:06 +0530
Message-Id: <fd60862b159ac6693feadc92e5574ce1e07ac456.1629135143.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629135143.git.aakashhemadri123@gmail.com>
References: <cover.1629135143.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cast u32 to __le32 with __cpu_to_le32 to fix sparse warning:

warning: incorrect type in assignment (different base types)
expected restricted __le32 [usertype]
got unsigned int

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..381deeea99d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -8,6 +8,7 @@
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <crypto/aes.h>
+#include <linux/byteorder/little_endian.h>
 
 static const char * const _security_type_str[] = {
 	"N/A",
@@ -69,7 +70,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
 
-				*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+				*((__le32 *)crc) = __cpu_to_le32(~crc32_le(~0, payload, length));
 
 				arc4_setkey(ctx, wepkey, 3 + keylength);
 				arc4_crypt(ctx, payload, payload, length);
@@ -77,7 +78,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 			} else {
 				length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-				*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+				*((__le32 *)crc) = __cpu_to_le32(~crc32_le(~0, payload, length));
 				arc4_setkey(ctx, wepkey, 3 + keylength);
 				arc4_crypt(ctx, payload, payload, length);
 				arc4_crypt(ctx, payload + length, crc, 4);
@@ -506,7 +507,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+					*((__le32 *)crc) =
+						__cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arc4_setkey(ctx, rc4key, 16);
 					arc4_crypt(ctx, payload, payload, length);
@@ -514,7 +516,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				} else {
 					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
+					*((__le32 *)crc) =
+						__cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arc4_setkey(ctx, rc4key, 16);
 					arc4_crypt(ctx, payload, payload, length);
-- 
2.32.0

