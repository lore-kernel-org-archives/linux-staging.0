Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604691D5CE0
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309942; cv=pass; b=RHYkSvOzTvtEBZ1ukt0FNl9S4Dq2UVUV/IgQN3W2uGyPlZBDnyHKMqsIt7M83zij4pUh+gLhsZ1H0xBMa6cqa4+TfEA3Oc2kKaBRzs7kVvC+FOUbVkCQXG1xnGKems0Q56QAscrWur7z40/gzDHLfYSuBpMyfZZiFfC/Uj6EaGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309942; c=relaxed/simple;
	bh=Iesy03fy3D5hzUgxS6UMqe/aNPanV+wNGp+mdEaII4A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dl6au8gT0EVMY3y4Yv/A9TCZVdzXnjxwRNnq7axc9RaL68FR5hkwWaWHc5ay/4B5R8+T0M5OEX1g3YqoKwQRVcvwHKv+xJqw2qOEoSDeRyYB9oLKIHYnCATKTshUDqNw51h9HI/r1flqLZRTdhojTPzJof6Rxs4Vg4VUqd4bIY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T02y6nMN; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T02y6nMN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso4786660a12.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 23:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778309938; cv=none;
        d=google.com; s=arc-20240605;
        b=a2BxbdUs/9L6nR/dnOENhu+4JoT/UupRUxExnQeOHiCdn5x0KUA9DgfgMKvgySIB7Q
         Sd8fcMt8dALNET59eLEWhncc2sh0OjmZtpd24J7qWliABwjpAgGbUiEhlQh35zFNh/mL
         khivP8Vh8LzA1PlW+EP5UqlPKLBX1LaxQlD580/sHeZ6UrK+BinWN655TIYLhLXn3Tg1
         +ZNyRqgl/KqPAtvY88nQB3HPMMb0hk7sVymPa9R8UG9kyjQlIHjcwB2dm2J/qbwGf6Yl
         sOb+h4o4ooaE8P1v2mxAB2qPSomZkIY82tkZ87ZrVjzJM9QgW1KI2SDy2me6UlX/6DG1
         CPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=E3ZzpIcBog2zjAykMMkyaeEdu/UE5HLcjw3UeNdWEM4=;
        fh=BjXQl1d4GD0mNl/1OEf73hxcPcbDHkN9zHTi1HzDDd0=;
        b=Hb1GJ/wW2ldYjAHrG78zTPRxVEV0xbavd4cQwvkPmn8Ua2Zr5n+TI/r0gvPY8slvWe
         HjteO28fY32jTpgfe4FM747Tj/T56EZ0xaSzwA9CstD3RWtIsw6QtoB2zguIgrUj7/+H
         qXSSnkmuIii5254R619U+HG67ABQkHtk0sOWXo9LPPWgqi7cq84iJzHFqIPVYSAt58DI
         pRUs0WEVmZlhligXilyBP5Wuk3epvK7IEJIQheUm0jzgzs2wck29WuEjAiwxVfGUEg8u
         2XRIu6it28UPTB2lPm9feNXHdUl+4cjH9g2oQNQzjOsa4K/8BVt+lPCfHuIPTw8dRweb
         If6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778309938; x=1778914738; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3ZzpIcBog2zjAykMMkyaeEdu/UE5HLcjw3UeNdWEM4=;
        b=T02y6nMNDJkoDiIBWj1srGosdgTj9DF0MfDg5f4bsvgE9ijLS/V81P1Ya4d2NUz9PW
         hfIuaboBb2TYqG+YSVCddHDkH7W+u/szVr2M0ZcDhGtMpGeAVfBP9y5fhzdj67Fd7LFL
         DP4vrwpoOvzPN5Ua/HBBqlyrqd0YxztgzmTVw5mNG2XT41W4sYGTEnSurhHkWqkKHogV
         T2XdOVGVM4gxgu2QDgo8KJTFcQz8hmsuRDe96uZL/JMkdbTpabfwkI2UlXaP6PFsumfc
         SzwF2+fKCO31GzG9bDRPJyf1k9fgIbludKqh9LB91BPa+iOU13ULsO4VQSPLEixlxPSL
         JNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778309938; x=1778914738;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3ZzpIcBog2zjAykMMkyaeEdu/UE5HLcjw3UeNdWEM4=;
        b=FVT0kyFcWra8qHElBqzo9D5dLTm0mMP2g8uN+2n0KfZqpngh0Hry72et2+oQeAbxrB
         EQmLrI3TafuNIwZLYCNHSq+bhGafUychWEaTvgnxbplItHJ1hDX+QOjWz12u9ZxxzzmH
         2q/TV3+qjBJ9kdUenmo6sNZzmb7Le2UcIR9riPqbWfpnSe6ekTvpxoEKrZ+lesL6sFm/
         2NLAI8Zhf6cZLrAVlQTtKupA5r3eD92Oz91MLhRQ6UOb6OZSraCM30cr2rYs3466KZoT
         xWLs412sm/JKyo8DOfKr9XGDvWjnBUA8J9S/edhJXeZifVX5yMeE+lRxrZXYb+r6/uK6
         tktg==
X-Gm-Message-State: AOJu0YzfJ5dkPw2tsrb8LYKaf4EB6e+aHZbyR3Op0kj8FbR78YiM1SgJ
	8WkdFxWcrF8vRFPg3Da0SLBMCKH1uHP6RYiIa7X+hQTptIvotfzVRRg7DS+0iIORSVvzgQ116nq
	foM+aF0KfNh6j5vSbRfZL1WfAhm+p24A=
