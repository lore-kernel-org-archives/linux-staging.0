Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628869;
	b=o7WcEMk44wzCzzGnsu5ruQigt0fD2emHM6bx/Fc4Ev9ZJ6iLBukp37NpC2/U7mRV31Fd
	 WZGSeiW14ZnRv1TqIHIiD4n6G8T1WGi526UXMHfJOZeOxkgv1FtZpdv8VhR3XNWZo/NnP
	 LxF6be97UMmFQOPVdsWroVX8ObQQ6T/VB+r7gnSDKxeA/hceahea+YpyeuM4vdq/3dTrf
	 Ab4qGBYTomxSxGqG+4VXIOqMetcdQB1EWeJiBD6SjycSZ9ckCJOboTCy3r7eHD0KgPpHV
	 wKHECT9kwp9drRJVKi1SW+5vl9Tl5AY8+i1x5wK2rhj6W1CRGdOzwAEa2NyDiN4xoZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
	b=utV1I96z0S9wvEalPm5/VXXSk8jm/phFCMUjllULPTlZSWBwvPCpX0BofbmfEWXZ/um2
	 zWnHWDkDryoGWC3BwSvex0ga3MaQgMT4X91tAJD5GUbUfN7bxE5nKA1oS7VdA6p9hqN8n
	 4nbdY+pOHqkqq9hDsRW7OWzXpZCpTksvUH1X+kKqHaYAlieXRGmxbvvepbj67MOoZBcA6
	 Q4METizwXZ0ceoGXdVVu3Ul1+tgHT4QHSUk5WQDCraVq4m92Ha3o+B+CnSvPBbg55v1Ew
	 fZy/K/WiGr6qQYoSa+64LSV9oCkQuY9O0LqzgYfCBwyD2ZGChmUBuO0hb7x5xSekGVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431660A263C
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 14:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1431660A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ac99992373so23975881fa.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 06:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628861; cv=none;
        d=google.com; s=arc-20260327;
        b=XBInQ1+93eotoAfdfzRjrmCLuMxSzB4Aez7PriIdoEmAXXaej5kUgj5Ms9edvVRQct
         b5JDJSTzUdWxwLz8whrdq1dFClWtyokDMbbld0cGPaTgEd8BI52XZKKL5ICeZZ//JNKm
         hYuNdrZkVgHdEj2u5Y+Z26LuKpTeO68KIZL+Nc6TKxAIqatCrvdvGHcJCp8cevZLWgHj
         t82CQAOSBC83JrK5CA626E9abC+P1XyECIaAbWL07waL+u580Gm9Sww4+7yeuzYwEShe
         WUFqCLayqFVaQMhMneebESmSxCD45ylD879QmYqRsNKWqYXxbtWzpwHE3Z0E/wF6eEq0
         8LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        fh=kNDiLnut5PPu924EZComLueSVIfw/+IFIU8uoHePVK4=;
        b=eN/10aDN8XMWhSWSK/UGr4qCfsi5WYztWTj5i1YPmG79bfaG3PqaePVwhjrlwQfEIw
         sk3qLzLDuwtdaqo6BYxH19O+R7Xn9FnTfm66Imq1c3j/43cpLaDVT+3wnWFxAkbFSzIf
         V80+eQc+h3ZPYcQa4N6HYQh8xMza/LJLR+9PklukSnrtztgP3iPT1jyp2kCiLg9D/39y
         xyRkKaqsWvtZ/IxZ1YuZSJUqPGQDhhYaT+o4NveeL4LM8TDIV/5WtM6GGbK9+ReaJN2h
         RkhPtjyEPYoSpIhxrZHrHz5by92xFEuDtz4MMTS6IOduMKh2qSYtO5i6GEXwZukEroSx
         cmbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793628861; x=1794233661; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        b=aj9qyJ7lV9YRGNrPtqmJt3mlmenYMXlaHqb1NpHZgyiuz+f7Sd6UVqE/4VKw4Nx42b
         nAq4i70MUo64SAU5Ml/yC5kP0pUYDDdTG236IWoi1INF7mHFVYMFz/yqIrbb8E1FuEZz
         ypvmSIKSoi42LLgl2bLPkP0Sjqs4mQs+4q7pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628861; x=1794233661;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z9u7rLBjFfObwxr3Bnidh1W488MKnwPxv7XdCiOlz3k=;
        b=AOTHtV0mNw5j1uX24hJgAHSmHhUIpNyYObgw9i8JgEhxfmGYlF6A1qYwqsZ9gcltBg
         95yyjnbpQPY8gRAnEP1EPM1EtnVmYsuUoYjLXAHWWZd3sA6R4cPBkE9CCdiiQyR03xOL
         XH8sBhlkI8XN7upLR71WO3xj3DVqQMnt6epSam3S88V5hGKW03O6Ou53RQSVoRjElfTd
         g97CVUuJ/d9l8tQjUGOsb0YxNhVdXUR7MEFlKDRYD/zHaBDWxyPuF7bc8nf3qK3Zlm23
         NMjpiGAQi+oIYPDDUaQ/ofBXGHF6LwHwZ7yh6phwhA/HZP9+9XSxcHFx3LEsJo3I0iMQ
         Lo4w==
