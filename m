Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792925646;
	b=W11xo8zHjW8MS2FmSxOWJyf049bYFaS9dVq8e1QowaZlIjMWxoKKudhXSKe9+de16hj1
	 bFplfhjuBrkn/jHFr9mCL3iy45ymZ8lvL49mmmPknx5f8X3b4ycwe0YAdzO83F1LYrNo2
	 VJiNCuBpfsLeNWF6S30jMuS4PhiL557VO3xCUTwwwIjQ0IIUk3VhRvUL05EhTJDJ2nIdB
	 4vvC+PUOS8KuqpALRXrNP2LQfm5yjrGR+7yPF/85UTVWENpOBv5wGaoMgyFp8EQYEpW7w
	 mE/PhZrkUi9gwm3T7j8UFYpAdzNKLoKDWHstpqU7+OIR1u5U3ZlIGAIfmfvfs9s4MAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
	b=bF0BBV2mO8BW70TasponRrJANY+/hoGRbw21XX1JQ5sdeBThur76cBEu8NKMDQx9dVvg
	 jDtL+1MSnKxoEZuJzY/DZrIty+mzDQnLIGxGQzXqEkBux5i086KeNyc/F4hKakZ8+Pkh6
	 aMbJqVvGm/O/gwsW58wup7yj1DKfcsF0Pf0y/TURxjo3sbGLVFOi4UH8MXmpuMdj9Keat
	 XartIZQ33tAYXWkVPxEHhTB42CAH7UZesWK08vA0/MIRwnVumPGAvQuEsfAp4Z3yjveyn
	 pCRW2if8Jlt2az5Qsa2IfoedK4aLbjlRoDYSDT26yRw7bStddexs6DPC62h3XcpMc/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CN58dwws;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB96606A31D
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 10:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB96606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CN58dwws
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso313934866b.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 03:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925644; cv=none;
        d=google.com; s=arc-20260327;
        b=O+VL8gp9CN+grxGijzbII51cIIRmfdeUzI93defS9yOkeo6GaUeZF6QUk/v1/fXbLX
         e/24zbZXsVyopQDMy+ItgOebM45QQ4ZYb+zSIwjYNKsz2VB1M/RNWxC1ClbMJNLBffX2
         cxtCWbhKCBAmXiLUEpaPtRWabqpg9o+yPB88vph9khOlJNK0p1wYKstXtqOxKmf03kc3
         jv2A/HE43ESO6wXbAZnOYF/+SMPviASUaulZxVQ96ni060w7lINM25tllqqvTuWap88p
         UQaooGO4bqE4m/qq7U5lyc97u0GpA49uMDek3XyIKqCDy9Bl06f7C9ThF8t1olBmWhzi
         FGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        fh=DeVw2MT/j4CtdCxLIHZdLlDTCqdKU2bPdX8d48eOkng=;
        b=bYuHsfBDOtq3w+uK0Da5cW/AS7SlpI5Pftze/DgKf/NkYB6IeBeddLYb4t/9Ul9CMf
         GBTNryRNNl6iVBPZtrnZ55Ult/taLdj4++Jz5oxPbarCd5xHJmvWG4QanwQ6gjPTPgII
         hgkFY/rnHL8z4YeQL7dHJ5qQifsgpUbgj+DCLtYpwjQCtFCLHezqSHUjTORHF7k54X7h
         sWGCojojXVWwhDahVHvIOIKDD2T/fQ46LIe+ZxCm4pjNFmE59zJ1jw7bSIPGcMakuwAI
         XI/0JN5twqm2KCNywzhYomo7+zYY26MNHY99hBSdS0hGy7rN8c72/OLjLPUpUfVeGeBX
         GPpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925644; x=1793530444; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        b=CN58dwwsfQL5uuPoKH0CZx/zXBAak+FKG/LXbWyvSdPdv91EWHvC3LGTOd1KtogmmI
         VU/SX4IizQ1eetduFkNcqiybn7tREpdofIHg8w8CmVEzIIkGtlfb6emT5fWfhiXAGmLj
         +80IDMkzRkqIZEMcu5vjJcn1GpSJbaInJZEuHU/RO9cunlq+AcNQf3UWvndJXu8d5Jbi
         YlTnUPx4PfqLobfLhWO+DV4eIqoffc80137Wg0xUb20ehIHwEpd/QvUcZ0qPBXpQDlbE
         i5KBv4fNSFU/bimDXWrkLJYBUbcT7Xrwv2CNHcV85aJb13FA/QzsX5pbCvRARTHkJoNQ
         xz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925644; x=1793530444;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MtahZLniFEJWP8SrmHT3ICGVYOg1SiAxfLPOaOBltmM=;
        b=Ntv1G1Ji5VWygEt+r2VWuDB2c8PKuL24GVnCoI36rjgN5YxBjpSwJdYbu6gY9Eo6TU
         mH/S2V9DeUmHEn7Mnq6YiKDa5U97wRzoDYlp1dufLVLVzCZU9K5sNv/aeBzhqe7EMp3i
         jlkvJundi5FaGBY5Bp0XvTp1TbkokPOj0M6OfHqrYE0y4+hS2nkPr1qyYXpoTvSE7HXt
         sOFwnXQWxyIchBJ4RiW0ggMHscNGF8OxHuElvEUYgCinWrdbiuEo8oCsD6QRSZ2eeej3
         QGHfTv1CrdGqeanskTZF+9V/YIrJFexRxK/wZUe9rd51Kr5HwG0z0RljyWkVyP6W+s8n
         cLAg==
