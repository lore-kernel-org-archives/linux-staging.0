Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E9C1BDCF
	for <linux-staging@lists.linux.dev>; Wed,  1 May 2024 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714543106; cv=none; b=LaQW2faVXl+nltxxN5Ir8w5js6rRbypiS3xqAFCE/HuPGoXDVwyO1Y/GMWY2bqFkUcbGTq1jN/1qXXDOOA7c68hhgH4etN5Go1WR1OI45DYGWIxRsUMTooCXX4s4DC5oktCHl4M5PIT52zejhYRqU9zrPk4oIlb0gkByiOjC/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714543106; c=relaxed/simple;
	bh=NEG2vTlibrdbeHfz/mSNhIkZQL2SAVbK+/ddgB9Wn60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F5NMx2pfPtiXXQyWU1Go9ABVJq+X92dZgE82LzrXZUZMDXgCK1/e012imEDMyXSNNSRlKqIcAMxf/t8dKHYodbuuG+xT93i+UtcWhqe1R0uYNt6sdAVO+VMOddXpThUubCNOjJyhdPcfCcCDmb3srfaaqWgWgjEmPCmZIHX3WTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYzFEEIw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYzFEEIw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34dc9065606so156949f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714543103; x=1715147903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJSPdGVNL0CH6RKDReTtjMIGVs3tCJE8fRUe5uhYbEM=;
        b=CYzFEEIwhbNti6HyDFzvS30EnpRpgEXKpJo+4cC0rk4NHkxGrdYQDHFpycWy/SkTLN
         XUWaK4AM319hwiKbc9qZ7k7mUMAq1QwUYSwXXjlOHP35CQ924ywaoZgU9lr9J39JJXXq
         oxe88s1XY2rhvczBQTOkrecx5XsHjIuKM6fB7yKgjJzPP8WGQVu+ZwEYrVZTn260wl+W
         PZJYxemh1APrgSoZjmAky5dnhtp0djRGfRmtjHB1gI6kl3uBnQBjBbbl6dm+JdVJ/LVt
         SIXocVml44JCpBfXtQGJz8XFustElvQOa54xIC6oVue4fKdH7WJsgcrHkbZUl5D7gsJk
         IFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714543103; x=1715147903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJSPdGVNL0CH6RKDReTtjMIGVs3tCJE8fRUe5uhYbEM=;
        b=Zks9BZWPEIYgiqnYt9kMtfUybtZ075BOIcIrKZ12EKtruiIMrTRGR9wgQOhFouJ0vN
         wajSB5KuqvhTA+Vjq0gQQQHz4/bW5rzLH5X530+4BKQIIS1wANcS0xddrlApC/cmMAR2
         c1vvKJVzwXJAByoPzBfcHLN6S5kcHiK9qWBqqbwsLN/gIpZmzxWY3u6M1Xrea+x9eF31
         fokt2gPmagSZ9ndhtqvwb30LwALaOIwgrLyibLuGY+2Y/nLTK3jT1JpR7AVG34rJo7wz
         H0pASngc0JpLYNNkrTeEEquj1kzGW8q1RHEcLqlxpoNW3s1wlj1VQE21R5mVqi9dOq18
         WD9A==
X-Gm-Message-State: AOJu0YyMCwwoB8tWFlIhIweH1IBB8Spjs9REa+aH22iFLNojG5lI1Uaj
	64wTOFei/XwE36/eKBhuXnXUkVo0KenIt1+IE0dZF3AgWETXp+Rr
X-Google-Smtp-Source: AGHT+IGt1yJDDGiDCjl16A+X1xU9Yhehn4TegkmTogjr+xE2qMqYBAsET+Hqkh8odECqIj6ZgfeZ2Q==
X-Received: by 2002:adf:ff87:0:b0:34d:8ed4:ca3b with SMTP id j7-20020adfff87000000b0034d8ed4ca3bmr1634610wrr.0.1714543102754;
        Tue, 30 Apr 2024 22:58:22 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:737b:ef00:e314:db5d:b033:4fc2])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b0034c61e211a5sm12451390wrt.63.2024.04.30.22.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 22:58:22 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com,
	dan.carpenter@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: pi433: Use class_create API.
Date: Wed,  1 May 2024 08:58:18 +0300
Message-Id: <20240501055820.603272-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset reduces static allocated memory by using class_create
instead of class_register.

Shahar Avidar (2):
  staging: pi433: Use class_create instead of class_register.
  staging: pi433: Rename goto label.

 drivers/staging/pi433/pi433_if.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)


base-commit: 75ff53c44f5e151d21d949416633b56e56160124
prerequisite-patch-id: 91943193af2fea74182be67fb583235a3fbeb77b
prerequisite-patch-id: 2cad031ba6a0782a67ab1645ff034a8be65c2e76
prerequisite-patch-id: 1a852ed8f9d133aec7c651fd9007e59e39c55fb7
-- 
2.34.1

