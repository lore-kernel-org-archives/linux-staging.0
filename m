Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81051CFB6
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724807929; cv=none; b=Z5Lij3AeRbWWK5hWy98nmLR3SezdbaFVqua3k+A2ahWhO682rwLemfrv2OU1hZgCmhJ2q6ntuTzJPhp9NgL0rSxfRfR+1nIMLReKs3f600SVGy6F5++ZnyjFsJQkRS/QyiTzc5sVkh24JIJaMt1nOiIDWt45F2IGzKYylbtMvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724807929; c=relaxed/simple;
	bh=LVR7KQ+RI2uzB2W8swxziBfD2+q+EXVl4awu2dbo4FQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c6N773HHKyvB0PZHoKgQBkTFYh1orESAQNTqazR3JJvxSY21RVYDj+NUDCEf+UhF0wrmcKRe0c+UvpgnGxIgm6zJquQsu/nkjzX/fHOPkA7O0qX1pSKaJEgL28Y74jvi49gHcQWaanAAzDLUbs/gCe+BT0T1+7a2dJjmijVxmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtULm1lz; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtULm1lz"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7141feed424so5079346b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 18:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724807927; x=1725412727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rmkiU4TTK/ObisUSMYSUHfXcPlZXp9bAaFXV0n4obco=;
        b=gtULm1lzglzs6NqtLaZzkmQ/CTgUtbiAzoY272EOOHZcxPRCONmgEY+7+Z83DCTFMO
         JLQRFPRQj4v1baiCo0Rkax0C143O/iD+znZFbNauqbsZI2lLgPhbHYpcjX4Gfn7SolWE
         zDL6aPQb2r4DSqAvTixQs2ebh51U/yspm2cZ/idCLELi4TqT5iO5U2KLic+U/vdD8O0J
         rNcstIJUJTm3PLY6Ba0cZ/NeB5DfGqjtykNqEI6kOcNGe7e2W4v/Wiq+xE3EPyoklN+Y
         pKfZZoBb7xRhaBJgzfESnakcG64RX+iis46DpXu3z1eqeNtrDdPzlNRTCdGxtCgJcqGI
         SoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724807927; x=1725412727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmkiU4TTK/ObisUSMYSUHfXcPlZXp9bAaFXV0n4obco=;
        b=iuT6JMDZ1lljiXbohy2fZ51DGOR5tyRGUNmkHfh/U81FZKP0ENnZELUpxZd0m1UyUT
         cmi6pHTqU/omHtadLV+SdO4gUK6sRp9VRLIuERDDAk9JN4dsXtd4gflV8BOxxr5Dm+hj
         /awdYXcaAepLjd0WH1sYHrEtjwiHlU/6jFeVgmbHVKVup6Vz+ZUEtYbpK/zOFJFCfTti
         AEGARRMO+iDOqKtubOIFPBQW7Gh63/uKjnyNF9axIVWByOZDvRUcD1F15cQ5EqsEAdBS
         L2EL4p102gpOeZmBEvZqZPthJJGIkcwHFwrS9xFprfSNEmd1H+80/vFNh2sZ2/qbAaWx
         ljYA==
X-Forwarded-Encrypted: i=1; AJvYcCV+CsC2OybJ7O2KAgfzuCyxJWczPjC/st786bNHG8wnpuEy4zdDKjNrOHPG5XUl95biPolFlqTxGwUTaCxF@lists.linux.dev
X-Gm-Message-State: AOJu0YwGcZVZWnB3S43U1bRlJ2j9N4SwDahdrfMSw/3MfCSYVBPGsygn
	aM+puOwsmKMcPORyrM4SNCm2BxyFb3P1dVH1EuDiSpzK5C4CIe7a
X-Google-Smtp-Source: AGHT+IF32G459F74ADhT3VMZy8fzDi0Nxq0gUjyPniy0Tu9tgFAWfjoEN4Hat4vqc/wuVPTHDRKNXQ==
X-Received: by 2002:a05:6a20:d493:b0:1cc:9fa6:d3a6 with SMTP id adf61e73a8af0-1cc9fa709dcmr10975086637.3.1724807926835;
        Tue, 27 Aug 2024 18:18:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:16d8:ec10:100:8c4e:d5a2:795b:a46e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd2d7sm89518165ad.169.2024.08.27.18.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 18:18:46 -0700 (PDT)
From: Nilo Alexandre <n1lux.comp@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v4] staging: rtl8192e: Fix parenthesis alignment in r8192E_dev.c 325
Date: Tue, 27 Aug 2024 22:18:42 -0300
Message-ID: <20240828011842.67611-1-n1lux.comp@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove linebreak to improve readability

CHECK: Alignment should match open parenthesis

Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
---
v4: Remove linebreak to improve readability
v3: Fix typo in commit message.
v2: Using tabs instead of spaces.
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b25e83743956d..a80efe6c7c209 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -321,8 +321,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->autoload_fail_flag) {
-				usValue = rtl92e_eeprom_read(dev,
-					  EEPROM_TxPwDiff_CrystalCap >> 1);
+				usValue = rtl92e_eeprom_read(dev, EEPROM_TxPwDiff_CrystalCap >> 1);
 				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
 				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;
-- 
2.46.0

