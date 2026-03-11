Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADB63C13EC
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219301; cv=none; b=ipWbjwIPW6XEYd1efi31/vwy5YBUgZUSGf3SPS2AVNslrlVmev70C1i9TT960I2VOz/9d4Ei/tCyU9ngWx/qme06MYOxsQywIXOZa4v6WY7dXNRWYT/lr/8FJXYG/jEFx4aQQljfiicecCqdOoEFUtO81VeOucMie/R7ISDEiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219301; c=relaxed/simple;
	bh=rjJdLlKEuej0RX2tfsJ3ch7JAAjsB8Axsa3M+SadHJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fcz5DiZXlWhS5ldVjUsNH5VcLRV8egfo7UTOydXR5ckQlfOYwEQxtoWBTwRf+I3t/c9R9AThSe+l+YAMKWbI3x16b3GdMsS4Uty9+F56faRwZD+8S5LynNDMldDGykI/5uHliyi8L1w8vnuPnMthiqRd9vzW/BFGNHd6tiHNQOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xfazy9Wy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xfazy9Wy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829759ca646so3836624b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773219295; x=1773824095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DRY4xaexHYmn5uiVwVpT5IF4eldjts7I75zF1CWyLU=;
        b=Xfazy9WyuHBuQ1/RoJvfyDx14ekiV1AnIp1ZtCF4IemAf+ulF09K5N0pVaNZx+Dh46
         UvaLyWhmSjY8j8EoyhGIBtVaHlzHubvcDg3RCf8scee+/2U64Tg4Be913TOFJ3AsrKgb
         bhzVdKc4PV5rsgpRjUWCgSpCbBu0hFSfrKqWcQP1RBTjR1DkHVRlq3fxKygPYEAJTwV0
         VUslk+0asV2bTtRvU0X8IS1bvVvaP/RYcEy+/lKpuqpyQhzLhobzqAISQm0HwhFKUTQr
         Y7G6IJGwaYXRHskG5IMsu8xOL534jhTL0jFt9+zymHAkY0IgKcvvEzAhBbVrd4q9bwiU
         3aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219295; x=1773824095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DRY4xaexHYmn5uiVwVpT5IF4eldjts7I75zF1CWyLU=;
        b=JPk9D8Zof0CLB5E2HEozMWP7sBG/e7SHI/wREWKHu9ZrHcxjE5K+8CuFj6PshHZ/pr
         huCR3BtyKVdk2w2hIHoCLs2UK67REhHKLMbfYpzP5TGlEuivUFuPRNHcepCN3FRZSSlY
         v4rkQfTqpKbeVWWIyyaYNMlOYdg/80OWez+X6erBEpUBzAqmiFZiMEGHNamTB13jCu03
         lQWpuENmVdt84qIpwC9uegqnvNjSCNS7CKgBGa7YL+ul23o3+NREqCIm9fXBTq0Jj8af
         H+MybysxjvjnsiV+u53KKZ0Rm5GHMKDk73BxIy5pXPhCHXtA4rfnofaxc5k1pc/MiA1J
         HeNA==
X-Forwarded-Encrypted: i=1; AJvYcCWEjH1NpRB/a2Nfmu1AzrGz5P5hKOGI8lWHFPWsMiUqEEBlP/YD44kdPqN/vOcaJXnZTgpOmFKfB1bO9m/5@lists.linux.dev
X-Gm-Message-State: AOJu0YxaoUN9SHiUdPaendZxqneBAbVMub6PVyMGG88dyNt1voX8dKJP
	kVqQDy+FwsKIeooLYF6c2LKaeDAz+6D4DQk5/NMS3I7IUlLzJ5SZumVV
X-Gm-Gg: ATEYQzyXaz5aetN/M/sNGuldc1jdfsrR148oUK0jEAt7D+e8+78X188Vh9x2Upuep9K
	dblHCc2aJLjny7wVPzumzA8mzPeyHPn5Fv/g+bTviYcgD7iduYPmoMH0UjxSveBAV9Ed2eV8QE4
	ygsyILEFPJlqbe+1xeft7bhGnTLFD2DQc6gVyuR0+BQ/9K3ED+AMEDGIiDs9T+5ntH2O679AIxM
	LW5avcBpkHyKDiV0QR8hqJYlHpKODQyttl80wIjWvpoP6QjQ4AW5xlBAFvH7j3gwGL2TRfFdmH6
	6hQ4OgrsFTxdtpaLhur3WArJGFRlnR70J5Fp1t4wAP5XRLKtRnEsxlItPanjuWy5G9l4f6vZntg
	MwujiNUXd7q0TYDdsGj6ynhAXF5RlT5d+Tljy8P4KQ9rHfTjuVmlGzvHg+jwdQ6dSpNXT+izsje
	RgmbKBKq0ai0OnqzZcS+742j272Yx0AuC66AVr6flDCQ==
X-Received: by 2002:a05:6a21:700d:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-398c6182de7mr1631877637.69.1773219295225;
        Wed, 11 Mar 2026 01:54:55 -0700 (PDT)
Received: from muhammed-shadab-H81M-WW.. ([123.253.236.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf204afsm1486475a12.10.2026.03.11.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:54:54 -0700 (PDT)
From: Muhammad Shadab Khan <shadabtg4@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Muhammad Shadab Khan <shadabtg4@gmail.com>
Subject: [PATCH] staging: media: atomisp: split long line in sh_css_sp.c
Date: Wed, 11 Mar 2026 14:13:18 +0530
Message-ID: <20260311084602.6088-1-shadabtg4@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split a long line exceeding 100 characters to comply with
Linux kernel coding style guidelines.

Signed-off-by: Muhammad Shadab Khan <shadabtg4@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..c38a7c69728b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -983,7 +983,9 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 						    IA_CSS_BUFFER_TYPE_DIS_STATISTICS);
 	}
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_METADATA, thread_id, &queue_id);
-	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id, mmgr_EXCEPTION, IA_CSS_BUFFER_TYPE_METADATA);
+	sh_css_copy_buffer_attr_to_spbuffer(&sh_css_sp_stage.frames.metadata_buf, queue_id,
+					    mmgr_EXCEPTION,
+					    IA_CSS_BUFFER_TYPE_METADATA);
 	if (err)
 		return err;
 
-- 
2.43.0

