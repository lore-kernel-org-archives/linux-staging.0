Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728682D8E
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162574; cv=none; b=IR/oCjnRGa0m2dJtpzF+w3nTHpvIAS7ma8JSr1xfyZ4g/YgGqRhRdzuvCY1S6+n+kzyKhhUuyB1F9vFcYgoqMFOEy+DWGK1yEp9WfbV0d1Rqams3hRz60zEWKaU92KTwfsnZCyZ9pxhjJot516FItdvEJ7L1fcJglainlNjKkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162574; c=relaxed/simple;
	bh=+hkSQsHkHuNFjHWC3sYMEtLK6wx5aCSN95mhnv+qW/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmtQ8HktGRtxN3uH3sz/zqJCMgL+GN2o0QgM8e1mCAvai4S3831fISkcfPFyJeP6Ohd4UrEZ2AtYxFVpPbFbsF2SsTCiaAk3CYEhjdkqPIw4dy4wJDbCtLxQkTy1mLUv+FR7kO2KKlPep1OcrXBW0DX8zEKKne8BRXd++YcIZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=F3k9Wi/C; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="F3k9Wi/C"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b96a781b63so2368155eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162572; x=1718767372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nb8O2azIXxdt4GxCY1fQnfF3h/5DHYmDEmQNF62iLI=;
        b=F3k9Wi/CWLkgDFwCRrKQxHDugTRh4Yi9svBX/3Hl0ORbRlTrqXIOk3JPmpqdoM2oMT
         uWOyPPQA8cMRc04lLcuyEmurqKIIlk5Pvzkx0KzAAPz93i1w0OgEhAWYtSuAfoZ+iM7r
         WxiAPs2pKtk+fby6g98KB8+BXV42VySbwC4iW1x0Y1cEf1/KWW7eDYhnZMdikd6rVcv3
         lC99BYiG7vgMsaGx8mqN/tfGnk20QvODO9O7cEq5bYvEvCj+HIo/mrnyBEyOPhIJgwbs
         p2FGrSCR6PYc0vpRrKQRJ3RPnIcckAc/RF/MYQtQ+7324pOSvMI16vRV3+muzWFxtd4h
         GSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162572; x=1718767372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nb8O2azIXxdt4GxCY1fQnfF3h/5DHYmDEmQNF62iLI=;
        b=g2caWqK/1jVLGjRXO8thTjlksiwIbLdamS7TdbebBLXPpYAzXOIC55LF7E0kkCVTUT
         6H+QL4W8LdZgT03our0qQ6Bqj5LlFSzB8U7VNtLb687INTv7kOk1iW7wqKQOSDjN4z8W
         kogjZ8eylt2LcL4zbXmm3BFHVtalB6MPZK50tWui997X3vmJNNKUt5dxClUcAIVNspCj
         pUvK3MQL/VtKbu/XTgOGa1TzdoyjR+eOvQH5Fwt3WNCLLplH6Mi+X8vyCWsqGyQYZHN4
         GOh67hUOi99N/LoR1bzkJxr86KqNhCeQVosSN6RlKR10ZQgzUs0MPm+n/6Ym5NEnk6/p
         fWCw==
X-Gm-Message-State: AOJu0Yyk3Fkzr1akUxqcypuF2IprxaWlpD7qveL0KMeuk1UVV0rmOkcQ
	XMDyOOwOo/zzmx9F389bZ+j0ydZ2T9nTDkBnlMoawSHClAx2ncffovsEPOe+9dc=
X-Google-Smtp-Source: AGHT+IEnGI7AT5ngPRYTMTtEcNd8mtD023Qkq2VHWARRINuGHnkE+kMqpXdURqn/Qa4rIy63aBHtsQ==
X-Received: by 2002:a05:6358:6f9c:b0:19f:4d27:fb76 with SMTP id e5c5f4694b2df-19f69cf707emr88629155d.7.1718162572397;
        Tue, 11 Jun 2024 20:22:52 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:52 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 23/24] Staging: rtl8192e: Fix alignment to match open parenthesis in rtllib_tx.c
Date: Tue, 11 Jun 2024 20:22:29 -0700
Message-Id: <20240612032230.9738-24-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces and tabs to fix warning: Alignment should match open
parenthesis.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Update subject prefix with 'Staging: rtl8192e:'
 drivers/staging/rtl8192e/rtllib_tx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 2f5005689a36..8e2abd16eb86 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -320,7 +320,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
-					   struct cb_desc *tcb_desc)
+					     struct cb_desc *tcb_desc)
 {
 	tcb_desc->use_short_preamble = false;
 	if (tcb_desc->data_rate == 2)
@@ -331,7 +331,7 @@ static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
-				      struct cb_desc *tcb_desc)
+					 struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
@@ -347,7 +347,7 @@ static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
 }
 
 static void rtllib_query_bandwidth_mode(struct rtllib_device *ieee,
-				       struct cb_desc *tcb_desc)
+					struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-- 
2.30.2