X-Gm-Gg: Acq92OGx4hrsOf4rvUYAqD2HRxCcXLDLgPxIn3qgRKPcKVFNo/QEQqXWJL1YOThQCim
	q4yCh1qjMebbp3VUxBUsVEcWUAVyVjBLckAdnTvVR+isiE3f0hIIRw5tfjW9R4z7rMnDHK+xjFy
	Yk4s0Q/rMTBUx5YSFNACUNN8RXAwX2bxzIziqzbvDiyRdps/ldgLMHMV1kE5cJbU4DvJu35jfY8
	LeoyEfMsQLspLkqNOyTSHOSEnBGHA3TInMkAthFFCQpwnunD9co1Sl9e4evFpRUdjJ8Gh+o1qRC
	vinLqEu/1hNIkHyZxO8iILqdEEHVqmUG+bKXYcmu
X-Received: by 2002:a05:6402:e94:b0:671:8ba1:e8ab with SMTP id
 4fb4d7f45d1cf-67d63d7ef4amr7643931a12.1.1778309937518; Fri, 08 May 2026
 23:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?5pyo5Y+j55KD6Z+z?= <kiguchi.r.sec@gmail.com>
Date: Sat, 9 May 2026 15:58:45 +0900
X-Gm-Features: AVHnY4Jm_ebRILmB2uHfdYlz90IiPkPJ0DPNDTLz42rzdOq3SYR5j5oNNsVE12g
Message-ID: <CAKs+XO1WXrv4jvNuEyMxu-iP9E-fifJLwOZ1nJynDjpvfn2n=g@mail.gmail.com>
Subject: [PATCH] staging: vme_user: validate slave window size against buffer size
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch addresses the OOB read/write reported earlier
in the security@kernel.org thread (now handled publicly per
Greg's and Willy's guidance).

Tested on Linux 7.1.0-rc2 with KASAN; all three reproducers
fail with -EINVAL after applying this patch and produce no
KASAN splat.

From 506ecfc9b8608fb3a56477b8fd205238a1bf66ff Mon Sep 17 00:00:00 2001
From: Rion Kiguchi <kiguchi.r.sec@gmail.com>
Date: Sat, 9 May 2026 15:38:33 +0900
Subject: [PATCH] staging: vme_user: validate slave window size against buffer
 size

The VME_SET_SLAVE ioctl in drivers/staging/vme_user/vme_user.c accepts
a user-controlled slave.size and forwards it to vme_slave_set() without
comparing it against image[minor].size_buf. The slave-image kernel
buffer is allocated at probe time with a fixed size of PCI_BUF_SIZE
(0x20000 / 128 KiB), but the configured VME window size can be made
much larger via the ioctl.

The subsequent read() / write() handlers (vme_user_read /
vme_user_write) clamp the I/O range against vme_get_size() (the
configured window size, attacker-controlled) but never consult
size_buf. The slave I/O paths buffer_to_user() and buffer_from_user()
then index image[minor].kern_buf with *ppos values up to
image_size - 1, well beyond the actual allocation.

Result: a local user with read/write access to /dev/bus/vme/s* can
trigger out-of-bounds read and write of the kernel slab adjacent to
the slave-image buffer.

Fix: reject slave.size > size_buf in the VME_SET_SLAVE handler. Also
add defensive bounds checks against size_buf in buffer_to_user() and
buffer_from_user() so that the I/O paths cannot exceed the
allocation even if a future ioctl path forgets to validate.

Reported-by: Pochix1103 <kiguchi.r.sec@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Rion Kiguchi <kiguchi.r.sec@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_user.c
b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..41b8d5b51 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -156,6 +156,11 @@ static ssize_t buffer_to_user(unsigned int minor,
char __user *buf,
 {
  void *image_ptr;

+ if (*ppos < 0 || (u64)*ppos >= image[minor].size_buf ||
+     count > image[minor].size_buf - (u64)*ppos) {
+ pr_warn_ratelimited("%s: out-of-bounds access\n", __func__);
+ return -EINVAL;
+ }
  image_ptr = image[minor].kern_buf + *ppos;
  if (copy_to_user(buf, image_ptr, (unsigned long)count))
  return -EFAULT;
@@ -168,6 +173,11 @@ static ssize_t buffer_from_user(unsigned int
minor, const char __user *buf,
 {
  void *image_ptr;

+ if (*ppos < 0 || (u64)*ppos >= image[minor].size_buf ||
+     count > image[minor].size_buf - (u64)*ppos) {
+ pr_warn_ratelimited("%s: out-of-bounds access\n", __func__);
+ return -EINVAL;
+ }
  image_ptr = image[minor].kern_buf + *ppos;
  if (copy_from_user(image_ptr, buf, (unsigned long)count))
  return -EFAULT;
@@ -394,6 +404,14 @@ static int vme_user_ioctl(struct inode *inode,
struct file *file,
  return -EFAULT;
  }

+ /*
+ * Reject window sizes larger than the kernel buffer
+ * allocated at probe time, otherwise subsequent
+ * read/write would access memory beyond kern_buf.
+ */
+ if (slave.size > image[minor].size_buf)
+ return -EINVAL;
+
  /* XXX We do not want to push aspace, cycle and width
  * to userspace as they are
  */
@@ -401,7 +419,6 @@ static int vme_user_ioctl(struct inode *inode,
struct file *file,
  slave.enable, slave.vme_addr, slave.size,
  image[minor].pci_buf, slave.aspace,
  slave.cycle);
-
  break;
  }
  break;
-- 
2.43.0