X-Forwarded-Encrypted: i=1; AKwUvBwAFLeTD7ujy2zUnCx4KZlR+FVsnfDZDS//ex2/LbfpNzQVUyHkOmBSWEvl8A5KqCFOm1cPwpykUN2mbbo8@lists.linux.dev
X-Gm-Message-State: APuU4Z84k7LpjyU8kXCi/Y0IjGfZSphAhVwgAC4BbdU6GeKYLBlPBEdo
	XnFslNOCii+Xyz888tH1MyT8AQlaSB4HL5sUyakrZb4Pcci1+oeEbCwCz9KfGiiKvhtxsJ2F3qK
	xnAScAV/5l6BOzPEbplQ3uNG1HjCn3FySm905tKbp
X-Gm-Gg: AYBFou0AUhpZ2EOH+pdd+6UTi0ME37YDTO9tlAngbA7OubRme/4Mn+h9p9j2gGnS99y
	8Q2LEi6T5lnHZSi/O4DLuI5lhNxwwUDHG4QGY/2maPJ+y6jsBbttQ/Ex3aORedrg//+jTE3uyRp
	IQNgXE5UT8lF+1meuvn/pjwL31bw+TuT2StaHvauIP8R3IvLMqn/AoUHs0hzI1uQjndqgUFXizj
	v8pwiMufuSr8GkuoKBoh3XOAvnwiXnMm1S8Ui7FEP+Sr9ZE1EDsnn3s0wDbPh1XEg8MXjelxjW3
	rImztBiFNMHiWYe+x7cIDgw/WsYgR4bguWe/RS8Gr+0iPJkTXTUwj53t6psAKGe15Ll1ubwt3Ug
	wZpMC1lnU7/c+R9ZKFVMiLUBIBJtm14gvTiRgzcEzifNQ3GLPk+D1M/bEAwg=
X-Received: by 2002:a05:651c:43c7:20b0:3ac:d178:4f97 with SMTP id
 38308e7fff4ca-3acd178522dmr3648971fa.14.1793628861275; Mon, 02 Nov 2026
 06:14:21 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 19:44:09 +0530
X-Gm-Features: AclHuK8zvAC6NLaJerLR74Nj2Z7Ax0Couwh_5yLGD3UqJh-lFBH5T1ZF2R1C2DU
Message-ID: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
Subject: [PATCH] staging: greybus: fix string termination in firmware sample
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 19:11:09 +0530
Subject: [PATCH] staging: greybus: fix string termination in firmware sample

The firmware_tag string copied via strncpy() is not guaranteed to be
NUL-terminated if the source string is exactly the size of the destination
buffer. This can lead to a buffer over-read.

 Since alternatives like strscpy_pad cannot be used in user space
sample code, we can make it  safer by limiting the copy size to
MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
terminator. This ensures the string is always
safely terminated before being passed to the ioctl.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

This is my very first patch to the Linux kernel! I've been learning the
process and would deeply appreciate any feedback from the maintainers.

Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..a6a0988ad6fe 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -64,7 +64,9 @@ static int update_intf_firmware(int fd)
        intf_load.minor = 0;

        strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&intf_load.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] =
+               '\0';

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
        if (ret < 0) {
@@ -102,7 +104,9 @@ static int update_backend_firmware(int fd)
        printf("Getting Backend Firmware Version\n");

        strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&backend_fw_info.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE
- 1] =
+               '\0';

 retry_fw_version:
        ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -130,7 +134,9 @@ static int update_backend_firmware(int fd)
        printf("Updating Backend Firmware\n");

        strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-               GB_FIRMWARE_U_TAG_MAX_SIZE);
+               GB_FIRMWARE_U_TAG_MAX_SIZE - 1);
+       ((char *)&backend_update.firmware_tag)[GB_FIRMWARE_U_TAG_MAX_SIZE - 1] =
+               '\0';

 retry_fw_update:
        backend_update.status = 0;
-- 
2.56.0
