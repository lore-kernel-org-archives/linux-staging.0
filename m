Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8439215E88
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272566; cv=none; b=WgfYya1jSg1IqRyFmv9Jr0KZS+6SrkCfUcBu/LK72Xd0V1T80IcpEQHhPdjVwzzxnJplKpe3p54VFqUc+eqXTcZ1nGx6np2IrYHy+cZsyGyDgNPiwneXdf3MFy9tKjzdXk49BymfZLDibOYfMduuFn0u+LtDEePbyjuSEdWvQUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272566; c=relaxed/simple;
	bh=kJA1ENfcVIOkNw3avk4+tDK8aEfaH/g6voWzg9aHL18=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hN8hBVYs3EHIc1aznxlegRTIfzUCYbsB8jGlfpSW4PYRHmnJ7A02CF1/Lh578z1xdeD4mq86aI981rvgasdJvlhDzj8tWZhJECcVe7NfKkW7Kz5fhAAvKSQYRWtRHmcpc6wWrhsXKU3BY8tJSnXpILnPYcsYEOwuXlQVAMbcNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MasCv2X9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MasCv2X9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e04ac4209eso30047805ad.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272565; x=1711877365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o611cLqDFm70Z0Jt+IMAjJ8j+5plaV1gN+jC5Ar2By4=;
        b=MasCv2X97+rP67NuRy+1CRPXqm8mNXpUmVczoaFKL3uCNilRsmQBr0yVgaxNbTwiWM
         GOAw4lXKIiQWQ7kEf88AIQU5EJvCEGpBNK6inucjs/ZghdFc6r0V+UnZBucSkOJvl3FL
         dmwrPsotF181BGYwoJCe850xL4A8N3Gc1pFY4PF4GmOqjRIdl6Wf8ub3I6+fZHjnn118
         wUEXidTGrRDH06Xs2JyBGC6kZn2uAjY3MuA5XTFTavYvwlDCSM1WvJGhkY4uxjlzEOLb
         mGHl8hfZXi82ppOcHv9AIKFAqbkMNxSc46LkDJUnR8WuMX8T1BCK+VWcOBeubAQb5/N4
         BIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272565; x=1711877365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o611cLqDFm70Z0Jt+IMAjJ8j+5plaV1gN+jC5Ar2By4=;
        b=H5dHOFoKU2MACRzs4zRobG5nI3KivMTlgS859QYIHm/GGp0omXyhdY9ac4GZARpL3N
         kad2ivtlJSky72q2Onaksx/TMfRVH3cj05u4uCd6jzh08EkJHBxcHbPOQ43lWk2vEz7Q
         IwoXCPoVx63yGLHegeC6hY8JE+9nR9gOxPy1mB7Sv2nTOZWByGADk99IE8nkE9KFK7RE
         529/OsmMDzDxcW6pN0snO0hiDSi/DSGR0Ee8xQO+PybRN7EqqtGlm9w1PcX/bZiz9hfl
         k0emCILzcXpBgS+2HejLriN/iLMOaYMa2vEv1YuuYSegYhbv8sPo3ctOr8u7VZEyRJ0P
         Dq2w==
X-Forwarded-Encrypted: i=1; AJvYcCXRnDa0eBBgZfWhHtblx2kyN/fN3rEgbppLkJ4ntpmbuG703kCxz/R3gEc3YkWEfPMdE6GF7PF4ZHSPHmwylnY+iFntumCWylAEhPlqVQ==
X-Gm-Message-State: AOJu0Yx0c4OssMlBHlhxxnJL4Jn+cIMBhGLyZUEUorKJLP2Lx1Uq0pQF
	8n0JjiN386ccyDInubAaFUU+OwwF0fEHt4V4k7j5FdQiPNHSNX8U
X-Google-Smtp-Source: AGHT+IFvawNc97ardr5RtDisvgJA38GFboOggdtFCS3O754mL/vF+2DKsMyOKtUSOxQENHyFOa9F6Q==
X-Received: by 2002:a17:902:e542:b0:1e0:b5d4:9fcb with SMTP id n2-20020a170902e54200b001e0b5d49fcbmr1110472plf.34.1711272564702;
        Sun, 24 Mar 2024 02:29:24 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1004:e7c1:d108:f4f6:f7c6:2fde])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001e0a28f61d0sm2717347plb.70.2024.03.24.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:29:24 -0700 (PDT)
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
Subject: [PATCH v1] staging: media: remove duplicates
Date: Sun, 24 Mar 2024 14:59:17 +0530
Message-Id: <20240324092917.19177-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

In Kconfig, the kernel configuration VIDEO_DEV is defined twice.
To prevent doing repeated checks, the redundant code was replaced.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

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

