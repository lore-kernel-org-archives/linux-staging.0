Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5C29CA
	for <linux-staging@lists.linux.dev>; Mon, 17 Jan 2022 06:00:57 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id l6-20020a17090a4d4600b001b44bb75a8bso8799254pjh.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 22:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=vmI5obZJChROSVQzReKLArfFA6O6EbFVOPbqT4ROOPo=;
        b=bzXRibkL6gMspoMTyv32gwea7E+SjcByYvMKrn+OpRMWQvPQHkqJLNUpxhFO/2dnd+
         Bi8f+tQgp/VEMvIxH03Ak0osC+8Wh1dJ3RNLO4patFiYMQyJNP1jONINPUYJbcM7jHHp
         donOX/7l8Irwb84ORSQGk5bgUoZ4X26DmKTEWrqQO3jS96+FdHRoBuxkfVP03AVN6j4U
         eNJR8kpYQYoUmBcwo/1P31OsCWJO4ftIq1f2uSz3emLO7OqmlXZQQoTpaxr/Y+ZljwQO
         X/ojPgNbDbEqaRQYVrgCQwx479DFSs8Jzoxc/kRxnC0g/KwEA1RdlAxLuVWehRS6YR83
         jo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=vmI5obZJChROSVQzReKLArfFA6O6EbFVOPbqT4ROOPo=;
        b=VZVDRFAmZuY/5NzhnHXjoX9GgKCJprt22xoP0AU7QTzHqBJTYeVsfGXZv54jjgmd3q
         uAjv/TFud3z/+GcmmQ1mN2F4d+vWImvl4RxCpqsZ81YDXXTdbdY7te33+3DxoE1/Ea/g
         H3U25EVQd8vuM0+aL5ylhxMsLe6vjAuRzrFckdmiWvnhEI+Bd0UVzceQj7oUPs70LegR
         O+JNIqJeOCL1Ok4WR5uPVm+9Oc+olACJ4ow9fUzRQcLh8NBaD42KZQ68d17T2D9skVMZ
         yhupin8vr67nGTiuSSkO0g6/rU1VFGXPq4DORLZt4ZS3j6v1ztzbisviu92xhIT9P4os
         L97Q==
X-Gm-Message-State: AOAM533utJ7Wo3LHBSqziy3rlbCHwiZVNV6RdQineL/ub/p7FUYHDza2
	CoayqX+NxzgCXDv23jvS7j0=
X-Google-Smtp-Source: ABdhPJy8a32ETgRL0olBS3qP/6S7LC7VlalHzWMXG4NzGgYhIGqvk2ybzhzIs+cvef4g3kQUc8IN/A==
X-Received: by 2002:a17:90a:247:: with SMTP id t7mr32719997pje.198.1642399256665;
        Sun, 16 Jan 2022 22:00:56 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id h7sm12858657pfk.173.2022.01.16.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 22:00:56 -0800 (PST)
Date: Mon, 17 Jan 2022 19:00:51 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: pi433: fix validation for min bit rate
 supported by the device
Message-ID: <20220117060051.GA10941@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220117055849.GA10644@mail.google.com>

rf69 datasheets establishes that the minimum supported bit rate is
1.2 kbps regardless of modulation.

this patch replaces the errouneous validation with the correct value

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index ee8c81d164e1..f4ac17adcd83 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -226,14 +226,12 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
 int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 {
 	int retval;
-	u32 bit_rate_min;
 	u32 bit_rate_reg;
 	u8 msb;
 	u8 lsb;
 
 	// check input value
-	bit_rate_min = F_OSC / 8388608; // 8388608 = 2^23;
-	if (bit_rate < bit_rate_min) {
+	if (bit_rate < 1200) {
 		dev_dbg(&spi->dev, "setBitRate: illegal input param");
 		return -EINVAL;
 	}
-- 
2.25.4

