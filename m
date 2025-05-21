Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D0221FD8
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747803425; cv=none; b=jhAKNmzusJK71uyMeSwh8lf2li4gGQeHVu6YCPtl3cCvTkSXroqq4q94+LEC4iHcwUmYmgBOdUG3APwYfIorBNEtzywc/fxGmshfTuwdltP5WphWhakkX0l9H4EJNG5jnCNiFg+I7W9eF6f3OouNwwXec/8ZAjd2QxlIYYfgLK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747803425; c=relaxed/simple;
	bh=vo1ypLzWXPCyz5dAd0yQBRwG/ACUts5O7p9HYNmzh0A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cG5Pamjr1aFr2CRwzOxy8eQ1z9RbQJ2Rb+Es64Wct0F5YIgWBopznZDdgnqfssViIltPpQUnyuorfKCBpaEsV06RMBwCOrH/TRycFvuVDmjsHkKCiekdM0THFPHOpTbA/h7tFIiNBjNqF86uKzJhDlf2mNcRkTwOqTO3Mx76p+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEeJ8BVe; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEeJ8BVe"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70df2e31510so2975577b3.1
        for <linux-staging@lists.linux.dev>; Tue, 20 May 2025 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747803423; x=1748408223; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=XEeJ8BVeYC3iZnH3m/IuDZxgxY1UjNnbvtS5WPjI5te9GtNbi9mqHMLlNAoaoV1ms1
         G9amxEnRkpPT9We5EuXtJ6+PgYcRSkP2j7xyGxXwKRTAsscsatC/+XHpEesAhpXrPPzJ
         w25shQjF0iAKMDF+ngZ2m7UMLkWqt91PBICu6ssRxZYAQQe1+0lajPPDtNo41DWHZ7P9
         B5saYKwfb4DCURalFk2RxRa3W8Bg1r7fl1YuC5Y/uyQPlxh4JbKpYvMc0XaZPCupuICm
         FsgAo+o+xovGWwQDgPBe6XvXYnYf42uW/c2RXzgE16TxJhmJzlf0BX0vH3fD0TfG8fgW
         ofDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747803423; x=1748408223;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=KqUNTI6RVaIF0tPaiDvcnR3TA+GuWZy7/Hfr/oQG9H6jUpeFU6JIjrUDjWh263LT/p
         h1rjvcTdNwWSK9j15HBHwUoFgtzLNXcdciNDxxNe9tHAYpyWvdqUxSR/JmJFXW9w9SHF
         DvwsfyeKct5kvkySnzvpTJOCLxxIgUew5Pz+z6R2aNP53J3oTVtYN5e2P1SgP8MK7NbM
         IdTudO8Edcsle+73wnh0PhKLdoHJHwSvnxUqleMNmYgpSA0osbxoHOn3zNXe79VTnUsV
         NIlPQEHkqhJDMJulOlJXiWlejVULqir72Ay8kg8X4QLWsqhzoMlmrA6qt+TWElqJDOU8
         hRdA==
X-Forwarded-Encrypted: i=1; AJvYcCX9lamsPIP7RWJI6gOh5glxU64c4/v9Q2PxvyLAI+vdN7YlLonRKKKLGVR5mstIRSZrOFjO5bzQdE4gGzX7@lists.linux.dev
X-Gm-Message-State: AOJu0YwgKNxI5ZS2HUqicWQfFo/xeTCwHEWVMw2pmHducPElYTlBKPUv
	p+jqGJb4TvGOOhXmL/38j9RxktbDJB6XAXut4/Rv+8AXAUCb5ADMOMS3V2rMyeBDaBlw9l8H3+t
	94j7njyLeJ/zFMsr6U28jSX+CVhwWlt8=
X-Gm-Gg: ASbGncvrcNHUme/04bOHAm8DEMqkaDcL+ArzTkdtfIixgEtUhaLt5kccsSQ4kQxbldK
	gYIqHpVSfjOkTBCik9wUfEgcCD0GLOB9T/kFMmnGpymVnpUWHOa6Y7/Sty3wIVLJnridGEQSFvB
	NeH9fLEJ+770mGgQ6EXwn8obSdiv40rU9fivQBqSBSMzO5lnc2UDdqNqzVFTaYNmov
X-Google-Smtp-Source: AGHT+IEWACZUbEn/Qvjby0NOVMqGnBxCdnWU21NIdYQPnzISHC6IxPhE6ErXjJ9myeXwvkONTIpEdWeO/LjmyEhrwoM=
X-Received: by 2002:a05:690c:4b8f:b0:6ff:2777:92b7 with SMTP id
 00721157ae682-70ca89425d0mr263705067b3.9.1747803422994; Tue, 20 May 2025
 21:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 10:26:52 +0530
X-Gm-Features: AX0GCFvr_1t0VGeoEGMfBmVXMgLUGm9UXK5DksnneiF0m3jEivpuHRiT-6JKn_w
Message-ID: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
Subject: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


changes has been made in 3 positions:
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
