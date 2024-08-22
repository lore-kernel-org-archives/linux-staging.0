Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3A4405
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286333; cv=none; b=N5xAksYKboJWAoNaw1fNRFcjumye8klXiVKJMX3hN3+oSqS+8sX6YZ9T/NyRoRgsAlzXCHkkI0COzdnSLufnhdJEi+7cOCf8xOu6vRucXgpE/+Klb4evPdUTbXoBBJNh3KLLg9SBu7o9wG9ji1nUd45Bng7sU7sTu/Pn5MMbvwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286333; c=relaxed/simple;
	bh=QzOtKAA0FeDdpIImmhCmZ1ahoJVp1wd6RSXq6J78zOY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=o2eqhqteY5K9kQp02PL/4Jo5vaJJiMgO0rf2LTNi/MgWB0s8Z14QJ5AaPbxFjdKYLuNeIWLky0ALW7KfJnDb0L6hCMIpvGh/ioCBzwooB6tslCxFLY2YH23bfwaHm1l7unR1c74L2DOGpZqlgA2G0nsez0lOVRJ6bNydiz6k4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7W/1t2E; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7W/1t2E"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fec34f94abso2393185ad.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286331; x=1724891131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvCQ5CqSkFA92AZgqJWLa2tJed5PdJScQ7an8WkJIkc=;
        b=A7W/1t2E0HoAA+hVojgil7RjOvjLHKBViIVoUw0U1ZxImea2SVjy7QwEnO9wZRWnqU
         C9DwlJ82V8uXtSsl4C1D70Pf+g7BQmHvZIr77mb1q242AQ7bUlAuHv9vlxPrtxzE1pNW
         cIjHUbritk3w1gTVyhpLPUK+2J0N/Vi8EgJlNJQckntGl8EKyHampQZzH8nBrjuD38wV
         BzYcprWPjUDMZud/fTN6hmmMqXRE4omzDHPetTmtZPnbANyovRndOIQtXKJNVv1StQSK
         LhZq0jn8YsUjk21bwWCmDojqOMLQjDBGYVzQX9bYfXGmfFrftteIHrkb95v/CGcJQT8h
         ouuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286331; x=1724891131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvCQ5CqSkFA92AZgqJWLa2tJed5PdJScQ7an8WkJIkc=;
        b=VFQu5Dtt4hsXQUl2oRfkxBbNwCiQHH2x7nHWXnLmYULPPz8ts+7I/KW0olgR7WIKPp
         jh0K47jRq5ioPg7gJj5L1A6XKoOVJMYIukkwH2P3xn+fOi4L35TjDaSuqbVmH1TH6Dhq
         atSSjlhENRaF2JjsI4HPwJN/7uxc0wULi6sWx9cR8ww5IOLkHscBg+59WAKfix1QOdav
         2Q8leFFrVj/sSRskJyT1ni2QltLZA/LLWEMyEHTQEtAMBye3VWQp3axLkV05/NQpgHA2
         VtMHzcZS5SVXoyoeHBO2AT25iLQowkCgY+PtA1rh7nhwyLPhDtwwVcBq54+n6hL6WM0I
         qdgw==
X-Forwarded-Encrypted: i=1; AJvYcCVAR/ckD/cEC9ecrGxTE5+APIalUn3JAlWdE1L4adW8wNmpKqgzlyLTuM4FNBAo/NmvQBa5xjTfl6HtLd1R@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi6EySwy06Q7HF9CFlN9GIKhQeW9EFVedSZh9ryAPevFviNI3r
	rBmc7RXjLi405Jqxra5TVQgww7Lc94u0a5EMVaQpD530rD0Pz7PN
X-Google-Smtp-Source: AGHT+IFDShBAU/E7lr/xr7RCWzt+ZoZy+QBiogwLBYPDN8gHFssHRboTikHVQo59I5ataVhSsdl+rg==
X-Received: by 2002:a17:903:244d:b0:1fb:82f5:6641 with SMTP id d9443c01a7336-203882248femr4395965ad.23.1724286331116;
        Wed, 21 Aug 2024 17:25:31 -0700 (PDT)
Received: from RenanNotebook.unicamp.br ([2801:8a:c811:1:edc2:7c0d:751d:5088])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd2d7sm1675695ad.169.2024.08.21.17.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:25:30 -0700 (PDT)
From: "Renan M. S. Florencio" <renanm.florencio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix indentation in r8192E_dev.c
Date: Wed, 21 Aug 2024 21:25:26 -0300
Message-Id: <20240822002526.19757-1-renanm.florencio@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation in r8192E_dev.c to silence checkpatch warnings:

CHECK: Alignment should match open parenthesis

Signed-off-by: Renan M. S. Florencio <renanm.florencio@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..ec867801bfbd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1741,7 +1741,7 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 	    ieee->ht_info->cur_short_gi_40mhz)
 		ratr_value |= 0x80000000;
 	else if (!ieee->ht_info->cur_tx_bw40mhz &&
-		  ieee->ht_info->cur_short_gi_20mhz)
+			ieee->ht_info->cur_short_gi_20mhz)
 		ratr_value |= 0x80000000;
 	rtl92e_writel(dev, RATR0 + rate_index * 4, ratr_value);
 	rtl92e_writeb(dev, UFWP, 1);
-- 
2.34.1

