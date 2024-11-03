Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36E18D642
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669201; cv=none; b=rH5pPVfXnh++K51tVLW5+WZJhs3HRcSUIQT98Tav3hHWF03iSxDf/Y01S1LbOH3FUw/pHDnCTZqJNIKRg0K7R6uDQsUPPR5sP+ZOzDsS2N3yb/tMpmOHoC6RnsWLtAo67dVgvdVmhSOYZiQ9W6SfGFi7IehclgQ02RUuYmEKybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669201; c=relaxed/simple;
	bh=tBW3esnZSM+5l0zHXX9xuAZ8mT7/nVdsRIt94p77xvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1ghZ4/j//QjMyvBo7f0g0qGWWDQBN56PzVkgSD8BQhf7UjfE76quAySoNjQHeX8tBX/CTklnyZUSVFsU/FSmkc95lxKPGSUc5o0IM52D+1ja3pIvudKosO8+DBT/8WHkV6n42neTb4/DG7Dc3M5W5p/Pz24ubUJ62lUST/uQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g781+DYa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g781+DYa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so31472195e9.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669198; x=1731273998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hpb+hfuRWtk7Neut2FstHxoBo04AGr1EjSHYezAftH8=;
        b=g781+DYar3YvooCwdufKWS6i31Gdz6GJOqBAhv6OtreEgvouaZgGlZoIsgn2QjuUXB
         QCWAKIMLa5t9FUOyWyOGqYupuvO7nPoNh/dLtyHnTgX48UvLpXga0vmOFddIhprMxDG3
         TZoqD05S5e5gOKbMK2OgON2VtxHzTxJKcZgcXIYkjpWthMQyt+x9oia7IpjR9CurizEd
         7YImLnYefNghQzdAqS/cVxOSFbfvfa/fDfUqgiuGr8UBLAi79pfQrtCyKXhJbovvJrj0
         uKW8UYldl/XgfpyrO1DzxHEKw5DERv6jrTA0anUQHne1SucQWhGbpTdCfbpe6UPFYWJG
         7BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669198; x=1731273998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hpb+hfuRWtk7Neut2FstHxoBo04AGr1EjSHYezAftH8=;
        b=usEBP3bnTwsoKVDcX+B0E9LuDYVeWLXpD447Mom3wI9KLzCini4O/UoPfiuzebOR/J
         xmEr7GFmO22+wq8pBRjZ3YepwtwdPwT7vkFswtx9gOBkO1VTReTe/3oEM2hnImLJndz0
         S0UQLxeNSTJG410HfRLkq/JUlQmbLd11jfTYdL+5VB90gRe4jPtenKrHRbH43oN8kCVK
         jPQj6VPYBADFecMo44+q3UEJZPZ0pXy/A/rpyjFtEo5nTKQxH3wXCyblGG7u7FMDdXd1
         76DlzPoQwbM5+tKjSGdzQOFlGlKZxQlqeX4J3QMMD5qbChPWO+uRWggtLIn9eNyBGRdn
         8qww==
X-Forwarded-Encrypted: i=1; AJvYcCVBVG5C4YtK27g21ZhkuqLErCgqjMhdXBEJ4SHtjXc72fuFegXW5a0T62/7db4G1TLDgoqWINsUJtkEsm1A@lists.linux.dev
X-Gm-Message-State: AOJu0YxHwS5UPDVWRyoOLY3X6a/UbsZeHxmtXILW1Tp82KfNx/dikIj3
	Iv2JcCZei/AVQNi/xrkP6gSlj1iCGthRzg9+ItR4RpXlyRHEEinX
X-Google-Smtp-Source: AGHT+IGy1u7BxCdxtmIXoJggKM8bEb/ymRcUNlSCICeYKE//ibdTFgU8yKXD//l/uwT+jh0+jmccWg==
X-Received: by 2002:a5d:6d84:0:b0:37d:5129:f45e with SMTP id ffacd0b85a97d-381be7c8137mr12211534f8f.20.1730669197569;
        Sun, 03 Nov 2024 13:26:37 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:35 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 07/11] staging: gpib: Fix Kconfig
Date: Sun,  3 Nov 2024 22:26:13 +0100
Message-ID: <20241103212617.13076-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NI_PCI_ISA driver also supports PCI and PCMCIA
Correct spelling error COMPIlE_TEST

Fixes: 2c9f5d8c6ece ("staging: gpib: add bus specific Kconfig dependencies")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 0ea9a276c389..95308d15a555 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -61,7 +61,7 @@ config GPIB_CEC_PCI
 
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
-	depends on ISA_BUS
+	depends on ISA_BUS || PCI || PCMCIA
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -138,7 +138,7 @@ config GPIB_FMH
 
 config GPIB_GPIO
        tristate "RPi GPIO bitbang"
-	depends on ARCH_BCM2835 || COMPIlE_TEST
+	depends on ARCH_BCM2835 || COMPILE_TEST
        select GPIB_COMMON
        help
          GPIB bitbang driver Raspberry Pi GPIO adapters
-- 
2.46.2

