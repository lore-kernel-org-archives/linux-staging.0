Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700CE481223
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119845; cv=none; b=IpRQCoCCf89FsrWckHA3p7z6QDRKnWXWrtTHrcUHWAnwiq+rUi+B6JoOC4IIGBT7qL5JNdHGEOUn6Qv1OVWWgHxq/Zv6okZKBx3pPI+JOTrJTmlYyfZ1mAdt9XyyiEIDprYHaFx4B/Sw/CKaQaqMXHvWxEmgrsWl1hYzxjLowyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119845; c=relaxed/simple;
	bh=W1kfFFf1UUPfOfx0z2bPSwVddljx+aBrFAOom2o0kOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XeYSkbSoDrZ7BvnJFaIS6WH6XwKvT642XOFsgMY1Vjool3whpdITQ25fKUXdMv3Z11uygjRZgAnsuIZwpJn17APc75nzTlM2Rr1rPfGZKJ5D5zQwfYE35QVRyvwshzKNnn6TV/9ZcWV++GwzqZptH/MgA6pN4HGkDbOGJBXcYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZlk7QMh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZlk7QMh"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso5086717e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119836; x=1784724636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om3ALfTPaVgmdWBb4RekgbtnCb4GzAeqiusNpd+QUcM=;
        b=HZlk7QMha3z+oFHIlg5t4SdpYWc3gGwKw1Qu5hMeNiLV+hpgQeS4D5iYELvo2oUAjx
         eyh+CjUBNvqaezinRU9bNJl/JIt9cdYk7lxYn4xmyxQbN9KWdKKyLroBjs1RsbNnIcxs
         XSAeQ5usAmd4Uc+hW74b99seWq2+rWZ2rtZ69oAVtCheAcQYbYkaArflbPf+A6KoGXIh
         vy/YBFQL5vyh4O0dRLM/ihWBCFd3kUymUQM7PdwE3zIP7ubuKmJJzAs1kVzgi9U7fOwL
         EFeah6NOab7q9+GY+spngCH77kCLBGZ2DEO5KJf1gnTskBoCA8Y4sE/swNJwFYltgiGC
         ObmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119836; x=1784724636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om3ALfTPaVgmdWBb4RekgbtnCb4GzAeqiusNpd+QUcM=;
        b=EC+MaEZgnwEBCViWicTB4fAp9sOp/zoHf1s6FFcXqGqfCg1xU8TcOMWUMZPwnz+VnO
         G8uWkrr8ARMV7bs0tCx37sXGMYkpyWBpiKVNqru53mRGqsAkN13aj4Ck96wQeMvkwYIt
         3v270HGpT18XUKoA+ZHxg3mvwdLG1zFFSMiB9IoYShTM2VNJAVuEW/F+UDikZfyYLXsV
         NMAgBRMYJ0YbTMsEogjiBzGurqwE8yLMC8FZrdPmzqtKTFkEtQE8D9jwqJnJPEIQIrCW
         PXUFxM/sQq96AEbGvMGqmdN8eNJubzI7UufhMpsM3WOfVfKdp2cYOweF9fZvKfIF5rG2
         OJlg==
X-Gm-Message-State: AOJu0YygqguZWkKJag3unR6CLGXeP1MidQMAFB3YSapiIJvmMFJkhx1E
	LQNrhP4AiaxV0oM0o43/ErmvcdrIrtibBNOpFlPiuZvtPC9IcjFzhfQ1
X-Gm-Gg: AfdE7ckMBvKQonEIC3Bv6qQnjAs57iv7D/5nod5V2bCsupo50I4aSWw+MOWnRlhn2yn
	QNAvjCkthryDJVAQ9NRr3ftfRMCte2bVA+r9yA0G+LBIEkLIY7//HfCBZFcqLjYHQ40jDvAsfGm
	8DC6M3Dh5FnU/wxzWWJSUKKbbmaBUqSp43NLGuC6FQMytaX+VhkSmg7y2i+T7o7XUrIGh75Rak5
	gmWpF8cfht/DI2NIWi98A32lLuPJy7kTVPbUunBaJ7ucyGu1OGhQHTSiWzmdeaKgZlDJ3OsjzJk
	Pt2UIw/WmHsPTi2ZUj3HNqamWEp8vs56kNa1ychZWZYwP9LfTpK9JtjhWB+Arfv1yizH/cGiX3A
	KtWeRANFckzGKlTCP0oLJ+EhxEMVojqTg1+SumLi9KsSXgWbSv9TWo5fbQkgCSDAkPPtftaKAs/
	E58rIAulDf/lQSJ78XAw9ZyiyW+Pxs86yItLFDpk19klqOx37qBUlhSoITyjEk/GOUH+QayMTRa
	XO8jUSenef+Pw==
