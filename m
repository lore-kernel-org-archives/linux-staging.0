Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8234481C4
	for <linux-staging@lists.linux.dev>; Sat, 17 May 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747453304; cv=none; b=FLj2YOan6nGLzGS1NvBiEaOfvmVfXe2Oy4+WaHtFOcdy721fZLLaIFLBqM5tmxuf4ehEzXmWxv00cQfXuHKQlnJYwvOXcCPXcIS5xfQ84uDvjLHTwZ+ExZpKPHEAOD3padDT8OSJttuOs0xppJPW3R88wWRwbfPp5MqhbYmeQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747453304; c=relaxed/simple;
	bh=nCO3xwkNEaNbjPd4tLMwqNXOHIBtcCufIA8YxkdNPyc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nJYoc7lIrwP5COKldrsZHOYN2qwol7Z2jmXK5VEKcOilrkvbVk7oOKt1A+aY/JDm5yMkdv6Vm9ij3cFgbJD+pE0ZAS92Q/C8oZW8PaC2LnbPog6aIyJ5X3ul/VK822JiIwIpORVL/9d1YTvEyMdQtnF4AIo3KlEJnR5wQcoiQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4q6MoHW; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4q6MoHW"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70427fb838cso25726607b3.2
        for <linux-staging@lists.linux.dev>; Fri, 16 May 2025 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747453301; x=1748058101; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=L4q6MoHWsu4YqHn5KoTIcQGXyEf597Hht8pk6Spm2Q60mzOlSdJ9yxSqE0un1fh3aq
         nbWs90D8HcEmNOERiC+G9E2OSFllAwwDC+h0EitYUfODg8gId5P3j0eISdR9cHIwnHa7
         o5xz+jukr0kaV/m3hREdohwX5vKqnExUI9IoEGELqDaldr228b9sZC+Cr26p1MmXmHfU
         C93R6KnlSweCvpJew7TFs46NsxE67ZFmoB3kDSP2/S2Jqe4bKFhQEb7pM5maZnjOHjw4
         NRz5FtQS6lSeMiqv4cr8imk8455/+Dj3H2uGpudEZxAHF0SW+5W1WtTf9atkXJvYmotc
         RnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747453301; x=1748058101;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=AaFBT1ZaaWYoXG5diD0lguk2Ekn4ENW5dIrrKIUV9ZDmBasbBZmn+sVgn/2gC7WYiT
         ZkiayIFjbv6k5X63R0BZSQmOFnp/Oh2WXAdvF8Ad9zt924GB3Tuiw997XyTfRUcBytNj
         3nU57ah1sR8m0vjq5e5E+O46d53ew/qQsYrba9SVraY2kphAnUUB+rKcqVSarHCntQOH
         l2yuJ8PRyYE/0TP8N8YsmPNXohHmpWymPxMc6EoKUFu6dRcfe+zeTuQultRexi8pvh9x
         lO6xDY/rWvr/u+KS8mC5j24uSY2ipsHmRiQHyNVmb5u0CSLPGWp0AlWrQUmgKe9sJhGw
         94Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXop66zhx9McJ/sP9TkG+tbjVqIbqNkq7JMuItfsmnxnTdLVujcvcgpbGlJqt0jFkx+oCuSQ0kljjwBpS1M@lists.linux.dev
X-Gm-Message-State: AOJu0YwEk6pdfTBv6UlRSOEG6kYiuqEqrkhWpMRaDE6FmbD1bnQbTNs9
	SKXKzUxuovSLMTTVJe0ug+EaDVoQ0o+sYtOcYPP65VNQQWlfe3F8WmAcEVJqBOKOn9rbEBMkXcr
	f6idcmZ6LTyyTuy1MDdUOVXElODNlquQ=
X-Gm-Gg: ASbGncsGIDubLsLaywbJrOAdAVO6gx5eRYIdCbQ43JLGv6jDIj5EhfAf5HJbgf+wbXR
	l8KMNhUmCZcyZvZHMVKL9eOBUDyQOE/gtUxt2bu1Jd5xjRt2Ba1XG0ujc6hy9d0IpBRHcAB+mk9
	CMkwprk/QY+O6tnfVrnx7zgYQOmUwGBNG9HATnY8tXUWDOAau8gBdxtvrBJu9N8eHz+ri5jcOBN
	qY=
X-Google-Smtp-Source: AGHT+IF436gN7/jFCxrpB/MU8XA9XIfXcR+aCYz9gELt5k6Au9AARPhYySBUccJehkcH53YIt5y+OndYonj9VJu76H8=
X-Received: by 2002:a05:690c:490d:b0:6fb:b907:d965 with SMTP id
 00721157ae682-70ca79573f4mr81196987b3.3.1747453301148; Fri, 16 May 2025
 20:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Sat, 17 May 2025 09:11:30 +0530
X-Gm-Features: AX0GCFtIxtvxIu4R3iOqAZjRuHeebVLNc8s_0cuzSyovkxkXONjjqOzHvDSMjPg
Message-ID: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
Subject: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To ensuring that the firmware_tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.

The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
may or may not be NULL-terminated.
included in "greybus_firmware.h"

changes has been made at 3 positions:
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
