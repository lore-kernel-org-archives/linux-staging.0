Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AA309EEB
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255638; cv=none; b=n7bcnIq2aqF4H5ZvIoJG5d+83ewk/WroqDpMJo7R9JF3ugvL/Oo5wJhP+ByXFVWe3FKW2/8JFW07RaUWACZDLHiqLfhIKEne9smVoInnT2gCmfHS09xBpJkF+A9IxBgrOG+eMtEhxlCzPyWe6M/jddq8DFgRzZEbXonysLMdDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255638; c=relaxed/simple;
	bh=I6LtF8EXeUhtj1XTSCUwhMx2r2YSL0nbFlFVgg6JO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGwdXhCSahMo3rwOOzrC/6LR/APCei5dfkLeGnWgNH99Im/CC6vHW89ZUvhUxequ1+QYbEovqbSFmt0ny45wITWtzPX5/4ABlnfOELaT+KXxwsDJ8p8JVXm8wGIS4rjEBcUnrWfz6DdNzbpB/n1BXCQtbPhb0MVmi/v/Ecqm+vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+6Sl/lD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+6Sl/lD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2b542cbaaso2504830e87.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255635; x=1775860435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SJm2/vQIkeZjn/ALUzAm/F5ea60bFLPKLzg1uDXLWk=;
        b=r+6Sl/lDC2Ouns/GP7fwY5DDQziBHnSkAJ4oaZUVRffWRYrJaKNymXiIwhqDv3XOs8
         hKVM/riy9YxMoe5/7sJWthqgqT3L/kEqfpOSk1p+B6W9ddO3C6miFdNt1FvaZyqdULcZ
         6T4NEdIaHzNZ1N/V3hMmrNUGKP/rhDGYf3gD0zb0J2ODufxs0WB0pSkHsQ3vd0Vzci5K
         EIEry16ZeEF54vXjhQcGQ6gAjjc1O2DCYoHjwtZNDwjmE0VoTppT4bWkfDXN9rFoinb1
         +k9I8aPIJDQ63jno2C/+CExzYlqwQmptRCV+9S7njZ7sji4c3Av4XRQyD0t8ATOrTq1k
         04Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255635; x=1775860435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SJm2/vQIkeZjn/ALUzAm/F5ea60bFLPKLzg1uDXLWk=;
        b=aipJ7oM5eoq6xWSuuL09YjNaEodOq/+J7jJ1b0wSMFU3tztsFkVVA5/nsID+ybMc7F
         bV+lVLtuxrhH6jClQAVACmDC8IsE/VVerTd1WK6tkGDlcSS6fJbVxbeZllQCIzsAdRYH
         eOib3eQpjVcUdkgJOzk+CzJybRRpdF7Y2ckxVwGCXVNq9u0WSUtRuLOgv3eJUwArAEID
         qejir623uckNQxivubQjUrdGZhFx/NTQJHt6gjEqgerVbRGn8N1KI0SZPo5FjsMx4HG9
         FOnla8W3otyycesaHQypEPNwR8tEpRRvgY60ETyzSeEctIXCAvx3C/VqYBf+NMhYWEcs
         o5NQ==
X-Gm-Message-State: AOJu0YxbcTMKkqSh7kHRqUzu0kAiK5o90h6vZEwekv29A72Oufo/LCNb
	0rnvAn6ZIcf0ckAxGBL1N1fIyRS5atDlj2M7aRf8Gx6AaYNne7wkBRmxe30/VSuX
X-Gm-Gg: AeBDieugHELYbMW7WxtG9pq8IoK/u934/tjECpv7Vne/CqFwW66lPazo3kNQU2iejl3
	zVxY41Z+81V9fcK1U6eLJVNqjeGFIznjTFcny50XuHwDOKiGZFLvZfT8+ITRXZTmaQcC3zeoJ6H
	F8kd4vZ0kAS2roYVufsvX7gau3Kkfqh24S9u7pI7mDBu8978PWkdJ8O0qQyfrajiXRHiINUpX2A
	Hx3vehWRgPm3Tn3clZjGWixj5gfCanFmOyYoBcvap+E/ed+fk67n6HUQGl4u+ptcOOsRiu/YRSo
	eGfopQNQ6/NILlwMvqnoP8aItbfC2VO7ntlfRy5Ek2wtlC0yGDFHiK3KreMQrC5NBdUQmwIjNdn
	SabImjrFBZvG2gzZ9SeFuG5KoKEGXXyekVfpQywUKKTrWn12wToFdfZJN5h2qkir1KgDftmeAJl
	xJ1Xnxssx4jp45j0Flk1663nydHR8XDzeGew2ToQJhICdMD4KgDpMc
X-Received: by 2002:a05:6512:1385:b0:5a2:a97a:4b5d with SMTP id 2adb3069b0e04-5a337585a90mr1484466e87.35.1775255634959;
        Fri, 03 Apr 2026 15:33:54 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc60e1sm1685684e87.51.2026.04.03.15.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:53 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 6/7] staging: rtl8723bs: remove two unused function prototypes
Date: Sat,  4 Apr 2026 00:33:26 +0200
Message-ID: <20260403223327.1831215-7-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>
References: <20260403223327.1831215-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes two unused functions Rtw_Hal_ReadMACAddrFromFile and
Rtw_Hal_readPGDataFromConfigFile from rtw_efuse.h.
The functions only existed in this header. No implementation or calls
were present in the code.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: reworded subject
v5: no change
v4: distinct subject
v3: created

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1012831c7eb5..4e8980d86965 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -74,7 +74,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
 #endif
-- 
2.53.0

