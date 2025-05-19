Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24B1DE88C
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620334; cv=none; b=fdGp2YefnjNNXiV1yY1elhL1ZChY81RU65+EgpzDGKAIi7FVUNUFR/w2EVLjz+GLHPgztdcPe5T+s3OZ8fKQ8Y9sn0H+q4td7a2HkJSNDtXlpX1zgM4JOpbcfcnZK59uxJw5CIwWXLtd4GU30U1coIfZrxtyTnBt6Mda7ex3obg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620334; c=relaxed/simple;
	bh=KuNYkTVSYWwA6JxxznbCZ39dzpJPuPVHpn1XlVTuiTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hCvtwSC3lFTudGIGf5EUwKi46ObP6Y1t7RWPSwp8fOtyP3vrhlol+SlTcJNACVa+Fdt9I6k1SCrLPd1QTtp6zKVheQ2S6BXMM2wyFxgfvzT1IBF5iM3ctUGWJDk5gAaQplRLkL5Ye9rnQR82QiBjFTv0cnQyChKdZSdeL2F56XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQNdZV2U; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQNdZV2U"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740774348f6so3594067b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620332; x=1748225132; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfHmDfi+DPX6UiPcv/N0w1gisnR08EyU/T2sRMe8FD8=;
        b=uQNdZV2U6yqoruoP3aJDhVAie9r6eP9x/ZDl3Zl/EHIdHBTRzj5PRfVAzuh8MfF+lM
         kCrO8biRftiqe71XLMyb4ieEPb5iePDf5E8NBN42kP9Wm1cYqSHRXD+JiK3NlPNMvv4X
         B7qKwBSGdgCWCrT7efHA+tQtd7hP5Yl6aW/E0nnNrSOIqIfykyJ/Ll5GD+OeIs3OhbaE
         u89bwQgOEAzYCUJjvYIleGuROxChNb8hGTinodT788QkSRKpiCZ0bb/Fq4V1OehwA721
         v9v+d+UrOkN/0FLfV8rAnwl3RtaBRVUyPnUE6zaa1u9UyAPiZlGTbpfSoWIE86nk4IS4
         xSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620332; x=1748225132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfHmDfi+DPX6UiPcv/N0w1gisnR08EyU/T2sRMe8FD8=;
        b=DzzccyA8d0iwOZ2RI08cQhWV/LBqY+fyornex+v1eCjAwBMsfqlW5fP+7JFxyHd3H2
         jKPGQcc0A9o0NvCZsu8yAyE8TStGDrul56RLr4ulZrOEQkt+AnwJaBkK5iIb2t59KmyO
         dfaXGBynaUweVqK8Kd9drsioTn4SCl8QUZwnxqFdR1A0gldG0CO572yTmGidfIBe/eLk
         pVc9ZI6tTFrvZv5ZryNmq/DstxuRdoEyw7iJnU+wC+0EHlVjMc/6CpNIoz1gSglxWgUu
         6wxcZlypXNrBUUb8fZYNAu45e8r08jlOPdQ9sFWKwh405G7NLqYNoBtiln43aswNMxpD
         7AdA==
X-Forwarded-Encrypted: i=1; AJvYcCXuAPT5Q+4PhNODBpOj3FUdDERj15WgeUjxgH4e3KLymWlDsVInsU5PAselN1d2rUSL55QetCC7pnjN5zDk@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ4WmNWgtHmjeX7JbXoQhJRCWnv80BKNz27ssJF/xsVAZI4gN1
	DqbKe9EZH1gCqxPpbPf3RavDB4zJlEf6fGiPLSg36Twna7TciGUIA5QnMq/BoZP79EhP68S5vOB
	3VFgbnOcevLF/BDYvFIYrtA==
X-Google-Smtp-Source: AGHT+IFWhP9qCzE0xp+jghUcFnN+E/k12ZG/1Uh9728niLyC1prSappxNcMkFk73ffaaGfN/Y5Lbn/I5zuqjnXq6
X-Received: from pfbg13.prod.google.com ([2002:a05:6a00:ae0d:b0:742:a1f2:abb3])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d0a:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-742acba67c1mr13868560b3a.0.1747620332264;
 Sun, 18 May 2025 19:05:32 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:47 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <32daa589cf80d2f6f67ed257aa9397128a5458d2.1747619816.git.ericflorin@google.com>
Subject: [PATCH 4/9] staging: sm750fb: rename `hw_sm750_output_setMode`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_output_setMode` to `hw_sm750_output_set_mode` to
conform with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_output_setMode>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9c62adec9914..eb7bae5e2044 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -394,7 +394,7 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	}
 	ret = hw_sm750_crtc_setMode(crtc, var, fix);
 	if (!ret)
-		ret = hw_sm750_output_setMode(output, var, fix);
+		ret = hw_sm750_output_set_mode(output, var, fix);
 	return ret;
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 7de3a3d44dce..7450eb975b1b 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -197,9 +197,9 @@ void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
 int hw_sm750_de_wait(void);
 int hw_sm750le_de_wait(void);
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
-			    struct fb_var_screeninfo *var,
-			    struct fb_fix_screeninfo *fix);
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
+			     struct fb_var_screeninfo *var,
+			     struct fb_fix_screeninfo *fix);
 
 int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 49b0d5b91183..c01abfcea811 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -178,9 +178,9 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 }
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
-			    struct fb_var_screeninfo *var,
-			    struct fb_fix_screeninfo *fix)
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
+			     struct fb_var_screeninfo *var,
+			     struct fb_fix_screeninfo *fix)
 {
 	int ret;
 	enum disp_output disp_set;
-- 
2.49.0.1112.g889b7c5bd8-goog

