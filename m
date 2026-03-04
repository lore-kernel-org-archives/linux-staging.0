Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882A3C2792
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645738; cv=none; b=O0cwA0Y6QWUgQrs3CK1075IMjTTiq3+dMtgLkVnC1TYdQw5BWS1zAHcB8rXrixVDzFQJVSIMGmOWxVBqGVGDZ8ng8NZOHtLue4z02tk+x1ANbKRi/2nAsCUUnuCi6/znuoOIOFpLky42idyikZHm36ucLHug/C9klFuDIHEszeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645738; c=relaxed/simple;
	bh=/mgLq6MyipgAXakM35FmxxzZYKnWCLgWV+pnzFPnrtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GcB9z6mo9dzK4q3sjtqqGpTFxKsskbiTIghSx0PsO6qBDa8jALvwJt5DE47QEXpXb8+l5QpSASZIVklxkrLG/TvseB4DIRIYhHgQq6ieBDo3XXjkTeCYXe5Fcjvx1q5RcSxHB0mbcUDOp+Jsx+uPvskNoxPvVTcsdijQjRtRA78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpDIbHxe; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpDIbHxe"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so8705665ad.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772645737; x=1773250537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtmuCRd6e+N3D2PnsalDY4juU7geywSEbJtG8JH60jw=;
        b=mpDIbHxedW7hacSubIubdl+p9BS1q45We7IxFRulvERdaYyHFVzhLlp3eu8NcQDad/
         TazR5kYQS2ansF3p183qqrytTpJNp6cSyWWWsWxE4mGA5VUygEuNaZ19bdX1ajGZNspW
         E5jrutXHFACyKc0hszcjObKsfrAlQx4pX5J5RdmiRB7E+R6Ml4XeBvAsMJBMUgzaKN4v
         KX1dh028lAHAKYSBC2tsLOB7FBpM+ljkBCnSxbz5hJdOGQTcPFaeYup5eyCs+Fa6EDuu
         UtNa36tP+mlNimlSr6SaQwwW4EesnDmdQsf0py3PYn1aI0aDoBAMZ5f1UVTb4t2RBXnm
         lVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772645737; x=1773250537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtmuCRd6e+N3D2PnsalDY4juU7geywSEbJtG8JH60jw=;
        b=ghDjn6sFV6w0muTxKyFsFyApF4n9AGBkP3ksP6O1VCZ+j4g0U9rkF0+rfTQANxUIRH
         xQ730rcdPkCzUxOhFCEnBNqgCo5qRYzh5W0i0muYwfYx13sKdIxLkB5OdQqN8tO/y9sM
         ei+atfNttmFoyvOdIkZWPUDoYrB8vsZ6Aoustqdj/+Z7Wivv9pChup+iG6ycoy9y2Iw2
         Y26t5fCebnRQkgK4hr4zHOq/RV1qbDMG5I3mvgwea72rzD01/K4RySLke0pPJ+Jwkg5N
         INFKCaTJ+v0uOAZqnr4Ovu9HrdQJRuX7deiMQPJsMZkN5nAjbE1UA35cTeRsmGVZuLDM
         Nyqw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8M6dT1HR1PqdMZD/hRmCUtIdjU4csGXEKK4HTelJ/s2+Kc8mTqMDEfYJrOO4mcOQsu4S6HpGKo1wUdc0@lists.linux.dev
X-Gm-Message-State: AOJu0YyY9mntYQKGv7MWCrmN1eTk+rv56QpihfkUpyOOPPXDRVQlevql
	aiEF5JBUwcexWhPxkH1HTLfce9pz2nRSHh0UPJIbe8FWNDKvxal3bOck
X-Gm-Gg: ATEYQzwhPJ5aqClLhSAKl21mpvIHzHfYeivTYvH/vH4TXAbMut4BFzP0Ba4YBJx9KvX
	b1FDSyiuSCU2TIfr+/l9fRtzmNSDWRSe8zckNee+OzrlYsOxFkAScmjKaWUPwaOXYcFkHJM6bQA
	33kBPNYDc2dvB0xC3ZGZ+qwTbCWwia6tuG5B6y7vrew8s+n3d7aoba8etz6X0mixbWf0M6TRBsn
	uDA8Tg38LGR7GJlFcnzL/6Z/8ZLGdR6fpdP4fFYCz9YJeeBnl35gDhtiettNBaim90spSzRaaqI
	5F68AjrFoBBtLj8dYGSmvn6FV1aR+FyIeJjBwv9iaebhFPCQ9gWNqHO1kxThmh1mdHcadBdzzlg
	NEtLnCc84Tp6WQt+HGxUdQ4+kiKistw9inqj4OvmfUBYY2F9Jde2p+U1hwslE7YgyFruF1GUIFa
	SGQRObAu2UezOJdlRUuApE41BTe71n5KI62GNggHPplMKtuQfkdiHoLipQpO0EnWFkOyYFs0om/
	hefIJw/8gHhTSc=
X-Received: by 2002:a17:902:e746:b0:2ae:6364:e6ef with SMTP id d9443c01a7336-2ae6a9da3c6mr22605315ad.1.1772645736597;
        Wed, 04 Mar 2026 09:35:36 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4bbdec99sm136901955ad.64.2026.03.04.09.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:35:36 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 1/6] staging: sm750fb: hw_sm750le_de_wait: return -ETIMEDOUT on timeout
Date: Wed,  4 Mar 2026 23:05:24 +0530
Message-Id: <20260304173529.192067-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aaVT1mSeKrSSlrha@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -ETIMEDOUT instead of -1 when the DE engine poll loop
times out. The callers check for non-zero return value and
propagate the error code back to their callers.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240cbaf..e4b6b254335e 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -518,7 +518,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -536,7 +536,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

