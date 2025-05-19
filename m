Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1E1E0DBA
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620335; cv=none; b=eWcUXxX+/CA42FqsHAy3lGu4eiMBRmvxCxdywu6q2vL8B/5q/LVuh5AFzk0dckdFjD3QM3W+16TGS61GYZmIqGp7RpuTId1nxsffq5sJHzwpe+Zs0EF0ozGFOE8Y59tafeKE4kuo5UUMZd4/mPuhLJERlpcvz8unS1afFHhHpEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620335; c=relaxed/simple;
	bh=vhlqpmusHxL1JZt/ZFHIB7uvHtunhIURE7yXQKjBzcU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=StVNoLFNLBBbEssvZGU/kaNsmZqBk4zbkrBaiuT8giXQQ7kmI+n6Jswdp10GKUeqxwJtcevfJIq7eAem9cVEIB+ajW8r4azK5MWs9r6nYgH+TFqBBhWus2eCh6XF2i8z4ZTDHvzW+kGOrRZClZJmXRg3zxZImG9bTmoZ7EdkJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UStSrXrl; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UStSrXrl"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso2899341b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620334; x=1748225134; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozZypt7suTsjkfADlsvIHKWSBSo/SCbJ6vLmSxOgWCg=;
        b=UStSrXrlKs4TAv5qy8aquKUebaj4JBlvmIJ+zbyXzzpfItF6s+01LW6GKcZ6Kry1z/
         By9PTFYIFDEDjqe3gqaJAdRLY/msa1OUS4AqAAJsi56o6XaB9t4/fAmSYfAuNNGtb4mp
         /sZcBwfycbbo9FjIVAAAbr22Q00c+9vsxHBZEVS2KHPXZvnbfoM7x8FnrhhPa/ANJv3a
         4fweDFV5BgOoh8Mf+arYNUgidFF5Lk+6c/LOEY2IXVufGiA7wwmkhFdhYFCMgaqlG7tJ
         yrG0xQQAGxyyW7yyGlRY9zHz/QvmQbhXZ6iTRCRogJJKpkUrx3ySeo0uSoqKhikM8OWY
         oBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620334; x=1748225134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozZypt7suTsjkfADlsvIHKWSBSo/SCbJ6vLmSxOgWCg=;
        b=PNwxWWt2NDrILlk/so0lPNk1ATPonfhsBuSZkBnAvqlZd+RKqUB/HryfrC5glACpHd
         7YRzzypSRxhFLjJkGYnCVHKwkPKqEgIXWB9Ht6qm1+OQMzhis52N0Jq/Qj/Ed6k53gq8
         7S2Wil1Wkh9+RWnt/1Ucm6He7OKX0FpjchFJoQ+RleDKC/lU99gCxQPSlL0Nu7GOks/X
         eYoWg+kyJcw4oixskmZEGo4+KvkZORsveVUCUJRco7AXG0Jak9YhOEebJyoEeAcJqdO1
         nuaZe6JqK1yZedOU0W1T1CODS4Phpb7HQWxatibRnl6R4aOJqOW3JlyLi7qRQsLIxV7w
         6vrA==
X-Forwarded-Encrypted: i=1; AJvYcCU/xXW0aP1HNc1NLtnRMA+KVmbBy+i4Ey4fGg7KuEUAJjaqIE3qdm19pXTKFRl6AqM82R0BoUghXWW0mfPk@lists.linux.dev
X-Gm-Message-State: AOJu0YzyvG8oMSr4EZK4lLUT9U43Z+0HLxZMIbHYVpV5gEmqop3KYmo3
	4J4sh8wsKOMiRjMG8P9zj/F2CskycyTmQvPtgePBV8InHC6MOCpxMJ6fqQdHxRCrczcPLOEby25
	lcTbPKxLt+FaoimPQpBPjZQ==
X-Google-Smtp-Source: AGHT+IFfFJCU+UjTSG6OaFb3YmsS2nc7RqgXiBB94gS8wlNu7QImZL00ebeBdfbpdye51BoIWeJb49t2p8OWfE7o
X-Received: from pfkk22.prod.google.com ([2002:aa7:90d6:0:b0:740:67f3:214c])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9185:b0:736:3979:369e with SMTP id d2e1a72fcca58-742a97ac52cmr13156659b3a.9.1747620333701;
 Sun, 18 May 2025 19:05:33 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:48 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <546e9abb8eac1be75f47b51460ab69a5736d8a99.1747619816.git.ericflorin@google.com>
Subject: [PATCH 5/9] staging: sm750fb: rename `hw_sm750_crtc_checkMode`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_crtc_checkMode` to `hw_sm750_crtc_check_mode` to
conform with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_crtc_checkMode>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index eb7bae5e2044..d4596590e266 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -512,7 +512,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 		return -ENOMEM;
 	}
 
-	return hw_sm750_crtc_checkMode(crtc, var);
+	return hw_sm750_crtc_check_mode(crtc, var);
 }
 
 static int lynxfb_ops_setcolreg(unsigned int regno,
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 7450eb975b1b..8bf70a3731bf 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -201,8 +201,8 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			     struct fb_var_screeninfo *var,
 			     struct fb_fix_screeninfo *fix);
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
-			    struct fb_var_screeninfo *var);
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
+			     struct fb_var_screeninfo *var);
 
 int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c01abfcea811..3cb69a471c0a 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -219,8 +219,8 @@ int hw_sm750_output_set_mode(struct lynxfb_output *output,
 	return ret;
 }
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
-			    struct fb_var_screeninfo *var)
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
+			     struct fb_var_screeninfo *var)
 {
 	struct sm750_dev *sm750_dev;
 	struct lynxfb_par *par = container_of(crtc, struct lynxfb_par, crtc);
-- 
2.49.0.1112.g889b7c5bd8-goog

