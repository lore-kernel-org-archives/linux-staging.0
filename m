Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FC73DC4CF
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894983; cv=none; b=WQ1cyXfAQXE6RTIyGLRT2/jJUMvfqk7ZfjXFZjT+tV9fU/7tjxFyvcp8RjP1gbn85Sn/se6XP482y/SWjAaidttqGBhBCZelwjyCRacSKsQTGK3/mKOAuhJsrx7ywOZLAhqoVm+NHQjeWCtN+R/J6pT5eoXtumc2/Xunnix4x5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894983; c=relaxed/simple;
	bh=DAeFPN+sO17RHHzLN3HxpZNpoUkxEL2tH+xtJwMVrO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c0rUqz37J/+XTGpWw8NmL0vc+PrIeBnNsAmiVMQ1aFMWgBpqfmcY1O5d+9plp6E5TiJFE2xdEak3kPbovgY1sneGcl47foKYNOrF562M+lUgAHWuo5oVWmAvzW0q4NwDlThTDicxnItt0dCNBl1HiFGyJ276qd7y8N96sqvnOJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwJ3wDOd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwJ3wDOd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so51387655e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894980; x=1775499780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stK9cT5cCw4Q6PYwLkH9CVyAPf4y8jr4qJdOQMJe9ZI=;
        b=rwJ3wDOdLDko7TMKD3XBMxVt9cRas++0Rynx8Y5U1PbxvRMolhIoAG1WCoVoIpnGf8
         dPpxuHhRVIjwvSaqWhdkU21O8obMCpxCE064DvpWto5tZ2FQP7HXOvhHaulTEy5JinuB
         dBcRQ0Wk96wKsOFPwKtzO5bpexa7fd7KsK9LiW9Dspeso5MuEEJ8YD0Azz03+JFmj9nm
         14C4PLv8jCEarqf+swSqpvBiP5wd5/VSjiob2lApEgEjJdldSFql2k6EIBecxN2ry/EA
         DhbuB6QAqcCEga2OAH2RjE0nxDLz8m7E1enlwxaLFzDh2DHFremW5Ggi2ipnb0S04WsR
         c8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894980; x=1775499780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=stK9cT5cCw4Q6PYwLkH9CVyAPf4y8jr4qJdOQMJe9ZI=;
        b=OjGJvpUZzvLjTH34ZQ1KW6AykPhe9RkzjK24nySpIBj+bKPlaG5pIMcA7EoYXpfHFd
         fWKj2kSGj/QQFby5F5aLc/7qD/1ydi1K+fJDRp1jev69iI8mQk+Qi6ibEVaTd6F7FSe+
         71/07pusGMPVLvscNkjCE6A1Y5IUIAh0wljjKcUntW6CNUVERSY+DMUF9wjQpwWuUZqt
         3Xu+tRBZFRKeOlryYwFgP5LBZFimmVnxOwhLF4u6KERmuZ6/4CfBZnNOlWMNZvLjElgN
         PDXSAd7NZlKgNoUmtfgQCbS58K31Op8XHl0KFidDFtWmU6/N+QR0na0+4tj6P/ALVYVK
         bO0A==
X-Gm-Message-State: AOJu0YzSX2GMiCvRoxZv1FPPz+e2Dd8Zy/ScbqXFCeO+R/MWOcxERnX+
	MruYyqqdAvFy/jxoq9SP3y/hkM4EElCx0tWybAktZK+sLGzVWFEMKXzE
X-Gm-Gg: ATEYQzzveD3u5hYVOhlFvplpDgI6zNFmLKIVTCwptU5seo2US/3Gh2eRhAvax2965VW
	UmVaiuK7x3feQp9tU9sy9LhLmqbgccViMLsfJ5fXcHrTw8yichqe9g62ZkQNbs8bJFcEabJ65rO
	Jq2s5sZdbogQKiOx3oZqNsVx20ye6ATLGfFOWnlaOVlieiR4TEKRK8pBACM+rNNyUSHtoJsccgE
	VWlKvtIXrOoxU48ccwkyp0FvS0dyLR7ZKkGXwaQs0ncLmy9N+t57usrQdZgGVNDyaLUs/3ppyPl
	L3wwJLdu07H7cWhcc/dOXxFwlP4RaqFGi/HK11YxjvcPQ1vz/CD552sWBJBu8i7NhQhlyD8vb2B
	Nkwlbgg1HkZky7ysYfr2jHFitwV5MAyCmvV/+jCIEG90+PwpwRDfyIqdO6vshZuwtCDkAv+mba5
	LcFBorubHlnjiaDWeWkFDdKoBxeHEBMgrSel2m6c7A3aVnlpfbQYOJ
X-Received: by 2002:a05:600c:3513:b0:486:fb5c:3b20 with SMTP id 5b1f17b1804b1-48727f23fccmr210042895e9.13.1774894980297;
        Mon, 30 Mar 2026 11:23:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:3437:41ca:45cc:e6f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48733c095dbsm130198405e9.0.2026.03.30.11.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:22:59 -0700 (PDT)
From: grondon@gmail.com
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Rondon <grondon@gmail.com>
Subject: [PATCH v2 2/5] staging: most: dim2: replace BUG_ON() in service_done_flag()
Date: Mon, 30 Mar 2026 19:22:52 +0100
Message-Id: <20260330182255.75241-3-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260330182255.75241-1-grondon@gmail.com>
References: <20260330182255.75241-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gabriel Rondon <grondon@gmail.com>

Replace BUG_ON() calls with an early return since the function returns
void.

BUG_ON() is deprecated as it crashes the entire kernel on assertion
failure (see Documentation/process/deprecated.rst).

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 48315f8cd..b820c3647 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -271,8 +271,8 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
+	if (!hdm_ch || !hdm_ch->is_initialized)
+		return;
 
 	spin_lock_irqsave(&dim_lock, flags);
 
-- 
2.33.0

