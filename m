Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D31E8338
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620338; cv=none; b=JYeNZuu2QJCEKAr6BdXl1W6kohsXrGAbsLV75RhF1NGWdMcsRPcyHIZS/1ikugFVjenlrr4B/S36QwmkgGtsTh6GAuO1eQzJDbvlWSRBlTrtDLiZWswWIHKgCwgiPqA7huR3RbmpkVvgc6JAf17hooZnkjfVcmhww+AUtZYtro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620338; c=relaxed/simple;
	bh=SlSjPSx3oORnZac0lX3df2Lf1XLvuji2J9tmHdBTFmU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N8nmQOriajGHEL+YOqnPsRgGRvVkvIlmb9CdLjyx5lEhZWkxX1sDtcZPgi+RzKgmkv/itavlmZmqkvm/ilOQzBKN09eaWTxJ98Hula0p9vqYQowPN8KtvZH8WLtFLbicsXcLn7MjZqGDs/vBi923sgzjQNuNt6zpnoaLBxssk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hwMCOIc9; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hwMCOIc9"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1f71ae2181so2449505a12.1
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620336; x=1748225136; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRY2y3H2M0g7eU6al4Bqcf8B85yBAZ79K9H+4pojmNI=;
        b=hwMCOIc9cGewUx5Juv87EVisaPh89Uz8da6QjXWeCHYpEW4ATYSZVjPCo0ktEH3OI4
         TTJVS+vmqD9QBl1eLsLsBMCmgxMEhkhc64KhrJj+q1U4rKcN+sPfvxCis57XFhH7DlU9
         o18Jk2ItXxNHfuZHwoIraK0nUxAWj/1sOj0X1HyFqYI9lHrTQy52taDzcvskpl0j/i2R
         aesJmpFWLR/Xw57Qt+PuGj1klfCbojSoERLSXv9Q+WlEYzz/r9ilMGBSEJ+MKDG04PJK
         8b8S1GvnUVBRrlc434uxYzSb1qda5Rwb9vSYNzqNjACUS+5dg9aRXjQMxKtWs7SfTwCj
         TOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620336; x=1748225136;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRY2y3H2M0g7eU6al4Bqcf8B85yBAZ79K9H+4pojmNI=;
        b=p6ltgDnSwEURecVWniDgCcH9866SLMvBpWayqOO9tb61W4PCMnKI6tn5jC0AruIhQ5
         axfICDqGwbledm1p+gvb8UwqszspfZcejwL0TlXv1MKBO7NQPcIelWhHcFzQBsfuWsvX
         YjTHO+aTqbOIW3f/KsfFBPhZcxqqP8xUjbCQdQhoIoGFnGHTs9C9P61DHZfywh86jW8v
         ntRXD3DBpaGIbAZEsOZwIxFFnHFEhCYg2ZPQitX7FXdT1BJaZ07Bs0MpqMXOlkRucqJY
         gI7jAmdFfSc799LkTX6UXY/edIEhuFKCbQZmmFg+HWZZ/OLvBRst1tmXm79Bi8lunV0Y
         shbw==
X-Forwarded-Encrypted: i=1; AJvYcCVEKO0BxihOcY/wI4F4YrdMxkw8vSvNOIgAIaHpW7cN7937TmpEuk3TN/35oahaJ1y7VeuQMwsoaYPTLPCf@lists.linux.dev
X-Gm-Message-State: AOJu0YwU+PvCJuPQO8VPlB5RCjFPRKsFg9Au28HudhC5v7jrFaVe7Dp3
	q/ZQ2zYliuBOUbS/BVYAPIZ3Hpk47J4aeA8QWFrM46IGTu5GzqOpclql8AnqWWEoTdmJcUcbux+
	UQdfgoCkoXbK1b0aql70kqQ==
X-Google-Smtp-Source: AGHT+IEgLCPDk0lcsU7PJBMeeeiGHkBU66pxZpAlFPIjVpPOdmqlIvYYUbJ1ldSdTgpALODW0ZliY8tcKqdF9dmG
X-Received: from plxe16.prod.google.com ([2002:a17:902:ef50:b0:220:ea57:34e3])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:dacc:b0:231:d0f4:6264 with SMTP id d9443c01a7336-231d43d9bc0mr180230995ad.10.1747620336559;
 Sun, 18 May 2025 19:05:36 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:50 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <3d4bb87742eee4a6792bbdae893256f621ffffe6.1747619816.git.ericflorin@google.com>
Subject: [PATCH 7/9] staging: sm750fb: rename `hw_sm750_setColReg`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_setColReg` to `hw_sm750_set_col_reg` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_setColReg>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 5f4b0064cf92..935c7b1a0fa4 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -545,7 +545,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 		red >>= 8;
 		green >>= 8;
 		blue >>= 8;
-		ret = hw_sm750_setColReg(crtc, regno, red, green, blue);
+		ret = hw_sm750_set_col_reg(crtc, regno, red, green, blue);
 		goto exit;
 	}
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index db80dd295658..a70f51d08dd2 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -208,8 +208,8 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			   struct fb_var_screeninfo *var,
 			   struct fb_fix_screeninfo *fix);
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
-		       ushort red, ushort green, ushort blue);
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
+			 ushort red, ushort green, ushort blue);
 
 int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
 int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index d3f218cb20f5..04a0f9218eb8 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -370,8 +370,8 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	return ret;
 }
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index, ushort red,
-		       ushort green, ushort blue)
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index, ushort red,
+			 ushort green, ushort blue)
 {
 	static unsigned int add[] = { PANEL_PALETTE_RAM, CRT_PALETTE_RAM };
 
-- 
2.49.0.1112.g889b7c5bd8-goog

