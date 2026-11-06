Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998551;
	b=5KOsrzfNyM30pRpHWgnKh7y4udsxwvWhCi3Z6JANRBOguJvjQZ5ROsB1Bbk4TOpVVYEm
	 KUtTtkfswlNVcvDp/g6UXjm69IQuhgwnmVrjaljHPSqND39/BULgwiNVyIxBtMl+gvzCA
	 r7DFbarG61k5ZOfzUVbBSOrXY8l0bVOatnjXzz8qNFl9WFR1XGUNcwzkkfbaKL5ug3sKG
	 c01nkgIZCj9ciSksB92JmWdoxB0geAJ0+jdpY76f7t9JO1JKxdfiS8fvj2TNJiPrQzCvN
	 FKLp4OapDizdySEz3hCyaiZRUN09XHQNyUuZeWhDOaJjNs65XTP3V1jynYIYkb6s3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
	b=3Ax6/vmOsYeKWKoey9dsamTl8fCdIvGWbfzOxgegXIHMy29KDY95ROhytK/hSaLJc3kp
	 +zX2Re3VWd1olUiKWfz97R0X5Z6aqWXfTeFmil8wcmOajioPrXoShS8h/jBHDHA8IlwNE
	 uauEbTEiDZrr7jQfRA61MPlprN0T70Fdw7y87Wfepmt0RigOkz3AKMoDU9yRbwYz2mz/U
	 PCuRgDmcYZsAyB2UkEBDjlYfmplW7D6vcYfFHOdQxzoielY1XmbyNL/Yv7n4mDenIQvRv
	 4Cgw7ZrPhlY1vbzD2SxSMfTXzLXck9OXfjuteJ33/PjtTvk7sUcg6DOBjCnWBhfGpBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWPHc32X;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94508606A326
	for <linux-staging@lists.linux.dev>; Fri,  6 Nov 2026 20:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94508606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GWPHc32X
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8543975e9.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Nov 2026 12:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998549; x=1794603349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=GWPHc32XEO+SHaLOjpBsmcmmFEfm9dKp2Cm/VsH2k4q9c6238xhEtH3Fyu3RXmcCQG
         LtKVMCDin2pjjfZ4+HRJunA3RuW3IBqUJ3PGOozNFbY40zZwikW76Y3jCsYsZqRXfw6H
         8czAeXOOrcWJEyYx7m1KaMu0NZmjSxIV4r8QwpyY21LGpH6cIUYMQLkqF/K2docMITrc
         IsBEpJ2llNx/0DZfj4SsTfJraxL0ys+D/QyUyMgmillVuNWywMoLMypdtG+i+aHP30Fb
         btfx4bGEUpUMXHobTQtk6zrhxPZi5SQypO6ajJ4nNiuX/0m1DSG6uuzDchj1IoWILl3M
         lMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998549; x=1794603349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3GadRqkUrlUWiVQ1/haVsz74SA4u36BlKTcEUmJ2ko=;
        b=EI7CKsRD0cBjrbhXVIqpo2Nt9ut4VVLd4kB+8VQvZFovgI2HgX5I67WSMqaFiFWn0a
         oPWUE1Te+6AKGJRL/hp+sjNZo/wv+re+7V6c5hDdieUEMHbpw6+5yS9PaHaluoEvNn2a
         njlDeriXO7ifHA6C6R2kdi4WhlJnd+DtUwsjWLpGBXH6ri9DV2REdok+e2Erhs8HYrHh
         pkHqvWfA2V0axr38VqrbnmCytJ49cyXgUDVm7KWZ0mwOPNQt06ISDLi1fz65++LIFbJs
         q0wRhEHohzwOye2U1AGXAxIk4QZMAO4UTEkHnLmSOWLYXESQouCj8xXbe7+/u2bcaxC1
         5CbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7hmgvmB3fBQsjEb6xnHtLM+VtqZO6IsFnFd/lTeXoY5j8NN0yf49v1DdgQniQv7/VeC8s3chEurUH8uMy@lists.linux.dev
X-Gm-Message-State: APuU4Z/mW8ZNWfEiN4vFL00N0j/cBo6v5BijYMWlDo/02aT13P1T073P
	AMw2YPJ99fTxkB2muf7eFFN92SbWxFwJFuxwubmQ0wfn26W1yPeGJDgq
X-Gm-Gg: AYBFou2897C4QOBcHDsBhzGGP2GW3MHmMaRjFwICCgRx0PJevvulvWdaAKxDKmfSPaV
	TS1I6L02F38Cx0hd7jFhRv7O51QWUlHEmieaNGMaWiM43C7QHMYZNI9OM7fcJsLlstOLMXv5Uq4
	K/dBNTpt17XbBBpz51DuyE4nLhHxBlkPtw3zEjdjCf+pVYO6u98+y5D8jcMfnUwffFRRjcySeQN
	lIRAf8xM7PzaODd2Dd4aNlUE6aqr6M83/sYfE4KKg/piSPTI1w226YglnCZc3vqGuSlzKiccwnu
	HrhqsP4Ak/reRlZw4HeLOhliWB9lcA/WWAiR3uN7PffQ+vWkYK1qg8ztdUtjI6W3qelULfuWzNG
	GoaUHjwjSRC6zljxhJELsxZfisPPwdB4nsWULlSgOYJ40b47ejB/1FMkX3iYoHVikfz5YmWHNZ5
	EhtJl4j5rt41eEk6bVjb9ialczIPHfK+sILOdCi3wIli8spL/zhVpOjS1phGuK67krfMOORrSPC
	jXMGXzQ75r8dRNGgoG9TOdq/EQ5oB9OJ9KISgPPOQiAhQB7fJjm6g6TIRUjbGAOWXTcCoaEwDAk
	QDBdNwFhWJ4t3k4vAS9BRBfQCRW6WXfvT4vxeymy2pu3JNEvUSK7SA==
X-Received: by 2002:a05:600c:4fc9:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4b6e017053fmr65530385e9.23.1793998548862;
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3271abasm7354075e9.4.2026.11.06.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:55:48 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH v2] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 21:53:47 +0100
Message-ID: <20261106205347.10407-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.

Signed-off-by: Francesco Giandinoto <testata.nucleare13@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

