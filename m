Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7C3B0AC8
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645126; cv=none; b=Z2SYl+cJGeghC9OVIbbRag+WsT5Aeq/8RvMAdpePg6G+Tvb8u1lPict/37BIM0ueFl9EY4NrBKHRSvNC7lJCL6bhIaL6FTuYckQTFX98MPcQ+lGF69Oi0/+xP3PQkdN/ubxS1LrMaMNXmt9qNtf9wdzhiJbxEqBIkZNVdy6KbMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645126; c=relaxed/simple;
	bh=f0PR34TdvdOJrt1uwL6aSTlLoYOFX2Kguotwc5bcPbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=arD9II3cCDQH9zCgZsf43anf21MS0C1wa1XeNSn538jc/ZnNmLyHP80Tevk6eqI4LgyUOCWGnCtc1NJA9yogtYZWUQACl4Ry9LJF8RtMxqFNjhCAwWtOu+cjXtDx5RnKSSfIzWjJZoV8Tll7PgKqCyeV8fcg9cqyvewsMomxdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsB0Yz3B; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsB0Yz3B"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c19d23b19so1653043c88.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775645125; x=1776249925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp4VWnoRlBF1ISs3ZdJ3il8z4bzscVAuNmEdfs/zcNI=;
        b=PsB0Yz3BjDcw0pGDgxKZjEdRr6eetu2cAGO8fwQC/SdzBlp8NN82L0Laj0+sv+g08z
         3znK34qlpBl4zdhXR3l0fvjTctWECQb9pfH1s+PbOpiI3sCPKfPsHc8xPL/L2c6TBER6
         6m2IsSltQI09HQKoCF/CXIHw9K8M13UKPNXIqvoclop6nqZ1YCcAA0Ouhd+ohkVx8D0n
         cZ3/ueBAybw/6FY3Sr23GDDIGZdOtkWlq3wKmNooSIMtKC+IQy+AkKo8e/cTgwNJq7B2
         ix0I9YB/ubyziJMS+BD4jMWh6opgSGj6z+WpLpPip3iSpFQW+rraIhuYT4RdAYv9Y4bk
         bCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775645125; x=1776249925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wp4VWnoRlBF1ISs3ZdJ3il8z4bzscVAuNmEdfs/zcNI=;
        b=aXW14OMofs3Kt6yQqhimv/vzo95C/9rZRbih0IahngM2OmZt3Tn8ucONWq3mCsoOdw
         FjoNUKLxFwWWNmbba8RWhfaiGVOrJjv9tl+a0MZPPDEdEJY0yd3cdckCrGc3iqCpPfZO
         maFK9WStR9eAtGEfkgJUu7joQSvTIUcA/1tRvlvRfJPwSFQwcn1TQd9bjHMvfOHzHYwK
         4qO2Ohg6vOOuqN7zED4+33Q5qJDqxCXykplqLo8twCFiED25kUHRitwNKYPQO7RSFzR2
         QBqpTqmdowilSl6ke/y0KzFkyY/9teufTUr3TixVMEZzALZFp7ZDtIvWuX9JANTC31QZ
         +yOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOeE4Fhiy22le8qnV8BxwkBnCJ447JLUfPABjekFqE049ELazPl8qsQFX3rpuH4zpOcr39DcOLlrHOgXuE@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw27FLzZQVygK7S81mOtDK4ZubmZJJ9xlR8FmXSg2Qn3/6WVjI
	G80BhtmvHDsai45ncp51+pp9PR46Mt+QvOiQFYuzQS4wzBRPC30Yt9OI
X-Gm-Gg: AeBDietlI++q+vKlK7uKagTXL64D4tWFZd1As8uZlDrcLhWNXOwIk31aJpB0hl8+ucj
	McjodVsuTc511qVfnlFD7BqNezM9Tm9juKMz9wVOXRJ6gacs/BbpxpGVH87k9mnhVYGWabVKpZP
	Yf8E8ubXFoG2RIXCqTC3oFINFweOouLCuMLXyimjxXy106ig2ADXUVKKq/MYIFX+Hk4y32zmADb
	TgKF+F3lOsKcWtOTJuAZz0R/2Bv3OE0KJ/rJyizKrykf/hdr+meGk6UsAFt7UujmIFLi4JsWTN6
	GAyPiyxWU6bp4DD34YYoMlUzDDLC7agpg5IQCHT4vqFi8bk8MnuZUQhZ3SqVpG21erB027MMHs1
	I53TO5QQAumjhTHHsfP1ZPqp+EPeYSd3IsjmaKKsd7IOeHVL5vHgetHZoWqXYf0dEf5+DYANURm
	lN/n+a1hXZ5V0VLdI3nwpx659HEf1ouLEqbz3cDhySvhhge8FATLrz1ww=
X-Received: by 2002:a05:7022:23a4:b0:119:e56b:989b with SMTP id a92af1059eb24-12bfb6eee73mr9293876c88.2.1775645124550;
        Wed, 08 Apr 2026 03:45:24 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm24417783c88.0.2026.04.08.03.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 03:45:23 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 4/6] staging: rtl8723bs: move rtw_os_xmit_resource_alloc to rtw_xmit.c
Date: Wed,  8 Apr 2026 10:44:22 +0000
Message-Id: <20260408104424.18952-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408104424.18952-1-dennylin0707@gmail.com>
References: <20260408104424.18952-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move rtw_os_xmit_resource_alloc() into core/rtw_xmit.c and make
it static so the xmit init helpers live together.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 13 +++++++++++++
 drivers/staging/rtl8723bs/include/xmit_osdep.h |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 13 -------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index befe74a1bc4c..249947a7d910 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -73,6 +73,19 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	return 0;
 }
 
+static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
+{
+	if (alloc_sz > 0) {
+		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
+		if (!pxmitbuf->pallocated_buf)
+			return _FAIL;
+
+		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
+	}
+
+	return _SUCCESS;
+}
+
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index 880344bffe2f..5b351652e31b 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -30,7 +30,6 @@ extern netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetde
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag);
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag);
 
 extern uint rtw_remainder_len(struct pkt_file *pfile);
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..54a6d54400e2 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -46,19 +46,6 @@ signed int rtw_endofpktfile(struct pkt_file *pfile)
 	return false;
 }
 
-int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 alloc_sz, u8 flag)
-{
-	if (alloc_sz > 0) {
-		pxmitbuf->pallocated_buf = kzalloc(alloc_sz, GFP_KERNEL);
-		if (!pxmitbuf->pallocated_buf)
-			return _FAIL;
-
-		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
-	}
-
-	return _SUCCESS;
-}
-
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag)
 {
 	if (free_sz > 0)
-- 
2.34.1

