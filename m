Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F450132132
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724787546; cv=none; b=UqyBQGeArDUdtBigXfJ3iXVAkrzitczLBzoVAjSAkYKmWuPZepL8Xxme0rivmQLut508Iao1lVX35AhbS/DqlZhMFvLe5yM0F9SFY3KVfpoI9RmpRiQnBHzxxV8VHFX4iymdEDtxcJ5r5dIZ1FNNF3VTBUEQYwvIFbD218bjuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724787546; c=relaxed/simple;
	bh=K8CboGhZ9yuHVLKmofbIAcIxBqnTTRvLVVlSNw+SQII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=akPT8s0TaragFQCdjNo3/J2fpTZVkSR8L90h25K1KVRljNgtuYr87a5ipY84boXNyH0S8uYOziDQLy2vn0ucIJvCQcJnY5VEn/a+Q6Uzp6EM55ADOwUmapN1jHR9H+EH2rrJ0z5Av3AK3oHCsoAY6ZSoGnUfJ3eXT1V++m7jiiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0tl1lYr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0tl1lYr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2025031eb60so51912205ad.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724787544; x=1725392344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FO60D97gOOTFkiNBFEwFM23LWZ49voULeyhtmHM4mI=;
        b=l0tl1lYrbQbScJjhFyB2/tVw2E48cbC0lWDnx9Tcub2RQBxgQUbGvO5QnnHSnlX3lO
         3Vr5nf7cbBmrTB+IUVKwy8C2IP0kp0Wl76dOKKCDzeBx9r6UnGq6acX/0hPrHn5bHjEX
         q1za2stOow3Tflz5DNarmeKZr/0hCRAawRolvhp53hLm/V34xQc+Ti0G1bKQ5ONHzke1
         ZYbI3B97GvL5S3RfP1JgmSE7Z9U7UfxIwdLGoSupZRVRaEa8syJtoex56VFdDPb+fjlW
         22RxaA/N7HiUbK2f2c5wYJMZHPiheOJPdrNHtO+O1ThVCdlzjLg8XBuBJf2JMtmzYN5d
         2RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724787544; x=1725392344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FO60D97gOOTFkiNBFEwFM23LWZ49voULeyhtmHM4mI=;
        b=ARPlQ/32JUNNj7CUuhUxcajNSzcGXsUFGvBL6t74jsK94kybZx79LR/L4SyuvMJkfw
         xOj8tw8pjqjSLgaE3QoACUHyWauJM7vSNmMZlJbYyjHv7JEYqs2xNaYWMuN+HMaGSI6l
         vBH4alX8LFN6Ovw2QCB+4qRVGrHbpBeNhdPjBnzZwYfJa1RJXYD7G0eebCenKbbossgb
         jAsTrBYaO7XQ+3L1Gg/n5MxjjFPprVJyMD3twUy3lW9Tgs5wPiV5DQ+dQxoTbnJZGyVQ
         piKf786OukQKd9gxh7YkZ/mZ6bPN978+gQCksCg6i7loL88rXQ/67JSxcPUZW4Sh0MSJ
         /Qkw==
X-Forwarded-Encrypted: i=1; AJvYcCUupAP5Nacatk1p46WFK6SHnbuXXH9dlLeDqd2+Gs5pjVkM/QdkRaEdj04lVakX5Rk6KrJVHdX+OvVJOoGe@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9O9YKoPaSUFjyQksWhoCGNqD2xhpFMbjmDilAOywtpHaew/MJ
	HnkVwkIjek5jamyR9hmw0d7FFK3+Fs+a0FA08HEmQizLZZ8WNX6x
X-Google-Smtp-Source: AGHT+IEdEo2C9MvAOXeKpa4R856afyBQRZuuGy0ZLczYjfA2hA/JnYu0nffVw179cBCBJKJWkDHbWA==
X-Received: by 2002:a17:902:c401:b0:203:a0ea:6266 with SMTP id d9443c01a7336-203a0ea6d13mr140108005ad.12.1724787544151;
        Tue, 27 Aug 2024 12:39:04 -0700 (PDT)
Received: from fedora.. ([2409:40d0:3a:e5b4:1c14:bc7d:2dd8:f670])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385609a88sm86687205ad.208.2024.08.27.12.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:39:03 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: sm750fb: fix checkpatch warning architecture specific defines should be avoided
Date: Wed, 28 Aug 2024 01:06:37 +0530
Message-ID: <20240827193634.3291-4-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Abstract out x86-specific code in ddk750_init_hw() to improve
portability and adhere to kernel coding standards. Replaces
architecture-specific defines with CONFIG_X86 checks.

Fixes checkpatch warning:
- CHECK: architecture specific defines should be avoided.

Changes made:
- Create a new function sm750le_set_graphic_mode to encapsulate architecture
specifc behaviour.
- Using CONFIG_X86 instead of i386 and x86.
- Added placeholder for non-x86 architectures in sm750le_set_graphic_mode
function.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 02860d3ec365..23196070bceb 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -210,6 +210,17 @@ unsigned int ddk750_get_vm_size(void)
 	return data;
 }
 
+static void sm750le_set_graphic_mode(void)
+{
+#ifdef CONFIG_X86
+	outb_p(0x88, 0x3d4);
+	outb_p(0x06, 0x3d5);
+#else
+	/* Implement an alternative method for non-x86 architectures */
+	/* This might involve memory-mapped I/O or other chip-specific methods */
+#endif
+}
+
 int ddk750_init_hw(struct initchip_param *p_init_param)
 {
 	unsigned int reg;
@@ -229,11 +240,7 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		reg |= (VGA_CONFIGURATION_PLL | VGA_CONFIGURATION_MODE);
 		poke32(VGA_CONFIGURATION, reg);
 	} else {
-#if defined(__i386__) || defined(__x86_64__)
-		/* set graphic mode via IO method */
-		outb_p(0x88, 0x3d4);
-		outb_p(0x06, 0x3d5);
-#endif
+		sm750le_set_graphic_mode();
 	}
 
 	/* Set the Main Chip Clock */
-- 
2.46.0

