Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB54C81
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286234; cv=none; b=ifnRW4r3bRW9D7UgnRj1iSQ3LBAbMLaRGAoZ68nO7gEYLMMWKa6bWvemzV1x+vkZWg7ydDWrlxskQUtoazg019JBNScbA92YmE317t1xJVsiMoEPkF01gYhlhQfvTs9hnCAe7EYZFhbz8dkRP+w6mTJKx45k+zRWWgKOT4/ElwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286234; c=relaxed/simple;
	bh=57EgDO7wwW4Xp3hC/mZZxUMJUnSFIqSkyprXXtuhSu0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ZeZBJnI7ChyJ59QNi2OdLZldhkM4k07wi1+W3bYl6bFdwGnWps18MTHY/bg0zwLwDN/ejIL2e+DmuTJeQxHG1320QlMSVNjidg/xvE0h8dWl9DUEm7uW4TC+6vcE2KGYfdCcrLx/CYhYGZHC4BLCBPRZapO9fJBGBxOp6EKxDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJFu0RSD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJFu0RSD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d3cc6170eeso35447a91.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286232; x=1724891032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzb9QWjLKzYt8f0ePQ5wDYcjQayYXKrofKHMppqwv9Q=;
        b=OJFu0RSDaHdRuj/a+GE+pTxTRnxkKyLeXd3DtOrNfut9/cpE/sFFI/L0x5oS40dkYj
         JE0py3ZFwUkzuyrP3bqLbZeKICfFL5FrdU+LwGCg5jEkDYkyL6iqLGWPWjn4es57e8JG
         RoMSsY8j7kJ1A9DKd8BDFOJCR4zvzCHNZVTdgwvq2FWePILEk84fD6R6rp0UYOgy/oCe
         FIyiYEr/CQyHZuKFOpM3+ehYITCjuz7QYfYTkGmxeEe587sNz743pJK1CnaKFMZIo5M/
         go4C3Jjcb7fURywCt27LGZ74rAmU2vmqw2YFbKySbQG1Qh8kwelf1q1LnJZgi8uGQk+I
         Z3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286232; x=1724891032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzb9QWjLKzYt8f0ePQ5wDYcjQayYXKrofKHMppqwv9Q=;
        b=JVtUEbunxsEWU/d+OfEGIlhsUqSxxgn2cq5mP6po/wohaetx2JDLRij6WB1fPX7oaw
         nGo8ZWGLTyf1jsu7NTLeFQR0GNswVHpqRvkJyxnDX7Rv7cnO0D8ixJfxPOFt/K7uZcdD
         zIpH8gER4x40dfwIjYDjQ7CHq9K7M71YlCFdnIoQptfIg70Zk6oqPIczDrnotc7cXjJD
         RW4KGJiwTiYMXlj/TsdM18bbwg1vtckn5QectrSQQnMTBoHtXP/EEKPvntQNiGheEYU2
         7B8vPsvTRYIh6g2jPejE4eEVauVA6TgLOAHst5hP+04GO1XDn0B2LYskB3iLuzZ9uvz7
         IH5w==
X-Forwarded-Encrypted: i=1; AJvYcCVomnhwc/C5mXxGbff1LofGoIy3s9H6mfE4ejEh6JRWJeix1AIXjx++7twDCQSd8aR5/2ny58I8uwKO3yca@lists.linux.dev
X-Gm-Message-State: AOJu0YwPnzBTa8ZN8shb/8x5f1AMhju/vVoOsygwlvg4KByVBxuQH1g4
	Wndyy+bedDNz9BZj6MZX45+buMG3r4I4xlXI4CmPvZOd4ueB+jwp
X-Google-Smtp-Source: AGHT+IFF6bQa7YQNk0jlJkvtj3uNu8uVNiBxONXhoFyf6hH+ZERnzxy2cbi9ZwggyNGcHF3qwCNrAQ==
X-Received: by 2002:a17:90b:3a8d:b0:2d3:cab7:f1dd with SMTP id 98e67ed59e1d1-2d5e99c5a06mr2608367a91.1.1724286232430;
        Wed, 21 Aug 2024 17:23:52 -0700 (PDT)
Received: from localhost.localdomain (erickge2c.fem.unicamp.br. [143.106.41.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eba25a32sm2547535a91.30.2024.08.21.17.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:23:52 -0700 (PDT)
From: Leonardo Kenji <leokk06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:25:43 -0300
Message-Id: <20240822002543.44835-1-leokk06@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix parenthesis alignment in _rtl92e_read_eeprom_info in order to
silence the following checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Leonardo Kenji <leokk06@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b3d4b3394284..dcd8650a3404 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -289,7 +289,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 		for (i = 0; i < 6; i += 2) {
 			usValue = rtl92e_eeprom_read(dev,
-				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
+						     (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
 			*(u16 *)(&addr[i]) = usValue;
 		}
 		eth_hw_addr_set(dev, addr);
-- 
2.34.1

