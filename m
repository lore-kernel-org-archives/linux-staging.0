Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E1E35CB95
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469838; cv=none; b=Fb/U/7Jp30WF7FOIxd1V3zFuk/6cR50P2GHm0hdGQPxYK+58XGyhLLvQG7q+l81Ph2E+/4J92qZFGZFi9HK4mWhF6CLshgwFNRZuPq871qqwGz4D4pk5+/DeFq/SKRUK0943+xs8nyi2EMsbWFAqrje17ryhbKaruQza5JfEG/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469838; c=relaxed/simple;
	bh=X4Xd7xCbh0SYcYlle9KWj8HqcSr5tjqYYkab5lzv5eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6u11fW+5rY1cnOt6y8IzrMCCrwiQ0ImG+mDFgSX5FpXN5th8vBItWuxnDRc+WvFvP+Ltmqfw7Q3/1VwloxU1DnZiyL3oYfxr/jQv75bzTqTu3E5/CY9zLqmgq3zjeOUdy/9ChgDHhGopouDDoSNXTJNquNXxZ7lv5hHr8DBcKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHkHAKqU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHkHAKqU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a58f2e514eso4619935ad.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469836; x=1769074636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVfdJ9orhJTwSTgdiMULruB5PJZpaLviIQa1t2ELkLU=;
        b=nHkHAKqUppQ4RIQyRkfZOmizThqFSTyrOAWCiD7GAFqJgq7PGkbMAcmfowQaI2fH4E
         zA98LK6DYj5idRzg+GTlsHGKxD9JWUjzrlAbzkRBr58XhuGsyPjaWCOIuBJjg+vH3p9o
         4bGFeWWzIBX5K/OlG72o4GUADxkyd8GxyTDUYQZYbCHiqIgrU1mLGIoeFH9ZfDL8BlGK
         vjLn/NjVle2XzpE+Wb+aTGDOj3ILMS1TTfRZMB4gyIwZuevAVoUZ6NUFf9Z05mlqb2XQ
         3CsfEvWhMFnVvMiBV2DtwqmixXg+mShOT/LP7sO+cFRaiVOYohh64NXXXi3rIWsDwquh
         HC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469836; x=1769074636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVfdJ9orhJTwSTgdiMULruB5PJZpaLviIQa1t2ELkLU=;
        b=hgCpsH5aOXRp7Iavw6TdgtaCAJrjWgzF3O6iK7Etf0BLSeVAUFADrIIU0ReqUjt5zo
         8tAjA8viVQOZOG2L8SWzU0ZV9lX+s5mXPcCaXvsLr/mXGxXI7Zv5f3OWvK2R+NZZVsgK
         teF9WDQhjMbN5Ny5kAOes7Awr1stLj/KRO871md1ohRx5Ru9w50iN1oMdXFlYU4xCIK2
         WC1yrOQO921MMQTQ0mUdRr3pFskDekdDKhuG/iNUQ1ttyw7Kk1i7yu06+8FPcb/gWSRq
         mnu+Qdfl/XWiz6C0PoyZVaKmWyTGyXeZsu5quK0WkEqZkiKa7P99AkNt8oxZ7vkh4cuW
         Ru9A==
X-Forwarded-Encrypted: i=1; AJvYcCWCx43TRUTt0eCn2uOpXG22zRyzf4E2pLRDiGKq9oNCXHuak0eShc3xh0ni+vjh/ALcv6Doh9sR/1gYrCv/@lists.linux.dev
X-Gm-Message-State: AOJu0YzesBhOYyGOdNtpgB/jETWMCcIAIK3Th3cZpyNESULKDyF51msj
	duTmyePnJKjGckBQBTgK8PR8PsE+jSo2DRluo+27NVgmkkc6MckaNlprtGv03OX6jo0=
X-Gm-Gg: AY/fxX45o+nDEEINgC144VWL0XusVvm4VfZCLl6n0Ie2E4ALOjeZk6vGWCMjzZ3St9t
	R+W7gxJwG1GpWr8ohGkGKwl8eWGTnCODJEICxavMY/kfKhxQ5fakIyLPXrwghh3CXZktJYGi7o7
	8i3QK+6oOqgEnEnsZSlo3AtMHrXo1oM972hUm7LHrQLn6UKK+bTgTrpdqYy6c13iVarYmhfhLsi
	DP3JSjoVtSZTJclV6eNPJO6+yY9vyGm7NyHvKzhUIt4Cu/4R0kjTwwBfkxw/0t3gCRrBjRTDI3v
	Emi3JFbAFAByOInTyaTrxRusPerTZjca2ELCY1LQyypIx9Q9w/nQ7oLlLnq1aemT7GRQDO44XjV
	BNuT6GcX2wlMOoDVLgbHDg29fJKWSxdhAQ1QA8bytuc+4cPFEGXywapRvskk0kS9KomiVUSIo6V
	cQ/YGqWJU9RNzRoEE=
X-Received: by 2002:a17:902:d2ca:b0:2a0:ccee:b350 with SMTP id d9443c01a7336-2a599e751d7mr66686905ad.58.1768469836193;
        Thu, 15 Jan 2026 01:37:16 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48dc1sm244063595ad.40.2026.01.15.01.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:37:15 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: coding style and refactoring cleanups
Date: Thu, 15 Jan 2026 15:04:35 +0530
Message-ID: <20260115093439.7588-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and
coding style cleanups in the rtl8723bs driver,
focusing on rtw_xmit.c and addressing checkpatch.pl
warnings.

---
Khushal Chitturi (4):
  staging: rtl8723bs: fix operator and type cast spacing
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: rename CamelCase identifiers to snake_case
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  17 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 238 +++++++++++--------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h |   6 +-
 5 files changed, 154 insertions(+), 111 deletions(-)

-- 
2.52.0

