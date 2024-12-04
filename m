Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8A4A28
	for <linux-staging@lists.linux.dev>; Wed,  4 Dec 2024 16:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329295; cv=none; b=eg8AmSU62kmbi5INe0FftDah05lZALpwXs5HFptOThgdB6ugXvjMMdpwYIPF7EcjR6aYqWSIcW2Au89DW4GlBNpK9AbonSFAn+LDqWjFRkLiSNkCWjcYeiXemY7Ih7HdxgQckaBmcQv158ZdE51HdmqjmSZjZxLpuLGWo3DKIpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329295; c=relaxed/simple;
	bh=a6WjITYDh8FlQbh3cr+ztIE3gMFYDSCNCAv8bVk/eYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nW+gw+nB2M2HDtDdS5H783mNcxLjfcFZRTJcxS4sNmfCiVCsg0jyH8fOqjuD9ss8RCfSzv1u5aXbH4GEC68JIp/lFxc7a//1/0qKZwr71tV801H3ZmdxhKovLkJc0qvkM5/SfBS4Yfz61FjPFCIHaSMPLBqNxDmQ1vRUNX6OSNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7dULuCd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7dULuCd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a45f05feso85698175e9.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Dec 2024 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733329293; x=1733934093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXdDkWsDnFtUrE2+z+ujQNEAqNP+3i4+ZyErVIQ9EKA=;
        b=N7dULuCddLLfqbrnbeav5M4cqQTJp13XDE2eiOvDPlh0BctL/z/i0MleiRpA8Awrjn
         2Y00S1Te+iUQWG8ZB4jPJ7U05shzAwrX3rW3Ovmbh9BXT/O6YqavcIsyfZzx6nEgbpcx
         ssPKLcHyxhZqdMeGl99DxiotZZ+JOv5sxN0Hv6E67iGR0mf7F07yRFiHVZU1uMgSXTVU
         6O8DeeGNErMUobg6nJbxlWLkSIE0avdxK9HLcqD8rW6Z4eCbg5ZqI2/FBqziwXG/7N8K
         FiuEhsoJmxWCOq/mgZWl6LN6evpGRH/elI7gW6NQ8EeqcsWegQwAPRwJZYgNmo8w4zFg
         M7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329293; x=1733934093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXdDkWsDnFtUrE2+z+ujQNEAqNP+3i4+ZyErVIQ9EKA=;
        b=Cb47NZc6JJpKFpkJA0qtp8NGJKYrDvsea/4PmT+ialtfaveBGfT7os6HZ0WgtDTLOX
         xufA91mmrzkje4afU+236sR5AV1agWMZP/Pym2BBLb11zIVGMf7YAEXb5sjr0zZbz8Hl
         1oBAex7c3CjM5yGLMeyOZMjGWpLWAIVaD/6QiAO3Hn28M8fnQk1Zyl17VTyifJo6Rmir
         mR7sAe5qrIJaAtudZ0NfAMhk9QMRDPWVki0YTH9CoFB2+9ZjDEkSROAtqWhsYmBM6N/Q
         aTacVtGYunS6hWyWRdMezkWHLgmzpezrwxGMjdRRLs3tCOeQX0NjMJlZS5VAF6dB/N3u
         Oc9w==
X-Forwarded-Encrypted: i=1; AJvYcCVKsgECbNb5PqxL7ZOOO0iqHgI83tBJqIfetcnCrtL9gu5gmURX8xVru+T3NKF1PKh/BoQx2W7vou0HxwI0@lists.linux.dev
X-Gm-Message-State: AOJu0YypCWScu79PrcQuM4iTS0eAReIxvNIuw2K9TlomfPSpxVnHVwYp
	4VbSfv38vN+qBIOcJo5IraQtXqKSg/cMReHGsRraMWjMvN9nVsEB
X-Gm-Gg: ASbGncs4NAl/cuH3bJHT8qD1io8PbwN77cX7OcswACIf9+hFsQeBL8V95bEDOdSlnvl
	JYf0TI7C3YnVe0MV8SNn62+U8ePAe2z4856+LIQq4tdYcyaih7slFybrWL3wNufbGRewxiHKZ8b
	Jnb5OPK/0o/5A4TnlqRREfI/Xc55MulwP6esJtl1GPO3QyK27s3hHWpLpD7qXe8WplX3OX9vk+y
	pEMFZk+HeLDEMMT4WFPtCNloRZhDi/UpQmYnrQ8wO1E2dhBRBfkQtPeMsDc8PBqekQ9B5vjo7Xn
	fBQncixUUw==
X-Google-Smtp-Source: AGHT+IEw1stCh48pN2T4EgDGQFXpVxFIxkZLFpmeriseUp2AmBTMzqWCbk3SxePuXPXryX7tk6wu0w==
X-Received: by 2002:a05:6000:78d:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-385fd4350fdmr8134370f8f.36.1733329292574;
        Wed, 04 Dec 2024 08:21:32 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f0d38a89sm9705177f8f.97.2024.12.04.08.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:21:31 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5] staging: gpib: Fix i386 build issue
Date: Wed,  4 Dec 2024 17:21:28 +0100
Message-ID: <20241204162128.25617-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers cast resource_type_t to void * causing the build to fail.

With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
int which cannot be cast to a 32 bit pointer.

Disable these drivers if X68_PAE is enabled

Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 95308d15a555..6cf05586ca10 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -50,6 +50,7 @@ config GPIB_CEC_PCI
 	tristate "CEC PCI board"
 	depends on PCI
 	depends on HAS_IOPORT
+	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -62,6 +63,7 @@ config GPIB_CEC_PCI
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
 	depends on ISA_BUS || PCI || PCMCIA
+	depends on !X86_PAE
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -85,6 +87,7 @@ config GPIB_CB7210
        tristate "Measurement Computing compatible boards"
 	depends on HAS_IOPORT
 	depends on ISA_BUS || PCI || PCMCIA
+	depends on !X86_PAE
        select GPIB_COMMON
 	select GPIB_NEC7210
        help
@@ -174,6 +177,7 @@ config GPIB_INES
        tristate "INES"
 	depends on PCI || ISA_BUS || PCMCIA
 	depends on HAS_IOPORT
+	depends on !X86_PAE
        select GPIB_COMMON
        select GPIB_NEC7210
        help
-- 
2.47.1

