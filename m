Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899271C1741
	for <linux-staging@lists.linux.dev>; Mon, 19 May 2025 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747620330; cv=none; b=loyLSLLohg6fySQHrAM+3yfV2IZyaBKyGA7J8tymQGQIuVkpOF+6gaq4pm5NvDh4OKxPUPg9b82ACE33W/4Je98IAgiCZkkgXRJy3rmLHRvgClInueDmnOScCqw/GMJCKOWcu7f9EzBwYbInolMvwSTNyx6SbwCdyy/HVLgUM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747620330; c=relaxed/simple;
	bh=P6YhGfwpTWjH4RxelIMCi1nT/wtCrRVWtOdmcF4kceE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lQOvfF3GKTUBw0nEyfZKUjmwjpFq5c95Uqc5ZyW/q2XgpCSP5a01AXjJY7KhhseyMwDJ+WRORCUOiM15U3a/Vavzs6wiiesCcnrJEtXiQtZm+XSiawW4i4l9/NGPrW0Y9RPUZMNHOfQmAaK0V9KrI59FQQ8I9cLzP9a5aIJD/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAKmkxyG; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAKmkxyG"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742b6705a52so2590481b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 18 May 2025 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747620328; x=1748225128; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WNeHNuQ/4XktBWCvVGZ2j9OjX/jX7Q26i4sZzFTDLM=;
        b=vAKmkxyGzemOUuFq2baGbGJrHLHYzB2k+g/qNK2dQDQmrtR7Xgmj0U6zh3QJhBycxq
         Z0rEdzhNv+vqdCdUp0oJ3brOuNTBgHrKZRpA8XLX96CvAdXxBLMOx713LOa+fqVk7cuR
         qlBFijZfr9RVdwz9l2EPydPSpwH9x3ZHG7r2eHK78dmUCQ2X9XP6z077cbb+YGQNyiTK
         iAu23CPPP14Y3SCxlqxq7P/XeZvEklgXyjVFjVF2r87vph8cZxIVx3Zip5FjN6Lvu7FT
         xUgF1+E+kQC8OM7Pw9u+we1z7atRpfpZIbXq8aW/x/gcPVz3TBVnVBE2riFgiEiuX9RF
         tdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620328; x=1748225128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WNeHNuQ/4XktBWCvVGZ2j9OjX/jX7Q26i4sZzFTDLM=;
        b=uRRsuZiV31RtWf4VHIjBX6CbFtGS0oO5rSGTddr4nqxafaiwD/GVvr8UqJlHRmWnGw
         CB2BBOipAtEWXdXR6qL/SRZdQxr0DTlpkikIp8NftJX6NHPqBbJgtjaPY1DnvjHLtS2s
         Y+aInAgqbOIjgv+G2xE4kDi0Hq0dMsYFQEVzDouqYp+RsSP07472buQXfszA6YZ2Kogp
         HWeZ989MOET+t9U0lXeQMG3UDCtxWGb4QLEzF+tuP+61JYD2AwGa5JIt1hYwHNFNYI8N
         8LuSTnEqpUCun1GKeo11IPtvp5j4Dnj2HJL5MrDkLcfwqUnol2a+cZtgYFN5tbOXdLdi
         DwSw==
X-Forwarded-Encrypted: i=1; AJvYcCVXXxjrHZh6vTxOCI6dq8FOMNfd5rIZlHIjXMuYwVukWE9LHsuNLY6pdCPhHVyGe+hAIiUwBeBuWy8q1hgH@lists.linux.dev
X-Gm-Message-State: AOJu0YyyhFVyXKr9VxiRI7RJ9GOuskWO/wd65c8aCX9dULP5lA0UG94U
	F46y9TXw1NtzqFouoIYYaUPhLeU3KQ9lyAIDyq/WEq/C7qfMped3lNQi9+uSMMBaCaqaMDKzDJ8
	P9WkmK4VIWcf6aPiW2a5D9Q==
X-Google-Smtp-Source: AGHT+IGJ1y2LMgtkB4KN/mhUl2Kk6KWp4viAq1pbxiTlJMAogrAQ3rkz6/z6rHDzqvrWuq/M/ufamRUOrLWsXoK5
X-Received: from pgre17.prod.google.com ([2002:a65:6791:0:b0:b14:9a53:2226])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d1c:b0:1ee:d418:f764 with SMTP id adf61e73a8af0-2170ce33ad3mr16521363637.38.1747620327781;
 Sun, 18 May 2025 19:05:27 -0700 (PDT)
Date: Sun, 18 May 2025 19:04:44 -0700
In-Reply-To: <cover.1747619816.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1747619816.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <3c84dccaf38161d6de6ff560d4f10bb3d344cc51.1747619816.git.ericflorin@google.com>
Subject: [PATCH 1/9] staging: sm750fb: rename `hw_sm750_initAccel`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `hw_sm750_initAccel` to `hw_sm750_init_accel` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hw_sm750_initAccel>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750.h    | 2 +-
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index aff69661c8e6..a797985a4df7 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -193,7 +193,7 @@ static inline unsigned long ps_to_hz(unsigned int psvalue)
 
 int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
-void hw_sm750_initAccel(struct sm750_dev *sm750_dev);
+void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
 int hw_sm750_deWait(void);
 int hw_sm750le_deWait(void);
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 64b199061d14..a5bb067b30cc 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -173,7 +173,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 
 	/* init 2d engine */
 	if (!sm750_dev->accel_off)
-		hw_sm750_initAccel(sm750_dev);
+		hw_sm750_init_accel(sm750_dev);
 
 	return 0;
 }
@@ -474,7 +474,7 @@ int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-void hw_sm750_initAccel(struct sm750_dev *sm750_dev)
+void hw_sm750_init_accel(struct sm750_dev *sm750_dev)
 {
 	u32 reg;
 
-- 
2.49.0.1112.g889b7c5bd8-goog

