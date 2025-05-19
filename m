Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031181C8630
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620332; cv=none; b=IPUjwmc69+iXMirKvola6Q6tX4yx+beoyB2TezA1vIouiMeuwIC7a+rtLET8F3qX86Hzk6mf3SVj8LTSXAmXRX5ORy7UbP+EeUMQtEylol0hhHFaugOvAL6I+H9GQiQj1zbK7ESQjwC46pBQNfyeo1kp0dEKsR49DXZ6hKOpq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620332; c=relaxed/simple;
	bh=ncET71PnXmAIuxS1eDPnjLvMD/7yLWiphKj4eRN1Lgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=suHSKMZS8drg0HgjtpQWa8Moo+kCH2Akhp+FyOhA0kojIBw8Iupq8uXgDn9c6Phm6oFDjtV+KEH2h6Oqp3lRVnMrTZCOFuY4OmgWH5z4lzfFJ7I4VkA9l2AFsdnJEJparlhvKiRjxwaZTpKC9r5WJ/Ye463M5dB151piN/Ng444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W8KIvUI3; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W8KIvUI3"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-740adfc7babso3108671b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620329; x=1748225129; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtx35lMEeWWAqT/U2Z/PODh9i6/0f0jADTP6jp+X+cw=;
        b=W8KIvUI32ThPDt4wMYJY71PZzN16yN9wdySXtBmPogLKEg49x+tEyN1LcvyUCdsH+G
         YoMjL92w6KQXs/QZ8b/JBHm7w4j4S7v/AhS1XVVIctuPtNKimFrjHj73ke2SqdqE8Cpz
         nsgR5d3s1gXL1/STkuY8vRwgQGIIR9/Rt5elB0+NltlFzM8hETaRV7KQhqiDdm7jSKPP
         zy7P3lEbo8qVbOAMMKlLGRE8ujhN3nSd8jFsTxp2tFyh5RRjJt6TdSdns008DKYbiOxH
         qWkH5UToa9v6S+xQ8VnVV72fjliQtz/DMLoh03Yk1OePNHMqd5et+TRracU8Tm0GzrUn
         svWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620329; x=1748225129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qtx35lMEeWWAqT/U2Z/PODh9i6/0f0jADTP6jp+X+cw=;
        b=Z4b5jrP1azNhXJiIFJrhNIktfMPl6KzJQqxI9uBZA6HkYntXHPb/g9Rg+06bJXa4Dc
         EdV4rSbnc1cKAFmoV3XmN664xMxpATjxBlY9cxPUYBkwjFJYH9JvC6glxbw94tUvyCs9
         eaeubA0OafbAB3RnCS3UP7J+iyw1/A6CMtevydi5cJQubjF5DphMKratH14l3EZmuxq9
         lVUp3TuILWbHXzHwdx5kTSr8f+WhUy0jgP80lpaUvpmqiJl0A75FBMPis+XbkzdcKvHm
         kUNEQkGbTPoBQhK5PoS3NCPaLc0Vt9zKYfjs2HQ0tkqSp2w1FnMi1M1AICGwIEjW9PUW
         b6cw==
X-Forwarded-Encrypted: i=1; AJvYcCX+ZT2MO5rhEpwJ/yxEziv9llnp5OnllryDbg9VBCvez45FFh6cQbybplLW68v4pCZIxj/AVTK3XCzcabm2@lists.linux.dev
X-Gm-Message-State: AOJu0YwaewShVtVUx0Q0NgCaF/HvjnJIXwFfNmc5dy7Y/RqBXFkFzUW4
	k8S3g4x1pb+7qwrtycTEjplh1CsLd78PpYmkE/Jx9hHie5Q1fImnW4aTEoZibWRmjOWiU0mwub+
	ClFHswV7zowp2KpiFM5zHwA==
X-Google-Smtp-Source: AGHT+IG881scAg6068dy4VU87+f746XKKj2E3wn0Hst8ag8ARBHagr2MNT6C67LOjGi+Q28aMdcJxsc+EbqZ1Dgx
X-Received: from pfbeb1.prod.google.com ([2002:a05:6a00:4c81:b0:73c:2470:addf])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d19:b0:736:41ec:aaad with SMTP id d2e1a72fcca58-742a97e6b2dmr15128592b3a.14.1747620329219;
 Sun, 18 May 2025 19:05:29 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:45 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <2d94a42ca51de9fddddb64f74e217dfb2e0c7d1c.1747619816.git.ericflorin@google.com>
Subject: [PATCH 2/9] staging: sm750fb: rename `hw_sm750_deWait`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_deWait` to `hw_sm750_de_wait` to conform with kernel
style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_deWait>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d74836fbdfa3..6a6b48254af8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -609,7 +609,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				    hw_sm750le_deWait : hw_sm750_deWait;
+				    hw_sm750le_deWait : hw_sm750_de_wait;
 	switch (sm750_dev->dataflow) {
 	case sm750_simul_pri:
 		output->paths = sm750_pnc;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a797985a4df7..e24ec6a9799e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -194,7 +194,7 @@ static inline unsigned long ps_to_hz(unsigned int psvalue)
 int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
-int hw_sm750_deWait(void);
+int hw_sm750_de_wait(void);
 int hw_sm750le_deWait(void);
 
 int hw_sm750_output_setMode(struct lynxfb_output *output,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a5bb067b30cc..5a6ee02bb95f 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -521,7 +521,7 @@ int hw_sm750le_deWait(void)
 	return -1;
 }
 
-int hw_sm750_deWait(void)
+int hw_sm750_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
-- 
2.49.0.1112.g889b7c5bd8-goog

