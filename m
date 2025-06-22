Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1A78F34
	for <linux-staging@lists.linux.dev>; Sun, 22 Jun 2025 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750563772; cv=none; b=TPEnMzCSBSqgfo+7fLvb1EQiXFnhSCaLKK1TcApo5so1vuvuB60oCneX2xBoQwV4sVvtKRoiAAX8+/sHLk6749I8Lrcr9NDR+AuoL0EDCnGFJeZ0rRdh01x70o57HeR3/dmLr85iTmwJOCpJEOnwTYcgLB1yoVlJQ63pErfg14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750563772; c=relaxed/simple;
	bh=3LjE801mRj78RJWJDrIvDPdML4nIV3zCJzVY+sv4Wuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=irs9CjUAun+JHbSMVpwa4zJciu8XK90Rz0tRSGaDiwU7D+eNCejOFh/yhrqohLUPk+EuT2FsDN/WwdeXEqTudNrq3xA0TD7CcGi/nciyQ4uVLVhIXL3+Fe9QacDAN0Zvjl1aEfJQ7EozxkQUX3Ka55vDT7cvp5ovZ2G6d8dncvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fog+M8ZM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fog+M8ZM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso40828525ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750563769; x=1751168569; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUhqmKLTOnc3oh3BthyzyWc2QzYwhIjxAnoQpkwuDh0=;
        b=Fog+M8ZM9IWVgSUGvUEv4kb0FR8JAhookKop67sK8S7GcXQ9ScJoTC3s5y1nIUUiKv
         uBRCEFYdwcVaif5PufTxLRFqfA/2gxG2IIV8/XpYSRGGG0MC5X9nGGdILx6Avzpo2ynD
         O1SedZ+FnuQSJARldqxLNqphkB1V8SZEWBrUlq+2/f+uIZdfO+AqHcFmINfp7HNxE9nh
         uNnAs15wMiQo8I2eDPD0v/Ny4NRqHFOm6rn6eJFetAzI3+VedBguihajspxF6N9tdEFt
         6Z/AQA1IhpcyVbzdfRh6tOPnDO9VZqVsK0NtT9Y3zVpT+f0DgqREPfnV38lRkTcvX+q7
         9BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750563769; x=1751168569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUhqmKLTOnc3oh3BthyzyWc2QzYwhIjxAnoQpkwuDh0=;
        b=crjD/qf3Rddt/8kLBAVk4ReUBGWEE1T2Auz7TH9Law7S7djpMXEyhaSxJ26FIexsIj
         nnIFrQTRkLx1MUoKEucwUqVdW3NFoxhriCztb6iP9DYXTM7HM5h42agAahHYFkFJV0AL
         xKli642Xhr4fRIoUDAq8W4TFTEdW4q337LRcKxs2upDUiF1HEZ8AhRERt5gCNSjdnRR/
         yzIO+GZtTkDGExrVj4AAtiEeqAKBoB9vIBhNRg9aAGmnVMkqNTu6s4ept0kxTuX/Cdju
         EMY3wwLHQIRCz+Q0yV81A4lVi3aaQndB3ZDLGAw1o6DyeMaRWDGJLjfQBOfAsruQpJy2
         51fA==
X-Forwarded-Encrypted: i=1; AJvYcCWmcP5DH4r6MZZOdnAdV+Ht5Bs6nTJ4D2oD9W9ShmftigoMGbzWQc60syFSncM+lPt5uFPtbztFYMP2aqp1@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd8WeV+19W1I4tF5UPxcMpnluzio0pWt0aLVaJZZBX/zOzdki4
	2DCrNhZLqz+RIJRpIW0d78xP6jfixvZDGU2r8YBb8t0j3aH4JhtNwSsc
X-Gm-Gg: ASbGncv/96N6wfM1UmtmGbLXwFCG1QMUm6aHdDl3F98msOans4PSQXEdx+Q+cN/ibQE
	pVzxKqM+qA321Oo3udrGVQu9xDgnyh2CDl5xZk8V8ZJW/X7GnrD76D7nsFxySNJO4AG3FXEaOdT
	7Gn9zBW2MxGLvs7yaHK2Exb3DIz4E2yVSoIf3FEXikjy9ytlYaBN9owfJVC9UXhVqXCiQextAJK
	OinUjqUEF7k88WG60F2EcbPOY67cOBS6MFGAN76RxDmATB0eUNNsl3YdcOBI9JTfRrnpUNXsh6d
	tPI2G/5hOAh4iJK1u+81DW9ONwMWC6PLsGj4fQe+EJbhuRYuT5/CyzR/5mlx1s6KK3Lcm22hSRu
	WR5ySPHL/G8Aq3PRl5JvVPXmLR6y5MscZ8T5OiM4OpJHy+8dqoQ==
X-Google-Smtp-Source: AGHT+IHTdgSE4SBzwLy/M2GSba4+YuxiCFZJDaI1tx98HQ3ewLX2HhxNyL81uwei6qLUpOCQtvyW4w==
X-Received: by 2002:a17:902:f645:b0:236:6fbb:a5f3 with SMTP id d9443c01a7336-237d9a3fa8bmr128954155ad.40.1750563769288;
        Sat, 21 Jun 2025 20:42:49 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8753900sm51467165ad.253.2025.06.21.20.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:42:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sun, 22 Jun 2025 11:42:25 +0800
Subject: [PATCH v3] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKB7V2gC/23MQQ7CIBCF4as0sxYDlEJ15T2MC8BpO4ktDRiia
 Xp3aVeauPwn870FEkbCBOdqgYiZEoWpRH2owA926pHRvTRILhuupWDORtaY2rVO8c61HMrnHLG
 j175yvZUeKD1DfO+jWWzXX58FE6yxNRrOldLSX/rR0uPowwibz/KPkcUo1L7zxpy0UN9mXdcPY
 SfqGMoAAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750563768; l=2932;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3LjE801mRj78RJWJDrIvDPdML4nIV3zCJzVY+sv4Wuc=;
 b=m4F5K0BM3M7HijaPnofVrKrPD6OSzQ/Pn31CfNCSwRSPo8QoBxE55HVoy7HKW5Hrtftoj0E7A
 ozHQutCYpLJAfNwoOrDqXa83eZG88YRR8LEpc/8Bwa6SE34z5xzHGtO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix multiple checkpatch.pl ERRORs and coding style issues:

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive space between type and asterisk in function
  arguments

This cleanup improves code readability and follows Linux kernel
coding standards.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive spaces between type and asterisk in function parameters

This cleanup improves code readability and follows Linux kernel coding standards.
---
Changes in v3:
- Removed extra spaces between type and asterisk (e.g., `*to`) in function
  declarations, as pointed out by Andy Shevchenko
- Update commit message to reflect all the coding style fixes
- Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com

Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
---
 .../atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..2af83d51b5b3a6ad2edf9b835a342455e7536f6c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -73,8 +73,8 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+int ia_css_output1_config(struct sh_css_isp_output_isp_config *to,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -127,7 +127,8 @@ ia_css_output_dump(
     const struct sh_css_isp_output_params *output,
     unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

