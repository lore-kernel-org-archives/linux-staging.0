Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F51CACD0
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742639; cv=none; b=GihWJ1xg2hthwygGbxP64ePUoQZkmveehpcGM/OlLLqLTmaYgkdn4aXuD9r9zl6ZR4yoMaaWItSsYjQSjIHa/2Ohs8b0Yiv/BnW9m37hWbhzcgqlMZvqNuliytJP3oVQt24Hv5NPe6qcbqDL28DUXUC+rRDPovK4JGUOyhSYYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742639; c=relaxed/simple;
	bh=8gIEE5erXu36bvNvc+z4d5bEU5WInaaHUZh7cwyNQlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkm8xOYKB3yVYp5ADqs/BIGgDIoalK6MWOLe51O1Kf9Frbh3RzBqCkrxWM1dE7UxyWE7S6QALncI1RvVftwfxjeQD3J5iyQu4DOuAX3xIRFBXq+rWOTLIjrJv2zbVJgW1P41mRAAVIxF5I1wfWiKi1CeuGr3fy/05kuI00RGbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yy46K1Zj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yy46K1Zj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d47eff9acso2907303f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742636; x=1731347436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYNa6oziVbKvDXACDgmoC/if6wLv2o++lD6SKYvehsE=;
        b=Yy46K1ZjePE9M7wLc986ca/60DpIlpmHAS/VNzzU6pr8884U1HtNcPrxljqhCwC2O9
         K1y7GDsTN5Tg+wZOFlAD85nj/lJ5It6umOZg95TdA7vBBTLJxawyeAtI03zaQ/lKr9+/
         v7qYfAl8+KGWF1ieFwpMaMfWpknCe8NsK0Ns1fx3DlFfs7bZjkwG+nGkr5SV2d7jix2/
         5cN7WEHJgk7APsIt0BGDlnCVAjVIC3G4hYqH/m5mudi9J/hKCcjxZVic/NQ43A0s30xT
         p8Oo2KFfQ7t8WYoIB5jXsD92W/3WJJu3CPjCZ0m2M97en0f1+9bBd5bbjMTKm8s2o4F/
         z1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742636; x=1731347436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYNa6oziVbKvDXACDgmoC/if6wLv2o++lD6SKYvehsE=;
        b=MPXq/lTJOgNT/se2qkH8hBXTxMFEQz9NZJewbYgUrRT/GkhLFShx/ebL+Cob0ddxzk
         xLssr208LFcNDNGAy/J5tETW2q2dEGptnxJsvspozRHJ4HU6H7eri6Ghz7wMBGjg0tO9
         t1wrtSW/QYKDPS5Hv4V1psH2/+fgbwJIRBxXsfPmcRzDWwLMxgzpJEAztjhtAPka+xGC
         EYeHqHfV3fGcwuz2ZMDloPsf0oRGTKSpeW3eCJuPCoq2x5kpBdU069V3DMF0mWGHE85a
         nlEx7Y3zWfAlmSj+ORoQOA+Z+QzcPRc8AoVprMTweqFayEziRGmFbGeqPLD+UApXi2Sp
         DDyA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3iHlmuaw2f9PYt/ftUl6hwU6JtTDoKwzS/eQ/osxwxN0kpqKLYAuZk5sUjTQNCRlN0W+QOXSjpby26R8@lists.linux.dev
X-Gm-Message-State: AOJu0YzsDWTg7jk7MMbaLJa2Sm48Kjj0pr3WNc+ZwHMewsqXIgrDmoeW
	wdKrw+33xFFOatjtGNFNhspI4FnvaAOKRfyootnYzEU5b5MeIMwV
X-Google-Smtp-Source: AGHT+IGnVgxrx5ovonj/QGgF0+NBzmzt37wTCOqj6iqbkg5z7fiN4rOHRJNLIbNl8YLUTY1JcGmxVg==
X-Received: by 2002:a05:6000:1fa1:b0:37c:c842:a16e with SMTP id ffacd0b85a97d-381c7a47818mr8476760f8f.5.1730742635646;
        Mon, 04 Nov 2024 09:50:35 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 10/12] staging: gpib: Remove GPIO14 and GPIO15 lines in lookup tables
Date: Mon,  4 Nov 2024 18:50:11 +0100
Message-ID: <20241104175014.12317-11-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO14 and GPIO15 are not used in the current pin maps

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index fc8502379c28..78032af5061c 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -216,8 +216,6 @@ static struct gpiod_lookup_table gpib_gpio_table_0 = {
 		GPIO_LOOKUP_IDX("SPI_SCLK",	  U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO12",	  U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO13",	  U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("TXD0",	  U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("RXD0",	  U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO16",	  U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO17",	  U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO18",	  U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
@@ -248,8 +246,6 @@ static struct gpiod_lookup_table gpib_gpio_table_2 = {
 		GPIO_LOOKUP_IDX("GPIO11", U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO12", U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO13", U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO14", U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO15", U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO16", U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO17", U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO18", U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
-- 
2.46.2

