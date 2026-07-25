Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2F4908D3
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784969243; cv=none; b=MjBYLyrbCmxtUrtZGeD8d2SVdAWD4yzgpzIQ5XuErefq7XrCZeBxJViKlBtGclD+mbpWkoaZLnNBuGZYXcjsLCoTb2jCHolPcxREeX9m55Nm21dt2WLMhIwNTwY7zbijIEQGAQU8/IVY0diY8d0sh5YEcI5QGlCTbLWpDczaTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784969243; c=relaxed/simple;
	bh=0Av68wN57SFEL3QSLrtDoLnK4quY/MDeqY9qTXeFRys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yn+60VsZ77HKiaOYG740nQLAQm7qq/h08UxrBO47nRpHXdbSsQHzKKWBz6dred/BG/WIapszEZjowSL2SH7SSx9ipd7x4BuG8EpJNAwj+pmOZRtbJa0Yv4ifMsT+KG2JuJEfZ7H9pCwNoKhgdFFpsB/kuPjtATbK4c0RKKbxCh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHCTAyEl; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHCTAyEl"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so857626a91.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784969241; x=1785574041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjZQz3L+xdWq/feFkJjqK6ttqoUhVBIYHHEB0gOlh8M=;
        b=YHCTAyElvXUiZ5BeGt9xrUvGMv5RvOrLUW7Qqsu0KFt2mxhyyxgrBpg2lSCa7wo14d
         d8vPED/2hWZbrf182rZ3ZTCNU9afG5uVrGU801HgN1H/YSFA5TgA2P8bRRbAjcoq5FOa
         7wlADvVTsm7wEjVsB/WoyMS+mBMsEwqKWanQMTfcvQ+h921+6U815mEpv9aRD8vaII1B
         /DuZ95bu/ZSWO+TKiESR9eBMVmsuLaieWgVX2ikryU/8+qdtANeFsKbAjP5sR6lWYr3X
         wurzW6pEMG3WkfIhWp5+ZD7NHd8F6hET+ToeqszMSds7JcgBhenabb/q4PoxHbHGpwPR
         ArSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784969241; x=1785574041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjZQz3L+xdWq/feFkJjqK6ttqoUhVBIYHHEB0gOlh8M=;
        b=iRIc0D5vda0GhRe3wTKcnVb/Pqii9Uttc359bNXpicOdTjRBNCL0P8IITehom2wjTt
         lDwLzE+/mAIDaSKjikRR6vgQ2J0/5nuJBCsQLp9IBUTbdS6kfHgdzW7l85ZH97NySt7g
         XFm5uCinxegDuc6uJwui49kaT0rMOTir3xKj3VGPYQaTt172TMG9ocyeoStWfqfuIcIF
         EeXcvWQ6o34WjMPRaj/yLS2xwUXM+0jwXGQ3X74AUfV7o91GMlxIpx3t38lx9iA4mWMe
         +NUXaKI3kJirTPXvmx9w9L4/ozlTIRSF5DVDLWG1S4nz8tZXmTEOcW3/MQHJkzoNGDdw
         waNg==
X-Forwarded-Encrypted: i=1; AHgh+Rrxq1mUMY7bhaTAIL9hcYkLDpkfj0mUE2i1yX9Pb/mw6ZsT1WbfPZvr8WbrdYGN8SyTgfmTWl6dg7RybH6Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc/edcSCvyYVcgRzO0j1oaWl7R8tuViz9Hly/lSneopqXYms+q
	92/0HE2doFnz7Q5BYN4fKult3W/jEScSnywqcCtAMLisbbzq4GBuVvD30JaT7uVh
X-Gm-Gg: AR+sD10158pzwi7DsbXewJF7wBKhmJTrfib1ZBXFh3BS3h/uIRR4SvYC9kxJqdoZuZP
	tOor1YxREIy7o7ezvTn/dC+CX+sq6NQFsI+tVTfKcN9N+PEIXbjHa0vTdWd8bC1fJOOJN6QFFwX
	IKop9ULYpDfEQDafv9ddxDpAThRCKo2ghaxvnfzjM6GkDq9cR09+NGX43UIpBJp8bchKVaFYTF0
	9lPT3vcyLMiAnFMJMFO+2OXKhk73JxN+kCBVIkNG46DlZDsjxie3uZYHL/0h39jK/yCAJ9M8T3j
	X4tTUFbWtK1Zi2MvCvf9eiaD0xTvGgpwps52l7Fm3UiWHd30H3sUymZobLjvwHyAgUDqeYs3JVG
	efC85Gg/5YW573RU59qlnOWgHrWLdqR5X7Jz7yMKhj3GWjFh7nu+J2WI8XVxK68sYDB4SrSwYtT
	agcg==
X-Received: by 2002:a17:90b:5102:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38f295bd22emr1717141a91.22.1784969241124;
        Sat, 25 Jul 2026 01:47:21 -0700 (PDT)
Received: from PC.. ([103.172.209.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d6ba579c3sm6232352c88.8.2026.07.25.01.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:47:20 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: Remove unused function sm750_enable_dma
Date: Sat, 25 Jul 2026 14:16:49 +0530
Message-ID: <20260725084649.106589-2-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725084649.106589-1-mishraloopmohit@gmail.com>
References: <20260725084649.106589-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function sm750_enable_dma is defined in ddk750_power.c and declared
in ddk750_power.h, but it is not called anywhere in the driver.

Remove the unused definition and declaration.

This addresses the first task in the drivers/staging/sm750fb/TODO list:
"- refine the code and remove unused code".

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.c | 13 -------------
 drivers/staging/sm750fb/ddk750_power.h |  5 -----
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index d617f554f58d..e4bea8da1827 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -90,19 +90,6 @@ void sm750_enable_2d_engine(unsigned int enable)
 	sm750_set_current_gate(gate);
 }
 
-void sm750_enable_dma(unsigned int enable)
-{
-	u32 gate;
-
-	/* Enable DMA Gate */
-	gate = peek32(CURRENT_GATE);
-	if (enable)
-		gate |= CURRENT_GATE_DMA;
-	else
-		gate &= ~CURRENT_GATE_DMA;
-
-	sm750_set_current_gate(gate);
-}
 
 /*
  * This function enable/disable the GPIO Engine
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 1c4f054d7276..0c4ab2120385 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -23,11 +23,6 @@ void sm750_set_current_gate(unsigned int gate);
  */
 void sm750_enable_2d_engine(unsigned int enable);
 
-/*
- * This function enable/disable the DMA Engine
- */
-void sm750_enable_dma(unsigned int enable);
-
 /*
  * This function enable/disable the GPIO Engine
  */
-- 
2.43.0

