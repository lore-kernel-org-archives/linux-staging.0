Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205624483A0
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 09:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046972; cv=none; b=msY5tctvQNNTJJoJQKW5UPg+iXmJezm/HU8GaXR6TTLvYjjLgpjphQLYkyYoEm9yMNtPk1aa7c0OhiA5kgTOa/hms3USPI0WAAkP2HBcGPKLeVsO7v0EgfKaUccxIbP1c6Ug9MrdC+wrZKoSt/2kl/i+rxZt8Y84LdUgIs6c8D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046972; c=relaxed/simple;
	bh=8XgLnxnRBdHCLqPo2Z7m3y5H/VkuP3K8ulUiR4wLTS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXf5XhluvfkZ6X+/ayGUH9qO29B+Lq+keRVE8plFJkKtmL3EXrPaW3o3jwGhi5DkV35OOFNGB9jfQ76tO3cprKFYsU0LKHSuOYxrZjpE4OyoqRPtUb85nvWDJht976Qui2rRhThG0o/mrdPZ7T8X2sjYSAuRY67cXVHU9AdUxEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jrx9X5wc; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jrx9X5wc"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so4139440a12.3
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046970; x=1787651770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbsLyQzTlx3K4qE/YdGkEmh0J6bIgZAvsjWc/qt5Ac4=;
        b=Jrx9X5wcrkyXgVJlV7kZHArSLibDRAA0TLsBhL3zd2ccCVlHVOC+/r9pGVGrPS17ut
         Kv+fHe/dA4ovdP6WVzU3JEALGzXvzOrriv+e46pEMAtueCkI8fVutD+0hzLcD8h10vSL
         EspbydHh3jkWeCtxx7AYV6OV2BYwWrWtgv9ibPXlW5ESWw5k9w+jvc7CGajT0RBkazA2
         v75GrBdbxL5jS1lzj4ePC/ETp5Ktsa2yMIOx6Ta8mRrlcnFz/5qYw/JUadDCh2QOEgFE
         QlZGWYrLveVt6JIthaavOUVwm0xCC4ZGhz28MzoVcu0sjWj7CsDRaRTeqwRyR/nVL38I
         Jc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046970; x=1787651770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbsLyQzTlx3K4qE/YdGkEmh0J6bIgZAvsjWc/qt5Ac4=;
        b=dmG0km0ZRTs/JFPntBgqk40ig7NhLES+pGVV7hfcXExDNo1ui+E2LfbpXFNNSm1NQm
         z1apJjUG9spJG9o23jluMuOXjyofdFg/0L6ZBYE/wGxuP95Emedk69B4UyAsXgeFPoyg
         cSN9V1GIQirC/EDKfqMuvedw6lIRmjScw1fxTARc7iQoJn/jXgzzz55AkSLECyKhh0w6
         jvNjXP1l8r62cKj3qYBcMpjeh0euhw3AYB9w1uIyeULOSyOTDmUDqphp6uyTEEGmrBXo
         MYCh31QNmdQo2MnnW6f2kNRG1PUh0sg9M4Q7Hgc6Vlz6XRKbNOw78q6SJHfhpLuVfncL
         LRZw==
X-Gm-Message-State: AOJu0YytvsCWN1cV5fucsxRCl0xxy5cd5Wzht5/iZKEEaxlB4ZynF+ho
	fns8PA+n6grenG9cwE3JXV1+Ui6Hh0JORWCebKPb4nLfrJV39ure86pV
X-Gm-Gg: AR+sD13pVX7f2CCX2jSrwLqhXMhYr2gxX9lYF0tvDh5Aumxq4kFcIBj6PH98FQsPHh9
	C+DapWFMdm7vLNfcSiYeVYftQCkBvtEzpy5O/OIG96d6mOIzftasD8tKeFRtD1tJaGl7AMa7HP/
	CIN2rvMUatsqYnv0L2gZQL5n7Jto2Y/kHRnykw0DEiQ8s8dUKz/8nZIsG7V5By/O8uLmK5WqDy7
	VilIHXFNKpk8A09y2XJT3vkx5Buqvl8BsF7hic4pHGMiPpwtghvdfclT4ad8W/xcadZPFj1mYyi
	rUUMMVdLgZrfvyVCdrJxfCq8+KtVqULTCLg2j6PVY+GQMYg4XnAzog/8buMhRV4e37+2kvcpQGf
	I9dvxbeMDsp+9C4RRYL9v9MyQOcAZ+ekD8GqAnF54RoobY9z09ARfkjC2XJ3ghyzJNm0GMuDexm
	vMqLHBgjHv0qOB2qtSPuMCx/+wafiDTn5simC2+uGPaZqx2/ep5k6zc4anxQo2FI8+6eHwprd1i
	Gf/q5I6Bv4v1I73QZbmA1fMm4k=
X-Received: by 2002:a05:6a21:3384:b0:3b2:8685:1473 with SMTP id adf61e73a8af0-3cc719c7356mr43935825637.7.1787046970367;
        Tue, 18 Aug 2026 02:56:10 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415305a0afsm22096004c88.4.2026.08.18.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:56:09 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove unused NDIS_802_11 typedefs
Date: Tue, 18 Aug 2026 09:55:34 +0000
Message-ID: <20260818095535.1230025-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'NDIS_802_11_RATES' and 'NDIS_802_11_PMKID_VALUE' types have no users
anywhere in the tree, only their typedef declarations remain. Remove both,
together with the 'NDIS_802_11_LENGTH_RATES' definition whose only user
was the 'NDIS_802_11_RATES' typedef.

This addresses part of the "convert any remaining unusual variable types"
entry in the driver TODO.

Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
v2:
 - Rebase onto staging-next. v1 was based on Linus' tree and did not
   apply, as staging-next already reworks wlan_bssdef.h.
 - Use my full name in From: and Signed-off-by:.
---
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h | 2 --
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index 768e4868ecfd..020b143f36be 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-typedef u8 NDIS_802_11_PMKID_VALUE[16];
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index f4c1456f1476..ff2cee2f3b99 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -12,10 +12,8 @@
 
 
 #define NDIS_802_11_LENGTH_SSID         32
-#define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
-- 
2.43.0

