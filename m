Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19725522C
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150850; cv=none; b=cEaCdDukU74EQQ2Q6OxhddvksDvgl+QQKWXXk4/ZYILCS4u3/EnsZVmwLc6cEmc/C3z4dv/3OniFIvmZsp3ONiDboENcZgeqIGmtTSBRwMYuHvdMMACIEgQCzQQNH/iftHRrQO0b6IsOXQhgzf6h6TkuefoTYcWKUMyMasJmzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150850; c=relaxed/simple;
	bh=vlFhX2oXyFRY+t2vPp7ftYiWu5/FCrps8KCWGJv+E18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiuGDxFV3MLqHbbrh26iKQ8tPquUHBNrVXYXZA8Ewrf/RmrcH8sJd98LAGrXLqG+J678j+qMrubOQ6lATG9+BD3R1SXbIjZn8gEnoyHpM/YdFRLk4tNDopl9U7hYRuLRZ5KRKGCM9m6BEfF8oQQhbvMTXjjf+8vAoZCksb4PhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=duxdxcsf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="duxdxcsf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff64550991so4812225a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150848; x=1744755648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K/BByDkY9tMF7eLVzb1A3mqI97/QyN2sINTR+3LN1U=;
        b=duxdxcsflVuQ/Kw+gSUUeWK7PVGn67PzpAK8TrHaE0KMiXbnKDlvR1qRckAIWz43OO
         8NLxth2az+xcgBgIlVCADv60MSHCJX/VckT0oAuulOkPoYbXvZ6zjCNcxBs8sMy2LT7K
         pkWQtprXogg5IztP1PlLG4Wd4rSKO98CUv5RBtxaD3TDRIDkKxIjHenDhka1DQP3M3g8
         0WHq8l5VeSEd+ejXNz0L6LiffKGPe5t7tVhS96RUoJSi/8J9iBgx7Ybo8ys4RjBL05Bu
         aDvktLyP+GFVv6kyWGokv+mAuND2/f9izV9X4DQSoeHTb1B8A8wmqLn8Nb87rKKk/8T/
         unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150848; x=1744755648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K/BByDkY9tMF7eLVzb1A3mqI97/QyN2sINTR+3LN1U=;
        b=ROEQIKFMBuHUDRPEGqjtIlikkZaO5fGT3ThYYVswcEYBQuqxVb9q/2xTQS7ind7Llk
         nDSsKDxW66tO4ysukYA5zqQZpePqMKFHBVJLIL0dC9aIpAIBXVu4bj/sSzpCars/UlrX
         Dkw3kbq/nKS2BZGSWcAtN+wFi1S235h0jhwKmFwxb59De+5zLwdkwGSW8/RrobuDU4v/
         oOIGG70Hog4V1vyYBT4xJONt1wtlGqY2Ffd054B54zUg9cZoXdoDNvHg/1AiXJuN9R0P
         98UGC54nrGUK0oRzct/BvrG/ScLb96BbOvo+Mlp7Q20BqvzhWzJxjvnFzvDL57EME1iA
         y5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUJaGKJubs8jY2rj1j2R5fVNAenpgvO0Fje3IYiCCWwwcXVwIczTj0EaQpjkJ1Pv7u6Bol+yLMFSD0/iw6t@lists.linux.dev
X-Gm-Message-State: AOJu0YzR0XO8nolpK+zBrUhuEczIYdvYbwN2dQ+1EFVsZWl0wk983QJT
	ocDK99jHLerjB2weMGAajiLSOEvLvPd7ox+fBGTgLc3UgtxeEv9U1L2obMZoQA==
X-Gm-Gg: ASbGncu0CHqkGaQCffTYKLGBnugKT3iO4zkDDRMw9VXzuY6VSD11EGtrjrX+cOBUa+r
	siNJNltx/6Z4AQbeQCIAn3OClW/WAcMWMXbLZzR/hgYfeeeTOnlbqam/iuf4ZiqElVtb86/ozt+
	C2l2N11ZifplT6aRmuabYdLCtcAdXZSMaodgl/9Uuu3KMsd7AHN1KRzvtCvJ0hKVmJKRo+N3sfW
	H2ZMkXLnmAz22e4hVFZDY+udE2Ro+LMe/y3s2iTAm+Qcy/+RI8b02W54SzM4iCB9sJcTVsVX+63
	YxRdhv+IRJ+uvzidSAZmAJxPHZy1Qpv8q0XACLHnFTcofY3OepG5tPisG0cWG8Hz80S6ve+jlwU
	9n2qOY45AzLawzLZiNTTV
X-Google-Smtp-Source: AGHT+IEEOyBKP38UsaWM/G2m65kib0whNND2QWoqnx1R0FChgSaHvXmmYfZgvcm3X3i1vRetB93mHw==
X-Received: by 2002:a17:90b:58e7:b0:305:2d9d:81c9 with SMTP id 98e67ed59e1d1-306dbbbefefmr1332737a91.16.1744150847945;
        Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e996sm89049a91.20.2025.04.08.15.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/14] staging: gbip: Alignment should match open parens
Date: Tue,  8 Apr 2025 22:20:29 +0000
Message-ID: <20250408222040.186881-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch

CHECK: Alignment should match open parenthesis

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 67bf125645c0..16cc5333beba 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -26,7 +26,7 @@ static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INT
 static DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal
 
 static unsigned int agilent_82357a_update_status(struct gpib_board *board,
-						unsigned int clear_mask);
+						 unsigned int clear_mask);
 
 static int agilent_82357a_take_control_internal(struct gpib_board *board, int synchronous);
 
-- 
2.43.0

