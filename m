Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802EF1E9B23
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620340; cv=none; b=g55182phHi5qSBx6AJR3fh7LT9X3GvRRugVF9JGYK2N3InU4qisoqAu6xc/o5xClIjMe+IVWh7OvvDnafeLGWeRkZ2z9Hu855ndML46RFIIDwj8/DLBPmUVG4yVrixQxOw0qY9HbUiOoai+K9ZqxGv/l4NMkTI2BvynPqSSYwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620340; c=relaxed/simple;
	bh=Ir3qwYotxNrRx5ZxChu6Iu2jJnsU/GgC2Fht1CI+cJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DNfmXc0+6RJ26pH2LAghe4jtQTjIti0ld/vwP6+kID8FTs758QbApgd+ybtpwS4gb1B/lAqjCWPNnkAUmctTMcqtcrso/vJqtAazIeMOywkGqGOMla3pJZupUZsT+GYZvP/q/GrQr1fL2qbGlWTtOemJyglI6Zxc3ktg2oxZ4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ENOw4+iR; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ENOw4+iR"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-232054aa634so10389075ad.3
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620338; x=1748225138; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ia1JORafIKNf9NZI5rHJee8OYvmSWCc+nVXQMpMhVBM=;
        b=ENOw4+iRyiKWfENsSMk/3WPX51WIvr8t6WUC4b1Al7SE6IauHMbnq2zfjiCx9xmQ7G
         jaUc7bDyOXZOlBD0BcfuVis+UlJyeBl2c9XH5U0zy1n46Nwjryo+CqLivHf/4su8g1IN
         ppwR4z7sh876L1i8vslNDqmGbuZNUt/kbPA/21HA52lioohb342uwS1rDLpTqFe2wjfb
         lOFjDYMBSBjibCIp7WGpOn8rhW+9Q56X6RT36pcpIDb4F06dWNaBuYAXKrE74gIT6heW
         fGhR6HrX/gvXJnyjvONhNtcURmppAWWlY9vJ+0i0oHrnuC8q6LXzgL2j302lKSGWRHVL
         xtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620338; x=1748225138;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ia1JORafIKNf9NZI5rHJee8OYvmSWCc+nVXQMpMhVBM=;
        b=jyEj+Y/AtCRBsw5/5U/1/qGN9AStdEqC5r87TDRif/RWNZ/1cWf8ttUNkZ47UwgDLb
         dGR2NP4jKFXG2vFY9ZLOL7ttKFn2eZMxW2FPSK+8KtJSDdIQqQpS+6uVyct4Fcj315a/
         NmDRwHebSOpy3mLKi38gfe29VS+3kV0I6y1IOFqmcFXYS55ZIC28BHti4OzuwKiz0uxJ
         oI8Bu7BKIZvjhbI8J9/TUD8+jM8hJOJ7h2B04DOp/9yFeNB4jnREB3np9ZYZrHgHfVLC
         rD4zzn8GgZm/KfZBeRiLMoQqvuouQToHklEI7G5/o7HvHEV7FJAHCQKkZ8BedI0QPQn2
         WRuA==
X-Forwarded-Encrypted: i=1; AJvYcCUGKtq8sJcklSLZtajcNuiTXO8LMmTX1zx920nbaJAK/a+fgMKdvUV8z89DpZ3TGFLlZoLBIkgM6CdADItB@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn+GqE7+x/CuPoO+BXVrLlKAx8557dgbtL9mC1azLEvSXzvMj6
	Qw3a0eIANWiik94AzuJQBBfkB/yurw8fU26+59glHxgjXwmdMq0ETtC2TfvpWEQHpqnSdKX2hJ2
	TIANikJYgFkBUeC/AknPe1A==
X-Google-Smtp-Source: AGHT+IEYub+CaQOwQjmJw5cedeG+QL91WXp6CF/LfCf17xPCOhRY9xShUpV3HD7yhcXlneRVxb9kapYtnJqa5486
X-Received: from plbmv15.prod.google.com ([2002:a17:903:b8f:b0:220:e952:af68])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2452:b0:223:628c:199 with SMTP id d9443c01a7336-231de37fc12mr145942715ad.52.1747620337952;
 Sun, 18 May 2025 19:05:37 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:51 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <e00a39ffba89e000fdf8dc277166297d995aa891.1747619816.git.ericflorin@google.com>
Subject: [PATCH 8/9] staging: sm750fb: rename `hw_sm750_setBLANK`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_setBLANK` to `hw_sm750_set_blank` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_setBLANK>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 935c7b1a0fa4..eb7e107bae68 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -606,7 +606,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ywrapstep = 0;
 
 	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
+				 hw_sm750le_setBLANK : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				    hw_sm750le_de_wait : hw_sm750_de_wait;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a70f51d08dd2..97682cb8c58f 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -211,7 +211,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 			 ushort red, ushort green, ushort blue);
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 			 const struct fb_var_screeninfo *var,
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 04a0f9218eb8..c64807cd06b3 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -421,7 +421,7 @@ int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank)
 {
 	unsigned int dpms, pps, crtdb;
 
-- 
2.49.0.1112.g889b7c5bd8-goog

