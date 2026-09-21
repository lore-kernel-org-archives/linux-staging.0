Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DB4E7817
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014479; cv=none; b=ePh4ypvaPBWLo4rKMie5Y9/RAFGxd+dqGNJc79jBh2q5GZ0pQQKr/jC0qkBdDPQXX0Cn3YBMlgLsjTZ/XXMZvu31bAC7GkZxlWQs9AI0eR0efRgkLHU5Oup5HymQpWsj0P5v82+rg207482iLZRWD3a58N5HHoG/dmrkotWW2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014479; c=relaxed/simple;
	bh=BhklwgvkpUrE+CC+vXjr1M0j6bhRvxIIJDO2uMkw5I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJ247Vymx12lOMkr6h4hBeMNXD2VVYpVs2IAJZyZEOwHsQ8dOtMZdblDAM+se/ZWks9GSIrKhDkfYd/ycWhFY477aAswHMU1oe9Lbuuk3FSVcFAMZXK9QIF0Eg5hBMamtPb+qS2Vx8qqtvBPw3mO4A89VMzd+92H1bzCENT/RYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmAJf4QE; arc=none smtp.client-ip=74.125.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmAJf4QE"
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e667e3c45so5325495e9.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014476; x=1790619276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8njTdDuR2VjcLI0zLlnQh6RcubDIwEA0WzrR3t+nYKc=;
        b=NmAJf4QEmVMOtUbADrc0OvO+wAhIQtWrb1GyNzQVJlW4lMmutHnqOT7gGkiywWQI9t
         xnYGHYLfnwN6TxOfGtTK+Iq17DA+QgWTC62ADiRgA+L9HwoihnzuHGjW99WwtBhCYwrh
         iQwJzeTzKrP3YZuMt8TfE+VfZ2hYzZp9HECW8ctUnfBDUFz/vffyoyvE4M4l+fUUsNjX
         8crBRYRhM85x70A2qbho+URjCMtf2KpLVoQjMipS6HmQyc6xKCTsoqYVfoOxRU42EEZu
         ES6GnPEOL37EhNc3u7N4WP55Ccss3Apd+oGvQn/Fsai6bkJkUw8i1pYzY/pnXbpMn8sH
         sEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014476; x=1790619276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8njTdDuR2VjcLI0zLlnQh6RcubDIwEA0WzrR3t+nYKc=;
        b=fmApgsNHqNOVABGGKTvclxGDzgRHA/5xMG80uGr7DG6EG5AXyGe6oWo1HbYFpLrLTR
         0OfkL2bj8f5IBcGW3ChY64P0ZC78seuJ4Cgg/rm/lKhk8mI9Mst+RPfmC+9ZE8MpXmBA
         h9jErE3vJatkwudg4swDTuEd4HGF2rhNtLivkI2z7Exdol3CSBveWamT21V2zeStIOEu
         9TjW6B/31MgjFp3MbytwD1gaipjDWeFlotp+7VM5ZGLPB/x52xYHqOzN2aCHZqhzhPu2
         5y9HgnWofPGHgNSPVOmkFYSblrDou+5y5ZXD99hwTmuKTa2bnN6TUSUY1DFzlrjoHsR2
         xXaA==
X-Forwarded-Encrypted: i=1; AKwUvByGAhqyH/oKW2ZyenePbNYuOt3maEmbtKAZERqnBeDLmpEDMlCcuBX0hdwkKgrDVKc445f2SBrI5qg47N22@lists.linux.dev
X-Gm-Message-State: AFuF++mliefaex1eKO1/Eddn7UvVVupD2B15kLXk/T8umWlpQf+oEvI4
	CviXljGCPAXIH1+W3Vqa8y+3kS0GLdof79eS5fjAi3jHNRdkfNjny86I
X-Gm-Gg: AYBFou3AUQS7RHGv//KCK6+L+qi49eEzqb6p9756LxXb/O/MCefMtCwBode+TOFMLbu
	ZnWpDcZXx6VuQLsTh8+FoQxs0roDZ3VuGvK9DWBQY9zxtU7Ap5lB0wu3aBqMJOekCyKLndPB129
	3jPxEA2rgLUCBUYAyVRiXX5jmyJ2QQfKYQY70i5pSBWWXw4F/+KlyP5BcROlQ/ZXbtyNx3bTl3q
	9Q/cqrhqpLiSTi/gvJrFt5orhbhb7wk8l01vvVXFglH5kmYM//DGt05PeevdWipcPRmvwl4F4Q6
	t/YlXtuX98UemiseH5NJhZZL5NY8huuSB5fdUoPcoSWouCmqOWNL2Ls6Skt6k73F/03XWdAuBvP
	DjZ/bFoc9VIOC+xkFszDLBlaMfyDonZF+BR09VR1IHZdv4EKFZb54zpIjJyG0bgMotDmIUUGcuo
	JsjLa43Ufl1uWzX81+xyoLg0rGnbXESsD0OrYhLQ3krUilyvgVIkJvYXSYzgJuDw1rF+QVwuBln
	C/hy0NSQJ4q5aJx
X-Received: by 2002:a05:600c:4f8c:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fc573f858mr164351925e9.29.1790014476102;
        Mon, 21 Sep 2026 11:14:36 -0700 (PDT)
Received: from gbox.chicasongroup.com ([197.210.105.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8a636d1sm10754875e9.0.2026.09.21.11.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:14:35 -0700 (PDT)
From: UgwuRhema <hikarialiyev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Andy Shevchenko <andy@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fbtft-bus: remove space before close parenthesis
Date: Mon, 21 Sep 2026 18:13:50 +0000
Message-ID: <20260921181350.89925-1-hikarialiyev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl errors regarding prohibited spaces before closing
parentheses in fbtft-bus.c.

Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..409770891 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.55.0

