Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE092C234B
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213539; cv=none; b=nXYjDgDSphMN3dIcnCMulw/7i1XHVs/7HMTu6X/exO3z7LSZePPb4iO8xGKtaaMtFatCeolwp9EPYaAtPMhQHfwdv7DJBf5R0X8WBGsOyPJkPC0mF28zTmZouL87YHC0pUX9VbURxLfO7/OIHvgjqGw1RqFKInubBDuMSKTLvbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213539; c=relaxed/simple;
	bh=BCEOec4n6CnSdrjH6Beytmr8Zelj/J4sgZA/LLYgTlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oveF7aa0EYpJquxdTYM+HeMERH5b21PPQf5SHwF5xzkw1yhIbW2PAswFrjdS/lYG2BRYVhCvqUBFtS8jvxQO+8gzHqLJWCNhPlVZSrb2cdamcndeJ43OZxCWB6HLYyxhlMWmkVwgaodov1VM0fRIRoHuGpMEtRZcM6aqXicZTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klmivSAz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klmivSAz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso4181519a12.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213537; x=1768818337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfsvwBs0vj27nE+nU84x5+gWK2xF5JTsgNfOA8vgNzM=;
        b=klmivSAzdiWydSiFdGcwYLpA3qImwRBj9F6aWubCHLvQc1qYW2jKHCOA1Ni1R8k93l
         zNr7kao93Hiorrd9Yaf5kbrcON/wuU4HnYtRMSNv/M6SQpkEgoTTIwkOXVtnVpwheVef
         UxsVKrdq3ZeivyIVD/pAj5gl9v+QC/NyJU8YrqFChFV0LTejyQgWINEU3xSYhSqx1Y/e
         W3/Q+Wf0+eZGH1X5BHuGSiXZ73RUfqgFnss9q2oE4eJ4KS+BELXqIGqOodrtPvtAgzCs
         M3YPy9B5aDyQyVKSukDskgGpb74Pczs/a8V66xmPrpodEyfTRoBkwKhNAOtO3bP9cGr8
         Kkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213537; x=1768818337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfsvwBs0vj27nE+nU84x5+gWK2xF5JTsgNfOA8vgNzM=;
        b=VVvGjqsKPq//YfVJ8q7MqxFYDs1pj8J5LZGwHhvXPx9M7lUT3IaM8kwAZRe0NXl/sJ
         9z9aLshI4PEvCVx75gpp5vco7PyQSDnTekq9bnbn8D4x4oJRa6jZfN6JcnsD/RMjL/UX
         Cwv7z1JxqV/h5dqU9EikhX3pWkocboJ/m6rwQST7D2MJAhMuoU4TPikbdqL1cE91FXck
         Dr6Z9ELWIKtXwRQICbRV5dtmTK+iIXsNYjs6eBy7/F/j0WhdPAatqV6K07V/Mnax6KgP
         6b56SgkUcsMRP1Ucui+y9ywjN6XXIU5iH5XVm9CyZrvJYwQ8h+L0stEiI/wVqBrexXZn
         G2AA==
X-Forwarded-Encrypted: i=1; AJvYcCV2WKfaIFVe2slrYTnI7TpGVQ5eVkALl0XcDMtJh8v1KEQv/ADOYSL1o0FjgQb/ErAUtTk8GS07UvSVYLOb@lists.linux.dev
X-Gm-Message-State: AOJu0YxYUDp6nZa+OHI34tD/wpUkBjzIZT7wcw7GozbC1G6Q2iHzl13/
	1TFjRHGiq1fWFxVnIfQkGF+PEq1a9wsO6B3aN5GMphLGAXn/SQMqrHPJ
X-Gm-Gg: AY/fxX51ZuMuria4S5ybIKgQPD2bSTq7O9LfQyvAkNEMdSFLSY+KvLVhuXtqtvXR6Ho
	VwpaYuSAg+zE2SqP8YT85a337jfXdsyPjQVFw7tOO2Ni1c2av2xeu7rUS7u1Q/CzdFhUEBRr9bg
	KEMk81l4LlcQNR5Mnz2e1TYWTUd3OI1GsQ+hIgFTtSU5X2H9UhwdyRlpXT6Q2kpEDV1eXSNTiVX
	73zv9kWMv6U21EsGc1MeSFYAVDH1LXuhCVvXXdj1wK8wKTeVkkH3toQZrN7mKssRuwMGTeOrApx
	beO9/9L9PU4ftVqNLCeGRSjxeaElkX53RMQMqy5Skrkcg3fhZRv3YYpU0HrH4/CvwpE3pvfcMEa
	4tcbk0HkVwJiLDpU2c1MNTr8z9Z0lDrMCoVfPWOx4BRbXNxsjDE8YcK9gpLVFQrunZgzj6DpVIW
	EUFQ8z9U4Oh5syHpV3g3qRW6//Dq/eJg==
X-Google-Smtp-Source: AGHT+IEYLmmC/hIssXQxrxzG8iOIBPP2fHvyARgDQjvopeOP370d51Vu0DqlZYxtTRqHLoOKJjFvWQ==
X-Received: by 2002:a17:90b:1b03:b0:340:ff89:8b62 with SMTP id 98e67ed59e1d1-34f68cbe4c9mr16271428a91.21.1768213537490;
        Mon, 12 Jan 2026 02:25:37 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b9a1881sm5452431a91.13.2026.01.12.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:25:36 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>,
	Unix Antigravity <unix.antigravity@test.com>
Subject: [PATCH 1/4] staging: sm750fb: Convert sw_i2c_read_sda to return bool
Date: Mon, 12 Jan 2026 15:55:02 +0530
Message-ID: <20260112102502.19761-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sw_i2c_read_sda function currently returns unsigned char (1 or 0).

Standardize it to return bool (true or false) to match kernel standards.

Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2..9d48673d3 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -180,7 +180,7 @@ static void sw_i2c_sda(unsigned char value)
  *  Return Value:
  *      The SDA data bit sent by the Slave
  */
-static unsigned char sw_i2c_read_sda(void)
+static bool sw_i2c_read_sda(void)
 {
 	unsigned long gpio_dir;
 	unsigned long gpio_data;
@@ -196,9 +196,9 @@ static unsigned char sw_i2c_read_sda(void)
 	/* Now read the SDA line */
 	gpio_data = peek32(sw_i2c_data_gpio_data_reg);
 	if (gpio_data & (1 << sw_i2c_data_gpio))
-		return 1;
+		return true;
 	else
-		return 0;
+		return false;
 }
 
 /*
-- 
2.43.0

