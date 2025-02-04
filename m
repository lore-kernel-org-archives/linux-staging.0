Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF0213E82
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690988; cv=none; b=MhZC6mOciyafzynbeW614P1YpxKx3kYA7JcyDBZtp7vy4rLiF/rKDf0+jFW4YPi1N+EXx3MycYiEbBPwWr0i/rGBLxhoB0bfqHK1rcbyq6EWbAO2g983aVJFAKxVo/dt4qyG4VSEiX9cQbq8HTwEkGCWiWSzhklNewa9+qN337k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690988; c=relaxed/simple;
	bh=rkAC509swjdUrkNv3XMK82thHEYdK072zzRZ/sqDei8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u1vU7QUv61fIsAcASm0bAUbIAPCQP7OXKEeTaFLb+jRQpd3DceMRYIw3JAuXekW9zmUam0pOnliVFf/b6lwpna23QPmIi/rmTIJbqC67pm8od+V40sCOpz5PTi8woa/UQCFCgoZgXHJ6fCZMViQbUiYUxD2DFRooicF5iu07Xj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPBKB4AD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPBKB4AD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43621d27adeso40783625e9.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Feb 2025 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690985; x=1739295785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmoBY2HKoC8vppS4FEhNVLtw+QQRzfa2YhjsykY8oaQ=;
        b=MPBKB4AD7azlA8o4wkd56lPDrqjS/Q7/XivWnuHdPIWGqJ7LsrBFGU05uViolEnBAL
         hnMF185wEd/wnt5iw5Nn9mN/sU57rivu3pj9jSn2qxfi9ve91RS02nro6Js6WrLrrMWV
         YXFVPraMP4+oDOfQkwkj0Oy/UKZ16r4lJmh85RKDkOVLjQPfh0ndcAKv6uXizmTlkY8c
         lTls9f4DwmPaPVkrEk7MT2MjcsjmiZZmnb+p2UG+FDSkwIpZkoSTpRhsIKGe3zbCbax6
         MHOhbVCJsVoHYmoVZYeOltUfbXzYkh7HvwRU9gNCtCsg4O5SFOAgddV2a1ZvVV/EPCog
         DKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690985; x=1739295785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmoBY2HKoC8vppS4FEhNVLtw+QQRzfa2YhjsykY8oaQ=;
        b=fkEOZCN22xEE9Qu1+W4Za+HadPsKVZHXEFKNO8t5n1ZMQ50mxJy31HX5oNaJKleU8b
         aPqJNuuxoL2se6v6Ze+uDOgEju8IjDMglTL6HhlMA0Ns7BjqOYiQt/UWAQIoinloYCqj
         0Ufid2gUpr3ZW/DbrGfvgreERAFb9P63bBtutoF/sJNxUxzy778pmaWoMcMm4kVqJGsN
         OOFJ2GPRyJ+LIqZS6TeuVLEwEwFKsMKukXqgubXMPELp5TAxH7USHe60vw+lix7xsTmv
         1s21zMOjQJSWTlhL5+vtug8JhQ+4UdcMv9dFcsSogf9C1W+fHETKy+iXlO10OcRkaTbY
         dsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU8uLu8NuKp4A0G2DaIDgivMlrt7HjWU2e8HJcaRcO4YAvsYptO8HRq51uGBri+WKNEoceJCnLUGxoPFSQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzcSH5dHDaMkbXf2Iqn3Uz4VTfWf31GJqgzWsctw1wMi2kbIF/m
	0iF6pvz4dznmXABHEbehUNr0yv+Y+Aa832Mmd6ev8Yb32zyj3dRs
X-Gm-Gg: ASbGncsIdP6RFEfoZ2OqcODYkR+cp567B+mXBOL+dQOOq7JY90Cg4ztlbJx5nJwiaxa
	5PyF7SAa/zaJp84FonMGJ3akQATDc8XW32T6nHsmx6D9YrNLpRG8IlyuYISOEZkhoZXkdorKu0g
	QY2BYyVo559+FTFLbZz2D9qDjeQ+8U4p+ZZg/86ekHX0PgRzyn+y/Lf2OI6zLgWPxPX3113E2T5
	a/1vw9QUrvzOq+j6b0ISPKN4DKIiijaeMJDirRijxD1BUGyLhpWHi7karCY4XLsCCzhKhhDbcUu
	jquwXrLtkGCr6Y0e1Tu7asBFfWEPHRq6g+79jA5ezmIwZF2yqM4=
X-Google-Smtp-Source: AGHT+IFReAXb4J/9mpQDDwFtQHAYn2WpKdyKw/glZFHckPLTAlF3J3XnGcDutFRQHyXG8M+u34vd5A==
X-Received: by 2002:a05:6000:186f:b0:385:f19f:5a8f with SMTP id ffacd0b85a97d-38c5194b92fmr19556504f8f.4.1738690984888;
        Tue, 04 Feb 2025 09:43:04 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102ac9sm16164380f8f.29.2025.02.04.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:43:04 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Remove dependencies on !X86_PAE
Date: Tue,  4 Feb 2025 18:42:54 +0100
Message-ID: <20250204174254.16576-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dependecies on !X86_PAE were introduced to fix an i386
build issue due to drivers casting resource_type_t to void *
commit 48e8a8160dba ("staging: gpib: Fix i386 build issue")

Subsequently
commit baf8855c9160 ("staging: gpib: fix address space mixup")
properly resolved these issues by fixing the code in the
drivers.

Delete the lines "depends on !X86_PAE"

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 2bf11df122e2..aa01538d5beb 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -50,7 +50,6 @@ config GPIB_CEC_PCI
 	tristate "CEC PCI board"
 	depends on PCI
 	depends on HAS_IOPORT
-	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -64,7 +63,6 @@ config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
 	depends on ISA_BUS || PCI || PCMCIA
 	depends on HAS_IOPORT
-	depends on !X86_PAE
 	depends on PCMCIA || !PCMCIA
 	depends on HAS_IOPORT_MAP
 	select GPIB_COMMON
@@ -90,7 +88,6 @@ config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
-	depends on !X86_PAE
 	depends on PCMCIA || !PCMCIA
        select GPIB_COMMON
 	select GPIB_NEC7210
@@ -181,7 +178,6 @@ config GPIB_INES
 	depends on PCI || ISA_BUS || PCMCIA
 	depends on PCMCIA || !PCMCIA
 	depends on HAS_IOPORT
-	depends on !X86_PAE
        select GPIB_COMMON
        select GPIB_NEC7210
        help
-- 
2.48.1

