Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0872
	for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 19:50:02 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id u14so7589145pga.11
        for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qko599Uq/EcKOeMa5T6Nbxwrwz7YFbQgmwQPU6o2zKk=;
        b=TEHAbMt0EG92C22jB5zzkNiVLa1JG5U+5zkwDILA21nD3DHz4nsqWmpxMAXThr0ffx
         GC0uOu5iHTM2FgDEGPCZyv1BxjtM+37RMZmVbn9s98aWdwueIyR/N9fwiDGrg9LZqg1A
         Q+XAkVVGzgTbCG2HbM7IM/upocugVJVK3eUKk7Q8mE9CRYIEropQs9+PffCaVgv4Wgx7
         Oi92j/iDLnuWRuTwQG2xqk4t8sSt3ezjXCDIb7vSzW9ZI7a2kECb7B+lM3kyrV2Ipa/J
         QAhnoZ7cpE3UyZCnUxaAKXPJ7PnhJuBa/609Dp08uMSN2untVnkAh+/M4Lf2udX/bJqI
         vVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qko599Uq/EcKOeMa5T6Nbxwrwz7YFbQgmwQPU6o2zKk=;
        b=sfu65lS5TXrKTANJTaT5oa49Or9xWiSa2N471vK+efB/Fo5wwxXF9alYAJT+f1XSUV
         MzOEzGchM5dHPQWzqdbbm97sWMiW76fUtCnH5M5d3oy0HDAxQOzV2kipdqH/jasLsurI
         BInfxpXCi9NZCWaua1c/clyhzD0N3RUEwcITP9lHGNCcnxCzpg+BATRhltKR7Fn+2Ceq
         EiQncIKFCQROgn4mgAb+4h3T2HL8TtiQIMgH8Gmf6alxFLkjOMoGKfWZd+KXVip79JhC
         XFoC08UxndPz3J+RL3NAIwN9Z0Riqvo/eCv9/yRP7tfPhVM/qpSH9gjQqVqw2P77D8Ic
         pPFg==
X-Gm-Message-State: AOAM533DIJTYeDaygj2WDXQPc4R4mNXYhAlAHm6SXBAVv/4XMe+lwjkG
	/0kvFSO/Og24DM7ApL/bdRk=
X-Google-Smtp-Source: ABdhPJy5Iy1XdpWlOnr8lZfv6Wh0OYsaY+OZCiV2nQD/fxlHso3X3itJOJBriBz6LnzNHgMlXPrQKw==
X-Received: by 2002:a63:1308:: with SMTP id i8mr6216999pgl.19.1626378601809;
        Thu, 15 Jul 2021 12:50:01 -0700 (PDT)
Received: from rishi-Nitro-AN515-52.. ([2405:201:9007:9a24:c780:f892:bcfb:77c9])
        by smtp.googlemail.com with ESMTPSA id a22sm7418045pfv.113.2021.07.15.12.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:50:01 -0700 (PDT)
From: Saptarshi Patra <saptarshi.patra.22@gmail.com>
To: 
Cc: saptarshi.patra.22@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <christian@brauner.io>,
	Hridya Valsaraju <hridya@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] media: usb: uvc: uvc_driver: Added a function pr_info() in uvc_driver and staging: android: Decleared file operation with const keyword in android keyword
Date: Fri, 16 Jul 2021 01:19:10 +0530
Message-Id: <20210715194911.8267-1-saptarshi.patra.22@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media: usb: uvc: uvc_driver: Decleared a function called
 pr_info()  with a string input "I changed uvcvideo driver in the Linux
 Kernel"

Added the function pr_info() to see the message / input string using dmesg

staging: android: Decleared file operation with const keyword

Warning found by the checkpatch.pl script

Signed-off-by: Saptarshi Patra <saptarshi.patra.22@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/staging/android/ashmem.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 9a791d8ef200..0b47ca75091b 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2352,7 +2352,7 @@ static int uvc_probe(struct usb_interface *intf,
 		(const struct uvc_device_info *)id->driver_info;
 	int function;
 	int ret;
-
+	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
 	/* Allocate memory for the device and initialize it. */
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL)
diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
index ddbde3f8430e..4c6b420fbf4d 100644
--- a/drivers/staging/android/ashmem.c
+++ b/drivers/staging/android/ashmem.c
@@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
 
 static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	static struct file_operations vmfile_fops;
+	static const struct file_operations vmfile_fops;
 	struct ashmem_area *asma = file->private_data;
 	int ret = 0;
 
-- 
2.30.2

