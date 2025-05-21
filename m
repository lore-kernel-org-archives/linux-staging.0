Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38125F972
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824172; cv=none; b=AttUA74loxZickd8+EtLbCNNPN5J+9/TOyaxjN2sXWAdeRtbdAtZkg/KYEJzTJVawNyLCCTT1I5YDXewTTilC/0YjxTfq2Z74/+hTple6MW76dtb5dscXrAB/9emDgh5bXuh8XR+PHwfz7bl7N/Xuv1xczqV6X0tQIFqSu3W4WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824172; c=relaxed/simple;
	bh=wGyIUm+P3GZiMLXsE/m58bNrfKOx2BMNS++wJhUhIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4ezSSdbvVY/fKtqk2tKJjwdImUYbhIn7mvn2lbkPphKJSigElJeAQP5awaLhyyRL8r2GhwgXZjtOVl9jbVQpITHZCPrcrIrpZDuf0tkUKAEmF89tfk0CSIjtbyyUurXVNFtvjV0CuCYnKXrtt5K1fS7TdxbTfGQlPP0ts4/ieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv7+iqdL; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv7+iqdL"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70b50e0566fso62139337b3.0
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824170; x=1748428970; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=hv7+iqdLBwOR4EBH/Q54JyaHQUU4ctoXU7ggIAp+Uu4WWhBMasmAebDnjzeMRKrdZf
         VY3ozA3OdwTzMkhS1WEpsptd+bmxHvqBU4XZVlAdPzHjFnWgRQKcBUyB49KtYSq0iY2L
         mWoJXYTuqjT6LeY5y53jQQniPgjnTyYK4N2w8cwWKlaX6aUexI39RViJbHKVL/CIBEWp
         P3Qooq6vZD19xS9yyAwhjxNIPtDzEUjKhezQc6WsWcFXG7mt2U0X26UktD5dJAlMn3tX
         9P3HdCvEDxl07C2CHC87wIu2m+FI3mRm3df2qNYaakvNBZDmSyTyegF4zMIM8h9662bv
         CH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824170; x=1748428970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=nCpvgy22DJF7QJaHGvG2hyqFXFY8eaZRa9fDQbzSCWxob44yyYGevMVmMaVor3YzBK
         aFLYbW98vXmxC5yAQSxgLcSh+Zy6ogwxUPGPmWT9wXAam0r0dcv3nH2wsYITwa7gugM3
         vDnryFSJTFYo6o3jgJnc5nb4iuGxhXXcCszYvYjw8vAmB8qtzfUrqDFdOvZj+pVg4nB2
         esHVZSA+lgQlgHoj9LBWqZCeyDMMHnNuFnCsyhjoNoIkScNHKFUUAXM/zJ1aVKRuiTLA
         Ifa2p/fQk0HOJejrWEkjCK2IGbaKzok55PNiCcKtCMbcZLBwY4oVXKPzl5phaR/98NlX
         4wQg==
X-Forwarded-Encrypted: i=1; AJvYcCWtY8byt1unCIPY4bOz4cLdKBrjMb7SxNrbr01icVe3BG+KJ9E7BzPWz2iaokTSbH4MABqGF9HRaw8FtrnR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4h8111Aa8oSX2T1JvzesLksjKFqjYUr3faclwNTju7doRPuqQ
	EtiT0g9G2rXMOKRPm34Oop+YgoTyWsuxD1/0P+6bsrR41ofS8W3WXPEy6IGDMYmn1QDEYGunK9V
	E90VKEhkjRUcZY2BsMgJKAAES4jb5Bq4=
X-Gm-Gg: ASbGncthLyZL+YTcq5hEsLURwVY8nERObQkCXlUXKAExreCKrJoqsTvr8V1Lh6tP1UN
	bpJC8hTPnpizcIig9QY2efB/g2MsXBGEHYkX/pmtZj51+Eg3eGQYBM4KZWc27WtiqkAQDz8cart
	sfCYtndMzgFDUQ50dbTvreIHZz8B57DIHnwdH/jVm/FE2twSaD2IvsT6+RugSbA5CZcH4=
X-Google-Smtp-Source: AGHT+IGCEa6kyM+UnftuFUzah/9Z4wSrRBAisibwNFh6VGxUeQAiBYOU1NwOn7d/SKAB67K4LUagn1THRgns4aXCGHE=
X-Received: by 2002:a05:690c:4b8a:b0:703:b278:db3b with SMTP id
 00721157ae682-70cab0b8d50mr279505107b3.30.1747824169667; Wed, 21 May 2025
 03:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
In-Reply-To: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 16:12:38 +0530
X-Gm-Features: AX0GCFupvQaAcKzkZjV_NSmznrI_u7c1AU4u8-h7t66D4WJTaKE4h_CycWF4fN8
Message-ID: <CAG+54DYR0CyAKWcgU=mV9ooeyGVrouxrKOv7kzCKTYaf3+9Yyw@mail.gmail.com>
Subject: Fwd: [PATCH V1] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is the new Patch for the earlier Patch hence made V1.

[Note: there will be no significant changes.]

Changes:

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
        intf_load.major = 0;
        intf_load.minor = 0;

-       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
        /* Get Backend Firmware Version */
        printf("Getting Backend Firmware Version\n");

-       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
        /* Try Backend Firmware Update over Unipro */
        printf("Updating Backend Firmware\n");

-       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_update:
--
2.43.0




Addressed the "The canonical patch format" .

thank you,
regards,
Rujra Bhatt
