Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BC3128A3
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855326; cv=none; b=tVg2lxVPkOzjda/Bs3M8US1E3A6qAxBfvG6YXSdnNfZVXkF6OGAFb87dt7a85eY9IETG8UA6GDBO7EXWzzF1THB/QC7FfCs6U5Nj6n8+2/A+2k2PxhJZJIZiRFuqhk9xGIvag7uBadfZomUuwdBDNH8XMPCGDq3bU7AVOycVyMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855326; c=relaxed/simple;
	bh=bff1sGeOPrpdwKjWuXZN6sUx+wfEDM7j81uWD3fIsZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJtXtBxBSr+LBIB9Z0h/k7vSjkHULHzsIuwtgHX+wOK0C96M3JOcpONGB8UCbASvz6OKsNaoAJbcEzF5vXqbmlxzpxJ7xVyrCBadrMgwiGF18drEER0VDBdelQN3tCMT88g2tK46Q7EO6I3NYgzwzJ+1w8zzYfeWMRT3bEggfJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekKfFYqE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekKfFYqE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso78920a91.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855323; x=1774460123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=717hwjvUKeRFJ/nK/O9VF6bm2edjepMJ7kzNrqjLgno=;
        b=ekKfFYqE26j4CopcHcB7zfqGlpyJZs7mnmAmuMKEy2L3+ZsNVCswq75loXHc5vQto9
         OE1nTzRXjrp77GdUv9tcCwEP/rQHMWo75xy/hE6CqoMBkuHeNOAl2hC8UMdbjJoGT5yH
         AML5r83oGV5B6Gv6xpJ2xXXfOzGoMYKxbQMFDhCrYztIsFTiHi9r6lZryptVdEMppAb2
         0qD56w8t5grz47R0lbo0TDtLPmuXyiqMB3ZcH2z1OkVDsVxWtYL43xn21WBVTC1KXrIW
         lROGOD/L9OoIC2wB7s95Jv42Krpe4NNCAE64KOIXIgsO2jRbO9zQycTO006xwuiN4BeX
         lSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855323; x=1774460123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=717hwjvUKeRFJ/nK/O9VF6bm2edjepMJ7kzNrqjLgno=;
        b=C5zBCUWLjodLvaD3rRmfIXW2JyYLpC4+8t03MbVDog4Mifh/3G31txRSSFykTQkfHp
         6HbR6E+iHDhpmgj27VocBzo3M6h44OyZv1map1+lGl8psSzlCQJvvn5RI16Zht8uhiUd
         KiOlxivAgk+PuV22qu+UkUGOAiqFfLl4sofJodnfwt8nZxjhrvO89WCwE4OwEK2CVZf1
         icS8PN+SrjyO1lVi47HkpjhYplyF782iDFL0xq4vzz4wL1U2JNh/aODLtkUtQsVNTp7l
         k2NEzWpEOYyAw1hf+cOwKbTuE17SIGE2umwGa43SNNbsgcNYV48srxybPK46R5woLBdS
         PQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJGiEEtJ6bQ03yqFAUDcJPFFyaRh+5/RRm9X6HkUl9de45ea6GQU/veFI/QHosI5JRj4c754BC0XkBoyzY@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbw/2UIy54w/IBPkZCA8lnjQOzawoxBGTsTYl9DdrIPw16wpt9
	kp4uWQfrUxFlovI4aVy9emLMRGf4mlRa33LL1ElSC21Dhk3N8xN7JZL/1EpeCILX
X-Gm-Gg: ATEYQzwIHlswbHEUrrL1JKKj38qGzJPtH5RbYxH5YPFE1uJ6L6HEFJn8+ony8Nl94tQ
	z1c10Yju+f0maggxn4x61BVwdOafH/qQqqkLSTLaOCFgTEBEPxg5s/olnIs9sii8XgN3yhf9owA
	ggpgilvdpoXD+IiFX0RTJMimsQRjTrV+C2NFBJyOCTikJVED9r3fmCSg5GqopzEleLTOuurjbCt
	VWILs0gU1EsZ04breWnJr6acI8+zuPHjMtVwLJwQpv4rOX+kFff0ChOw9mwuknCppUagLJMpYhR
	v1bR2O5FGVfMeG6ah8L4a1gtYp0r9Qq3WvXcjA+7Rk3wXA023Du4ar5YejMHQWmIkqUonDpbGeR
	KZX8uaSTnZtrkWII8X8Q8JrLKdiEMbXC/24ZishkfvCTDUreTlkKy7MIYFQTPoBGrvTPugejVJH
	epfjtHHLBZS8nNqxUwp5TuGGYhW9aM0CNrQbs=
X-Received: by 2002:a17:90b:394b:b0:359:f88d:1e2e with SMTP id 98e67ed59e1d1-35bb9f90248mr3765947a91.31.1773855322714;
        Wed, 18 Mar 2026 10:35:22 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm247103a91.2.2026.03.18.10.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:35:22 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 2/3] staging: sm750fb: Rename struct init_status members to snake_case
Date: Wed, 18 Mar 2026 23:04:39 +0530
Message-ID: <20260318173440.9457-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
References: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase members powerMode, setAllEngOff, and resetMemory
to follow the Linux kernel coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 +++---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 729c34372a1e..c30ffab8a5f3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -921,9 +921,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 49a79d0a8a2e..b683a82af349 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
-- 
2.53.0

