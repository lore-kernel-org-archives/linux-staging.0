Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820AE3D6463
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519013; cv=none; b=MYhfGLS+kOK1YIFJ/zM+SymrGYF/7rLFuwg+cMqgxGNSVyZ7/jU3BipLAt/wEuDDqPHVz6l7P6Hbk8HroSbNNhonZd6hywBXZE4uo5/xdH+zdRWMd+BL3R9wvbQL3G7WWyJj0pa/fl40P6B2Bdyal3uMvVwZAJQtdNrJ7Nf5KWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519013; c=relaxed/simple;
	bh=YCyAaTy3tNRlW3vQ1sWSmBjYYEpXBHbHt7z7xrLpx5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBj6g7eVbuMcpTQCgMd3ngRW52Sp6ZWbe/DZZ6sHRYrKXYvIeOPDRYr0hSmmx4gIuVuti2bYbGuzM4B/DO/1SMommWPUB4FdZs1DAratpKXBEtAKx0KIVmv/Xryl/JAouhpB2sbIvOznMJUswcQgCX/5ROnKQQGShIijrp1mh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCTsXIUx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCTsXIUx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-837b39eb078so3092793b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519012; x=1779123812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ2UzcN4bjFQ+iX2aiODShSxAP3mdh0bB9CnSJKiQ9o=;
        b=NCTsXIUxCZVWL0SAEP1O0OlOMlOV+MJ5Xo4VZdrlrzLkwqSk1YZHzaEl1a02eldhAs
         QxVwOGNj5YXaFy2aWKE1vUCj7Wa5qKjYrPEw1xkI1qgV87iZERy+6h+L+bESKScVG3PN
         2srHKbRe36wRwPuZppb6pCnYM7g2xge4BMbRGEm25W/9if97khLAs9FJgzYjju5BMfNZ
         D/1vHR/8jMH+KFesExpWX4vEGxhg6pfzNHkRjPtpAU1UogJ1dyLSpr89iONsIS7D3j8s
         WBIHmnHQjrPBu1U0Hx68W+s7ibD/5comYBnrVy/9WXVotEpBzBnBQSzIYv1x/79cruEV
         fPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519012; x=1779123812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ2UzcN4bjFQ+iX2aiODShSxAP3mdh0bB9CnSJKiQ9o=;
        b=PxzVUqQAaCfO0VdoQuut6BIZiss/2dzYAlM6BjnlDuasRShDLmj8f19mZx5dPctyYV
         N0b3GrzDxs90S7VY29sBE++ekpgqFWgZVIMfS4wtGFdYcptbNYTTX6Nf3OpX1BoVR/hl
         xIBcK17h4viBprhk/7WAAhyLftAD8Q/3B2K1kl8cRWQT+oE9MLxuTygQms7xxhSy1gDn
         dpzbTGZKYVaUCKX+98zYauiRXU4CK6NdvE4NFcPBQD0mAcUqgQuhvtJvPRh5pdGY9dcT
         O0f6bzi6wALnrWwIVbsqScQtquyfBQ6froRac8X/5mxFRFijFTUVfkay4xVhLx7lZtB3
         q37A==
X-Forwarded-Encrypted: i=1; AFNElJ/Z8KKFgELr/HFBq45NxvrtAz+EYy9Hlp6RHcG72FGqYwUuBEfYlNAg/mjfAEDtFTyxH0jDm9leDNYfbB2V@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrbd0R0QDORYiZODU2cOUwdm4slFymcrwPqN0gi2fAaU/pNDzY
	lCeDp/G62cmkVmUD30DfC+1AJFgk5bXLrgon+RWNTjuwlW8+BaQssO0m
X-Gm-Gg: Acq92OHHu6Y8SH9YNkR6tr2uIilihAtK0dKX2cF5ECZvWvVv8WUq61iqWtUcyviVufF
	Ue8awdeI1So9X1wpv1ZGPHgG6ONElc4BmW+hrMZ7HWI7vaiHB0+I5fa9L4Ncg71Ki9PZ6UCqSmz
	+enEaswKc3x+NAvY4pQgjGvrQ7AcwR8hbDA/e040zhpSTEsv2rZcR5U6f7CAnIrk6bN1ikywpE8
	AePYu2T6x1LM3iQaBHX0WapXmfkgDkSoHHZzGqFIU82tnJbpGVc/p69V7Ch1hh+kHcTG3cJmh8L
	LycAkfwZpn1LKj+9Icng9phvx13rf2enfxLSFMFV5pfYeHb7VOtN8n19zUxlnLOTAANmF940/WH
	G4Sgue/31OEKnFEoAfYAgFppwgViGyAFuMTrkhvZ/6DgxkubVxo3/zESA9ZBYak8+JfGk2Nmu+2
	mwK50GC2u1oFjfj4tcB8XJgaem+up2uiY2UKzMgnpWcI54wwzxKIl09xO/m0Zd9SJqwrdaQHqqD
	cUm
X-Received: by 2002:a05:6a00:420e:b0:837:80a:5aaa with SMTP id d2e1a72fcca58-83a5ea3c118mr24296078b3a.45.1778519011764;
        Mon, 11 May 2026 10:03:31 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm21245900b3a.60.2026.05.11.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:03:31 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v3] staging: sm750fb: Keep g_fbmode array non-const
Date: Mon, 11 May 2026 22:47:45 +0545
Message-ID: <20260511170245.53556-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The g_fbmode array is modified at runtime, so it must remain
non-const. Added clarifying comment.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e82a..a553099f42f3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,6 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
+/* intentionally non-const since array is modified at runtime */
 static const char *g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
-- 
2.54.0

