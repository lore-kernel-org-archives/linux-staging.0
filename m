Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8641B34E
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486001; cv=none; b=uro65vvvQBFspEQfmEJOaGpDMzHKJ7Ij22yzh4SJxxwZsLeQQYi8EW97TKfqrwEC8Ofuin+tjlxuvlY1xpL+PNw7iwo27dGfAUU4su3NR87/iYyVIOyo+sAGYaAwnF8MJPh4EGYLSWc0MA4/kNfChDvHczGnLnb3RX873m9WGks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486001; c=relaxed/simple;
	bh=yN3oOXGsU9m+O8FHXmbXOe06hln6+CoQ3Bfdi3kkpEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOOTo+Ukxke5j/QFr0cX+lbJZZqX2SXrjgV1DEMzNlkxYVyOmWcse4De4hSiJWrTgM1o7exiaIDoZjd5+b6rgQ4EjeifB1o55kxo2b1+TJVTAkMtAhZYG4CAKYrLAoG41ASv/+RRWvN/fNWzf+s8B6QIn2awLUdW1f/pAnxUHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWsbQ7/O; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWsbQ7/O"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a032383008so1227146d6.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485996; x=1778090796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xJocfIjpbzSjf6qOkZQhVpHOzyCK3XFmlbltimvCtc=;
        b=SWsbQ7/OrV1Xy+0mB7d2/C1iZX33L4G2SNn6RKjkDFnQuvyq1jDow5K7BzD/vIGppM
         HmMDTq7YwX84dzmqagSFn0rf3bRUzAAjN6jJk1Dahv+Q1VZGjE76ijSNe+3s5OYKqhjW
         8kKKpjTT+UO6+f6zz47z6Ic+Th6A0ItqoA3yz2gzjyIJhY53RIAe1wg/ws/rXK8iLfQ1
         TH3g2JGXHDMTBE6ZzxBiHHN7APD4Uzu46oUXm4sxNYWgQkHDO+cmoOu5+z9m9gcure4w
         N87xjtVWxdEi3FkaLNW/SK7dR2IDk4ZsTx6qSgY8eSmiaKu79nBBwbjnDnn2frk2uUsh
         psjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485996; x=1778090796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xJocfIjpbzSjf6qOkZQhVpHOzyCK3XFmlbltimvCtc=;
        b=gDIlgTAefSCWJgGA1E2JNxSlaLb4oaQyyuTuqHpxenc9V0QNWrERyTdFdo4P+a25dP
         ybCcmtfjk+GwkHkQA2BliBGS9d8mmOa3dBe4YS2cto4cIkQRQtmLSqwbxYE+3uKqJs8G
         yrMILLspIWDzOSLZGRHKXKH+syTqMGHU59QDPUMPnRNQxBP5+AlheWuzqzu8rWI/34Mx
         DMJSOcgibTJbkkQgchMJKt3pC6jGIBNt3E8mAvd8NBf1eQinTzu3uQqxPi8FmqrUf3rC
         M6/iRRRM+bPRPOaR1Jl3NGUXEtn55bb+YW/NP3pDa+9s4jd8Lgp3aYgI+4LhOs0JNzV6
         T5fA==
X-Forwarded-Encrypted: i=1; AFNElJ+u1vLr0lxY0LaBQ4+txbfy9Tj8rM3uxATyQKzcE9pj0BV/QHidjGdulgbADneP5f3Qxj2ejprmBQpawAYk@lists.linux.dev
X-Gm-Message-State: AOJu0YwZpuqVGdaMYk5lcJlxc1OdSbaIFDbjCZQp/MJ34O/qUnjabk2+
	M8zco0cDoVWYtXNze5Qr3uXCXYps0272ZMsbpoOrHNoDZlWdPL2BP8Xx
X-Gm-Gg: AeBDieviT5BbYj3R9HgnZo/XoSkkAeSCkXdxBRp8hKHK0+hgY2Lhob/KnlFJ4ElwvfZ
	BMT8fF2b7L2cSg4eAU6BSXCGKHNXgR9dP+hoSaexP1DsiwOs4joScxkK/u+UIFWWIdk+gk6sMoj
	AI12d/qfyFJQhgbFANiBGQokpSgd6zLKrVanDh2O87I/PmX7qmIagk9PTV62y57zN5TCJrdOZas
	lWqNJW1S2dd139Ty78x0+0xSKc93ZXpayAmwzvJ4mvwpqd0Ht+4fR8m36tUiB3RJxQar0AdJ/Iu
	y4mahi8IFDeZQScvo969R/9REkMg9xrfyqGNIZJVs5jLIU+qG6xltAV5cDvtX+ZhRJppYxIEMdS
	guMn0OTIZ0G5TWnt2voWFAZpD+cE5RvL6Bs9iN9kiwwh28bRBQXcylZkbUzR2v+l4UyDZOy1YTu
	JbekF5BzY92kZBJLGf1TfwKAvfEEFz7KjfmmeTexN2AdxjdM2Bxkc94r5h+y879cCOvwDA
X-Received: by 2002:a05:6214:6005:b0:899:fd8c:55c3 with SMTP id 6a1803df08f44-8b3edd0b7c8mr76575106d6.22.1777485996525;
        Wed, 29 Apr 2026 11:06:36 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef81731dsm24380276d6.38.2026.04.29.11.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:06:36 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: ia_css_event_public: fix typo in ia_css_event_public.h
Date: Wed, 29 Apr 2026 14:05:30 -0400
Message-Id: <20260429180530.6944-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: Therefor ==> Therefore

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/ia_css_event_public.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_event_public.h b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
index f7215dd96739..8eec3b0af65e 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_event_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_event_public.h
@@ -110,7 +110,7 @@ struct ia_css_event {
 	     until IA_CSS_MAX_EXPOSURE_ID is reached, after that they wrap
 	     around to IA_CSS_MIN_EXPOSURE_ID again.
 	     Note that in case frames are dropped, this will not be reflected
-	     in the exposure IDs. Therefor applications should not use this
+	     in the exposure IDs. Therefore applications should not use this
 	     to detect frame drops. */
 	u32               fw_handle;
 	/** Firmware Handle for ACC_STAGE_COMPLETE event (not valid for other
-- 
2.34.1