X-Received: by 2002:a05:6512:3a8d:b0:5ae:d80f:c77c with SMTP id 2adb3069b0e04-5b159b8410bmr1494206e87.30.1784119835984;
        Wed, 15 Jul 2026 05:50:35 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:35 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 26/61] staging: rtl8723bs: clean up Michael MIC pseudo header logic
Date: Wed, 15 Jul 2026 19:47:54 +0700
Message-ID: <20260715124829.90290-27-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the single-use Michael MIC calculation logic. Simplify the
priority array initialization to a standard zero-initializer and pass
the array directly instead of using the redundant address-of-first-element
(&priority[0]) syntax.

This reduces visual clutter and aligns the block with modern Linux
kernel coding practices without introducing an unneeded helper.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 27 +++++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_security.c | 28 -------------------
 .../staging/rtl8723bs/include/rtw_security.h  |  8 ------
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 78bd04982..cad44923b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,32 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			pframe = precvframe->u.hdr.rx_data;
 			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
 
-			rtw_seccalctkipmic(mickey, pframe, payload, datalen, &miccode[0], (unsigned char)prxattrib->priority); /* care the length of the data */
+			/* care the length of the data */
+			struct mic_data	micdata;
+			u8 priority[4] = {0};
+
+			rtw_secmicsetkey(&micdata, mickey);
+			priority[0] = (unsigned char)prxattrib->priority;
+
+			/* Michael MIC pseudo header: DA, SA, 3 x 0, Priority */
+			if (pframe[1] & 1) {   /* ToDS == 1 */
+				rtw_secmicappend(&micdata, &pframe[16], 6);  /* DA */
+				if (pframe[1] & 2)  /* From Ds == 1 */
+					rtw_secmicappend(&micdata, &pframe[24], 6);
+				else
+					rtw_secmicappend(&micdata, &pframe[10], 6);
+			} else {	/* ToDS == 0 */
+				rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
+				if (pframe[1] & 2)  /* From Ds == 1 */
+					rtw_secmicappend(&micdata, &pframe[16], 6);
+				else
+					rtw_secmicappend(&micdata, &pframe[10], 6);
+			}
+			rtw_secmicappend(&micdata, priority, 4);
+
+			rtw_secmicappend(&micdata, payload, datalen);
+
+			rtw_secgetmic(&micdata, &miccode[0]);
 
 			pframemic = payload + datalen;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a4a4f0e6d..6f3069498 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -196,34 +196,6 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	secmicclear(pmicdata);
 }
 
-void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
-{
-	struct mic_data	micdata;
-	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
-
-	rtw_secmicsetkey(&micdata, key);
-	priority[0] = pri;
-
-	/* Michael MIC pseudo header: DA, SA, 3 x 0, Priority */
-	if (header[1] & 1) {   /* ToDS == 1 */
-		rtw_secmicappend(&micdata, &header[16], 6);  /* DA */
-		if (header[1] & 2)  /* From Ds == 1 */
-			rtw_secmicappend(&micdata, &header[24], 6);
-		else
-			rtw_secmicappend(&micdata, &header[10], 6);
-	} else {	/* ToDS == 0 */
-		rtw_secmicappend(&micdata, &header[4], 6);   /* DA */
-		if (header[1] & 2)  /* From Ds == 1 */
-			rtw_secmicappend(&micdata, &header[16], 6);
-		else
-			rtw_secmicappend(&micdata, &header[10], 6);
-	}
-	rtw_secmicappend(&micdata, &priority[0], 4);
-
-	rtw_secmicappend(&micdata, data, data_len);
-
-	rtw_secgetmic(&micdata, mic_code);
-}
 
 /* macros for extraction/creation of unsigned char/unsigned short values  */
 #define RotR1(v16)   ((((v16) >> 1) & 0x7FFF) ^ (((v16) & 1) << 15))
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 22eec2215..5bad48ed6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -249,14 +249,6 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b);
 void rtw_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nBytes);
 void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst);
 
-void rtw_seccalctkipmic(
-	u8 *key,
-	u8 *header,
-	u8 *data,
-	u32 data_len,
-	u8 *Miccode,
-	u8   priority);
-
 u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe);
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe);
 void rtw_wep_encrypt(struct adapter *padapter, u8  *pxmitframe);
-- 
2.55.0

