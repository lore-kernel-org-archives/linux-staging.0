Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E133AD95
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214862; cv=none; b=fmukWhNabnRnD84AKmZxwDUQr+RxIrivVaxXn17x/GHbVsdN7REk7cIXeR8c2HjexMMZOuhmRtZl8LPPq613CtsH2AhP9u/eg38EiyGrzu5EFsGzpc3Nj82HJXfbQl3Bm1+BdvAeEDhhgUOpGI6gMQ43gJ0CxLNuUr1ty8/HsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214862; c=relaxed/simple;
	bh=WGmy9DOe0+wiaEkty9w7br46NGqdsJlC5Fnk+FiYaqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOmu0p1WM1bZ9MSWwYISc5gV/9BysMDlylqcP7rQVznZBVrB3+s/4oZaiH7FeOtqfhGIpxHsC1TWj1KL6LLxWVn1vn4/9wP+RJt4ke9doU7u++lygM8lQuCpEUGJZRjEb15t7iq0s2pCrbv4m2HN28m5Wzm/sN0YpNxN6ZokjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQwTcGBk; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQwTcGBk"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b98983bae80so2724813a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214861; x=1768819661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBVCmRPx+c26FIVNeV9bpAvhhSTQfYstgFSr1DUGxTc=;
        b=aQwTcGBkaIOcu8lh1hjmSboqffTtvZyFC9FIto+Ns4M8edwE9Ffsi4gb5FMJHyxZnX
         GpdI2HbovzrWQnKedygChAYVQJ7lDziwJf/wuRwsKnFsAqIbxsNOyMyQ/+ZPRmwKV939
         h+gE84uuCLAsJOfkK+Rx7aV4Q11fWJcsGDkj6DuCQIWKncABho4Hx0C25w1TfAt42Vgi
         BA6FwOj87lGSq+D7iELC+dKUaeu2zL7w80dZ7dltBfSrQar8PJ5B4lO79cQVhAPf0RE1
         1t/o3I5z0xh3RvWYV71gwf6qsyTmYcqvfa0aymsS5Vn/jBXbva/hN1Dgxgr/luhAy3AW
         IDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214861; x=1768819661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBVCmRPx+c26FIVNeV9bpAvhhSTQfYstgFSr1DUGxTc=;
        b=Qe8zFyL0O2lcq3SbTyCbiHLdgmwA5R5MPJSh6cB1ju+NSDldIOE9aIh1rXBekqkfr6
         GuYUiZCihFHJJSSBrm0gPDKGS0f0rDzxfKLQeFrdvF+njgDv12XmTLywNahJbSz+i7Zr
         txrP/epJwmX20JhbMf3SXwVT81XM07M6afLAp4galG+B42PmQToPAWrmbudFOaSMWt7K
         wi/Qv70amqM1Q+IdV+uC8Wk9ya7gkBHcE/EF+jysniGldBJUoLt6enWPkz8behWiSf4h
         iCV+pp3eykhNOSZ0iUCiGNGnFczttmuUqV4aUKUhPgo6AFppU8tqmMFMmrqgNC9R9JT3
         ZD4w==
X-Forwarded-Encrypted: i=1; AJvYcCU9hqZYpv79oMrbwQYxWY35yeCzXzP66EP3/n5VaOMs74n2c21fTFUIVHslZ86rev7qhcvwSeo0uH9npJzT@lists.linux.dev
X-Gm-Message-State: AOJu0YxuIbI7ZzH1W/o5M1HeJ2lTwzQDW2VMAQntaSL+ceAz8IJ+54aC
	aKEYpoGZVQSaeQf5ezTPpC4bkst22G8DyDPN43xGbNp0YqwxYrKD6/cIKUu8GA==
X-Gm-Gg: AY/fxX7XWhutbehSX+tG8xeoMI21THckPNkU60dJNBsayrRtTBPO34sawgjRGVXz5LZ
	1h+S8GodR7WCJh6GDqOA5r6nb1rag8BwOSZhF1C7+iuQ0PLTXjQVZCK6FBnLOG8xS8WJuiQUzYd
	bygpY9tX/5TuUPWOYYxINa4FcYbCwtUsZj/6Fc8fojXxCIfIDK+s37m7V2st8aXz2hgzuLr9VEA
	GEOuxpdvGa4YnRpk/IOUOtYBrZ1IrKRlfXPgzbx2LFkJ2HM0W06CNwIBN+qH9ZjZXEZLFX4qdz8
	3h4bt4UaMcVwdnkx1uyxrY2nqVVuT8WMfyXrouUi0vCoRJFcF9wHZRWChgdjng2DJd2n3ttdbgj
	CbYXMMQAZbZ1HiXpNwhkHDfiz9PVR4aoWNwUrj6V8++NOSZibiwAO+UkwrVQQxhb6ics2llioUN
	RBnQvaj99hYf6op+8nhwce
X-Google-Smtp-Source: AGHT+IHJeMVUZJSajgIyTqTBWnObgOel8ZODP0BF5nrF+PH5OJh/cfqTriQQ8Gnwc7dV3QxB83Tl3w==
X-Received: by 2002:a17:90b:2ec3:b0:34f:62e7:4cec with SMTP id 98e67ed59e1d1-34f68b4c743mr13762331a91.5.1768214860946;
        Mon, 12 Jan 2026 02:47:40 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b10a44asm5686116a91.5.2026.01.12.02.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:40 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v4 3/4] staging: rtl8723bs: add blank lines after declarations
Date: Mon, 12 Jan 2026 10:46:53 +0000
Message-ID: <20260112104654.45175-4-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added blank lines after variable declarations in osdep_service.c and related
files to improve readability and follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 0f767d3e8c80..163129e1d44e 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -203,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
-- 
2.43.0

