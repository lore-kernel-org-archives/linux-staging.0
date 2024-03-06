Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A212C7F2;
	Thu,  7 Mar 2024 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818195; cv=none; b=BGdvqT6q8CVOWF6Lj+/ImMpb/5sCUsUk2O9qB9t9NgAIOO8JupqEceK+SXerCuEEwzcSnYan93xKmCofQGUhJucUZJSyFQOxtCW7nscPoqc0R4rMmr9q/uVeaXu68BNJQQfQZjGpCnQ2FrCKw+obIk9yTXUrwm4RTGXeJQrT33o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818195; c=relaxed/simple;
	bh=J2etBa7M2nf6fRJqQKEXcxEyvhWY11lxK97trwZSzyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fiSmlrEvHsfbDOVW9EzYObfsAh83aynlZI8vLtDoNbFMd9h1mMLE8i74dOaR7e7HFPaEw6psbM+u1SlG5cZ2OR0WuSop/P0KdAuyYUyU/WH8YxCPbP5DcOnoyEf7o6qCZCT/G9XLfAKSPIAKfDEr1i2U3oaON1/SRipAKxdyg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1giAe1/; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1giAe1/"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a45b6fcd5e8so116743166b.1;
        Thu, 07 Mar 2024 05:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818192; x=1710422992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=138Gm4ABtYaPQIE5qRATOKRtkvCq1Q4flr4LHSy11y0=;
        b=H1giAe1/cmuvjNzhSErztAvvGxVQtTLAAmBryUTUtU1DOXwFVuqBV+RBhFT9rhmxjH
         nxMjfAvwB1D5zsfBvXyLbc+sW+WxagaWujiGnkQnSQJHz/xzPy5Nua7lJpkH6Rf+04Wd
         /g47KXQp5ZsdWoyS3SXAg7fRmCCkLtjz0eJu98vZ1br7Yj4lFIGKywSh+ZGOdcxme7g5
         uI9O9GwNwbhT0DhGSZ3AlQuS57QYCeKzUbdn/+uZRK/c7yW+jtYUA9ju+9UShS3VT5kK
         YAcRbADvGTzpbOiyuy3Ac1J5LyT4pqp/6DdDyONs4MaAgHsAsjmpeS18Um9II7zc+0aU
         Rg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818192; x=1710422992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=138Gm4ABtYaPQIE5qRATOKRtkvCq1Q4flr4LHSy11y0=;
        b=NUYtKKXeF4UQgFAGRdFJf09g776yvDneJJuO/c35RhsBfk3b8IYIqKVC5lm3KmXDGa
         udsoXdOSLnO3a4iX+/NVNvwdEjDNgboZcyKFWC6MJklhqAs0S923B3Evpky//BLUcSL1
         iNZ2LZVlEFiwGAvYDoTMwL8qwehGOZG5iIBKMMut4dROOb2WypmykMA1dfkEEHyQjGw2
         wTr0WUlQjBOA3hrcsg15iZyWgE61Qpf7OmH351sX7TDTc/We0fGwPZbHNGE7sGu0u6NF
         vPbNzLXTrbWuWfD5ICxeofh+dps0/cRpenGrQ1vS2o7nlW46V2jToeL0iCZxEg/lmfnm
         xnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeR1Lri54qKfAm1Ha1VH8cDAgGRUII4/NDmy+hJOU8NDsncK4nQuhN55eIwkTd87iskwxT4sV9o1pMhJ8bKoodBCYm9ieTAGwRIDEmfGyHEmxTq7DIZAUP2dSuYmIcI4CUAnWTuMprdQ==
X-Gm-Message-State: AOJu0YzoyOz5dREJgouXTIfm9Li88aQJL1vZRGOutupG2tmMQTzKs35c
	qEI7n3tXGpQVYBAsKIG7qG4y7EPNIYDrtgvwJUls31Ghwsvefx/K
X-Google-Smtp-Source: AGHT+IF6P+FNJqWRAqAPqHdf/mwHKOS6tPFhvY2mvizvf1s4x1ewXkRwfakBLoO66TUBCZH7txV5xg==
X-Received: by 2002:a17:906:c00d:b0:a45:b75d:2e6d with SMTP id e13-20020a170906c00d00b00a45b75d2e6dmr3762643ejz.14.1709818191772;
        Thu, 07 Mar 2024 05:29:51 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:51 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 7/8] Staging: sm750fb: Rename Variable sii164ClearInterrupt
Date: Wed,  6 Mar 2024 05:44:57 +0000
Message-Id: <20240306054458.102288-8-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164ClearInterrupt to sii164_clear_interrupt to fix a
checkpatch warning

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Compiled the kernel

V3: Reverted a commit in the same patch series


 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1def02be4cce..6fef1ab484c1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -24,7 +24,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164_check_interrupt,
-		.clear_interrupt = sii164ClearInterrupt,
+		.clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
--
2.25.1

