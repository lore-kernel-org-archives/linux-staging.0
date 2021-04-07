Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CCC6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:46:06 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id l1so8830707plg.12
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X/1WQUx4h3Us2MWsdbVA8OpNDkB4BtTTjDqsMm8O3ls=;
        b=LLoGUZhIk6YW+UKKNqOen1oLr0HJDun+yEuhnwfn880onAoEnJfLYW9fYa278+NI6g
         7bg2Md5XZwV8f5JJwJkK7jhfXEgDHTYgW03cCEJLD51fISxqaBoXn0aRL4eo7GPGbo9v
         fko9MRjaIYHZKn8ACTy15FeH8U7DDxTJNbL88RcZKGaBT0qmOG0rDLR3jIoqdCLl9iqa
         rV50+u4tlHgrZGw4djiaCDiyqRTFtefE52ALQ7MtTPT4vF6ji2i00uYhIiYnryMuBMFD
         5XovHaAHJN4GtcEHSK3LaGtp5F65nV6DjVrymT/L0DUYFT7dVjubtHfiFmigfJotZ23S
         Ii1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X/1WQUx4h3Us2MWsdbVA8OpNDkB4BtTTjDqsMm8O3ls=;
        b=gW5m6U0gVfOF8w9k2FSKnKTFgz7q3xwf7OWI50HnE8bkD1NslLk0gedEZ6d85nnIB5
         X0oUNvOmN4+7WCwe3N329j526aEIbUhe1BCW9132pOGi/8sCXGF0ngGKSXioG8IMHHHc
         Ajr1YcUwWuzZiSC4tlRswYwvMUtsIisuyu2obVUyUIDHfnXYfduXQ3sxV4oAfQBUPGYd
         /0joM4irF/z5sWx4jn0c3Smy2vyc39nNhjVSUsO4k64Y5AiGwGrv8hJGHzTcKbfCM8yH
         N3nkjNkBjWuX2tOjyeoBy+mlfRL0gUcKCtZiUUaT5MM7lK0i8ZZTG5zzAGeCdSEcE0Kl
         beBQ==
X-Gm-Message-State: AOAM533ff4oiJs41p7q3O4KgliWuo+iDPBSBvSa8cO6/pS8nksfRydag
	UDrjYoXUbyOF6G/VjAsvFWo=
X-Google-Smtp-Source: ABdhPJwuxcPKuFNIh/WSZFXCdlX40o5XBWVpLkiVk2vc9UmT6PHe1RjKBk1djEeo4HxzN2TX1hQcYw==
X-Received: by 2002:a17:90a:e50d:: with SMTP id t13mr312566pjy.160.1617777966454;
        Tue, 06 Apr 2021 23:46:06 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id k20sm917135pfa.34.2021.04.06.23.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:46:06 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:46:04 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 42/49] staging: sm750fb: Rename functions *_deWait to
 snake case
Message-ID: <0362262fbce2e49082f213a9bba06b1ac64a5bb5.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the functions
hw_sm750le_deWait and hw_sm750_deWait.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 05f3a1d454db..bb25ab4ba0de 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -609,7 +609,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				    hw_sm750le_deWait : hw_sm750_deWait;
+				    hw_sm750le_de_wait : hw_sm750_de_wait;
 	switch (sm750_dev->dataflow) {
 	case sm750_simul_pri:
 		output->paths = sm750_pnc;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 4f9fe3e9ef81..da37fc81370b 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -194,8 +194,8 @@ static inline unsigned long ps_to_hz(unsigned int psvalue)
 int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
-int hw_sm750_deWait(void);
-int hw_sm750le_deWait(void);
+int hw_sm750_de_wait(void);
+int hw_sm750le_de_wait(void);
 
 int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index db2c87fe7006..789199e628cd 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -506,7 +506,7 @@ void hw_sm750_init_accel(struct sm750_dev *sm750_dev)
 	sm750_dev->accel.de_init(&sm750_dev->accel);
 }
 
-int hw_sm750le_deWait(void)
+int hw_sm750le_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = DE_STATE2_DE_STATUS_BUSY | DE_STATE2_DE_FIFO_EMPTY |
@@ -523,7 +523,7 @@ int hw_sm750le_deWait(void)
 	return -1;
 }
 
-int hw_sm750_deWait(void)
+int hw_sm750_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
-- 
2.30.2

