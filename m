Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014763DBD4F
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900917; cv=none; b=TnLqlxtdS343wkV0wgcV39k7URnYI2ClLXRvTwj0gq6gAoXJcJwOdKLGhx7V1P8IxdXhJY7P6FkmYl4zjn/DjecDcY3CNeU3kJxqX17KkOfwthNHDYubTdvZegf0CWDXmgPyJOLTF8MnSRDj7VbD+Cx2B5waLkghipmrqaiSRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900917; c=relaxed/simple;
	bh=r9eQVf4VASyFYaE/ZIlyDRbmFOv6clE/O8XKlS0U8ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u4ttZisKRceDbyxEOPJeG6CQ/2SqzjajMnG2vxuNRQ7Xaptq/Sg/hjulhXYIj5xH+uH4mzy+h9NpXmeT6XFSWAIvewQN3wdLj5jkYb2WMjnyp7q6vGDCl5AIzl0swL1DPWbNFqwLwC6zy0hZ2jVxvxsQEST1YyxXrWXoCp5Jxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ld/tr2D7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld/tr2D7"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38ec6e3de84so3921741fa.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777900914; x=1778505714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzTvXmtIHVqLoOxlkNflVv2HMvkwESIZVj/UhIYYlUU=;
        b=ld/tr2D7zRiZoadJZHF5tU0BMDla3x0LUkljktieBebJtll/nrRL+cMwVnB3qZ7+4n
         9hZWjIYErDarzrAyzBZUk7hyDHoECRc6NMhg+5AiyEC1icsE6WSJuT9ewrb//gFXDvT2
         Kn/Ia945qFCn4VGb+NbOjJOwF0agOxjV+jd8jrjM+SubXw5tjeXQ/Q1At/U8L3KqKZq+
         HWmROljrZCDUvKFxkmcvnAdHwyFVn52V5BrJpaqNMUCz+t9y8xP+RL/NTvSchshU3WRn
         /fOvKOB/pI5s6mayCtZ7CiZAFG6bax/TEi7a9aK38gDtq9twx5ven6ow7zAqqfrTgLU0
         YSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900914; x=1778505714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzTvXmtIHVqLoOxlkNflVv2HMvkwESIZVj/UhIYYlUU=;
        b=BZrfv0eM9Bc0SFn+2Awe977BtkZL6eLm9AGYkuDbLWqOi83Et8v9eSuyxU1GwqmRP3
         /OvwdN9nofChMJee2+QN13FTVc4/mVBEOmbigUgpIqm10bX9vNHQoPV4p/pvxHLtOqUK
         N5CSAsnmev42YGwNzlh1WRdXyVIavMRPgO0KuJFB8JcwlNX2k5uUyuQsDOCoHNq3MLow
         N1xAuzGcyJBzl6+rXETfamrhhQh4udBBE2mzVEM1fQwcPW/ctN1puNeaU1V36AGAZhVj
         YkQMG+kiReVEaFITHQ9vw+hg74K4D0vonAQ6WXpSYsQ5jaKCuyEcMQAR6SVV2uCSinq7
         3urQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KjpXxtMxPwa8tA0WMbsmE2UXDwzHvIIXTT8P+cWEOY6UjXCHTXeMhjfCmE+al7XqUCX5pa37Ivo213LNl@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2rSOKuIruWA+tPO2lmx7QnPvNFS/rS9vt4rGLwtlmLlDepnVq
	XHCG/Bcr+9gTm0uAsKtTB63VQnVhekdt13auyVP2TCtuzP1PD4pr2w08
X-Gm-Gg: AeBDietkeraFBoF+urXLJC8Xew7JjPah7Ngl4l1qESQch29XSg3Jv7y6iy3Er4ZTQjj
	siBMoMNLC57EfDh6N4aTYtAOXx4XC/pkUJCg/cCmctXARIWbGrM5U0rtHIUVqjRqOSgzgo0GD1+
	1w1orNVvHPBDUqm2bchjYsCpEx/DYFoMXEGnppa7uM7NbU8eEMTWw4eGqRtOi4n7kCQxa5t5vjO
	W2o8eRLFZ5gY7GHR0sIMw8U7Zst9xE5YdMYZsEVJK0+Rf2Wna3SBEGrnT1fGevbPbH6gfaeU1i9
	QRLQ6C9XZz/Yy5RQf9p/O+Hb3qKcFQjCxnbT/k8pADMvByrJDEGkFGTMSMReAb6bqJbuQ78PG/A
	jVZYE++a4aTQiaCv9YiTeGUdvSKzNQD8Y930eRwMgDNkEtTXKQFvgoy/pInNxikM+/mg+Ag2KrL
	9AuO0FMqK6nt5HcKmBE4xDiX0Cuzi+v9tfVHK2x+jvtxClMUzYR/Bl9g==
X-Received: by 2002:a05:651c:505:b0:393:a31a:ab30 with SMTP id 38308e7fff4ca-393a31ac91cmr4741351fa.0.1777900913930;
        Mon, 04 May 2026 06:21:53 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.95])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba631sm31780481fa.12.2026.05.04.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:21:53 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	aadarshmandal9354@gmail.com,
	luka.gejak@linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: media: av7110: remove dead av7110_reset_arm()
Date: Mon,  4 May 2026 17:21:05 +0500
Message-Id: <20260504122105.1428-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The av7110_reset_arm() function in av7110_hw.c is wrapped in an
"#if 0 / #endif" block and therefore not compiled into the driver.
The function name is not referenced from anywhere else in the
av7110 driver tree:

  $ git grep -n av7110_reset_arm drivers/staging/media/av7110/
  (no results after this change)

The actual ARM boot path is implemented by av7110_bootarm(), so the
disabled av7110_reset_arm() is leftover code with no remaining
purpose. Drop it; "#if 0" blocks are dead code and should be
removed rather than kept around (see coding-style.rst, section 21,
"Conditional Compilation").

The "/* av7110 ARM core boot stuff */" section comment is kept,
since it still applies to the helpers that follow (waitdebi(),
load_dram(), av7110_bootarm()).

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/staging/media/av7110/av7110_hw.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 49ce29577..3cd0988db 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -96,27 +96,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, int addr, unsigned int co
 }
 
 /* av7110 ARM core boot stuff */
-#if 0
-void av7110_reset_arm(struct av7110 *av7110)
-{
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTLO);
-
-	/* Disable DEBI and GPIO irq */
-	SAA7146_IER_DISABLE(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);
-	msleep(30);	/* the firmware needs some time to initialize */
-
-	ARM_ResetMailBox(av7110);
-
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_IER_ENABLE(av7110->dev, MASK_03);
-
-	av7110->arm_ready = 1;
-	dprintk(1, "reset ARM\n");
-}
-#endif  /*  0  */
 
 static int waitdebi(struct av7110 *av7110, int adr, int state)
 {
-- 
2.33.0.windows.2

