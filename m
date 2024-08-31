Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4017BB19
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725098926; cv=none; b=qQiC5qiCr4CIRDRJ1wddGjFQIFvOTta3hC/w9qaHEq8JCcD2KjZFCzhTmeTjJ/I/YqSPlYRkj7CwPYc8dQUEtIDHF63i5+U/L0TgU0xbB71DJ61hRUDmmbgYVRnq+gbIXWXEDJhLFe57uX6QtMk+o06uHKuWCaaxUQ8E4YclLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725098926; c=relaxed/simple;
	bh=z9x4kvh6fBoQQ7+oTmL+WFNDMUlp4TnhC8xJ00dGT3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8iOoaDRNTZJ1urLJFWfODaY4ZNkJp2eGEjYAwlC1eUQpmcozPySBgdWGUDtuv3NHoTsfD7NrR3NP7rBD1H6iBoXusVJBgMpm5EAnJjzr9oCjM9z50h0NkbFLdXQEfYne5xUUaFCLO2kb3uGFRFCpmgSaxZc35GfZ3RihDPv3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqUyH8Jk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqUyH8Jk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01b8738dso1904705e87.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725098923; x=1725703723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL32uT02Dwm3xjWU0uDR6JvTAdhZwWaoQqLWzrb/g1Q=;
        b=KqUyH8JkrQQdbJ9bl6XUN301YaUBNXZsztRV71Y3+1ORoYArahcPGDdIZKuyfTa9td
         2me17rxEZMZTUtSPf0SueT5H+fekJg4rYAD+CiYn3cXaeA9i5bUqCAfSg9/8lTUiBlLh
         UekEhZmDmHc1E3Zc3Wgfg7gS83HcRtORlgmV6zOf32/u2Lyrax8ypj+Z9hYoUcfIP6NF
         Gr7zRiz7F+s609fk3nOQp5WTvwV4X7d/FcrhT3HkVrAC7pVgKdP5y3SjRo+iRXzLwE6k
         g9IfVDbwI7JHJMOfydUEjrsGUry7tVLWnvzr9AEMK5slMAEwViGI+xNcG3xUhqFgR34e
         ZUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725098923; x=1725703723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL32uT02Dwm3xjWU0uDR6JvTAdhZwWaoQqLWzrb/g1Q=;
        b=YrXbfxNRajjM+Uip0A0amZUQq56YM6iuFqU9IyRoAtRwSclvls5hf26Y8Gu6dUB6YY
         LzUnZZMua1M//VIYRTH6Nv6covEHwuSwKhwaurXyDqBiCOqmANaItwX9Hjd4WL/bdZMW
         bffKfMssS2tqHub8bCPKrX3maToJwLKp90YxhnWFvZB3kaKdJmltYUyP3EJy/vM1Y1FC
         RFLynzWxavkrM+CP14mAm4XprExZ2mCaO7EoFXAP77dxWexp/2fKefdCRi7nQnlVs47w
         7x1EqoEuVHPnM8FyjH9IShjI/R0oZv/xM//bZbVeq6o/PIAMarQr9lk9Cz7i1IN2KTqG
         cqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxj+ISKvrdbj8aFHKH6Yq6w4NHFz1UZZs21ieOHp5E1/le4HxXsZyWCgMHMYL24Kq+UBlypqStztf8x20Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwHjHOzWGILiyDjp3O9LZXaVBkbphNVMKmHcFWVPSVks9U5Q/P0
	4ODf0XCp3+AmS7WTU3nqF5aZ70QgVIEpi6ML0NdCmyNAkeGOOOB1
X-Google-Smtp-Source: AGHT+IGUxmjs5WxFUQJb7wPfgODJ7HWZJ3tLpxPDimfNnZ3Cx53baeTmf7TdQZLwqN0lms5VPT1tUA==
X-Received: by 2002:a05:6512:3095:b0:533:4b38:3983 with SMTP id 2adb3069b0e04-53546b037c6mr3152673e87.20.1725098922087;
        Sat, 31 Aug 2024 03:08:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aba11.dynamic.kabel-deutschland.de. [95.90.186.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989021973sm307444966b.82.2024.08.31.03.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:08:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: rtl8192e: adjust size of brfpath_rxenable for new RF90_PATH_MAX
Date: Sat, 31 Aug 2024 12:08:08 +0200
Message-ID: <20240831100809.29173-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831100809.29173-1-straube.linux@gmail.com>
References: <20240831100809.29173-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array brfpath_rxenable in struct r8192_priv is always accessed by
indices in the range i = 0; i < RF90_PATH_MAX. A previous patch changed the
value of RF90_PATH_MAX from 4 to 2, so we can reduce the size of
brfpath_rxenable to 2. Use RF90_PATH_MAX instead of a hard-coded size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 1d6d31292f41..8297d7e59415 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -300,7 +300,7 @@ struct r8192_priv {
 
 	u32 rf_reg_0value[4];
 	u8 num_total_rf_path;
-	bool brfpath_rxenable[4];
+	bool brfpath_rxenable[RF90_PATH_MAX];
 
 	bool tx_pwr_data_read_from_eeprom;
 
-- 
2.46.0

