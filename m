Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A771EC2
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665893; cv=none; b=oLS9V0auaVF/TPwGLwf0r/vYDDJKMN2gn5aw9tbO/bsgbWtgW+KZCKb3NRZxci0mJKKPxr9bYsMSFnRdIp45jwWj8VvibrCvZIwc+x54fc+cGt/JftJdEFYO0Q8p2EFVg6wkdDa5ZwN7j0BMkCFHohDH4lS7M5QVO6dcyEqmBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665893; c=relaxed/simple;
	bh=V8FvBcbzx3Q9lQ6sda7Mxo5Lo2vf6RrvfJ95UD2FEfY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nnsdVXDxo5Md6ITBoWW1xLCmgvjBTc4ML37CyQFYAH8odgpfdslVB4j//LDBAYgjGXCiIvPU2FRGKf56MgYTgZZSEjNdmiaCLM6AXkq4pWt7CdT5skWRIcB3qukgt7Rprvr8/qDGdjMyroU1i3P296wn4wi72Ekf/fJ8/BgBSGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2a7lMFl; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2a7lMFl"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73e4a448370so1563654a34.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665892; x=1753270692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saA+5sBWMKRQbpPT5LMVqfZ4icG+Ea4kafNgu0BFEh4=;
        b=V2a7lMFlqtABt112rj2O670vg9X9OAGKgvAaJb1ddsL6DxeDjKKwuN0hV25oGNO+v4
         uoGCGUPPIALyyOzRHAMfO0gLYypfPfJyNAywdP3TZpCn9cD1hkbIciQ95Yez2hCdrFt3
         FMpnIpEKJeAalIMjUttmnzfymJSTyn1yG9NxNd2yBiph2BHQcJDQpdSR44SolCVLlHO+
         TqTwz+B6UznkcgK+VDMu4gICs/bnFB9ve7N8bUOYNV6GikkAKhH9WPMB9nRDVE3SXSJd
         AI5NdkfDUA7FXGlE6Yn2jrc+CBBe2cxyMeKFENT2Hb17AovX8v/CV9bqHWCvKlXb/HyI
         pJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665892; x=1753270692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saA+5sBWMKRQbpPT5LMVqfZ4icG+Ea4kafNgu0BFEh4=;
        b=IQVCsuOqpeF94xWXOB7oR+33pIeWZLYKfCkJK6srm6upd0L7nGUz884oW/UvU5gbnn
         zcL6SojNOJ3kPt9ehGUd6nc85oaBEqfJWuwcR76tti57AvdLQR1c6S+uDSbUw5TzSBLe
         8vTf9v9sMONFXHLfjP1Ra9otu9oqDMdmLoTIwo78Tj2AKQ6qup1DxgIqq6n+eDTPLKgF
         QMNK93Bw9f5J5U1LjxaGo2+4rJC9OOH3xRwJt6/FkffPNDmRhndEh5T1Igo5e/CfTHNi
         0n+M5352WujZHmhnyOCODgVCccKbJ0Ab7h57OkYt1znMJEs1hVU+ou+lAvoS+mMRJewE
         +eRA==
X-Forwarded-Encrypted: i=1; AJvYcCVvPAYJllb0a9qpclU1JLPU80os7aAFqFXAYl2yt0bziIKSy9OaZnqn16uJ0AEuu3wYz0hBXhp2/trd47Xz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5lO3D28i4G6/L3KGn3wZzae4uMaDvaPeFymNg636LJehzqLiP
	pqobnuViWuOpYfcp1YH/nJsGf7MAhU5NHceARodB9sKu0Um6VwJdNMRhrWLeBTii
X-Gm-Gg: ASbGncti8x6ioL3WtvkHfFTJCSlCDmb8lEPQiLhFpHfb9+J9Jo4ht9Y+IwjREoDNyvt
	ytbocuiqcc/A6ufWqL+p/Vd0UTyByrOolWzoTF7KcUlVmbZhRzF4bFNx33XyfNhZVybbJb1UP97
	TLZ+QipobgBGE+xIeBSRqO+Y+1JZK8hSb1N01uU6IOrhQ36jJ4XbW5Lot9MiWEeBZRe5lzh77xA
	wutmDJrFpvIjTMvzTZfCacAjR0L7kHDZnBfXlbk5yv6FLHL+HIrV8cRtqIXLkK8W+kGKMmM+WEn
	ODi92y4CLsikyUpzPOS5ptA9BhUDrmPVeLI18Rt6mYTKfrfcYbffMYAdt8EDYiidx8AiceqDVIk
	SsC/Vj5s3SmhXtDOxqQ0eGbVoSOeBJn05J+9PPyb/P37sjqxd68yw
X-Google-Smtp-Source: AGHT+IE8OK8tSYc/EGkxJIJHxClpEazoWY7Ho8TGaCt5XVvL4Gtt/qalaxNqFsnvID0hsfp/thEZuw==
X-Received: by 2002:a05:6830:6305:b0:72b:a465:d93c with SMTP id 46e09a7af769-73e64b21e8dmr2225165a34.20.1752665891608;
        Wed, 16 Jul 2025 04:38:11 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff1127dd10sm3353730fac.19.2025.07.16.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:38:11 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: fix yoda condition in rtl8723b_cmd
Date: Wed, 16 Jul 2025 07:38:05 -0400
Message-Id: <20250716113808.73115-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning about comparisons that should place the
constant on the right side of the test.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 56526056d..abc123def 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -24,7 +24,7 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 	do {
 		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-		if (0 == valid) {
+		if (valid == 0) {
 			read_down = true;
 		}
 	} while ((!read_down) && (retry_cnts--));
-- 
2.39.5
