Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F283CCFD3
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742674; cv=none; b=L9z5KDjUIkKXdklM+REg1BIcHDYjMwrbHPL5V1v9/m1XJTk5cCaOhyw8X1RZBujJYGonz1zCj/3KQtfu1Dlh0AGeRpsxrwE58bQMk7P/Ag3nQG31JXNpUxAX6xF4pRre8mMj1ntza7DmJfkGv+v3AKxujzhplse12KKIIA/hR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742674; c=relaxed/simple;
	bh=1LwJM37Q7NKIw50Cf3+KN9/jRGOQih8ktE+fD8cOp2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQ2B4qKerK+VR0DiUPPCqgiI8GWr2qnJo2AUzRe0ZaWyS0X2hN79cKcW9y4Paa3zztG5STEcPXxKdQ5toOuQEpnGukTIZ6rm5BPwj6HpchUn58PJ/Y/TTHq6WGmeDEfY9ukptJiPYtMef5jCKl2kGEfQ+emvMSkMBg+R+YcnrlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0Z/GaaN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0Z/GaaN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b24fede2acso5358065ad.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775742673; x=1776347473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIQUUz8HJK10CN2cyTrf7XlnfenCpDOYTcZ2fDMqU78=;
        b=F0Z/GaaNotuOmx8b3XBxKW74z1l9zuZbmN6T3M6TO2pDzIOsk+trvI5ZQvKBNFIZ6t
         fgMvLufKmBtKu8wQEAwTDB520hULuniTPgBmVPIsu243taKCcizRcyYzNrjIyL5MgyLf
         CSBPLC/W/Ic6KN8tgVWqz3rWv44RTF3ZE8rH1tDA9iIoYfvVpGbdOoB5qiXKDnkM1bJt
         tHfLi/3gM9phj5uiX07pMiH7plucCVez6nRPGdDV1HWX1jQS2jp2TYbMn+mUshg3Vy+q
         o9tMaEnYmJAhLcrmVUnZjT0IYuNZWEyHKc/B4NFfJWcqRso8GbHk20Ik/8bLTmYtzLsA
         RLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775742673; x=1776347473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIQUUz8HJK10CN2cyTrf7XlnfenCpDOYTcZ2fDMqU78=;
        b=V8/L4guqNBCxJF3L+adkjlfvYYIESDYGLvZjRF4ol5N4v45g5k6M+Cx43EqjPuNrOA
         6FFoxeF4RCkTt9GwXh3gPUJLBeGLWIvs6daqRpG5lLKxok/47mFoEJGP74TzjHyWPnLJ
         ZDwyb7V5dnbzaHsvwQ/FsmiEDM0YNsZLPYK1gGmJ9JBNlNCNzFY+RFF6UHRf0mgy/Nk1
         0qngSqXmwXNT8AAZh3FvSEp9ubbTlnIfb3sMJmKAXzDKqtnrXICAYU8QzGD1dvWVkIiI
         9wy8KX3wZvCnyKsWjwuSb6uF4cpGJ05fNqLspMg2Pxk8Ztl7CFQfS9hqMpomI/2zzodp
         kURQ==
X-Gm-Message-State: AOJu0YzvyfRXtFlp3lG4pX9EsevSZ92Y0NmBCwM/TkmwOt1fHE9QvBsu
	XojnkeDsTk5leLhMhWZWPFrmdkVMryFGdGAcBSNhR9uK3an/Y4nmJbPX
X-Gm-Gg: AeBDiespnGPDVh658/UECQ8KQztJrTedM6UzhV7p9jjzIXIEO0HUeg0UH6u1EUpG98m
	dcAP9LN4EqosRaLFCXPdcjbI9+xezH30NLdLkggX3bLsEpEIlO1apIVRmpdxe6FjR1lkUJpYqie
	Rl3idJ1ufTnVxz8z/kmxL8EckftE2j3W+rSV9HBl6LlaLZk7FXBSJnly1ocBbJTLZiKsuTlW+OI
	94uXR5njBQPHbNI4iE3YhPm3uaMY6TZ644sO92nlh8h3Bktr0nyKn4KMxy+jQ0/Bd1Ops2FnoUt
	WQXLrk+mw8PWPfN4Dfo9b2LzVSUggBCCdY3LohpPl9VxYTj5BwyPA5594JqyfMzg1wkwRDyZd2L
	T6okCsn1gICifoM3sD/9/gwBHdznG+C5aYVZbVLBg1dUuXaV2/jQhJuTtJhaekzhmvllHoRq47g
	47OzxMkcxKRiruQyBqWVCfbLOAZjd8PjNxN+nitdli
X-Received: by 2002:a17:903:37c4:b0:2b0:7b57:830f with SMTP id d9443c01a7336-2b2818e4f2amr259026645ad.33.1775742672900;
        Thu, 09 Apr 2026 06:51:12 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm315288855ad.28.2026.04.09.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:51:12 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	tmimiharoen@gmail.com,
	filippo.muschera@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	rayfraytech@gmail.com,
	david@cardinalsystem.net,
	weibu@redadmin.org,
	dharanitharan725@gmail.com,
	ignacio.pena87@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	luka.gejak@linux.dev,
	khushalchitturi@gmail.com,
	suunj1331@gmail.com,
	s9430939@naver.com,
	nikolayof23@gmail.com,
	bryant.boatright@proton.me,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH v4 2/5] staging: rtl8723bs: remove empty if statement block
Date: Thu,  9 Apr 2026 19:20:23 +0530
Message-Id: <20260409135026.137904-3-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409135026.137904-1-activprithvi@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty if statement block for cleaning up code.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 0780847e287d..6ab65e9e8bee 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1415,9 +1415,6 @@ static void phy_IQCalibrate_8723B(
 		}
 	}
 
-	if (0x00 == PathAOK) {
-	}
-
 /* path B IQK */
 	if (is2T) {
 
-- 
2.34.1

