Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363B8BEF
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286429; cv=none; b=nop59jnK83aR3VI+eC0B7mQId3XMPVd54kIG4zWi6+y59mPlHWuuiRksWsrXCW4r9akNNfAFo8ILJTHqF2TT9x29d62kGbIXC4TlVLCltMHG9aEjGvH8+OqmhDM4RpbUPnpw1Sz6HE4GDoyAwnd5wBMNTHtTPcEBCXVX0JhmQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286429; c=relaxed/simple;
	bh=3pp6gpSU7hKvKNGBkaWHTyCgUV02DJGsTirelpariC0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OukKfO8NpPZFq1rHm8RSInWGIbK6dgEnN5Zn9NmmZymL03hmgBZKWKvWRP0vPOLL5Oy5QK58fG1RT7vF9unKND2EAGhrVzXSl8S/14G3qj4u4GCqT6W9n6jJqYATB9p9H82ITb71Z78f8uXU+3d7b9k8I6HiQno4oehiNdy6Olc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik+pm/T6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik+pm/T6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2021537a8e6so2183745ad.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286427; x=1724891227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvlAQhh2Iu5hUoNlMc40btF8Kdl4Oqh4oQPMDczCT44=;
        b=Ik+pm/T6Zcj6hi6dkXkBaQEMYfnV46WCzNhadkPeq5uEs66cZU/4iwnbZeoq0veTMd
         98xJzTIHdif72Epb/mGITLe7fdwuqQtDFjIVoWZDLtjUw0J5dtIU+JOzQzuteCZLliNI
         WHz7GzsbzcJfyMlymGn8XCaMslOth4XSh3E0fC+GPU53HN+Ow7iHdPkvwT2kY7UeQgRQ
         N1tFLD9w3TPZ/k1JV5BtEZlX1/9FIxF4HwP+lGBCFGdgDyNRqVjKaKPx5mr9EkeBPSi/
         HnkWMzNiYscAhl1vfNYYLHLfQruEtjo7VlgkEw5UILj8r+3HV336YF2zEkQOWdJvggVS
         7yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286427; x=1724891227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvlAQhh2Iu5hUoNlMc40btF8Kdl4Oqh4oQPMDczCT44=;
        b=FRWcVmDKp0uHQe5pxEkN55psXq/yAV6+whuEFI4Psq4s8imL17XDfhSX5HTjookqgU
         oZ3P4zEWZPcEVi/sAlvPd4Lnd91SIHv9mRDfxIaYIKRKSztiYWsee0Va5QMeXbRpwYHF
         CBUPlbunlhV8RYo9313ztRRs+4FH785QEOilpPHUGqPRKPM3bWB1LqOorjXyrxveqRMC
         x/ojO3/tSfUVfvFJT1wXWVlW5X6/HHXFw2lsS/4KWDxeks4+m01lrnfWqvSFeAOKCLaM
         pldElB9pNcjKtJI1sKAYlpbP0VPJpeiAo2MzPCGFKm0HTr+lL+IAr81NP9mr84L4BX00
         0dzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0+X6riSaOwPtpT18oeCTQtTNI03YxqdNPdICDm3DEeO4kf7l+gnBeAnpoRfAI6fgdfhbxGdPKxaQnt1PB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1E1hxQEuB1oIgzDoj5P6uZMG+xwzByeLxtsH2CiaZ95Xzctb0
	ziWim2eJKz6YC4xcOPj7n3wAtBYC11fZHRW/VEDi5Ky5JJaU66ec
X-Google-Smtp-Source: AGHT+IEkozD7C27Noa+fI0EwtD/V4c/ip/cpFJi+eeSAwVrGS8pBO7celhVousV0wLHSKTfa2nZqdA==
X-Received: by 2002:a17:902:cecb:b0:200:aa78:cfc7 with SMTP id d9443c01a7336-20367d32badmr47069205ad.2.1724286427390;
        Wed, 21 Aug 2024 17:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:16d8:ec10:100:8c4e:d5a2:795b:a46e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557f081sm1725635ad.94.2024.08.21.17.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:27:07 -0700 (PDT)
From: Nilo Alexandre <n1lux.comp@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix alignment parenthesis
Date: Wed, 21 Aug 2024 21:27:00 -0300
Message-ID: <20240822002703.4183848-1-n1lux.comp@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment parenthesis in _rtl92e_read_eeprom_info

CHECK: Alignment should match open parenthesis

Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index d95807ceed7a6..caaa79935d7da 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -322,7 +322,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->autoload_fail_flag) {
 				usValue = rtl92e_eeprom_read(dev,
-					                     EEPROM_TxPwDiff_CrystalCap >> 1);
+								EEPROM_TxPwDiff_CrystalCap >> 1);
 				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
 				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;
-- 
2.46.0

