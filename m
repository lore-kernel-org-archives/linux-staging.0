Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBE44C4E3
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785278407; cv=none; b=Pljv9BSZ2BIqol5mwpkhl5+venbo2Ou+bSAoK6MyWMqp+D/rikd6ZpCwoLgFoGv0bNphLqctwoBpU5gy/+zOtTekooC1DiN3QBZmE4mh6nJ0ZpykjZFACUXDoNbmW5dm6574LfdcrxlwYEgBqNO19dvmJFPphGTDj0PoFaThCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785278407; c=relaxed/simple;
	bh=2se3aOv9/5GrHaham5C+DJtZbUroCRjXB7PwS1jc+U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUR6CWefTo+3mwi54+gTtFg0WovHJ1QAbdZWg/3ITicycN+GXAR0K3XM8AP4oNXF/nRprCcAwMuIJ0cBAZ3o+xN2tNHJSC2AisB38yA7MazBU8XXCkDffA5ixBJC68Wids+ZHMjgABvJPsHhYlBiRJiK6McwD/u1oUfG7f5rF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1WuDRgr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1WuDRgr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so281213a91.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 15:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785278406; x=1785883206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFtUghgVXhXCFuPyxhJvt/ikNqme5a7AZrChDZVSnc0=;
        b=a1WuDRgr0PODAOX8Q7SmQ2CyzyYIVvz64hqtzZizCeyYuXyJy7ovvWd/CFrn4xMzjO
         ZJonqmIeEhRNWqKkeiGcgcYEZ02H4qHG6uZ9o6eyTXqYewN/cyBF/afOWjSyH3VsZckH
         VuV4PvJ623aQJOr4WNZeA9JtXwSKs7ZyBpwZPevKraSZvdOwpW1PZwVkbMhP3i33ODrB
         rEGEfuNa/OBKeQG9fUN0n84bJZfDZI66LZ2df2PqK9mGPV6CPPanFwCuOXJe6Zrgqs9c
         qK1j/TO9Luqa7mSwmXs5gQNXRwgFDhDzJsphBFNyekI4JLKTZcPtrwdVXP1tC8d4HNRe
         ROtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785278406; x=1785883206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFtUghgVXhXCFuPyxhJvt/ikNqme5a7AZrChDZVSnc0=;
        b=B7wKt+EebIF6hUE2jDKu+oJqZKI0XspW06SnrbtCuH1NOGI7m9nUAOLTHe8rWjzhSS
         SwN6mU8hWoLbTsZDBgjvyTrI3vBcsiervl7zZhpz4Hh1gtBn1oa3SNz1BrQRTN2mS72e
         ENBF7VWk/rp7VPl9j6K7hxR0Dqnavn7euwF91Jd9XenImYb0oqqzMBmA1lz6SLk5Gh5y
         hfY4SrBgIvTUKqrjcUDRXZYFdTlPim31FcSSrYgcjbcX6uPA2R32FuMVvaMnICurAwvN
         qNZrT9/D2ev6TZyLzqx9s2BF5JruRNac6BMWn3uCzQYa8ko7gyXqo3+9JvZJAqNU91B9
         8Vyw==
X-Forwarded-Encrypted: i=1; AHgh+RoxW5dPy0w5XNJrC9sJwLp/4hSb1mr25E4LHFQ3eUhxfvetqrFlhSNJapfRTzYlxB10+ILwQAaajJFEqFzc@lists.linux.dev
X-Gm-Message-State: AOJu0YwUjozE2JbZqAfoCWdj6Q90YbM/et/BEYiZcHydlVicP6w4yZN5
	TA7nw/aHcdi7PUA887LDA36dz77lsNvz4oErWdLWlbOOR/usTOq3mnK7
X-Gm-Gg: AR+sD11bUgKT2TT2KMjgvYwVm4bw+GQ63d+e7yvduCST7uZ10KsPtt3quNS94+SSymh
	FKsV0kGDT8lfHvsn8ZHPLPrLplBYx/rTEIt9ziaDoUpcqNAcbSneH68vaEIDpe93sKS9zt3fN3o
	leVCEPN2wzplKFaqj8zUMyvwJ64jyEvVY9W6dAMdz2W2ePqdIfUuoOm13chuLT5kuVEnUI8b2M5
	OS3r72WVb1HuVu2q53yjIBDrKK9A6iKMtfsAcDaAkVQsKPfOl37zD5NB610Pj/5Iu90tMwDOeIL
	DwmOsxgWjRmfxROCqTsG4XyYIFkaoUIua4d9owVwKxkQ4OEpIGHNJcZr9vqMTvJXKo/R9u+Ni4k
	Te+Hs9ZVutM1Yf9Msad+s4wI7zahO7iUSiDKBoKXLEAWa2lg5KOn/yOwb6TGMY3ZtwdQGeIwQM0
	brRX6WH0ZHc4AJgq/4JPEjd8JGKqB8Cjbmy9qlZCMEkCy8H4ncJfQfuJ9+lJdOVLMewZwlP2x3x
	jb1ulHR3LsiAo4ZBBUHUq6QtTIFbwACxi6QIZkhqUUa/xU847HtIMRZx7PspZSBoAeEnd4Tk0Yb
	c6bWrIwe6B2i+V2gOebYVBAfWhpK/NXO71DjIH8=
X-Received: by 2002:a17:90b:3848:b0:38e:4e62:f998 with SMTP id 98e67ed59e1d1-38f6a556542mr4751169a91.23.1785278405697;
        Tue, 28 Jul 2026 15:40:05 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-60-64.hsd1.wa.comcast.net. [67.170.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f12f965sm480915a91.5.2026.07.28.15.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:40:04 -0700 (PDT)
From: Gabriel Changamire <gaberashawn@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Changamire <gaberashawn@gmail.com>
Subject: [PATCH] staging: sm750fb: fix kernel-doc comments in sm750_accel.h
Date: Tue, 28 Jul 2026 22:39:06 +0000
Message-ID: <20260728223906.350-1-gaberashawn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the function name typo in the kernel-doc comment for
sm750_hw_copyarea() (sm750_hm_copyarea) and add the missing @accel
parameter descriptions for sm750_hw_copyarea() and
sm750_hw_imageblit(), using the same wording as the corresponding
comments in sm750_accel.c.

This silences the kernel-doc warnings about the mismatched function
name and the undescribed accel parameters. No functional change.

Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 617885431661..e76928bf260f 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -195,7 +195,8 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop);
 
 /**
- * sm750_hm_copyarea
+ * sm750_hw_copyarea
+ * @accel: Acceleration device data
  * @source_base: Address of source: offset in frame buffer
  * @source_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
@@ -219,6 +220,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 
 /**
  * sm750_hw_imageblit
+ * @accel: Acceleration device data
  * @src_buf: pointer to start of source buffer in system memory
  * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *>-----      and -ive mean button up
-- 
2.47.3

