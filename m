Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53074378D7B
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 02:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777428253; cv=none; b=frILRE+YIp/BE1cflk84qQZJu94bOkbkstT3Ffp6k3uUmvNqL65GRytNSvJ0E7pYk4tx0vZ8ehR6OLOQF86JyWcVj3iZEn+gJOXl0522s522VxwkXS3LFTAPe2eTfGyRF4085gmxZTYDNVum+aAVSr5Bd+75rPUF6CdwaCUYeAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777428253; c=relaxed/simple;
	bh=pNGEUxqIkLRneAEGdlVmHnoRx/bC4NAD7Q0cryc4cmw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=J//5fVWUhOLkEWmw2yB1e64dNutkdHjO0rVm7AGljbSB0hydimL0NxgISxMxA8ptnLljoXejbsP5fR+Nsfqc4Les5+nOCNxzKM9Y0agXMJJlUaX3uIfjCxZJxC2Q5YxTx0qH+YWA8/WqA/V3c2Xy8JSpIWl0wqHfimQ2fEUqNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5MTh2L6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5MTh2L6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35e576110adso288207a91.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 19:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777428252; x=1778033052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLFx8y717mpRNSW+VB91MFPyF4gRDJ4SBy20vx1VnSU=;
        b=U5MTh2L6R5TGKdEXkHbUKkB2JnHbY9VLIpjI8UDXTaFjMe5UTBV8VbpeCTYWluQtSD
         NTZXf6S0DtzlFNh3RgAFsbnUsibSbdg+5kZUdVZppsmPywp1ZVoAD5QOgCMJudu5EkGm
         04B6fwvgvLzMXMkgkp0PB0MTAgM4bDXMYM2lJX1uDmNM2FUaAgUjXYswpOohI9EX0pWY
         9fIvTOOS9IwIJ4wHPQpCvDZ/PEmTwIACI/yrob9HGQiFHt1tD0jkW4U/9NLtQWrCQDqJ
         0W0I7Lbv8qxvXarzLBjyDshMUkAcysi0zxmEMaKAkUVlUij7oZiia4t1dzdV4bf5jz8b
         /xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777428252; x=1778033052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLFx8y717mpRNSW+VB91MFPyF4gRDJ4SBy20vx1VnSU=;
        b=U4QmZ5S5TBoFF4uywu7ZBNa4tXiYYt06n304uDp8V9VKxMmLWloy///97FTOSAi3KY
         S8HSA76EkGmxkLdw2nEB5f62YL50Q4TVJ2CTU/xxc3Gf4NdwKj8rgVq+cO+7lrazJxIz
         7PMBMvgcBsYNnmDgBXcD1EA4B+57GqCx7sEZR0AUGt78nAvNP5gp3BV6b03GfPIIA0uJ
         fGfv3bjGTp27RhEpL4vtJ9K8T7ODrixno7qzP69xN6JCPQhHv93hkBY3uKxjGzXBTQvP
         8Pqp2P/FDwvYNf4xi5LsJa4YENuRhcPfVCLRT/7PfMs6Od+lPeZGg/oJWA1MF2NLhzcF
         jZng==
X-Forwarded-Encrypted: i=1; AFNElJ/qHv+9TwzF7EBU77WYOwKk7ca28bBNrmrpTEHPRXX/jUwqXlpklBNo1aId+RWcqqvKj9HPcEY5HvQD2oPx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5RXLO7lXI67j5nUF5yKdmsKqCoBrcnYbZxWAZomZgOSF2n/Mm
	K0eGeexzpdynWo9l8MdOiDF7is5vce4fAzwRN2xWFk22sKBwZ1N79KOK
X-Gm-Gg: AeBDievm6GkGB74b6JSl+YeRkDG1vTI/QB0+oTVYjQld0KVPUEVPLJveYS+G14gGj5w
	e7w15z0Xgl0mg1fqZNgFFnryGri3iKklQ8T9KirxqbTbGQ0Pj4W7KoFeEwtZy1X2T8IWfwxdyiw
	2PYr8jb8SdxC/Qtr0aiRSkZdKfu/LDfG/Sgd58VAygoe83pM9DisGpsj+Dyb7IaV/buGfYsz/zD
	04L7KZn4AJviUmfdl56ly8vKcUonQhXGR32HPJGAe00Azvc2bCoD8u2PyCnqy8Ry5XGYMjsKb/i
	VZKnL2ktwnX4+uDVriModQsOItCIZ/7khmG3Tn9a4gxU3ZvBo6tHMBPiJtE8jAqg1q4tq01UCeA
	2fic0177Tpzb7Mymf1tVhMulLithlNu1anAf8RM//DFhTfs3TyFPlGhRY/8Ix5zLbMkTYm1RsCj
	W6TobFoR+Ylf6rXvZ7GwfHihANtGc2DqUwz5Aod+8pSwF1DPZcriAlczDPPfm+3lY1RNPHnVYPB
	EivgFWhg13UC7hsP7/qSqK7FxA=
X-Received: by 2002:a17:90b:584b:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-364a2612c72mr963116a91.7.1777428251574;
        Tue, 28 Apr 2026 19:04:11 -0700 (PDT)
Received: from archlinux (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a119e0b4sm366943a91.5.2026.04.28.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:04:11 -0700 (PDT)
From: auth <skunkolee@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	auth <skunkolee@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
Date: Tue, 28 Apr 2026 20:03:31 -0600
Message-ID: <20260429020335.83143-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace misleading comment with description of the function's purpose. Also replace return ret with return 0 since ret is guaranteed to be zero at that point.

Signed-off-by: auth <skunkolee@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..5f3712d6b81f 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,7 +599,7 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
+/* Initialize OV2722 sensor */
 static int ov2722_startup(struct v4l2_subdev *sd)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -619,7 +619,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
-- 
2.54.0

