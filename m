Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27020AF62
	for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606218; cv=none; b=cD+9h4jWa2LNRzFHHsbT/lzxdytr9qo3PSzPJRdqwBFK0pVFQhnTx1j0Avu1rSrCgeIj7Dzo8o8zZQAkQR7nhx3G7dSboodgBMvEWr2CxXYPZfEAs99o3ip0mW01hSg57mn2DT54p1O0Gyg/j8Km2vaibXCR8r3oyjz7q4Y754Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606218; c=relaxed/simple;
	bh=SWvGIfkhRbWfeovnI48bl+Lss7+3GtniH+IW64+H+po=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RzdeLgNM6kfPrPf9Mh0lYByg+AVjEeBapFHnCEISdpFPcCGSn0GG2Q4zjVRdEixJceF9WNaMcx3Wl5qVhFkxTv2M7PquIXmgZmc+75LHsfWb+Quv9dATETh0qsD6Zp1xhPr3N83pqKRGxaDUuBo3UvE+A6nrtJmua01jeKhD+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NP9BnjWW; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NP9BnjWW"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22aa75e6653so25399075ad.0
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747606216; x=1748211016; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgIN8qU07WLqB2jI+fLrkDZZnm1G0XlzsKXj9QMd8M=;
        b=NP9BnjWW/JFEe3m2LDLlmTuq+7/Lyu6HSsoFq/aGCobmpIGXuma9KcKDUtfLPi3Cev
         Tqe/9FV1Csq3NmILJOeeCA5wt4ocDCWZIcyYjBgEVyHH0b2PQ5PakIiblLEqFn9t5qJo
         2+zSERSbCIa0glgsoiW1zV1VDvDl0bYbhIpuWfgrgE6oUAnycSZugyyPVNaDY6gOO7Gy
         GIzBaY9aZzSE1yJQzr2c7KcGcritvF3tBmXUC9FjPXHrkrb9G4isxfq82fPbdyM/ahVO
         0qewvQANRE7oJk7vgxX4q/pliEdftmlzkkfdmjcOSAC0+II7x7vTThH1oCsmxEfbOuJA
         xiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747606216; x=1748211016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgIN8qU07WLqB2jI+fLrkDZZnm1G0XlzsKXj9QMd8M=;
        b=NZwfKydy2H9BOIMVqcXboNzXFhpoC7CoUvAHsqOTBEcBNmvdy+hObb9aiBA9hYa3HB
         GDbZd/K4OLlhc/ZJibSuV8r88HKW3bDzmEYFsKerKL8/denFeU5CfjNG6SUeLShXHTUl
         f7JXIRSkH8sO4u7JLaS7ADFRSYhIjvtgYVzHgKpwv7zFMs9lii3v57Ge2InkbTX6/akb
         dt3w2QiFlSHk/9bwa5ibUaL6tm1XWbyyyrVqOQpR/jNYSLf/72YE5kVryqiKi0KSykJ9
         u9Vls2JZr6BYOcK5qSjAt4ldFXvCq8oLctk1grSn/xXZJ3QIIwf/5ZKjtGesejCseYzq
         1+sg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4LL5n06zNyAgku3vnllN2NHoVzQfkdfFmxFvZxrYOelZkT8X1/oCpUPMiQ+QrzsLSfh27sDz6AvRVenQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Ld2wVE3rxGH2F5kvc9Y3odzC7y8htTo7DtpQaM+q6XKA+0S5
	QKhs7JkYnLotVFwRKRa0iGSR7y2O5NziTAX/VmMOeAAOMai/tdkDkY9EHwYry6kKHskPb/iS5vT
	m1FE8ULfKfWd7EmYi4HvM3Q==
X-Google-Smtp-Source: AGHT+IGfnAPZYs1RjIQmyMNTBGtrRdET0rahQn+Z7K88kjkMkyG4PvQjlMM8Jb/K6YInMKuOlOjUwZPfuWnIm9Fv
X-Received: from plbmu14.prod.google.com ([2002:a17:903:b4e:b0:231:e2ee:34c9])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4c9:b0:232:202e:ab18 with SMTP id d9443c01a7336-232202eac80mr53400845ad.26.1747606215822;
 Sun, 18 May 2025 15:10:15 -0700 (PDT)
Date: Sun, 18 May 2025 15:09:47 -0700
In-Reply-To: <cover.1747605658.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747605658.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <97fcc39f3e63f465c49e8725d10f7c43fd35cd85.1747605658.git.ericflorin@google.com>
Subject: [PATCH 2/2] staging: sm750fb: rename dpPortBase in lynx_accel
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dpPortBase` to `dp_port_base` to conform with kernel style
guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dpPortBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.h       | 2 +-
 drivers/staging/sm750fb/sm750_accel.c | 2 +-
 drivers/staging/sm750fb/sm750_hw.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a2342c69a65a..0ed1e18611ba 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -52,7 +52,7 @@ struct lynx_accel {
 	/* base virtual address of DPR registers */
 	volatile unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	volatile unsigned char __iomem *dp_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 97791f1b0123..7ac2e7b6ea0f 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -29,7 +29,7 @@ static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 
 static inline void write_dpPort(struct lynx_accel *accel, u32 data)
 {
-	writel(data, accel->dpPortBase);
+	writel(data, accel->dp_port_base);
 }
 
 void sm750_hw_de_init(struct lynx_accel *accel)
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 159a5ad621f2..75ceb594fcb1 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -59,7 +59,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
 
 	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
 
 	mmio750 = sm750_dev->pvReg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
-- 
2.49.0.1112.g889b7c5bd8-goog

