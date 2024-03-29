Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636D3E47C
	for <linux-staging@lists.linux.dev>; Fri, 29 Mar 2024 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711691097; cv=none; b=UX530EjZFKKRr2AlGmW8k22P6TVMYnDz7LbUmaWIGxZFoC8m+My2UXKtADoKssxRPcl5r7qxvAmaUr3isjtpkh4DHpTVfd5aUp5V0+wxLOSQp5d7NlOYi6a8znSsWmaGhuynyDt9qVktzjkaaCdoAfPi9aJM0W8bNn1e1Nk8raA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711691097; c=relaxed/simple;
	bh=Chsh0Y6imvACPZqM0aZBL2mZYFk82NHt7OzDTWuPeoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ht9jvZQbb4+FF0eM28WvXv8AISRnvCR8KeamndUllONURgDW67bYm0dq5wh1KhId956D9+tcwZVAK1+W631dl6yswr+u0tigGwV+/iuKgpHsxjpwU1OJOuKmxl45vxTOuuD3rpL2FYWd0KCSF4W47b2sceKvSY1hTbNNxoSJXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0N8V/X7; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0N8V/X7"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c397193878so1063718b6e.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711691095; x=1712295895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwjYyV1xedFSqTP36VO0uSIhJUQea6nzzcBnO8oLakQ=;
        b=l0N8V/X7sKBiMOAbMJXbIHsk3RzxXr3NO+fVzBQ/OP4XkAoYXsd4iXwF1Lyzo2Nmx4
         uTlh4JdGpeYPo1UdU6X7SFqcK2d9uBFhs7fanLV/eR25TctlG2i7JG33s34IK7Ry/3ov
         ZADmm59bK3TLjnP3RSP8UJxch/l7jZAb5Z63FGx743J0tKFTYo408rGB7dhXV/5kCiTs
         kWkXE8ZCvvF/eTw95FK+5UXyMbGHq4xPmCmFfEI0tyl9MJbp2V6dW1NrmDnETzG7sP94
         3p1L96YMxdl7KUM6OAsWPJXIQuoplpz+QxSr3kuZGpxXsZBaIFXf15QWkAyP2eSSyVPh
         Lylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691095; x=1712295895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwjYyV1xedFSqTP36VO0uSIhJUQea6nzzcBnO8oLakQ=;
        b=VHm/2pYgq21LqEia66Unfd+RoV0pAsDPRIiQAXj4aE2HvSWVwLRa0athx93lGBdpXy
         BvIonkOZcGAI/huRB9Q651B3lL2klHgOMhqZ7r0ov6tvxo2DkaGqRS2nVWnVDR0R9GQs
         pPfQ3HhTgw70rjDxCHG6ZdoWJ+RImWQ6oNZL5yl0qHj88CUXVqmKmrkS+RmwIPiHmgiC
         KFCsoYf2+2q6nXR3p5XClUmkA7SQZOhfhXp3FJDH6REHqiueJF/gBPwMmo9xDR+sbPrU
         /bywcGaFmzG3ZpPEjJnXH+qRrfuCLlJmkFcPaCWbBtaNnmAf6uTArQMZEEhDL8BoxizB
         P1AA==
X-Forwarded-Encrypted: i=1; AJvYcCV2WXcrhUrmXukr2GvZnZ35RIcA13/ip8gEjHCr/oFfUX4pYSJM3+nMy4fWstTSnYLvvVhd0lGkDC0REfavWvWO9oH89tSrAYDObVIG1A==
X-Gm-Message-State: AOJu0YxkITtzbMCf7+PeFfESEKWd+rqVmigRsOShpumbspMiI4IIBMms
	44jlMHeZ4CXXv7Y8z08GVytXCU9bPrc5l6SLWezOFfobjEOQORn3
X-Google-Smtp-Source: AGHT+IFDwMv1sfBpVAUxu6Mc2Bi3QSJQkBrer5BK2llVjxSCi4SL/46S6aRYY65dN4uWzKxG3Vi07A==
X-Received: by 2002:a05:6808:211f:b0:3c1:c7a8:5ede with SMTP id r31-20020a056808211f00b003c1c7a85edemr1577604oiw.46.1711691095092;
        Thu, 28 Mar 2024 22:44:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100f:826c:582e:d62c:addc:15b1])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7814f000000b006e47e57d976sm2315495pfn.166.2024.03.28.22.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 22:44:54 -0700 (PDT)
From: coolrrsh@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Rajeshwar R Shinde <coolrrsh@gmail.com>
Subject: [PATCH v4] staging: media: imx: Remove duplicate Kconfig dependency
Date: Fri, 29 Mar 2024 11:14:46 +0530
Message-Id: <20240329054446.33523-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

The kernel configuration VIDEO_DEV is defined twice in Kconfig.
Thus, the duplicate Kconfig dependency is removed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message
v2->v3
changed the subject
v3->v4
changed the commit message and subject 

---
 drivers/staging/media/imx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 21fd79515042..772f49b1fe52 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -4,7 +4,6 @@ config VIDEO_IMX_MEDIA
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
-	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
-- 
2.25.1

