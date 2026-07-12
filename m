Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AC2211A09
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783868390; cv=none; b=LJp2xc6H5jgsy5yD6MaiY82DMRUAjXk92QlYvrOfdpuvvIkgtNp8s5K4cZEH8c1C5XYpZQS0EQRIHCQaNIL2Y/SOFxDCqZ0vb7EUu0IHJf+1z+T4G3rzxgeN2hzzjOIRwBgrV6l1TpXDj+O2/CusJgQJGsFMuk0WaocNQdJGQJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783868390; c=relaxed/simple;
	bh=wndxgxOgCk12X0Jl2sY1qVz7auXnOu2Nb66hP6XRdwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcR2Jojr3xl6hKuRwTKgyMz4IVI7I175W1pUPiI2Ns5K+lmeCYW1S4Ag+Mxndf05MH3ZDtHCHBtNxanjNKZn7DAo/C7DayFq4ss8YJ3N3YegTWrqQ+1T1WFZRggpaiG4zY3FEZrv7XlESu+fbCAoMqqiNW3HjxW1yDHohB3C7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIt9hdz6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIt9hdz6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39ca0a30148so14672291fa.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783868387; x=1784473187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/fdqtHsA7kt6bWwH2CKdmdDEMhGqG4sxt1XJFnvV4o=;
        b=UIt9hdz6dVdrakMJkN29Zv7ruqeqEm1SRlOZ/X+b9ZIPszQK6uWrxyxE9O/B40PKH2
         ROf8G9vYSZZhpeXPId0NUDQehN369hW68UJx1uh4RQIhqeYow2NHZ2E5OoMmE7+X9vlw
         9Yg6xEyrdvxM9yQ8GC1EBvObhhFowxFOsBbxpxdylq7p6b2hSpIaG70imERW1c8gecXJ
         dCY85mZZTGDBCa+scdk27hg5KlW0Kvu7BjR9XL+6IokQk0lNm0OZ9ejtd4UvtJEKATw2
         6onRDWitD6NAkv1D2Bi8kZ2bTKmT0VQr78kAvxG50YSQc552NvQhizAqQ3HZl4I8QzkA
         B7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783868387; x=1784473187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b/fdqtHsA7kt6bWwH2CKdmdDEMhGqG4sxt1XJFnvV4o=;
        b=pLqoqMNU0Q6Y+GOjOqeLSppUjPB1Y2n8jUNVFyHvjHaQhtb7UCuK3fC2p8RiibZQud
         5wanPgg/+f/wXgN5G8W9/HGHGe/fAIR0CZyoWqOSQxI8aNAGVHgtxcudNllP8HXABgiq
         VB2N3i6PvnSlv7ABb5JR/WrrlHLQWbrrqHvD1Tkyr0hTPg6Vxrs/AJj0SCaRygSST5TV
         hoo58LKbubGtaMHf2isfOkdqqz/Mm+JzMWY68+aOZhx001PezQNBPCLroQY43ds8I/7L
         4FvWbVcNq5z/RcTBUxsvAImMkF+g5wqtJuge91JrETcSt91EQAzWUAPMm0+U8RcvbioY
         MCiA==
X-Gm-Message-State: AOJu0Yz+Y0GnNlR7avLtL3fnlgtco4awIF9x6FOhWqhwiB1wx5AIjma7
	lWNkOpv6/0hvRrbgNE36IgSiyR/RVwy0noLUyjvd74qIgpCKK8Xus4KMfjCWKJHGGC8=
X-Gm-Gg: AfdE7cmQioHirkuh9RehG5beSkKp7lp3BLlbHopcRg9dtgqbCKvVZ2A9bRR7AWvRahW
	In0r/FVBfZQYxKhTir/1LRHn9QiTT+zMDlfA6W4V6EcmjCNWNiyXB03BMHcIk/mRVipcfd01jXG
	MqBzh0FiKdJ4WBddzuEHGS4hkMnvc6Nu4GhyH+0ICObV7hLiWFVQh68DWaP3Yrpbqbcp/ihI7jX
	OjQmzLOR5Cu40s9nIWFoTbKb33dCsLF3pvTRGGNCIBpMUU0JlA3XtNnlYpPSkgdH/dSiQd5r+/A
	l/CkvfkCYb/BL/vOP8R1al2OkrbH1SSiDcW6XEwbina2kya32NuC1eVuqvelpWqKKosrF4RLj0c
	L6iBsY8NmdiOYANibYXCutxqwFrwz74falQXwV09/CX7uLK0zpXnHk9GKuh2762dsIuIu/Ct4Ia
	FcZA9MdyTa93+IqtZF1jCr0BvqOBThr66aC6RWHt0tIh1ZZT3x0VriKM9KdF5uyo66WDUBYxLhq
	Fnrbdo53AMMokcVvbu1lIQh
X-Received: by 2002:a05:651c:198e:b0:39c:6e84:99b6 with SMTP id 38308e7fff4ca-39caa80e85dmr10280571fa.23.1783868386941;
        Sun, 12 Jul 2026 07:59:46 -0700 (PDT)
Received: from archlinux ([94.180.100.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13423sm22187141fa.13.2026.07.12.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:59:44 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove redundant chip version wrapper
Date: Sun, 12 Jul 2026 21:59:40 +0700
Message-ID: <20260712145940.123031-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant internal helper __rtl8723b_read_chip_version()
by merging its body directly into rtl8723b_read_chip_version().

This eliminates unnecessary functional overhead and simplifies the hardware
initialization code path.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d7f9e3119..a364f4507 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -820,7 +820,7 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static void __rtl8723b_read_chip_version(struct adapter *padapter)
+void rtl8723b_read_chip_version(struct adapter *padapter)
 {
 	u32 value32;
 	struct hal_com_data *pHalData;
@@ -843,10 +843,6 @@ static void __rtl8723b_read_chip_version(struct adapter *padapter)
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 }
 
-void rtl8723b_read_chip_version(struct adapter *padapter)
-{
-	__rtl8723b_read_chip_version(padapter);
-}
 
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
-- 
2.55.0

