Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060735C18E
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019128; cv=none; b=lAfZlQ03/yOsMpUGSvCtOcbyaqFL8kWJHRL6TxEEUKMYgDcPqsnGVDwT9zNAr2uz8tmLgGNSCR4OYtxapcSRVvgY2DW0HLaVIEeUMm0+JEpahYQ9aLXLAiuCeIFi9GeJsYJNBOwxqbtojfPcAIFFWnxsJRRyiN2KRbfH3a/D51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019128; c=relaxed/simple;
	bh=S3HrSb4kQr0tZEAn4+ziXjCV7QcBIfNfDbAbmUqHzK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4qqsNbmAaw/MZB3xnkj9pdaY0ksCnsB6GT6HBj/l8F1Mio4pYJMYPwkk1aaOWnKYLCgYzbMLLN25d3BwFJ7SdK4fw/CgVW9ygYjTMm9rKZ1V739coB5TMIvNPYDCyIYjYhTwV/Z3hO2am6xs1E0mDEIt92kZ90vrGIXiOvHnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkodOWPC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkodOWPC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so68857105e9.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 03:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772019123; x=1772623923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3HrSb4kQr0tZEAn4+ziXjCV7QcBIfNfDbAbmUqHzK0=;
        b=VkodOWPCckPDkNvje6o9Rye0lVFJ7lqQPTx6ZzBfVf3jCHIAf0I1Pm7wtmqc4UbhCs
         lNxZie8dlXeGIZByJHD2UqRSUd1AEnmrWIhGCvRjLiLpztCh+go/kvROTLRugql1dcjO
         LdVrepjGfix7mJ1S1MEbiftQWnY5bfzcy92tQMkeTNaz1ejmy9Oyg08WgCw+5XfJTSNF
         9B3rcARtMH/yK0hIVMKxohJtgUaK97uno9OqH1Z6CJWMFWvliicEwN5OsDJ/mXIGm35t
         Qc8ca4Q50clMh0umsSC1qpINmRG0J6PRsih1QzPgKbkFmukVb9qJTWo8pMG5004XDHYW
         YvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019123; x=1772623923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3HrSb4kQr0tZEAn4+ziXjCV7QcBIfNfDbAbmUqHzK0=;
        b=Sr3Xoxzy2dMHPEhsDKqBTMQSnOcXUTaE5YBlFcR2mVV5R6DpkaPnw6ZiaoxyOCSf44
         dLTbbDVXsGOjfqxRvoVAvaYJ/J5113lFuefiFS0wZZ6/CJ2uZM0bjYpmm6YYjRXiS7Tv
         EhyHZM0ziW6/GjSswHhvw0OHzLG4OO0yDkJNJ/t4t6pmbz6BcvJAEv2h36BC9lxvn8Mi
         h121yIh8bZ3W7uzxjY004SEkXEXhwd//w+p6A84wMK/Hu26g7s+/ArnRtbRFNKMIe1kk
         tDbi32+qMzEevXKkoxG50gKHhOtDcipMMZGd8anHTfHbJd4uQsm8srvPALGvkSd1MfnL
         IaIA==
X-Forwarded-Encrypted: i=1; AJvYcCVEU3MS20SUZNolqwGYfHk+ftjj5PDZoibCpqS4Drw9wQkWhbFKO5fSpwetSjo/u85sZYjQg3F/pRpW3mm4@lists.linux.dev
X-Gm-Message-State: AOJu0YwQGa5FNelr05QEm6c58UbAemM7Zgk8fwaG65rDdl99eH4oUKs6
	1wFMY6IGv5mdZqHY/o/Xo8tosLeMDf0oPHJ8BPELsWJh8B+01fiBHGMv
X-Gm-Gg: ATEYQzyQKX60K89lquD85bT2sYuKjVJDqRJ9sw1Voy3G+imB71CAibbudrBWUesfHmJ
	SNKQAh62j3TYAI5lAAJJdr1Kirr1efCaXWwdElSApRcyPrq/hcwPTmSL6fvfhAlhMIYmq5Rom6s
	Rigbc7h0jBNcyZJE8Zf9zouSeo94MR8uhH1LV9cXQGrM/sdX2nVmJ8XOVy5TwOoNiVk9SvVuvcA
	3OxT5Im4i9W4/oJnkPJd2y8do4F4/AAKaUVINnksQqTdgYwDhLgXSClGcg3yKcagoIxfewVFG50
	IX1NBB1i6KjzDsCYIbrmOzBIVYSenMFnsdBa965nKgJ/GVDwjYtXBTt94nR1s5vAX4j7buwxo82
	gmlyIT0slVYaAd2joKEh1rmZqHf0QFMwlcH+19KEA48TuN0U1ZS+AQ3o3RWytO3S+wEoSkEb6Np
	7FlCn+CFwfMko671UXC4bYbUIlt0dr4cNRhPWmxU4=
X-Received: by 2002:a05:600c:45cc:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-483a95f5892mr250171385e9.30.1772019122561;
        Wed, 25 Feb 2026 03:32:02 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm13739805e9.5.2026.02.25.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:32:01 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: dan.carpenter@linaro.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	azpijr@gmail.com
Subject: Re: [PATCH] staging: greybus: camera: add comment for mutex
Date: Wed, 25 Feb 2026 12:31:47 +0100
Message-ID: <20260225113150.109829-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DAN_CARPENTERS_MESSAGE_ID>
References: <DAN_CARPENTERS_MESSAGE_ID>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the honest feedback. I'm a new contributor and I was
trying to resolve the checkpatch.pl CHECKs to get familiar with the
process, but I see now that vague documentation can be worse than none
at all.

I'll withdraw this patch. Since I'm looking to make my first meaningful
contribution to staging, do you have any suggestions on what types of
issues in Greybus are actually helpful for a beginner to tackle?

regards, jose
