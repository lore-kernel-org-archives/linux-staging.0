Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038CE1EB5FA
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620341; cv=none; b=IzqsmyjbGdP5UzIdcNpidUh+CRo6xhPCRhBLQVDce8DFf8BCtCGlBoB8EweEVNA8RSQ5LYJpxR0Fv/ppJbSyP7tOXIMtvluern2i7v/+2c+dML+PpTWISVWttvryEYcsfHMGc4Q1D7vGJ++bo1Lpccauhc4GSEHUgaIeT13gEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620341; c=relaxed/simple;
	bh=AKhe5ID5VK2S6HH9G6o71QeG8NKFcce9hHnzsprFiNE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sr04mj62cOtIVY9BhOYvUaXCL9APmYer7sZsOtEAtr74uUo0nZ4CFJ5B9i6Fli8Kebbt5BuJqP2YcXvKF+spEc9JkX11mveXm6L85Inf05k1Vb/Gg7jm/qaG5VvS9tOr6sqNaUxc+hv4VNDX6pD0N7PDDgvqWdvr6UqOrvSnmhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QiD+tpZN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QiD+tpZN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23209d8ba1bso11237365ad.3
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620339; x=1748225139; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CfAlzniXrPMCrfJTDn2fGDeJE8Mig3q4QY26cxe00ok=;
        b=QiD+tpZNR+r1Kk2eHrxEDAZxToZypWTE1DZyjEwStMpVBANnnddvaH6IZtv7RreKRM
         UU1Tk7SNrK1nY5UlRUhmM8gxXx7vtFclbCwzgTk7A/uz/i2S8JhtWIUU8jVl4VaxQmah
         LD6Qwzc6f/Z8rZeGkhnRNdpT8q5QWPEDgPN2E8mBxGgqwZHTHHFxyFigYpIXnu22Y94d
         ONBhUN9Mla24nsFkDSAVKJC41tSxxT9RDU6c//hCtQVgtKXRjPNBReitsgtXjWdTs554
         s02S8sMqX/RbUzt6fU2ymvNBtH++Tdc3Jl0lNsHXbq5EILBUMC8OUgeJnx/Yx4NsN+9s
         9h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620339; x=1748225139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfAlzniXrPMCrfJTDn2fGDeJE8Mig3q4QY26cxe00ok=;
        b=DlHgX5BV8wMo137tpgN3hHI0KwraIJXT6TwSEGKUSzkzrz+rIBGqXTd7Wi7iUIXU3e
         Ha2quEyJZtUAPnaV8UmL7JYYt7fodQj+YjTgPvl8y+41TCoNLr92cDM9+Z1zVand6cWn
         56/Xes2L7MpYAHOpKA3+kusyonVQYKeDYEsNhvCmW3KC8RZoWQEW597sSlG5zks1WYRi
         kUO6Qm3U0SgfcDjASkefOzIVM7acAE6DQbRlDboS1vuGgMvEV1HKELcU7wPPu/gXu2Oc
         FvM7YfeLgrB9SYCtBS0d3jPLCPNaXhdcokTuu4Q6psNpbZZv+kXGCKpdVvRGMGkmS2k7
         Cqig==
X-Forwarded-Encrypted: i=1; AJvYcCXslk/w3uiivTHwjMJjXEuazOj9uJkhVruSjyWhbvHIPiki44ikq4CNSQZ/9nlFiiIB/TIEuf9KlZcvnoqf@lists.linux.dev
X-Gm-Message-State: AOJu0YwzUkTf5ZMxyVlVaN7i5Mp1C231ry9Xl4G6DC3jmiBKN7iAja4j
	RBLdE26KlVKg/C2unkMG6FgjkAYrzHvdzkItDeZjI8T1H7dUa7gChonPqgzuHxWmLYf2tbheYH5
	emTFebLZjjARpvmWFQWG2IA==
X-Google-Smtp-Source: AGHT+IHy7CwWC996c0uz/P5wNRBqBpd0SmONFgiUZ1T7i9rZrVuSPNIRyS0ZnL/V5vTNjAB1A3HtaB9afilFp3LX
X-Received: from plbms11.prod.google.com ([2002:a17:903:acb:b0:227:967c:4f38])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:230b:b0:223:fabd:4f99 with SMTP id d9443c01a7336-231d43d5592mr161256615ad.5.1747620339399;
 Sun, 18 May 2025 19:05:39 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:52 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <b49d1a00628a3475fdfbff4055d8347d35a802a9.1747619816.git.ericflorin@google.com>
Subject: [PATCH 9/9] staging: sm750fb: rename `hw_sm750le_setBLANK`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750le_setBLANK` to `hw_sm750le_set_blank` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750le_setBLANK>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.c    | 2 +-
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index eb7e107bae68..1d929aca399c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -606,7 +606,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ywrapstep = 0;
 
 	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_setBLANK : hw_sm750_set_blank;
+				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				    hw_sm750le_de_wait : hw_sm750_de_wait;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 97682cb8c58f..9cf8b3d30aac 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -212,7 +212,7 @@ int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 			 ushort red, ushort green, ushort blue);
 
 int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 			 const struct fb_var_screeninfo *var,
 			 const struct fb_info *info);
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c64807cd06b3..7119b67efe11 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -380,7 +380,7 @@ int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index, ushort red,
 	return 0;
 }
 
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank)
 {
 	int dpms, crtdb;
 
-- 
2.49.0.1112.g889b7c5bd8-goog

