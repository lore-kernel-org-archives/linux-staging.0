Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC35B64A
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219591; cv=none; b=AYDoRqtdHvzPTngr0wqHgT/12b4jelpKDykKJcd1b/g0+c8sb8WSecANeQtPB1avAKUeYSkmIbjNVG9w1wfj709nk8y0IxEsP0qpOnYSYpocah9hfVYDcFqShUcDct1wkFQjMZWTxK4yCCgcuMP/XPERdVtw1z40YoyxZPC7KNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219591; c=relaxed/simple;
	bh=0ZGBEa3nKN9nmtBQzdi4v/JXQ08scUtoe4Ysqoq5BhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WAiQrs5KMYLk+80xt3gPWlC+laIw/biPJUNmcmkuZIuk4toyMhJQBGdmGygJLOh/r/X534ejvVgx6beoAiHz0JewWeoGUqm3MXy5KXgyn0Vm7ywu30h1+ZBeCGbiUbnJkbgbc4ycNWmMKVn5q5fkH9n1Jw+cMQGpwMStO9lgt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvYoxazw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvYoxazw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso279495ad.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219589; x=1741824389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZGBEa3nKN9nmtBQzdi4v/JXQ08scUtoe4Ysqoq5BhA=;
        b=FvYoxazw5X0cjah9rRoSqBLHtOtHcYUY8rm7bbryxNVzSC4EehcP9uzoLvJ77A8YqM
         tXratl4pNc82qszwl9Onmon+La4VplOcYq14vc6aZL3tLWMESTIysR+7moF0GybEy4/G
         oPeYcZM/LpR2VKXSHsyMkiDcraPmYVbsuWgsw5WTQkOvy1oGtpx6v92z+n31TlQWy2Xe
         VH2buZKCs5RSkSnigdKqdeRIIAGjX2NRxguhjcptVySwxp4yna4rgO7SkB32QLbL0YQk
         Wxq0SMckLl+Jh17kTsmWR/HG16Pg+DOGhaDwzh4MhwjksOqYRISbHirfwPLQ2k5X5eVb
         BEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219589; x=1741824389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZGBEa3nKN9nmtBQzdi4v/JXQ08scUtoe4Ysqoq5BhA=;
        b=CyFeX8grTUiunQqHIqkw0X45N/TyFx7UrANt97/CaJQP5hp5Re3ZZeWYBUENVSpUbG
         Ed4mcJTCZva33nZtUb6ptSQG2wRSvlS9VHUzNfTaMOLvMNNloyXRNGGYTwn8K0i/DFu+
         ZpmrFr+P9e5Jse5y1lFXh61IbvNrllIi2ewzlqLi3S/Q08ngOwNwq33jez9V7rHY/NZj
         859ee5lYtNHX/vjYW0td45SkajNGah6V/pgIC2Di+zmlO9SL+XwOSUc9UkSSxhmBgOvs
         O5NeWscpTYhIXXGB4lDH73CbRXQTfMMWDZylxYe4grKHrT2zIc+X8WTH4yOhD0gFiIUH
         CjQg==
X-Forwarded-Encrypted: i=1; AJvYcCW6SrBH6q+uArN4X7Ar/Uw3Lb1CF2H6xn7nWBCfwPqVSaur/Zh91NMnm0eSC71nFwtJWasdAzamMjdL4FLm@lists.linux.dev
X-Gm-Message-State: AOJu0YyVcihuBAM9ahdVFVAcl13/FhSxZKx1mrs2HALdOwnocDcL3RDu
	hAjL9kn1tLiIIh6ZhkIbzkvJoOhtN716JcwxNtqZSyVnl3qwUBfK
X-Gm-Gg: ASbGncsyTNMf2/lF+lKP/GlXDdKM//wwGL1BxRNKYbG6mjlzZZfMtO5ez3aoz44Gvi3
	7meBOd19hJbJYzcPB1BZ7GagTlm71JWsps8ZhVqp+NFhyixN42c0Z+VasbWJ1LnbC/umoRuBEzd
	QEKc8GXUQecDaf5b94+2176E24zCMbXklSAguYpMjRy5sm1DWWtTl13B75rBnS3G6Nj7ZSbz7Vt
	zNRue4NfkPQIssMR1OFDhChHYFo7pjfqFMerFiZYAvRFdVvP1+45uWJjMZbdq7K8+MHueQO8Lhc
	i1UjZNbgSpW9VKhVJj//dS1PW0/hLnsfq4KTElDC+zVEY1pLB9i7H+JKU5do0C3jHQg=
X-Google-Smtp-Source: AGHT+IHBhYIgc9aRlGjnY714QzC5qHd23J5//vzpB9xP76OCN0p8RlrjfCAV2hn3Yb5KESvtp5ZSdg==
X-Received: by 2002:a17:902:da87:b0:21f:c67:a68a with SMTP id d9443c01a7336-223f1ca5a6emr69095285ad.31.1741219589198;
        Wed, 05 Mar 2025 16:06:29 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:857:3077:7768:d8a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698514ee4sm27463b3a.135.2025.03.05.16.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:06:28 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: danascape@gmail.com
Cc: Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: iio: adis16203: Remove unneeded spi_set_drvdata()
Date: Thu,  6 Mar 2025 05:36:24 +0530
Message-Id: <20250306000624.1554112-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305234949.1548646-1-danascape@gmail.com>
References: <20250305234949.1548646-1-danascape@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, I forgot to add a V2 description

V1 -> V2: Update commit message description

Sincerely,
Saalim Quadri
