Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB6A72
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 01:59:41 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id h1so3492411pjs.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 18:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Fudd8jhG4G4A8TwkFkc6LJ/nOYeKTZZ7GsfAF8ps2HA=;
        b=f24B1rjHRjIktz9MAxupSynwSyLbvVc9V9pVTD72VfFO0KqvFzd9WWz2USWfcP7VTk
         M6seFatlOWcp439gkRUeEQ3OZNsDVC6FRE8UY9VMt6iUwP8efo9Q96tTGqIeI2x01mOH
         g0Gh+dhrWam+r3CE2nmu/x4Kr6Hv2ayEZzxd9EL/VxIeaeMeeHfRxuObeOBK4aFEv9ik
         mnaSWQqP78tSy0TArBETS6VdSL1krZu1tGyr4L2XUA4kMmc8RGiCvLJeH3sHgXZIyNxZ
         6My5ihqxnXeIQdpOY8/H5fhW69OT1+u0wsGf9Uq1RD++bztZhwbxvo8ItZxGnDCqf6fx
         vVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Fudd8jhG4G4A8TwkFkc6LJ/nOYeKTZZ7GsfAF8ps2HA=;
        b=bRFfFpK3jNQB9hBZ09wP0WyhsRmntcHevP9FyiGxkdjtF9OOYT5gh6ESyYl2M+cOrD
         rfI+a1Xx8zaS27HQLKp7br0joXB9k7DSLxEQmMsHzJjW4XLSJ2UMQftQvqCwdMc3xW/h
         6C/OMhJ5hJq4YEHe64hv26zhuPpcgpWDd1ciFRwERHTHXfHCJknUh3+zf/0gKmOfSmQ7
         VzfiacTiwtA8gliEj+fxW6/kd0cGaKHnJD/TgRA48UegqyomTZA2/qkjCGRBHJSOwmC9
         fwtVLBux4B3PPo7X3KfaeDBzhV3Vj6slV7Ikbv4N0kNqD6zvfIYqjuGjD3qa+2NNlgGs
         3ZJQ==
X-Gm-Message-State: AOAM533PVeFbdQ8p8DQg+mxpTKRFsIgQFP8IZ+swT0H7HEGZY60D4sMH
	UJvwU+Wb4TxoMVFqFvXnZXIEnzjedAvqZr0N01hdG3qpMWckeQ==
X-Google-Smtp-Source: ABdhPJxm8Fs4VB2tMbVtT5rTzWpoSkFTja1+IP51LHZhdAL/jpEJHlM1NhfCqg4dwh4BDFyBOmSydybCJam1S+Ob3bM=
X-Received: by 2002:a17:90a:520c:: with SMTP id v12mr5177931pjh.105.1630029580852;
 Thu, 26 Aug 2021 18:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Krish Jain <krishjain02939@gmail.com>
Date: Fri, 27 Aug 2021 03:59:28 +0200
Message-ID: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
Subject: [PATCH] Declare the file_operations struct as const
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

 From: Krish Jain <krishjain02939@gmail.com>

Declare the file_operations struct as const as done elsewhere in the
kernel, as there are no modifications to its fields.

Signed-off-by: Krish Jain <krishjain02939@gmail.com>
---
 drivers/staging/android/ashmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..ec18f2ddd66c 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file,
unsigned long addr,

 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-       static struct file_operations vmfile_fops;
+       const static struct file_operations vmfile_fops;
        struct ashmem_area *asma = file->private_data;
        int ret = 0;

--
2.25.1
