Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8EE6D18
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FchcImxY"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3bbd1fab03cso301659b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520572; x=1705125372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZypATw8H35ihqG9rrXc0EK6Jgq23KE6lbLiv2k1vYQ=;
        b=FchcImxYD7K/tA+pufLoGaMghdouFBX90NUbbslIibAfTEkUjRA8r+QGptQvWQm4Et
         0qZl+bRQqsre8+HW+nDzsbJAdeDSw+q4LXXov1aW61z6hsP46kOvlGlYbQLZYert2cWp
         NmvkZHWGmOQUxHxd52BMdJ5z0rBtZYgpnp/cczX5HK1t9cvSW0Slps9e7bv9Q8bMlSK6
         4qwtfXn71IHFR5V5dsGDJtPkOvx/Of8n2ZF/yYFwtRy9qfvqfgp1MpyUpcVX8w1iTP8H
         QGFjSaKcuGydtglA2t8GBLhmpHsx1mSNfL8qZgAjlAS/UUN8Ctlk5b7JtWF0l1c0QmQV
         LKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520572; x=1705125372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZypATw8H35ihqG9rrXc0EK6Jgq23KE6lbLiv2k1vYQ=;
        b=VH8qaaMwZ1tqrQzdaSi2FVcLKRqJp3AfTzGwyVr0y+o6LTl0BesOz25UjUpi56ZVpW
         6V+kjJsJsf2p6sYbudj90iX8lQWyCujNeIvWdxKhIUuNxeVnqNXg6JUEdJR3DVZeRnW7
         Ov+1TwXhjfL0ZDdYhe9b6q4S2eXc8EuwN4xy2BiM9ccwrAD8NWttB8I0yeYQhEh+8TxF
         63GCjlYqgdKADpdeVsES7m67SDzvtMVwHFdiamrJZBpYOLPFr8JB0+iaiVXy9/Z0BkZy
         XOFcR8GmzmGWztavTpbihCSwDH466PAeTfVdCVk9DouQjB/MLj4OUzOHuB9sn7wejIMY
         WPIw==
X-Gm-Message-State: AOJu0YyPhQItMttPmfun5cN8tPpIKauN8Jc+iQuK9KFKx3Qfkplq58E9
	HKDsh6lKoOhaFjfz2NCkvRdxh8pwXktQmw==
X-Google-Smtp-Source: AGHT+IHw5dbqkWTzXcnD1+Uloj10USwtpp3x6uvXsevFn/L49TQeKGvCaip18M90KM0O5EDyfMM4Rw==
X-Received: by 2002:a05:6808:bca:b0:3bc:2fe8:8a48 with SMTP id o10-20020a0568080bca00b003bc2fe88a48mr643469oik.56.1704520572375;
        Fri, 05 Jan 2024 21:56:12 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:11 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/21] Staging: rtl8192e: Rename variable MaxPeriod
Date: Fri,  5 Jan 2024 21:55:40 -0800
Message-Id: <20240106055556.430948-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable MaxPeriod to max_period to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9db834f5d637..0d53e0a92a4c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1381,12 +1381,12 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 		if (ieee->bAwakePktSent) {
 			psc->LPSAwakeIntvl = 1;
 		} else {
-			u8 MaxPeriod = 5;
+			u8 max_period = 5;
 
 			if (psc->LPSAwakeIntvl == 0)
 				psc->LPSAwakeIntvl = 1;
 			psc->LPSAwakeIntvl = (psc->LPSAwakeIntvl >=
-					       MaxPeriod) ? MaxPeriod :
+					       max_period) ? max_period :
 					       (psc->LPSAwakeIntvl + 1);
 		}
 		{
-- 
2.39.2

