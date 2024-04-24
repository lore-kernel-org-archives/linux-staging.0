Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CF15991B
	for <linux-staging@lists.linux.dev>; Wed, 24 Apr 2024 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713959017; cv=none; b=G4xlE7hHubXE2EejNYns52J2Qg5EPmNvxDjBk6/8oNwXJfOHEz0BLlkamusiQZLvYQSqvzszWGvoM5g9zgBDBmJLrvawyrv1ZdN8+/2GcNEoPWnzxSlnA8GqU0IBC+foXXp88uIcVbz5X9PzQIYDgKBBmNn6qlUgJlZ8HwpK3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713959017; c=relaxed/simple;
	bh=3lahgNJKWCq8KC5g+5ZgzQuCAxnQjDYOSrfMMIwSLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmEtbCBXaDvDHlBJatGrsY3oHPSsB9qwOBDPLwQWos8EsAvjPO3k31kU9jf+6ct/gki3VB/YD7vGndunT6AfFuSKOXRBDjEuVVjrdAjixpeXbfiQhBDfjllbt8RiUWItaqwJh6+noEY9EoHChXPbIxFbM8K8Ezsk/i2tStYshwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MM89I82+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MM89I82+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343c7fae6e4so5948335f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Apr 2024 04:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713959013; x=1714563813; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enk6u0NWo+HjAlsfAsaG/0BOtgb+vI9MCBxWfkbUG6A=;
        b=MM89I82+IG6Ilx06cmD+0bmPSpAbIshMjYU9hye8umEQgNR190NoIkmW5FJb1m5LAk
         vM6b9XNbomOIAsxAHPAXtmHPs/1JZmkMzyy+iP4/SY+uIZULsa47rtSGhEhjllLRELY3
         1WFa3dyZfwRAhHggGJ/+fQTUVnn2HaM6aaCeezqQCe2uWzP+qw7a35UN3X9RGRoNgLX6
         WOlnFqq63WX5Q0joQe96+gsvjWAz7hd3LRSGAfMU+ui8pePc2m3zabeWxfc7/l5GOnh0
         4eBw4buMRxZrec0kS98PJDUJONHl2HRyUyjrcn5K2/KOh7deamcOhkbeu1Ly+UkH81kF
         6GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959013; x=1714563813;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enk6u0NWo+HjAlsfAsaG/0BOtgb+vI9MCBxWfkbUG6A=;
        b=HauRNZMRRYPA2yS9tzNTlDuVc1am4RM/wZFJVeZOnQ8WGXVWhyQ1BiCJyOOkUB9fNL
         S7mJMRfGzP7tTxQBirSEU+bZdywVNTeI/a0OB2iDWzzVCZJduVuy3RA8NXGhJpXuh2Pd
         6L77ZvUVpZv9SaV7Y+rvUXGdEnHeYOySx1WOCXZGEE0b6zlyhR5Cq1m5glir9nXdX1A6
         /ACGely/AN5pyrlJmQ1DTg99wqZ/HgqicdLdrso/5eW8+Yq1ZEGPmfOEmTGkFcKSuFpV
         /ERlaU9q6CZKxWSFkoxTb1hgw8ow4xNzxoBYGzIFu1SeiQzlT2mMdrTJkgL2MZkZj7SM
         Da8w==
X-Forwarded-Encrypted: i=1; AJvYcCWcOErJOYlbps4ajQoJUsTTZ/8wwg1o67lOf5m5qxv2P4+6+jcvdBEk1Q7uX5Ag9kagQ72L+3rgkyTvfs4upG1KUWyHGDFGr47Tn2h6kw==
X-Gm-Message-State: AOJu0YyI5a7ztS7hPTzyB4CmLwWRnntvPbkdLu+P60R8lLFv9TAu1tRG
	kEQ9XUbWVxSW5mP80DI8pAFxgQ5zDhjrmbPFD52B0e9BOSJ55qk4RyB/vsuYSHE=
X-Google-Smtp-Source: AGHT+IF5vUsuDt3b5kATjhz13YwMUbFsgUZ7ijQ1OWYZHfaNiPIFT/g4J+dEvQgjMaMZVRjTozCIKQ==
X-Received: by 2002:adf:ef43:0:b0:343:4b39:9dbc with SMTP id c3-20020adfef43000000b003434b399dbcmr1447812wrp.42.1713959012474;
        Wed, 24 Apr 2024 04:43:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b0041b0d4e1c27sm1442161wms.42.2024.04.24.04.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 04:43:32 -0700 (PDT)
Date: Wed, 24 Apr 2024 14:43:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: vc04_services: Delete unnecessary NULL check
Message-ID: <526ec2ff-6277-4d5d-b2d9-63b087a97c7c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "state" pointer points to an offset in the middle of the "mgmt"
struct so it can't possibly be NULL.  And also we dereferenced it on the
line before.  So this NULL check is pointless.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c    | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 9fe35864936c..3c63347d2d08 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -1170,11 +1170,6 @@ static int vchiq_open(struct inode *inode, struct file *file)
 
 	dev_dbg(state->dev, "arm: vchiq open\n");
 
-	if (!state) {
-		dev_err(state->dev, "arm: vchiq has no connection to VideoCore\n");
-		return -ENOTCONN;
-	}
-
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
 		return -ENOMEM;
-- 
2.43.0

