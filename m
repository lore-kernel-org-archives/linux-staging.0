Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C0C15E89
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272732; cv=none; b=eOpG8Q6YWdQbb8SNVJCq2fmV/ClzNsLqFX73Nom9zuToKEysgRst/938qCvJAuWNxNIfkRKSR0iRTulo0O8YxvsWdpPfG+YzP2Ks5CeLQliSVS6EDljCCLz+SBGcv+bsZHJbP0lkHkBFry90l8mQ+jQYgoCMMvQCYC87G3k5/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272732; c=relaxed/simple;
	bh=jOF9iZgUd7g+X27X7gIr9Y8B69O2z7nBsgy0A/k1qYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sH3ii4CRrY+hmBia5RKwPCwGToV1x34ntVz7UFak6VAnton+BO2/9OpWQMfs7hIFqQF7CrVR8jBtp/7+35KKdWIL8VtZDwYr8rlJeKEmvm1ONhqumhpGQih04gBVX2tjk4ZsiuntL9wOt0B5bwbBR3M0RdRJKlnlqS/1SMrlM5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQFDHLgL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQFDHLgL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-341808b6217so2117585f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272729; x=1711877529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxbGaOtsAwJ/zarjDamCe/HbCO2cHZVNxWTbIWGUDKE=;
        b=iQFDHLgLxUbVEQV4A6mVf9hkFnQewiuIJzDUtUmKRP5uhzobGdf2W8HXMoo1pi4X/T
         gF1pcEsN7lKBTSUJ5zD/8zbyJx41sbuoFUDDTAIqVjpVnjxsKTEF7AsTEfXfJbz4GWgU
         7WvAEQX/nqrFVXLkVvsR7wWtZ4Moi13ZO04vKaTODHUUyq8bZsZhZHOWnZXObw4jnd0N
         OZJ8u55qu4KruX4ZP2u5e+aBs8FoBBy/c3grugIc/Erd187sGO7LDtemK7nXp4EWRhYR
         NWWq5brKalbQZmIIjNWCMeRDanlXo3tvkDPlSsb9DQNPgEH8GfS4ZY4oGLRiHXHQNaMi
         ZaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272729; x=1711877529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxbGaOtsAwJ/zarjDamCe/HbCO2cHZVNxWTbIWGUDKE=;
        b=AhFXsYgAl+di78tKhaTFXYmZD6gGziYEy+DD9sboTZKF6x+SL4iJBzf01cUdNI5y+t
         cyp0Mg7x5Y01WudpgkWtSMHB/uLIXYHPp14e6cJqEuOfASYdhJzB2nDdqOm8vzyuwOR7
         AWSiqzSK/6/BP/du5i5wUd4XDa6Se8tVoXkBnHA2CGzbglmMmOpZXABMrEvDgOGPeGXb
         tR5nZOXWRUBhbinAScE0f+2Y3iNlb/0DE0hMWp/gNOfJylhRwhuTRzwnFJC/7/2+9gv0
         8JoDavGNIBgZqW3JBq5ZyQc62VziAsUQ3Ya3sOGVu0hm1yvJOCMVJ+e4DjAWpNA5lkmM
         3RzA==
X-Gm-Message-State: AOJu0YyH8MT6H097AwmW8h4GDQK9lUAEphtV58dmkas+upx1kA/2nl/3
	rpZYBB0cCZ7+Is0id1S4JEPIxVtOVuZGKnM40vNiSnTt9/l8rJaM
X-Google-Smtp-Source: AGHT+IEJ00xSkWWq048VudCmTvl9Uw5e9k7Kpq3UgGHjtCokqFMwGQDp0pWSO2uyJEawjqO6f6Dm+g==
X-Received: by 2002:a05:600c:474b:b0:414:8948:5f88 with SMTP id w11-20020a05600c474b00b0041489485f88mr66330wmo.0.1711272729177;
        Sun, 24 Mar 2024 02:32:09 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:42b5:8c78:fc9d:7600])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b0033b87c2725csm6490711wrb.104.2024.03.24.02.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:32:07 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: pi433: Fix includes & macros.
Date: Sun, 24 Mar 2024 11:31:58 +0200
Message-Id: <20240324093201.793485-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Untangle include hierarchy. 
2. Update #minors the driver can accept.
3. Make use of general macro instead of magic number.

Shahar Avidar (3):
  staging: pi433: Use headers in appropriate files.
  staging: pi433: Reduce N_PI433_MINORS to conform with N_SPI_MINORS.
  staging: pi433: Make use of spi mode macro instead of magic number.

 drivers/staging/pi433/pi433_if.c | 5 +++--
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)


base-commit: bfa8f18691ed2e978e4dd51190569c434f93e268
-- 
2.34.2