X-Gm-Message-State: AFq9FYIuhCVtGYSSYSfswC4n0L5hUGBOsxdvVA26eT3hm8C71xAOsZ+n
	hieWE+mlkaA9lVZr8KycmzfbHlEQvjtCxt49PmhkiPGogFPpYkdg+tagD1+C6omaYWLoEAgIQRH
	QREzOfyIThSm5tUKc8197Xff/c0Qb+v8=
X-Gm-Gg: AYBFou1PGw+Wqyzuq6Hb9CE+lOMwqypyLcQpXqCd0vtTNRviBSNWnWhNrcKju9QOhMw
	p5ZLGzteykIl9dS49VvoewMB2g+GdOgBqXjwPRhKhSE8gjWvIY80JM6CBRB+o7yxVHsV3se7eYP
	oRcXU+mQB1+bKdd6MjaLYY6mDuV7utwRxSSYBafKv/7VcDkNNEYsc5wtJ4Y0nBDOh0MiIruKHjk
	bZdDnhDacZg8rMz503dI9KgthkU7XRMxs5CQuucrz7qkj2snro1KMUtGSUl3ERVupODk5aPKE+U
	TNF1A08XB/91J+xAURopiAzqTImtF4h/GiEIfdLQnSsrFjZ8FkXjKUQMco6murJ06CnoVfgkqeo
	+dYDJ4lTMgysFbU0QPcYdyxs8RdPcxZ1tcvXnk8P02gQG82Utb9M0Dd52NvZfWYhb796q
X-Received: by 2002:a17:906:dc8b:b0:c29:659e:2fd6 with SMTP id
 a640c23a62f3a-c46bddb549fmr450364866b.10.1792925643928; Sun, 25 Oct 2026
 03:54:03 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 11:53:49 +0100
X-Gm-Features: AclHuK9TY3j97je9JyLB2E5dU6k-0NiwAm7rcWLnTy2tP6DroPMgj8seRuA_E5c
Message-ID: <CAHxSwT8zGKHDLjAbkR=EZL7QVwzS_47TPB283YTHKEQsE0mvFA@mail.gmail.com>
Subject: [PATCH] staging: fbtft: fb_ra8875: Replace mdelay() and udelay() with
 sleep alternatives
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"

From 474546adc013fab098dfda25e6503413fddb9929 Mon Sep 17 00:00:00 2001
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sun, 25 Oct 2026 11:38:17 +0100
Subject: [PATCH] staging: fbtft: fb_ra8875: Replace mdelay() and udelay() with
 sleep alternatives

Signed-off-by: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c
b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..ded953636 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -47,12 +47,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0A);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period  */
                write_reg(par, 0x04, 0x03);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x27);
                write_reg(par, 0x15, 0x00);
@@ -72,12 +72,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency  */
                write_reg(par, 0x88, 0x0A);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period  */
                write_reg(par, 0x04, 0x82);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x3B);
                write_reg(par, 0x15, 0x00);
@@ -97,12 +97,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0B);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period */
                write_reg(par, 0x04, 0x01);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x4F);
                write_reg(par, 0x15, 0x05);
@@ -122,12 +122,12 @@ static int init_display(struct fbtft_par *par)
                /* PLL clock frequency */
                write_reg(par, 0x88, 0x0B);
                write_reg(par, 0x89, 0x02);
-               mdelay(10);
+               usleep_range(10000, 11000);
                /* color deep / MCU Interface */
                write_reg(par, 0x10, 0x0C);
                /* pixel clock period */
                write_reg(par, 0x04, 0x81);
-               mdelay(1);
+               usleep_range(1000, 2000);
                /* horizontal settings */
                write_reg(par, 0x14, 0x63);
                write_reg(par, 0x15, 0x03);
@@ -150,11 +150,11 @@ static int init_display(struct fbtft_par *par)
        /* PWM clock */
        write_reg(par, 0x8a, 0x81);
        write_reg(par, 0x8b, 0xFF);
-       mdelay(10);
+       usleep_range(10000, 11000);

        /* Display ON */
        write_reg(par, 0x01, 0x80);
-       mdelay(10);
+       usleep_range(10000, 11000);

        return 0;
 }
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par,
int len, ...)
        }
        len--;

-       udelay(100);
+       usleep_range(100, 150);

        if (len) {
                buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par,
int len, ...)

        /* restore user spi-speed */
        par->fbtftops.write = fbtft_write_spi;
-       udelay(100);
+       usleep_range(100, 150);
 }

 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.34.1
