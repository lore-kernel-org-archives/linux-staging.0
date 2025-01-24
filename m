Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F770815
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716432; cv=none; b=gTy4XCrxx35Wq0XP67l6G1SKaR4opbErb7GS7tokbsY5OJ+llSIzUvIdZBfKf+lDT5B/ZkT0MvigrI55QIdWpNAzNflUXVKG4l4x6Oq4NdmTIBgNVGysCBLS6Pw5LLIIS+mR/CHrZPElOySDaN9EwwNJDE7+ggcaI4TcrSWeNmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716432; c=relaxed/simple;
	bh=K3lXE34v3bAKQCBs5HiG80OEqBCSOkm+2psFYeZcL0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uswtaZG+4Vfyjgb/v1NzxfodQptbwcpEAAXHs6EYAH3dqik/FPsYavwZCJteD30D3J12Ra0GVjbfgBUADoxswJehZOL6PUiYV0dvDJuV6Vv3MMfz6ipbPNj2uCuBTb9inNB5X0mezC7wC9VAGt54I1xLbhC1H4Iamqdhta8YlNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AA032+4U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AA032+4U"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a39e4891so12961325e9.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 03:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737716429; x=1738321229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z54+9WQWLutDiVJQz03gQKo3yyUNOVr5XixFhEZ4iPA=;
        b=AA032+4UaK+jmHMsaYrQI+zAHWozOdWqZtwgkQjFXvGkIaJ8f1oM1483rcZawG9R9S
         H2UxSQTDD9+mMzKyvnne0dYbxDB5okyblLM4RO4TD25b0syRtkbtkJYBo9J72pz5NcRn
         ghZD6ygwSXFPj6rsOxxraCEs1ZPTVy7G3pgJ9QqU18oe3S4a14Ifb/FbIKN5lRgD896P
         0LBAUQOZLPwN+5U7AkK5bdbp0cdf2swXVtF/XsytdaTrpHmxAHz2BdNaRzczSXz+qHvU
         iGRvkZG+36PankCLdqCwOCQPpc5Ckknyl046Xa13t3CaEA/TCQHpcBJxFTmFuS3ZqxVg
         vwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716429; x=1738321229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z54+9WQWLutDiVJQz03gQKo3yyUNOVr5XixFhEZ4iPA=;
        b=tiTj9LJpGRR4FDzWxQGc7Ii8u6k53lXwa7dpYJu7E31KINCrGegjsdjNAix27Fe0y9
         AK1GvfU4zeh4G4+EtnZQiuvSaw9pW9AJwma0KU12EIrI6jwx5klClwhDc5mYFx4xwUnZ
         BNtJuACg1Ovxv+SNmpnGmQIs0GyJ+JB1dACu7iOS52241l5tsdUXVm7p7S3jEnTLG5zl
         J6ecQDA38jwt5r8/+twXvRESv9oN/GsI1KGwaG+gYg67xYAKZypztsKMA4IxgyPR3X+Y
         WpWuPq99DnOBVdTl/gDtUcD9RSbSgnTJe7fSwnoYz79A3wTJBQK4wA3o0w13PUbPOsax
         h87A==
X-Forwarded-Encrypted: i=1; AJvYcCWw3iboIn8LJ1l3Odoo4dCwBZbpnpnpgKCyvKt8elZC1nH1WPDft0LPq0UMpIsVvjmFzl05XaQYAG80f/QQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyjcjGGtB0Pwsr+hSzCV+EDQj0Vwj5NPNppVlIjEQTukK1fBuIV
	23/2Tz0P4uSQe6sDdrfbZrqO+WMdQ0fXbqYg1Z2T3jXm4LJLjhOeeLvT7Q==
X-Gm-Gg: ASbGncsR6sbhpQc8h3I79vaCpxNchUhPJnu1AA76uzT7vGhIKHqPb6eYmU3OIDTqTqb
	8Q2bIuAzTlAO7um+Pi4cKgDZbw9tZSp9iGCaUonpGkl3nXS5VBR9O90NmPuTy97K8DLHbnmKzHQ
	xul824UJcj846Jyre5iKM3WDtM/kXl/ml+aCNl3NUnbx9jqOYxEDPkXtfsdSzjK1xdltUxHTb7o
	QjIxnyl+hJvuQo638l0MUcNBl+8YQ9zasHzK1+zAokmpw2q/WreUpfldW3pUulTZ3ac60NheKtk
	kQw/j3ZkA1v9qgGhjLLCz4hiLUnhEPfhEnHMpykR
X-Google-Smtp-Source: AGHT+IEaf/HCd4r1H97dhs1o0rKPHUdKBLJhFr1IOQK31EYIxfQvIfOy07DaokwsIf2LW0X3PqsTyw==
X-Received: by 2002:a05:600c:35d6:b0:431:5aea:95f with SMTP id 5b1f17b1804b1-438913ed550mr316865145e9.16.1737716429138;
        Fri, 24 Jan 2025 03:00:29 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501f1esm22101185e9.12.2025.01.24.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:00:28 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/3] staging: gpib: Fix pr_err format warning
Date: Fri, 24 Jan 2025 11:58:58 +0100
Message-ID: <20250124105900.27592-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124105900.27592-1-dpenkler@gmail.com>
References: <20250124105900.27592-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following compile warning:

drivers/staging/gpib/hp_82341/hp_82341.c: In function 'hp_82341_attach':
./include/linux/kern_levels.h:5:25: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u32' {aka 'unsigned int'} [-Wformat=]

It was introduced in

commit baf8855c9160 ("staging: gpib: fix address space mixup")

but was not detected as the build of the driver depended on BROKEN.

Fixes: baf8855c9160 ("staging: gpib: fix address space mixup")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 9cd2a2f50ff1..800f99c05566 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -727,7 +727,7 @@ static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *confi
 	for (i = 0; i < hp_82341_num_io_regions; ++i) {
 		start_addr = iobase + i * hp_priv->io_region_offset;
 		if (!request_region(start_addr, hp_82341_region_iosize, "hp_82341")) {
-			pr_err("hp_82341: failed to allocate io ports 0x%lx-0x%lx\n",
+			pr_err("hp_82341: failed to allocate io ports 0x%x-0x%x\n",
 			       start_addr,
 			       start_addr + hp_82341_region_iosize - 1);
 			return -EIO;
-- 
2.47.1

