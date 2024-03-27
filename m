Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17418B1A
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 02:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711506835; cv=none; b=KNs71ylmFMwlNXfSP/KsZLDpRFl3YsgL0ls3jQ2h9UMm8TNV40/L3pnJFhZGy4DrX1vu6pQSG0aqUAMNErlVW1ZjTlNhi09dUkBEyspAi2lpJf9lwMhNCdn4293lhpD8rUolB1abqDl/OwG4KHNr+nnxXWYzKPgtNqFjjZbO6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711506835; c=relaxed/simple;
	bh=fqxbjdG/J9dPK4Wf42csZTCr+nu7BxaXdN+9IM5WVuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sNdfkEVgxCQ+49yZeTxuKzPLHhKdmXEY7J/BWFLi4sJZrxL5hi8sPTkFsbC48B8BYkHH+ccPcG3aYEFh5HEl8606BZDtjOECnl/AdOKvutFnoq87UNfDgD2xOLm1t6nG7z8TXP1vWzHpEdVUx8kvnrY+ZGLnKZk0/FldfLqnm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TELsDFQR; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TELsDFQR"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e74aa08d15so4265741b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 19:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711506834; x=1712111634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mFE/WKj5+GBAYBCA9TZu6+BYrqSKo8UWK4STAPr+tFI=;
        b=TELsDFQRZlgWsRbe+hpz7/fEyKHo8qhT68LVCpJZPA+aS50yDMgSH4KwwOYST3CjVk
         KF7vmRB3FS5sVOFuN89FD8D5mFynfnRTlqoAkPGTjCndq/MQqlE2NnNx++dQkD0GykbA
         0IkCD3E/CkX2GJj3gMv8Y0asFkg515qTt4pZkuEBPCLtF//575X+LGR+m7WB7bQgoqsd
         ULwSXj+lXRbRQsNbxTjquprULVqyYkVzZl1o1bwkSUfO9ojnD9S39nkSyUApukW2kSIe
         wBjS0+wgJEORNtlX5vyk87T0ZKZ3by0C5ocv+obPwYc/KX7oKyyS23NACRtmWjMTlO4K
         VaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711506834; x=1712111634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFE/WKj5+GBAYBCA9TZu6+BYrqSKo8UWK4STAPr+tFI=;
        b=XZYBI3yjAAlIVmSqWmTpKrbn4mM1de+9tIe/oPosqPqRhYH0bKYa/GmxZYIaY2U8Xr
         HeyonzpRUKOHDW3Tn8OSRNBh1MiQWEX2D3sv5UpO3nbzqpgYFqrmrlhc06LGzwfvxgpR
         0NvNT52Ad+E+IOqM+S3tr7DpAQtHBnHstN6SVkuPCL86QHQiYeTCAcDhncGlgzzxb7My
         xENdsjRvGiRCQ+4iyW8yc533mIDAzKekqVeJy9YMDNrqbCkcCJkyQQ09xfa5DzIMDAzW
         8AOYy/e0VlTYRPL/uuS9CTVuEJlZnbZz9EfeEJKoxsnKD2VPifRUxtleHSX+ADOC+zQV
         UbCg==
X-Forwarded-Encrypted: i=1; AJvYcCVUvpadJFgmdV7uWQRJXYm2H9DLuUhHj4eZYsMN79bcf4PMLgRJHS5PBAgZjUnW9GN2zlvEIoZkBH+6NccgoMYP8ZcJVs+oz5i76lmqig==
X-Gm-Message-State: AOJu0YxbRtRzczfCUzXxsprc2tvntHPk1/snhYjkaEdhUssZwyNETJbd
	vRtyRnuaoDALOLM2Lrrc6ZNJTVQUBHYllyASS+eWEmvb65Mwyjxp
X-Google-Smtp-Source: AGHT+IHALrwx+sm0l+OwSsy7AtHVrSvCQg1e5TSoosF5tEtKe338lI3N4UKnH3zPdgfXjfwA/xQdsg==
X-Received: by 2002:a05:6a00:3d51:b0:6e6:88c3:8b7d with SMTP id lp17-20020a056a003d5100b006e688c38b7dmr15983050pfb.10.1711506833394;
        Tue, 26 Mar 2024 19:33:53 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:1161:203b:4df1:bb4e:1183:2058])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78d42000000b006eac41e9674sm1008168pfe.146.2024.03.26.19.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 19:33:53 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: remove duplicate line
Date: Wed, 27 Mar 2024 08:03:40 +0530
Message-Id: <20240327023340.3710-1-coolrrsh@gmail.com>
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
Thus, the redundant code is removed.

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit message
v2->v3
changed the subject

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

