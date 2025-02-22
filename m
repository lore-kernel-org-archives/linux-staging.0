Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D13145B16
	for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740252792; cv=none; b=LFMHFekxOKzMtc+5wp8j05UgfBXsa8xugUyeSiTqVMSubCVI1C/J722XzpenfQ78ssH6WdvvGT/H/RnLqadpDEJJwoKDE5W131KVzvzZk7kAF+mN3hHTubIQLUfdX1nUqrYKuoh0UJ89sg5aO44NcPxhdpjn8ukH6Yr492atAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740252792; c=relaxed/simple;
	bh=OfmZMEvJIkp5Fj0oy2tReM70wDR8EHOpSUyCFLG25yI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6K7VsCYaYWTemNpiDH35W2La6o37cbBEQuM6J3J0xinEENpaGhuh/QXjSvxQFcg+ouBtuXe+PAV75kiUgk1J7SA6EpQdIYlwr7DuNGpj4vyXgwKnz+kEdZLloeNHJC0gejy1j/9fnAjeivtR3jDtd78R1rrHAqQO/akOL8kSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0BQ9Oxz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0BQ9Oxz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-221050f3f00so71546135ad.2
        for <linux-staging@lists.linux.dev>; Sat, 22 Feb 2025 11:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740252790; x=1740857590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oG1Y4xUVBy90l/AWrqKDSxBw1CTC/BkXHI7h/Zxom7o=;
        b=e0BQ9OxzqEkQcY0A+O3Ax/3dO9FgKc10R17nlPuOxSpB89yDwe7k73smW6kbJEYlP0
         gmv4ytec5AEHTulL5OzZxi8JpiqMV7jDpL8zbwopH/kQaP0IYT5j/sUKbOsFWHozIEPZ
         Gw3Rd0RBJAwGM12KzFBE7DSa1BX3ISwZgCnSqeUXG0c4j4dbKtVSsrIEe/vz14hwn8Mh
         83vuKpPD5om5sGMVhHOsy+rehvp97O9dKRdG1c7EErxaXx3vhrNVo8CklVGRx7tnsfLM
         sGsF0eOoaVfgKmWpfx2d870GYiePlA9H4V2fLm1tmaSEbqIZQ2jH6aGI9PhND5rbMUBF
         Ra6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740252790; x=1740857590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oG1Y4xUVBy90l/AWrqKDSxBw1CTC/BkXHI7h/Zxom7o=;
        b=RKIDu1jJ+C1vZtmG1DiRM0doO+sjgsfijWAVvTx10gNOWIIYyeXi1bpRYIDFHdNNoj
         mIr8Ge6nYjljYe4jbXTGrqVRd5up8LgKVDOA4rhZ2AXJFkRAi1JHsOvlHJy6Fnlt5Xvo
         mTISs5jwye1pfBI54cr/hh2jl5f967swEGUtSLXESTMwvh4/CeaH/tNA0tFndz8mfCEK
         iGMa1PwM9Ip0jrW7bq1+TI0cU529pdX+PemUJs+baLHX+VFTePWnIq9w/IFOlBiP+6DN
         oUVAuTag0EiubQPcadKIgcuXTr/Raf2jRRXPNk4uMFzmoLeiBZ/3KXRbYrvNmCjbGa8n
         r3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvSuFHxaDmNebVVmR0qRLqRfiJWyYqfUpAf8GmKH5ha8O2SCWe4gVWHEovmpjUVXlMP/ur+kcFyZ7GR1Se@lists.linux.dev
X-Gm-Message-State: AOJu0YyvEtr2gyyfoTT2KI/gzpaYmQYioU6iBbgpLK82h0CY5nhFf/uW
	F3CfKpSfJAnU18aQYmHWvdDBs1dqKqr4jLGan83OGsrzKbHc2WAgbGW/FbPXUKA=
X-Gm-Gg: ASbGncsC93g8g/IKikN+6BE4K8EF51+epSRjjvu0JwMZOIKiG/1sKCLnAzoHzeP38UA
	nGJHpLvoueMwEgao0/UuHfJndsMUa4XszNFa5fGcI99GGz9zlxpmlpUkZeNo1Za48Vu6U2ZPk31
	YE+4RotWfiKD5Lw3ifxfKoQBL55LrKySCSjmBPmbUfg6kUfJbppko0ktgzoKeUy8NDwze7YVk2Q
	fAJYqOkJMK6wYEjx9As/4JO/hJt9RyDw184zECPTNSfX2GB3fmfHlFiv2ejlyTSb6ugLVk78DQ7
	jJoLCaJ4xD/dCAFvcG3vDUbhqlU2Dt9YaqySqF/2jR8=
X-Google-Smtp-Source: AGHT+IGds9hYYhM7lhNXaP5V5VGPOZOdlf0A/D+v1WqyQMFkqW1PLY9zki3n+7oIDnzn3VBbkXHGRA==
X-Received: by 2002:a17:902:cec1:b0:21f:55e:ed71 with SMTP id d9443c01a7336-2219ff31895mr143259245ad.5.1740252790272;
        Sat, 22 Feb 2025 11:33:10 -0800 (PST)
Received: from localhost.localdomain ([36.255.84.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536375fsm154131165ad.53.2025.02.22.11.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 11:33:09 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] staging: sm750fb: Replace architecture-specific defines with CONFIG_X86
Date: Sun, 23 Feb 2025 01:02:42 +0530
Message-ID: <20250222193242.14302-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of __i386__ and __x86_64__ with CONFIG_X86 to adhere to
kernel coding guideline, make the code more portable and integrates
better with the Kconfig system.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 02860d3ec..67a2f6044 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -229,7 +229,7 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		reg |= (VGA_CONFIGURATION_PLL | VGA_CONFIGURATION_MODE);
 		poke32(VGA_CONFIGURATION, reg);
 	} else {
-#if defined(__i386__) || defined(__x86_64__)
+#ifdef CONFIG_X86
 		/* set graphic mode via IO method */
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
-- 
2.48.1

