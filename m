Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFCE15C158
	for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750510911; cv=none; b=etOVcLfY3p9R0wCZIi6YAoFDEUvPKvXobgr/bkjfGtPqBAf++K20N+Yq6y/fF1zo4MhO2zanO11IGtd5M9e8aDWTle4vK6qi27Whr29CJyRinRo4tXzyOKD9VmW2YBqeNbqM5N8YwzOEwQd+nZRT3j+YYPh1W2iLHisoExwI3sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750510911; c=relaxed/simple;
	bh=UmuaVwVACEk8G368/vsvTByhNseq8/MmDXVCYyOC58Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G3c5DVQZQwQ2w09RLfl3gvyc4JrUVMWUW9/+UBpYCe+7U5Br0cVsPCfmuv2vmDVw697V1efr9ob46s/nxFWXlukBzQ9AwZLVPuA8E9+3EHzLihg1kQbGJWlYYxhMs/+/Gsqb6w7eNIa8uS3YqzIE5Zb/A53/DXPgKF22Em0r2NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c846JOqk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c846JOqk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237e6963f63so1834775ad.2
        for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510909; x=1751115709; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++Wr/hdHcpVIEXymOHZrBQsfIoJyvz7x05Ev90joOPw=;
        b=c846JOqkHeB2isOJLoX940gKDslYti3EeumkM6QORpxCi0Np8YdKcyMsQHDz+Kc4Lx
         Y3yh9aW4eqyhrWGN3BR9arNciBe0mlojq6+a2ES0NLKQVCt3mty6pnOQRKDtVNUxclyl
         1miBZHX+jzUCOItIp4wLqRxu9nqDKoV+qdq7WPs9NI/9uVMV2IUfc5IPU9QF2st4m4h1
         kcMv+TQEuVEkPdiBebNEBBU/v98k4hRhFH82yknVEs+4NAcOtYn+w7cefTSOj5wtBJW8
         zZp8kwv+9J6ETZUxpVeqDs4JTokJvKoBESMU5AB48W1PuelJiuFmbg4fa7Nt+ii/KTDO
         Rfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510909; x=1751115709;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++Wr/hdHcpVIEXymOHZrBQsfIoJyvz7x05Ev90joOPw=;
        b=DM1DKC077lSsJWXVzp3xsv9aG/AJLRnpiO0kX0ZfyrEHpO5oC9lgawKtnOHAwjGOqQ
         eevuvFD2ifZQArgZBpBr15JqZtS1Ug8m61XgVjccml1iNJeb1SyU/pbsoFiIzm8+YCK9
         6zqPmuPN0iR/r5Bs5P72NqDKYtx78kerhcegJZXFogYGrf3uAVasgGLB0x1EwcAtdGTW
         wzS2cJL+rUI1ObC1RaiYW0GpdcEluJ1jDJNvRCXh4f3S9NEJFgHixAqreEbfYA9C8Dtg
         whUyIQA6zjqXGIPd+K6RGjtX134QqHhll3hJXQyNr6tEdyFQaHGB4/w5u4Z+JjfKVLXU
         hkmw==
X-Forwarded-Encrypted: i=1; AJvYcCX0KBU4HJHnS7IZYkxtzywwspbQ0A8l++TyJnk+Jja+ULJAcQ7FGUIlwwnFfHQUa9aFczpJn3JsIe1JJ0bS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+04yIxj+CirDOtLVfjuRaICNFcux+DLSlpjsndNUhqOFe4Wij
	J01ambwreUL4cReaAMSQEnqkfQoT07T5K4qj4f+kZBG1wQY1gcveBiaTyuXKbwsj
X-Gm-Gg: ASbGncvubB1+Olv5ASjJrWgkbdNHIZd9oZ+4vBGJvl4e/PwegD9LEh91yVqpHF2RV6w
	2OrKQ6Yr+tPuBgzOHmfG/Rvat93AEyzarjMibBPoXcKhLQwpuHxIL3vJBcDKOCRwAk0m8HCONX+
	iV8bif4EdbBVoQ/iaRl5Gp7z5sCSBRJzi6Zl2GDveaohF5aT7igVhQMkWbfbuWYD4QMmTK4yDtK
	uA057dPtXKT4KqjZujvLsnMTOJAAMvSeiFi3nb24Zfm+qzcgj89e0TvSKiKTYIg1YQsQRkRS0go
	HION+NmYW0w/ifgnKPDWbjW71w5PLerSkzgJ2gRKzxSyxWw5wbA1d2gyvtuCUEvFy8z+JAez6Zn
	4chidROGygnzs9VlZVElo1xygcdjh0UjYPNNeZ0xdHRA6mGrVvg==
X-Google-Smtp-Source: AGHT+IHdzUQZnMVQWroq2Y86Ji+WHfkeOg/cc6RKLkTNOoQTQIJHGPYR88ZHTNwdnPBk+xf98vMmoA==
X-Received: by 2002:a17:902:bb8d:b0:235:ef67:b5a0 with SMTP id d9443c01a7336-237d9a71c36mr64793695ad.36.1750510908606;
        Sat, 21 Jun 2025 06:01:48 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8640ab9sm40575145ad.145.2025.06.21.06.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 06:01:48 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 21 Jun 2025 21:01:34 +0800
Subject: [PATCH v1 1/1] staging: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-bar-v1-1-5a3e7004462c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC2tVmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3aTEIl1Tc+MkiyQTg7QkCwMloMqCotS0zAqwKdFKZYYKhvqGSrG
 1tQDlMHRVXQAAAA==
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750510907; l=1991;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=UmuaVwVACEk8G368/vsvTByhNseq8/MmDXVCYyOC58Q=;
 b=tloAjt8E0c/tquzQidruBT8mvc3LN9b7bnhxWNqp4xkKJlVl9EYzEysGN/Uvis81F/ujTTdeQ
 zOz/hWwP9EZAPLr9Zyu/sCqna7coxuEGRIyqUBH260HD8bs/hHBrtOQ
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix two checkpatch.pl ERRORs:
- Use tab instead of space for indentation
- Move trailing statement to next line after if statement

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format

This cleanup improves code readability and follows Linux kernel coding standards.
---
 .../atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..044c7d3706f486ba7cae5941ac598044c831b6c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
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

