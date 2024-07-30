Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C318E741
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323702; cv=none; b=ivhq83ETPu5g4HNcoqGoPiipA8/XJ0C7yFa5Bb8HtHXaTHucFbe9B5wMKD7jG/RAHg4tsF/GvlgPRPzPgXvjuf92x+GvDlIk+zYsGEC319Xjf7QeT1BcggrHKqwoDLKIsCBmyx98idYw0JRsZPZ/pWnjQAka2c/6sGXMdO5NE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323702; c=relaxed/simple;
	bh=IthfG0EQvLVT4Dl0Cp66KroYdXLTIhdye4Z7i1IZar0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SwJDpnko8NYyCz23E9WWeXTC7vUhrW/e0G5tgYApPDBfXYouygwJ9dlGIWQz2dDkyqqbSLQVyzZftk1cYW13t8hvY9NxkGyn9Gk/fG1PuyURdv24FFcxXQ9VOkcsfipD7sV93HsI/GWbmZbguJ5F1Ia2BOqpaCOYma3Mf63CcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDFJy4+q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDFJy4+q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fee6435a34so25011155ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722323701; x=1722928501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGBS2rpr+A3aPueh3D6OD2pyezLrXyWzp0rS6hZNrGo=;
        b=fDFJy4+qkArOPuf0RbRjxF3Km17xngYJ4iOM4CchXsf95FKdAKb8K9qXQmWGcZ+uDi
         ly2S59hNykUR305X/fEyUtjw/tXj+KxSK2qKzmwoZYkluz1h1guFHbLz379BzV4/9OtG
         cGKR/H2sNU03iQh7BsfPUQ/OFhD4F1LRkIs7mC6syTQvPyGjSnB6QvqNSf9lJDQAVQKm
         yBB4lwL4BUy9gnzv7vdvgmO6Mi1jrowMUwGTumQjqzuI4Atwq02lECJAOHpWqf8uKlF8
         /9nwhV1rZIg/N7ymVlCU3T++lQSDHFvivQkXMz8R5AWeenBwdI99e98zwwkpwYpEwecr
         T6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722323701; x=1722928501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGBS2rpr+A3aPueh3D6OD2pyezLrXyWzp0rS6hZNrGo=;
        b=TaNhUTmcgF6DqW5NtZJ46mEiTtC4UxcHzmyYVSxm1ndEg0on9K2MYY01IAb+VaufcE
         QEHtFip3pu687Q/VYlq5qthrlBoG4HZuicYGzH4gWy39r8x2pgEQQLsYXZwCdUmSe3V9
         WAEYhYTRjotquLT2Y9O6QZC4qKyeLHsYQ2epTFmFBQJkVNtz0M6KL7RlK5/fJ51KJMNw
         IEnBma9R9PdKTwbK5fJI6iZab9IOELrmis4Ipr7fNwh8rbyrY2zapFKApkBlJUNTet9w
         kTWNAcI2FBm4L7w5pk1bCUNe2dsx2QEOoya85Yhb3UouHyEDR8JbW5U5XCkoow5APtkz
         tDVg==
X-Forwarded-Encrypted: i=1; AJvYcCVDEzqhaSqSfzeFwAXJhSIL9uelXqtyBDAWhcgTepUSRD97jqcuw6B9XIXOIf8Eg0pV4e5tODy+UPPf2vV6IbtFny/ih4FM+VhWjotsDg==
X-Gm-Message-State: AOJu0YxN5lVLnarTu4RBw0SxMKmaHeDg4zs5zGsS0gtPHTZPBZ0JYNgn
	GG81hTGFC0zbRbDHCZkpgC6htyXcgXQozNnYHdOB6OQJdOv33x6rUWvCKG39
X-Google-Smtp-Source: AGHT+IEqaChifI36y9GRjZ1BIZXEH3NXZ4BPZ7FAGlh5To/g48a+6rZQW8YI1/pp2Aw1QDfWYAHgCQ==
X-Received: by 2002:a17:902:fb08:b0:1fd:a72a:f44 with SMTP id d9443c01a7336-1ff0482b8acmr64992035ad.17.1722323700747;
        Tue, 30 Jul 2024 00:15:00 -0700 (PDT)
Received: from c4897d9ba637.debconf24.debconf.org ([116.89.172.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f1aa18sm94810815ad.190.2024.07.30.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 00:14:59 -0700 (PDT)
From: Sakirnth Nagarasa <sakirnth@gmail.com>
To: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: fbtft: Remove trailing semicolon in macro.
Date: Tue, 30 Jul 2024 07:14:55 +0000
Message-Id: <20240730071455.37494-1-sakirnth@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <sakirnth@gmail.com>
References: <sakirnth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath warning: "WARNING: macros should not use a trailing semicolon
in fbtft.h:356.

Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>

---

Hello, this is my first patch to the kernel.
---
 drivers/staging/fbtft/fbtft.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index f86ed9d47..45dfc92b8 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -365,7 +365,7 @@ MODULE_DEVICE_TABLE(spi, spi_ids);						\
 										\
 FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)		\
 										\
-module_spi_driver(fbtft_driver_spi_driver);
+module_spi_driver(fbtft_driver_spi_driver)
 
 /* Debug macros */
 
-- 
2.20.1

