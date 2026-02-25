Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F3314A9D
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772055001; cv=none; b=KpMIpK4ZxWQY1LZLZwD5vae7fNlu4tgqRepxRZbR4YN42VS/o5Lh6mPu3XcmtC1Dl3xRjxc5qzJZXc4v3MMCXBqCpA5IwoDL0cg0J7cV/OrR5m2PmTzmrC9hTP0G3ldWoUCtpwbXOb10FxxPR6/2HukMq2n3DebyItjb9FYOsGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772055001; c=relaxed/simple;
	bh=mCLPrGOtRUwtqUXdKMvvjI+qHjopx10aB2jzC/sdhn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kR86OJT/iIVAFXJDFLS82yylC63n8aoUmBUBHZJuNG1b4DvB05XY4JQ+/qRZvwNbX9Lv/sM+rcW3l9rquh3iZFmci9ZV/54tiNU1U5mFGbFaD1uFZTbGuqEESqbBsQwpZzK4uEeY3Hlh/a3yknwneDkntlZqyax1+X3Rf4VxO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5lm8snj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5lm8snj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43992e14638so164329f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772054997; x=1772659797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vL2gQfXBf12veR/aTVeOj+fmUJCvNz6gPc20+jAbMl0=;
        b=i5lm8snjkgQlVLm0zjfdxNKet8vQldF1PMprTJ27n4JAnUwDFzbRaiYxxq7a0orgQU
         ZHDmoAvAgpfcOQr+hXLYCrHZtAWKQ83bUmfHuxzqQqIpATVEA6ujwjCtFjzQoHP+BW7+
         8/bU12PS4bWeJKAg47he2lMKVlZj+l6FLaw/2S9ZuIXrz6fX3TrX6gj4c9P2/6CkLuwK
         uWUNRfC19irKA7xddSKNmNY/nQ0WnT3Uk5WWFDtmp6bdjRKdLdufDak6tSixqkHshaoO
         RIud0FAq99s/9ckmdMl4yvcGp/UxkPDfAewNwRWNtFRf+9nDmZmhW1KM8kC9o2Qz298C
         tCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772054997; x=1772659797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL2gQfXBf12veR/aTVeOj+fmUJCvNz6gPc20+jAbMl0=;
        b=Ur8ekjE5uarHveZ3Q8GqjeS0W/R5RMatrGHd6gmSAN4RT7niveEYL5kL7IXFfGGuTy
         lrAObUIc8BAKtn0NTWo2nRzn09POTzKd8hvaCXlP2dqVCfjqr4+xmI1jR4mAWrRf4aLM
         Iq+ou3S6VYlCX6eHPNO5BZRx66xlLXG23P+BXIM8ang0NLH2UHilkifBVCGLaoZa9544
         boAy4IjB09mqqmuzx+tFIelaQWJvLPoQx5L9RHwfdqzDMo8dG1gzMqVTbst6w5XJ3gpX
         xrEubZtLlpnxnVGPU6rBronvP7R4mAAIyskRjvHkwHkgUYVY73h6Zga0+lZQrquu10Ho
         2UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8RVCIre0jt86K6fe6C56IBkS5accj0G8FtUT4O296OdklLsSDX8s2MdWmGhTx+m80jq5bPAqPavSPUspx@lists.linux.dev
X-Gm-Message-State: AOJu0YzscxhRfLL5zCSV8KYsrQiX9JBoBuB0c0E3eumM21CJN2vfHuIH
	6kBPLorAyoOqXNrLqq/wwLRQxDx2N23/VTOhG4ZeJ8BbptEzAvwELgzC
X-Gm-Gg: ATEYQzyU8jrAx7kItTXjzqeDPxxkYGSSyuyXZmEYg8hx6Xs+YCDzbGqj6yiKTU37WFx
	IqCnkLViimHjaQZOuLIQdBwnGYez8v/YzZNrJIFV947tXY9+iCxG5ovtkzD0hvgcwH5aImRFuTR
	PUJtEoSr55E/4qwPJk1BYYywC0sAnrXzJ6w+EAbdBhk4zaIbLbq+sa0dOjLEzy2hVE//jn8SUCE
	sfysJe+ud/utOoovBgSWoYsZLJoCwgi8k5rkzcZkEHEiCmoAiDd0aOv3sML3gWGj7DMHycJxzxz
	1Gh/ynxSnHeAEH2T12rXZrVYGGLfkaS23dkxiAEqlGNWllO5OPV9sRmEwz7lQG0MDD4p5kWa/nw
	XZc1V03B9PuVJ6akIUVMlRVigQ74kivaUMh9TjsF4PZqFFSqvTqlxQ/MPDfleDf0FjFeTpUZz2A
	==
X-Received: by 2002:a5d:5d84:0:b0:437:7177:8f04 with SMTP id ffacd0b85a97d-4396f15b248mr34788029f8f.14.1772054997083;
        Wed, 25 Feb 2026 13:29:57 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43995056115sm2452561f8f.14.2026.02.25.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 13:29:56 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: [PATCH] staging: greybus: arche: use sysfs_emit() instead of sprintf()
Date: Wed, 25 Feb 2026 21:29:55 +0000
Message-ID: <20260225212955.57102-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
callbacks in arche-platform.c and arche-apb-ctrl.c.

sysfs_emit() is preferred over sprintf() in sysfs show functions
because it is aware of the PAGE_SIZE buffer limit, preventing
potential buffer overflows. This addresses checkpatch warnings
about the use of sprintf() in sysfs show callbacks.

Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 10 +++++-----
 drivers/staging/greybus/arche-platform.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 33f26a65f..19a6e59b6 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -300,16 +300,16 @@ static ssize_t state_show(struct device *dev,
 
 	switch (apb->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off%s\n",
+		return sysfs_emit(buf, "off%s\n",
 				apb->init_disabled ? ",disabled" : "");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index f669a7e2e..de5de59ea 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
-- 
2.43.0

