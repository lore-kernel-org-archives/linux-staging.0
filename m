Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48C3128D5
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868312; cv=none; b=aVL41tT/+pjs6AXlDPbSTkIDgz3odQzzwQiiEtsMO+Lu4Yys3DqjUSggcFZsm2LaUMLlSxyhSguywD1IhVudaPesCNTqgofwy8WGWL0jPIJWuE8ioesi+0ggmfHYUjpu9Ej+pg1zlKy+/mKC4k8RXqmQn4Uxvr7j40DMdjnPKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868312; c=relaxed/simple;
	bh=uZipH4uk/sSFmYFAsVN63Bh5vwppkOBfjqOpG7V4hTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9iYtLxx4UTZRCy4egKzS4tSlURPr2qFvD9MZCdKyi/mtVFkfQc8J9I841OIZQB8xIvNIMHmexEORWHKYngte0P5MeC2fThVV/NBSs6y6aeuPJZMpgDMfxMolYRkO439PD+gX7era4oQncLHjlSV1LNhKLsGurHo2ra32N/Xzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmPKw5ZE; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmPKw5ZE"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so25184031fa.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783868309; x=1784473109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrh2OKfAqYLEpzkF9WFd7qumKcAweAPQxy362YXKecU=;
        b=HmPKw5ZEKjQnOf4K0fxCI3gYMxR2xrxbCA6QawI48H6vrprI7adL4nERmRbJ/7kc6a
         JIyTDFtTHZCDbl+8TSdtPn42sEx0oNVIBHIVK/TyixNSz7uC6RlL+1HfY6OltPfrJEmo
         1zOKlKoWJdd1DLBvssiqFCaOsM0ZNr20+85AY1Lym3AApt1Skp2OZe54tWSWwkKT0Q2r
         pBxqp4VUZXiRZjHwnB5LJu8A4XJF3bBh5DqrcW2pmPbIihQHT5UrU8zV1AYOt6Q80DYk
         lBv6HdgPL+49mDzJxW7zxC3/mNqD8ZQSeLJ4OhZMHBOR/qv7VHNnwb5vS3y6jwm9ioBr
         vKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868309; x=1784473109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrh2OKfAqYLEpzkF9WFd7qumKcAweAPQxy362YXKecU=;
        b=MwVCv6hN9hGrfWn3RNr2v8XkI89aG+upW/RsdThyEilR1i6NJxTJgd/baDeTxOLK01
         rLqqeNJCe2BgyeWCFYGkeKWa8+P5n9RV69mVpLSXqjtvaLYQiMqFtVURVkVoz5nXsn61
         2J/XhStZuKvIU2YI1XmSkTUdbdyYLzqVDWvppxCBQyc7j5gAoEHoCC/9YLUoO4Qg/DtP
         LK8h8WXlC/BeJbzJOgUCC+KMOSLegOaE3oxbSE+QG3fLm6tkDou1SVauKTjNXp8QVKM6
         ylRohX1G5MaWtUDsr3KGVBRYmwh8oonbudmgVOTaCOn7CRIv/p9Mz3MyvHtIcCv+J+a7
         +B3A==
X-Gm-Message-State: AOJu0YzA6bLpiHUOP6wa9dPs3vfhr2uvFTI3GmfaNR9q1/eaRmJra1VU
	ZCS/Z4N7ozDhP13qzTmKyC6Q/t2DpNBRTpIyzcIoz4CmPcwTdItBdtGv
X-Gm-Gg: AfdE7cnPwYu5O0KxPnpixKdxgFGwfP0x2Kwk0nvgFKLreMDSkb/Kp7epTe7iHgZzsTY
	aYPOBQMWGkWA6D31Ltsy2Ql2rmFD/zr67+3p4Uwhi6T1mu0nBCnR2cx0j2cD2AXEZ/ov0aQ74cb
	2LRU/SmJLMT1h1q5gtAbeFxGhL7fyqlyCBqjcNSQwcrn1K+vhJIct2R1XZR547JXho+9QeFEsXA
	+nZJ5BjDw2546zdoonyhCuWdrZE7nMIoqMSeL0IHlVRvXMX0pgBHWopwV0fs4+k5Vt8zksX34L2
	UNiJzD8SHMyFcgsDj3XmjVZ+2fW8nX1uwPkdpd9qC4gYuVuXMmA6RKl+MN1Clgr3uqs+xmtI1tT
	OhSjOUVRZB78xjcKCkKPcWHK/M3WC5kBcO2tzenSCwEDgziKBhjiTLKtwzGqTdrAfYqwtgG/iPV
	8iT6xDeVWZ9leCzIo9NjX9j2nTKIsdiyXgpuRDubiGxZIUceRM0qM0apZmU/WQODnPmDrd/uQzl
	gvSmcEXQpQtNA==
X-Received: by 2002:a05:6512:8344:b0:5ae:c745:f39 with SMTP id 2adb3069b0e04-5b0236a66ccmr854330e87.44.1783868308904;
        Sun, 12 Jul 2026 07:58:28 -0700 (PDT)
Received: from archlinux ([94.180.100.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca54e25sm2102336e87.30.2026.07.12.07.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:58:28 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH v2 1/2] staging: rtl8723bs: rename ReadChipVersion8723B to snake_case
Date: Sun, 12 Jul 2026 21:58:12 +0700
Message-ID: <20260712145812.122618-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the static CamelCase function ReadChipVersion8723B() to
__rtl8723b_read_chip_version() to align with Linux kernel
coding style guidelines.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1b8ae3d57..d7f9e3119 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -820,7 +820,7 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static void ReadChipVersion8723B(struct adapter *padapter)
+static void __rtl8723b_read_chip_version(struct adapter *padapter)
 {
 	u32 value32;
 	struct hal_com_data *pHalData;
@@ -845,7 +845,7 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 
 void rtl8723b_read_chip_version(struct adapter *padapter)
 {
-	ReadChipVersion8723B(padapter);
+	__rtl8723b_read_chip_version(padapter);
 }
 
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
-- 
2.55.0

