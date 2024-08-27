Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E780146A63
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724788586; cv=none; b=V59oYdAcrBlD30awMnznQeDsvk+xLpOhEp5AdFaCjIuVCaHWoNXpLZv2fZqM8oR+R0vsrniq0VovHcHQ2KHRXTlw2uAK5tQr2BPkbxWqoUfHlDIpPYoPcQA5az4KTyVeSIYkk3GbnJEuIlDIVUPLUeb6liJbmAma/TkgQnUhzd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724788586; c=relaxed/simple;
	bh=TlHnc6LhVP9H/5j0kBJ84CxpzBsrXkKjWnAYwNr8I4Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qbXxWF8w17nwxJY7Jtkbk0pYBQQ9yDpWYbw7VNL6WPWQ/YzAeQ4VXSsbd55V1l56SGn8/ZAzTV6jcXAtMXGjoK0PH+zfigtcKhu4ky3nqLDIpFuZ1+bc/t426xnFirs+KQ/bCBgDazty7ZUVXBSNSoxPtSzlb4/MRH+JyQk0eQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9DUbx42; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9DUbx42"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so4870212b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724788584; x=1725393384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4m8pZ58RVuetSQCef8u+byuvMfFoIktNE8VEW444zY=;
        b=K9DUbx42A6UWd7tZsXDh0W9YuJsyp+6OrSUqiYGDWCvSzLZUOczxYNWXPP9k7otsdn
         gBxi+axFQRKqnvstTr1IkC6xtjRBfq9BXWFd9RR1DPC/JRaBV2hkprCYq8vsn/4q0xyh
         7H9V0wW8GkyERokPjNhIOIPFFx0+YGtU+HUEL2LSOMEadzvQV/HeNplOlscNuFZ9/Hmx
         XUOMgsdZu9+lp2yyKe8qiYCOVNcoPYDsluAXl7uFjKYuHOs0tUfWqrJhOfJUcLfVbVDn
         KM1SxA7thRs4mK6edndT5T3TBBXMIcaDKcXcEuuVudOzJJbyf4VCaJjZQuHHFFHldVJg
         4+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724788585; x=1725393385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4m8pZ58RVuetSQCef8u+byuvMfFoIktNE8VEW444zY=;
        b=ZbnxS5sfFQ0ze9JKX0yVlhVlP1hT4SBYytnKRc+uRTiP5gJfso0QVr6LBk9lFtffa8
         9GbPODQLgNGD8SSrkOeclLeyNQVk8CphlWrsq663B7QEG07hE9l+tfm4cDOp3Mq1XIM6
         dYnI9ZNyGV+oumDRbfbtHuBY7MTzeIzfHHB71w6jrbPSPfrTiQW5l/nvlQCWtFFvegKT
         wqFG8iVi2xCzVRn3WOU9s6PsKQbTdfek5beIjWPruOUIRSMKSV+MjFyeADeXGdYv10YW
         fH4SHkGtMrrmGqfYUK5EkqKvMxDxJRp8zr1pNtsNQnuf9gevLR9FqhdoFtWHdawz93pC
         o+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV1EMveDHX2eac8kCap1Fmj4Arrz2eKUVksEvYOv0lSClxvMJeqW+wWUoArccF9RCWCOdF64AQiRJqhKmLm@lists.linux.dev
X-Gm-Message-State: AOJu0YyCxyGo8JgdnPBEnagtQsogMRd+gVrnmB2FrUE+licmz1vc0X9u
	/+/J9aeiafhnPwHO3G1QtAzNM6CY+ofi1KY/DH6TDfE+tBf1bOp2
X-Google-Smtp-Source: AGHT+IHb8TtMldCvGdpVG6MwxW1eBlqOcmE3Z+fdcc3o7bBNDkjK6qr9rgwQvEieUw/2M8om6csfCg==
X-Received: by 2002:a05:6a00:1415:b0:710:4d3a:2d92 with SMTP id d2e1a72fcca58-7144573e05cmr17362654b3a.4.1724788584507;
        Tue, 27 Aug 2024 12:56:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:16d8:ec10:100:8c4e:d5a2:795b:a46e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422ebc6sm8965745b3a.38.2024.08.27.12.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:56:24 -0700 (PDT)
From: Nilo Alexandre <n1lux.comp@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3] staging: rtl8192e: Fix parenthesis alignment in r8192E_dev.c 325
Date: Tue, 27 Aug 2024 16:56:19 -0300
Message-ID: <20240827195619.34712-1-n1lux.comp@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parenthesis to improve readability.

CHECK: Alignment should match open parenthesis

Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
---
v3: Fix typo in commit message.
v2: Using tabs instead of spaces.
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b767dc00100aa..2d17d8e8898e7 100644
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

