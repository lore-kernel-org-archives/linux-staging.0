Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B223A564
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 00:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788656023; cv=none; b=bamoz79bBVjAGL1qhwdkdJchPcO6IUsRFQrPXBf6s0vpqE4dMp+cuKrQINdzoOOHJavzXIrzkIKu0umnWrgI6pdh639G36jq8kruvNZDrtol9YSW3uxc/UPavx5B++WisjExzGKqauDvH2vawVFsCU5iMY3ffQJHrgWYnM3wrHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788656023; c=relaxed/simple;
	bh=rBXUUvvkerHNhThNqGS5MYoS9ksLclnjJVKvR2FDQT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vxm72XfKFUHhOxYRY1XZgL3TTbNM6u6ZX4RpUMJD0SaHAvHmL3aVlx2Vms8gpt1adAGZbWuGNKh17zVXN7z46uc+zWdyXBaZlOE90IAMJ9dlPKKun7JdSDRhRRd3EKA95jW2T435w+rotPsKcna1vJIplLr6oZzjnM6Veq0fW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikbwpqJ2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikbwpqJ2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1902187a12.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 17:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788656021; x=1789260821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=ikbwpqJ2FfV9qnDFd5jqlqEed88LH6PdAxkK/GTw1mIs7Y+9ewP86WMEb3/8OdIBPa
         U4jmXZQXwK8eR7oPS+qlW29N2PhZvz8KonXhAkgtu9FzojR7ke3wGDBZtDFqM/6TiMat
         nwWuOs7NK7k5JzQRPn+b9JGWBiEn0QXWwQ44vRfJjKHMZhcsM4oyr/GDGVA+GVUuTCvU
         Vx3yv0KuTys3M5YpPdOlKdU+rJHYBVk8Ab0cpvrEHDbzRD8l4upE/UJqZnDQM1BHxY68
         C1NZ3yoXSjkBRyqJsb8mVxIhv+jkZhjvc6kN6/FstWw6+7gJqieUcBPBWD4BWX6IclLp
         h8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788656021; x=1789260821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=UMSSM8gBV9KH5pd9qJ1S7zcwsB+OUiPYDlqHPgVob3G8HTkXolQ7aceXBLPcq0mkV7
         0eWjCqMw/AY1pWlw8J+O94luWLXx4RzZu+pMuP5R/KLPV+X1fSGxwK4yMALp6sUdR50S
         RJigijGGBcawEbUUpCL/DjhMa0DIg63YzJmQO38uxrVaJNd7qw3GMx5vLvOLYEU6haXF
         rN1YqNytcVDZdOAr2vGmgW1u9WI4EmkqDKOkUTLkwm+czoC2jovL2EC7Ya/f1JnkplBX
         3GwXXxwvBgy3S7VX5oKKV1DjZiLCyQvuhXNAJ037F2weyPEVwCIr4HJCqJTLFC7dprgI
         h7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRkJpLRxfLkLRvA38WBL7B61RBsPt+XdU8sgyx9R0Yfjmsj98Oo1VSACOpX0GgOe9D8wVIzMteDgsW0Nxy@lists.linux.dev
X-Gm-Message-State: AFuF++nyfjjTzOi24FPccUIH6UOc+YBM503eArbOm520ernRXpiGIEAQ
	BsRs9l7YQtoMmNoSQKltIzV1O7Rd5MAQ5RxIGyatuqdnWlKsoR9ineZQ
X-Gm-Gg: AYBFou3t1pzq2zd4q+5KfOHh6gWi9jigAlH+culEQVo31qJKzHcnrKJWX05QfqyFTiK
	3BE7HKjTgPm0BJ5NgXG+YgFZSlpskUEE1B9rzlHHbWJZ2eaffJawVTDnvvp02a6Vz/VtSp6XLLP
	2Nb4R83WuY4YQobIj7Tdinwz7cX42jj+KDtiuLFpkJ9lQpqflUH/6vZMDjqBosyauPytu4LGhQf
	Y2BFQiwKe5YY6p0PLZP0cecLir44Quj8UMSiYEuABFSkZVLVeQNKznbzSYaC3I5NVP7oQwUHmS6
	RLEgOnWS/UDErD/C2YjJagVb6LPlkT3+j2okoVF/QohDD77MCj056ZSQulOo12Co0LdaizdjBca
	/tjdR5PkGt3+5rEhOey37IgwchOzigFT99cFVtbberRVi8ZsrZRVMCAbAoIg15IcX2CHeLhrSAB
	cuYTJf6D8G1UqThPhJGy/Zy+YmZHuAcMpHm0fMJB0+UPpqBMCBw3ewg7crcpRzGMa1
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr23964308637.27.1788656021393;
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
Received: from G15-5520 ([103.246.195.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm15261476c88.14.2026.09.05.17.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Sun,  6 Sep 2026 00:49:58 +0000
Message-ID: <20260906004958.26041-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers for the ACPI ID tables.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..588f2f90a884 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..b02fe0c915ab 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

