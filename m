Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377B313E2D
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760449355; cv=none; b=p127eSMivG2c7YjKgnUan8muGrn6GGCcZWaV4sJIsiOt2Hw9+HC+S3THYCn/sER8BzHyBkJSoTCmwR6/68Ehsve1/A2VLNPd/vz7BrONx0TpJ0MG85yLjZqafYHXTrfnLLLZW12c2ufSU778O6E2nLESNI3VgDlTbJtSYXhXyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760449355; c=relaxed/simple;
	bh=yOyz6IvWmi24PN0ZdlL2ETRoY7+x5Y4h3rMkLIMCeic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MGoDSrJB4tK4yMU4dvv83H1t+7qAQp004nu0hHsbBbf/sEIsz8cMxv47vASVeQiJYsowbUZFhe3nCY9DV7IAiAHX0tZUkhzm4U21yNWbEvmkqomBjhqaE/62lMrS97clNU/k9nZ0BnPayvsk6BEBkCklaiLjvP4dE3DzZUh/W78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3kPsIdo; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3kPsIdo"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8599c274188so640556685a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760449352; x=1761054152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j01C3ZF4H0h3fr2NXxsvLtO/yyM1N0PB3fovVaXYGQE=;
        b=D3kPsIdoF2bhTrKCb5UqAKfKIEkt6RN/iRwcO4z3HIPpOppgYkMvH9d4Z4vUxRL9PW
         N4+S/kCL/SwqBi5O73zqS8ns98H1QiztqJ7g0P5JOJGMovsAHiHzj4fdn5bQpWU+D6RK
         GYxvfY7AG9w/t8+dW8i/sGLjTs+YR3CJAo+RaoIE089ZUhi4hufw23hwrtnz0ZAH6W1/
         EwEKsZ4HLkgGj9US5959Na+4tOVr6sQ/w5agzNGZNIsqGcKWV4WYe/rbw+EjiZ8midkL
         Uwh54cIk57c0cIS7rdqdxgWYhXIqnPD8VxVKx+CFPAsoE8g1YdkBNukBV8GRbG5xNt3g
         KPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449352; x=1761054152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j01C3ZF4H0h3fr2NXxsvLtO/yyM1N0PB3fovVaXYGQE=;
        b=F1q/VvI1JDpy+LaFTI4xJDEWPBQWt9VrBlprm7dX+f0Oysxq+2tBdbZ60Yx02na1JT
         EMOVTdSIS7noIukMfVlYkbUVT5oTcfka8ZRSZ1WbY5IR4C+jJbXLzVnZmIlVmhdVFIP1
         PiPTD+nznvpTSpHC3YCTWVMXwaVnESytCvwSxYkitplq4lkevmviugP4sCgVAt6Hg08x
         4iFnv17Ez6SpbOEPA6WhyYkdN+x1nFOAt+kKnaP8xRNqK2zG6gHoXViNeiHjl6uoWmCu
         n1WWZ0F3k0sHfLntuAxSKgv4la4s61qLhH/yEVpvDKfz8bFcD/286R+b1RbYcVT4XWTk
         vrKQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKMfNtvU4eUFBcpZg+F7sXnMlIXrDBoKXBz63AKvNdqNXWpaCnjFH5eAGj95R6cM/kAdDeMnL9bUChUCI@lists.linux.dev
X-Gm-Message-State: AOJu0YwJcnL86Vge0h5oTfGBfmGNk8OgGXf2ianGt6oD6/EW2Ww1Hlge
	BisA/7BaJTEt9EpYpdTrT3GbVy+azd1P7/X8Wf9y88Vrg4aXW4gbsoIZ
X-Gm-Gg: ASbGnctp5DpQkFB6SPpc1DuK8PLtd1D+pTSFGpE6gJtdGpKKRLZtB6dtNr5pwtEoH9p
	bE7lxJQ3aamjM7FwroQ73uiBPlW3fyO9zOKzaJ6RenbcFRNbL1a2VSHkSToNdG8CFXDIzNiuQJ7
	e5ccAtE9K8ZFci+BSymMMQmmQG0XZgyKsTJBz6KgB75GCtk/q/A/HD+7xOuq964qznQbnAaEkaV
	IqbFSpwvm8/Ieat2MVGxx+BuiqSHq8jsgpn3WDaLgWCrWmSKXDC2EBbNElsJqyvdegREHT9hno8
	1SL+kXk5lLNKdFmsgP/4T3+7UkyhupQzJEAFT+PBdjE5ZfyvNRNeuE5m8uA2AST66EikoqWT6b0
	ZZinbRL4e75XY5Gu7ivQW6+Tp36HWV82BuAv3Jcxzw/2UcK+bUes5/tjggkYBeqJDYV9/3barar
	2lLJVHFUYy
X-Google-Smtp-Source: AGHT+IEwlgpPG3uvjmGvQT2i4/p6+LKOyxSTea/Iia58pq2hmmM8J3zLPgs3I36OerMcczFeKPK/uw==
X-Received: by 2002:a05:620a:c4d:b0:84b:97c2:4f27 with SMTP id af79cd13be357-883529b5d5cmr3367221385a.4.1760449352485;
        Tue, 14 Oct 2025 06:42:32 -0700 (PDT)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2272670sm1214768585a.42.2025.10.14.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:42:31 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	schopin@ubuntu.com,
	me@abhy.me,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
Date: Tue, 14 Oct 2025 13:41:48 +0000
Message-Id: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() does not guarantee NUL-termination and is deprecated for
NUL-terminated strings. Replace it with strscpy_pad(), which guarantees
NUL-termination and zero-pads the remaining bytes, matching the fixed-size
firmware tag semantics.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..deac8584841b 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&intf_load.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&backend_fw_info.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&backend_update.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.34.1

