Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D029CA
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 05:08:46 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so10453543pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 21:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=K+srP5VtjGUVfkF3Gd4z8iDliRUZYWBlpiguTbcMjJ0=;
        b=KN7STkDHGeQZ+/fNT/PQ+6ccsDcfJnLHbvGFF0XJC+T28JDxFH7W55A0ieHnZg5U+C
         K/y9H+pNTIB/Pddn0z6vP/z6k4eUsng+Pz0ooMsO3VQAKq/pIYK+4PcXNR0iBfUJfolu
         Z9kAth7ajWR4RyfDMpMYjJgVobBuY+xKVADMP4S4bp/IWqCHzCnZ5baaE/Q+/lRaE22y
         qE5lFkWNw+Q9uSVntysvwOh5ft/jLQ5wk5TQpO5buEHe/S4v8+RJD/KTFDrLGVbxQQ2E
         jffDFflrXZps3bkFA2xJFQFyWb9vptBOfEeS1QB6rtT64pXfA2AsyHLWN13CIcC9YttJ
         9PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=K+srP5VtjGUVfkF3Gd4z8iDliRUZYWBlpiguTbcMjJ0=;
        b=3oD9fwFR4EM9BMCQPVTcTwU0X0EPok1mBAgXTsKX7mVA7Jv13v2t8rO0Fn+ckxGol/
         NgLVT0VMDPNnicFPVp2gRGSIWV3Pq42QpQ8KOrmAQMwY9oxQ8vr3A/o1IVV3k23QN40M
         vopKKabn73Qglo7KP4ltl37cR31YR47Xwgyouq2KOqyJQ33oPVKn0gdJoB/DE8VAD0y8
         Rq33hWvDDVsfmPSiR3dMW3kdpZnNZmPDuxMsygintwz2LC1Xom/yEBfb1CiyHhVqDmmC
         e/vP1GP+abycKeB61LzFuldfkZzVfzvy3WpdSdJZfNhh1YxBN3oX55ksQtBVGKkMCysV
         jgSg==
X-Gm-Message-State: AOAM533tFQ9Eqe/Suc3JSCYB/YDDqrgZCVeJRzQ70C3znhbopL1rc7rz
	C464AxDO6TQOHSSPlZmU5Zs=
X-Google-Smtp-Source: ABdhPJzg5kvfXicnLxOB+7t6a/SutVJjX2J8kjE0aEuyT7W7WExZP2ys9vjwywim6+Pox8l0rSrYkg==
X-Received: by 2002:a17:90a:17a5:: with SMTP id q34mr27892356pja.1.1643519325450;
        Sat, 29 Jan 2022 21:08:45 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id p16sm1081948pgj.79.2022.01.29.21.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 21:08:44 -0800 (PST)
Date: Sun, 30 Jan 2022 18:08:38 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove coding style item from the TODO file
Message-ID: <YfYdVokxsQ+Adl+T@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After several patches sent by the community along the last couple of
years, it's possible to remove the coding style item from the TODO file
in the driver's folder.

This patch addresses the last code formatting inconsistences and remove
the coding style item from the TODO file.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Patch dependency:

- https://lore.kernel.org/lkml/YfX+llwDWZZMz+NY@mail.google.com/

---
 drivers/staging/pi433/TODO       |  1 -
 drivers/staging/pi433/pi433_if.c | 12 ++++--------
 drivers/staging/pi433/rf69.c     |  3 ++-
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
index b9e6c01a0..8d0f1b579 100644
--- a/drivers/staging/pi433/TODO
+++ b/drivers/staging/pi433/TODO
@@ -1,4 +1,3 @@
-* coding style does not fully comply with the kernel style guide.
 * still TODOs, annotated in the code
 * currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
   -> Replace this with another interface, hints are welcome!
diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 74748d3cd..02d4ccebf 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -364,8 +364,7 @@ rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
 
 /*-------------------------------------------------------------------------*/
 
-static int
-pi433_start_rx(struct pi433_device *dev)
+static int pi433_start_rx(struct pi433_device *dev)
 {
 	int retval;
 
@@ -405,8 +404,7 @@ pi433_start_rx(struct pi433_device *dev)
 
 /*-------------------------------------------------------------------------*/
 
-static int
-pi433_receive(void *data)
+static int pi433_receive(void *data)
 {
 	struct pi433_device *dev = data;
 	struct spi_device *spi = dev->spi;
@@ -557,8 +555,7 @@ pi433_receive(void *data)
 		return bytes_total;
 }
 
-static int
-pi433_tx_thread(void *data)
+static int pi433_tx_thread(void *data)
 {
 	struct pi433_device *device = data;
 	struct spi_device *spi = device->spi;
@@ -883,8 +880,7 @@ pi433_write(struct file *filp, const char __user *buf,
 	return -EAGAIN;
 }
 
-static long
-pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+static long pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct pi433_instance	*instance;
 	struct pi433_device	*device;
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index b1a3382f4..2ab3bf46e 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -654,7 +654,8 @@ bool rf69_get_flag(struct spi_device *spi, enum flag flag)
 		return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_CRC_OK);
 	case battery_low:
 		return (rf69_read_reg(spi, REG_IRQFLAGS2) & MASK_IRQFLAGS2_LOW_BAT);
-	default:			 return false;
+	default:
+		return false;
 	}
 }
 
-- 
2.34.1

