Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B3C24167F
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819842; cv=none; b=O+7/iTzNP9X21vElwFW+v3YdnHNGhiXsixzsKmNbCI28kecAj7LD1DDgMQVBjKS4q9SKEO1oPrhmrT8bqHnqwZ0Kx4fAdeHgc0sGRth1WoAcXxWOzwWy2yU86Ero9AbWqFam2H7jKNUfuT3kefg7CU5ZbMVP6DSYLXN1KfuU8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819842; c=relaxed/simple;
	bh=R17NssXV/QU3clKpUta5dw8h6ucij/YPwFGrlZXm6N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yb8SPPNc06ea7yTK0ktsrcvmwviD4lPVJMzBULIMiVrTEKKMLREkwrjGml9wR0a+empfcaZkN/TVD9W4NulfLQkfmf4SDJwWRK5q6efCF9INLjuX29/du5Fz9PNlnZgTGLr+PlCMw1WVcHS159cjMBNiR5y3woa4ekWmnz7z5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZXqqeZp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZXqqeZp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7398d65476eso5125585b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747819840; x=1748424640; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=DZXqqeZpcuRNdFGGTEgaosTYGT4HWl9WJ5PQ29PwH8nQ4/gi7jZXIw+yCiJ4uQk4BZ
         Y3x/sYEzZKMqq8Ii7SRdbPfuFLLglyEfz/SCrDrHd+nNuweXPBFX2r8/i9RE1K4g4onT
         qzUeul/W1JR1YRMRmFyIVhOkftkIx0jMO7EqHAytJet6UPFzxbBmIO8VMDshSNkMmF7I
         ZBfEklzJy3uIu/KquLWDWGBBoJswEiY08y7p+PgQ3kjEqj85oigfnV5dc8l6tXjbXmfp
         Bfe1zE5ZleRAWqjr96OQAJbeLb9PYgi9FWJQ6xo2HVI073NByoUHs/J6OKHgM9fB9mOn
         VoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819840; x=1748424640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=c9QPmfHoztVj/bGZN9GTt178ae9b7H+limhvDIJWKMoYfFqK7taB4nuoWN+Ygqnh9F
         ZqkgXfYY10mBvP5SoKU0V677V4mAWATtQTzQFb3Nrkz0nWE6S/W7nAe8zCUaaD3EWqgV
         ElNeGh6O/u0zh7PX05YQSjPw5afj/H3LX+6T9L5WuuVf6V5ZvxPxIWTqxybjc3jQvfDJ
         16dBNA7jyaFMdetLjEUGA2h1tm1hUMKp4T4AGTDX86FF07XgoX3CRwrapLI6oTLmepgV
         1NXxy953fpTk2C8g+MriJr+Bf9KISVHo+OZDz2n4UTRScbzWT0dGqKKy66GD+ZuO0+zu
         fj7w==
X-Forwarded-Encrypted: i=1; AJvYcCUv0XOY1QNhJwY+sAPmhyKrB2oaNtjrceqQhS+vFqbFlXlJsue+W8ISneIyRhgrEFhY3+TmlNgntMHZJeC/@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpq+8A7MJB0TAc15hRvtfL7Djp5XBGY9nXU71WiecFl4mooz1e
	nLwwoJLIMosYMsKok29aYAqoWfeYTVYqTaaBjbjveerjrSH9S/SwJKJX
X-Gm-Gg: ASbGncsuC/Sri35LN1SU90Padry8Mb5vCkN9aSEXRajMZLhqY3R/6rjpKVqFY11k5t2
	xvKCWm2jwzZlnis8a8L+x5nFkQwIhYc97OdA7wZW934nhKR1IgePtekihT+mUq9++44v+8vPiSR
	mIWsHmwOF+7P5KyDxzd0h2OwpNg46IgluvvwWdyQKSOlNPXtWaFLVIuLYDNSpRoHglQfxAOU0ub
	3/dOjEPXThRApgvbXSSNvl4HrMhAxm404lbl1InOkKJi7TjpaW61r1DCuY/piA3tgqzeHtjFser
	clBpcz6sS9FYJpoF/vHA3At9n8sansE9kNfXoWbWQEJ5gGlmQvjDfdpye0VDa/AeQRZfsw==
X-Google-Smtp-Source: AGHT+IHUyx+vlWYq4hohag+qL5ddwEkbL8Ga94LR9t3ebzdNx3dQ1c7jzeXIFn1QLgkVEwlx47k1mw==
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr25752923b3a.2.1747819839565;
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Received: from brak3r-Ubuntu ([2401:4900:91d2:7413:9e7e:c313:d5f8:b22b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877030sm9516405b3a.148.2025.05.21.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Date: Wed, 21 May 2025 15:00:35 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
Message-ID: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----------------------------------------------------------
This is the new Patch for the earlier Patch hence made V1. 

[Note: there will be no significant changes.]
----------------------------------------------------------

Changes: 

To ensuring that the firmware tag is properly null-terminated. When copying firmware tag strings to prevent buffer overflows and ensure data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
-- 
2.43.0

