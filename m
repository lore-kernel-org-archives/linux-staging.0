Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCB186C;
	Thu, 19 Oct 2023 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOCvrhRH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4079ed65582so20664405e9.1;
        Wed, 18 Oct 2023 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697694448; x=1698299248; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QH/jOnY0ZF8TPHR/Twc1JX2N6xDANfIG+JOlMvNVHM=;
        b=bOCvrhRHDQlkCNWUiv6MgqFyv7nGTRaxiHcHnSBIbRF9kd5WigVjkaoKoRMOIvfIAU
         BgP0bSSsSXP/SWDr/8Akiiwtkzm1+0xbsOPBaqwe2SsYliGdui7fzXZjV9FN1Bfv36Zt
         CezgBPY/LLGGH1JBRIOyu2EQBAL45qf7kITMGG62iWEBn520FLWynZ83QSI1w/NcYTS/
         iW5v6Xw1ebOHO0R96OVMr0SPCFVZ4LKaGbMR62zNY/vHqRh0Iy06WKRBTsTp799Bpd+3
         1Z3y2/ER7XS++DD7hSgcYvL2C555yGsoOrxHfZBMvYvaIEn84+CiOEuImTYXI1stBZXo
         q+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697694448; x=1698299248;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QH/jOnY0ZF8TPHR/Twc1JX2N6xDANfIG+JOlMvNVHM=;
        b=G2oy/e2aM9g2ecsvNfih7fIdSPfrw1bDzgiwzPYK3jcvr1s6fWnu2v11+yB0fdtJl3
         /QhytmBLXK/uyBL5YOwua3gu2vm5aF7Qo/z+faoV5SwRj9rkFMOtl1cLYbf5Jqsu6Bf2
         pbslQjiVcZ6sHCI4DIIdOsymlOIEBmnp5f14JmIB/fdohXuplqCv0lm1RklHS6hXJ39A
         9N6+zEfGuFS0gGdaEL46WpguEBM/wdiFB6/9hde6wzaFm6wOO0OY8AGc9SK43e2Yj8+4
         MNV5fYQhR/BmTTsfggWMJwREpgrDmgmqzUVgJUYQ0/Ya6K5NKahPq4ZvOvjgBncdU21e
         fw4A==
X-Gm-Message-State: AOJu0Yw6nI3EiZnF7UXXa763T5CiW+usoSFw6QLhaSFNpBdWYHxuB4YM
	8J+ZKMnCBMFXKerSJ1eGezY=
X-Google-Smtp-Source: AGHT+IFEDAqJ+kozlJJ+9eBNgjKdB19Uh/+XKcoV/W5aAz2ZrA8rKQm/+5rUJ/PKI07biAsRN+vuiw==
X-Received: by 2002:a05:600c:4f89:b0:408:3c8f:afd9 with SMTP id n9-20020a05600c4f8900b004083c8fafd9mr960177wmq.3.1697694447543;
        Wed, 18 Oct 2023 22:47:27 -0700 (PDT)
Received: from lab-ubuntu ([41.90.66.104])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b0040770ec2c19sm3438034wmi.10.2023.10.18.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 22:47:27 -0700 (PDT)
Date: Thu, 19 Oct 2023 08:47:24 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>
Subject: [PATCH v3] staging: vme_user: replace strcpy with strscpy
Message-ID: <ZTDC7N6GLXZqaevN@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests using strscpy() instead of strcpy().

The advantages of strscpy() are that it always adds a NUL terminator
and prevents read/write overflows if the source string is not properly
terminated.

strcpy() lacks built-in bounds checking for the destination buffer,
making it susceptible to buffer overflows. These overflows can lead
to various unpredictable behaviors.

In this specific context, both strscpy and strcpy performs the same
operation without any functional difference.

The reason for this equivalence is that the driver_name string "vme_fake"
is shorter than the size of the fake_bridge->name array which is defined
as 16 characters (struct vme_bridge {char name[VMENAMSIZ];...}). Thus,
there is no risk of buffer overflow in either case. VMENAMSIZ variable
holds a constant value of 16 (#define VMENAMSIZ 16)

The null-terminated "vme_fake" string
(static const char driver_name[] = "vme_fake";) can be safely copied into
fake_bridge->name using either strscpy or strcpy.

While using strscpy() does not address any bugs, it is considered a better
practice and aligns with checkpatch recommendations.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Changes in v3:
 - Rewrote the commit message
---
Changes in v2:
 - Make the commit message more clearer.
 - Remove the incident extra line change.

 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 0e02c194298d..8ab5b43c70a6 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1091,7 +1091,7 @@ static int __init fake_init(void)
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
 		     (unsigned long)fake_bridge);
 
-	strcpy(fake_bridge->name, driver_name);
+	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name))
 
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
-- 
2.34.1

