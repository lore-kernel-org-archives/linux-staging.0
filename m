Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0460128801;
	Thu,  7 Mar 2024 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814055; cv=none; b=YDLkVPeBTBnI6KmV2iHvzQfs18cpsMGxgT8rghaf27BTN4AkDIIT+FMxdTE3iWXxYlfTYxS5HMOHph4vM+Y9HPcBCpijYdHyGtb3hdg+BVdi3bRgh05p1kJAuD119MQzTEwhsdVE+oaLJFgn8R+Amdl+RLUHKkgPSqHYJYi+Ny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814055; c=relaxed/simple;
	bh=Bxvks6pPj/wsgJQz7x2udYhqltEPrbBD5LUm8t+vMo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tpdrHCYDuivnk0yW/uddubWISvcQ3wh+bWwi2mRNanwK5aTqZoEuBqC1kuZrQcnApCUKJ5nMOhDLzhsjaDG1xjLFOkgqEwj9PxmiAiWUfrxR0+qsfJolyg6+t8xPpzjsH5gDtKHZANtg3FlUgMfHH/h+X/+IxGOxD+2jc0Jpkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhYB3cmq; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhYB3cmq"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a45670f9508so119812966b.0;
        Thu, 07 Mar 2024 04:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814052; x=1710418852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQ03N/NbgosgBreqgiNxjMdgmj44JYGGw9CvZuZuxtY=;
        b=NhYB3cmqjgaUiXE64SkJCwjvIhgCLL2KuunJ+KOoqm8FhOiDIk6ldzmoF2me7gU9oR
         Rzfiw8L8MXZ1L5x6nfLKgmdcJCazHgtlfuF32YlT8W2YvnUyT0qAk0ESxdkWm8MJRuNQ
         EslQxezhj/S5x+ktOwXO1UU/t6DvVC7Y4GELdlSm6DqGwSo1Tgppfj3nIrhwYa4ds6Nl
         mutk66Xka2an7wCDmudnAMrXQIp12PCwL0ZhdUiHjLafWc2yQQkUP1bAKeuHXexjXhOj
         jAbBjU1EJ63aPC+RsjZCI8qbEqhP7HCcNITxCxbhbhr32+vF31cuQQvlKwcbyzjj4Ag/
         yeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814052; x=1710418852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQ03N/NbgosgBreqgiNxjMdgmj44JYGGw9CvZuZuxtY=;
        b=gKAfG+6TdzqQe4542bfYULCox5gKctKGC26J9s1EuojKWnIGetPmp9nmXe1y1FZAWz
         qi7Zz9BkwMw5UEd1RV7Y1DwpdOGuhCE7uhn9bB61Xj+KIx/gphfwj3y3B7zZXo6ENmMD
         wI9pLkR4HqlKzy4q+38XcvUGA82AFUgB5rkMJbp5yTejTYZcDnHBQ3FLV5frc/L+vxhr
         JFjB0ze527trY3Kioqzt0fBGVwXCT7XxzyZkGV7HWqYXDdGgNyMD75uhzg0DFgey0QFv
         5r5U04IffosivxIGDjFjZjK60KrCafH2r3lYt+Tspmsq7kj5OBQJ/4N7Pvh7t7m+9hkf
         VWZA==
X-Forwarded-Encrypted: i=1; AJvYcCU0kSMU7VKr5mUUxMj4dUyA7wdFWLu3MQamGuWQheqK8GO0YZ2zspQFO2LFXMyqsYFuTEAYF7rQozToQ7OHcnLM7HjgZi2qNdYoObK5ZfBmLXxGEvtYmUlxiMWkhyFHIwKc9CeFA7n4rg==
X-Gm-Message-State: AOJu0YyxKa+4hEj7FWVnyDlMustBb1kifhPputYMMLJE1SqZ55ZBttia
	XFj1pZsafVrEA8ynpAxUgiQGqQgaMyL43PW/WjZmPvfPRCw9lsNs
X-Google-Smtp-Source: AGHT+IG/fY4e5Z8Sqgnjg336Wo8Sq0StPGcrEAs7ShmPCnx5dKgu7yuGbXKRpG8UOiRBXnAuMqt7OQ==
X-Received: by 2002:a17:906:3392:b0:a44:bf5a:2175 with SMTP id v18-20020a170906339200b00a44bf5a2175mr11618813eja.71.1709814052237;
        Thu, 07 Mar 2024 04:20:52 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:52 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 4/8] Staging: sm750fb: Rename variable sii164SetPower
Date: Wed,  6 Mar 2024 04:36:07 +0000
Message-Id: <20240306043611.98074-5-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164SetPower to sii164_set_power to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    Fixed patch warnings
    Compiled the kernel to test my changes

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index e568c210e2bd..c12df1f9fb00 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -20,7 +20,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
-		.set_power = sii164SetPower,
+		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
--
2.25.1

