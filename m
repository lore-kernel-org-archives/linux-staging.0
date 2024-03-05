Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDC2256A;
	Thu,  7 Mar 2024 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709791313; cv=none; b=cNJEg5X4JzraruXz0UYsxixhP+puFsMHTpi6oo8sOL1OWF2+wAqz+PchQqptRfTFKUX1s2LhxIpIjHcS9fBqlVh+4Qc6j0xkSLsbTRXgdPov6YKl44vWiUIZ2pi1CVryXugQaVmNYsD47yanDDJg1+MBCAZtjoR/8qPM2IPbEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709791313; c=relaxed/simple;
	bh=enPm19HJs+stdcDacyhOgDCj10scd53rNSQJ1fkOAJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FhhwiZppyZerXm3/rMfCQCHCtaUKOSgzLGJk4YNgN9gC0EIuIjBjXNnWqTGIwQEFJ9c+sjevnv/dMQtKpModxLpiwMamwbFjqrt8MLSGCsosuNhS9qy5SUTewXvPza+dYc0GmeHQSSlQBx/JM9nuan+oInbhRTLpNVoufbmDlR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0JCDLJm; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0JCDLJm"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a449c5411e1so62633066b.1;
        Wed, 06 Mar 2024 22:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709791310; x=1710396110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScVjuiqvxSIzRkwqdTKzRY9uFBQDWxNR6UED97AOcTk=;
        b=G0JCDLJmtHw67O5JC1QEPIn4OwOmCC8Pi4ERJmtCCI4LVXXmned3xqcEUClatRAHN9
         z6Pwf2xZ2ZPfdQZNnu5zRlOUgre3EHuCp/hhAMY/ZYgY0zrhMDpFk04asjf2x9wp9FC/
         5E5+O8kaRm9xQbkKXsDdwaGdRY196FMZ1gMcPbMj4EGUXvKCpP3GjGz7YAZZRTefb7r1
         pkCoakuGFnKsYuvw+r0Ccb/rO0kxsd17hcCb3PujqmS7nhTb5ezQl9v/VO5n984ejuJj
         MtPJ8MMHFbbnC76AqC1Fzv+1k7FuSEqDHCAcmddSGxzLy84nrQrpv10o5UA6WdwEzdkW
         DpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709791310; x=1710396110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScVjuiqvxSIzRkwqdTKzRY9uFBQDWxNR6UED97AOcTk=;
        b=Wh3klbdVfaTXIR75JlakwVL1nQyOoCzawnZmycElHU30whsEbvBxvR9x/tteZ2JXMl
         WLyrLMmO2aGMAyZRvgmVU7swhTIcWnzqjrWLnIJFVXtm3lQz818crI5JKWvXVag3Jn5O
         ELzRnVmspm0OodzPrl1reH9VWDBTXBSmXqI77dwqPGB+S55KORFrH7JtTz7+u9L0GHAP
         6YyJ6l23EvDp0M2y/JLm+lu9GwyCiGECg38V0HamJU/cc4LCMGm+F7DaDcIa/b0T8NfC
         GY3P4P2iJ38IuMCJJ4tIZRDsr+LPKhvNeN1bAIXAcLqvDIzRfhAanqvxNsiwvAvjvJXZ
         jfqw==
X-Forwarded-Encrypted: i=1; AJvYcCWBR4PasQrWG/krB1Diwr/zs5E0nNJdGNu7HgiwgY/DgZM+bamLkaVRZgDjcdNt49rKZ+fIMdv3uh9jegIjCExXEPt/NeWI268qz3qMQ8VsQcHJb68wbBDEuNCOgB6UaxsuJ/SqzaKfuQ==
X-Gm-Message-State: AOJu0Yw+SPV12/XaZSqoPhPxOYbD7TvR2GLMCK9d/rVmIhnRkJVaagLR
	0wGIIxaAyXrS9cIFTEJEdEHup3GdoFGGCLB3L/YDle8EgAS/L4mm
X-Google-Smtp-Source: AGHT+IFKhoLcE2SASAWlHAGLqOAydstDH1HMQXFtJr/WzajxqeQQRLWBhmae/OwSjukBeJEEZ2Di1w==
X-Received: by 2002:a17:906:a2c7:b0:a45:b84f:7ad8 with SMTP id by7-20020a170906a2c700b00a45b84f7ad8mr2475317ejb.13.1709791310061;
        Wed, 06 Mar 2024 22:01:50 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709067d1600b00a3d2d81daafsm8003864ejo.172.2024.03.06.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:01:49 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] Staging: sm750fb: Rename sii164ResetChip
Date: Tue,  5 Mar 2024 22:17:26 +0000
Message-Id: <20240305221726.37275-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164ResetChip to sii164_reset_chip to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
-- 
2.25.1

