Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EC4690
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724983514; cv=none; b=dETS1pIlxYzbU1ZY/ilXiVhdAikSvAuBzOjt7b8XdP/OJ04sUCUDp9vgxDH44E0YRp/CzTWZN6GcbYhnc0sn3rWshfLofmt6OU0+oMFV3SiDZNTFOtAwwe+JTZua2zFEuA+fSnWR6IDhkcy/W6QB+sV37KEXz3bXTRKR6bkbvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724983514; c=relaxed/simple;
	bh=2yuuJVKQ+Siguo8PGv6DbdWIFXlssxpRT1fH4pUOoOk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ta/Oz3lk/wbyH2P0p+nkgjbT3k7wYC5dhyt6udZvX9XH9RDAKgrI+xwh2pxQQ2zsHtw4+Fj9QbZX0lTcFRjoF4y1FBcK3RM+gOmKoimldn462jHSywWv0MSmnJJ/u3KZ9RTUDlLCvt4DFZgNoojoiWcxdmzHjolkucxENXpKDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=KNzOm5SO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="KNzOm5SO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso904670a12.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 19:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724983511; x=1725588311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/5DVpazD2e4b/WBbkd9CtgNXP337r5jJGNekgg+Vhw=;
        b=KNzOm5SO9Gn0EjNN2QZ2hHe65NnEFGaqoG81uw3ufVp3q91wailkDqnGFM1HnVAjKe
         722YO25AxBlVn2xyI3hJkXTlVP8bGgwvzo6Qxcvi9DutcuSBv+o9HodNP3ENGS3OVwp2
         DVLaT0bwN7i32TU7tlEnOjcbCNOhvkiySKGatLikohN8neKB0k7b0ETO5PG5MqBHqKP+
         4j9E/Xa1g/YARUl1JpLnzS8bFo+4lXJq6fydcY4k0SmYUEKXV9CAU9f3k+J2Km5PyJlX
         TSv1Fq1Y4p0aI9xm3x0blXJtpA9AT2w0hNZ78fs6FzL0CvnOm1k/+BL906b1SjodBxNv
         M9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724983511; x=1725588311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/5DVpazD2e4b/WBbkd9CtgNXP337r5jJGNekgg+Vhw=;
        b=nNvMzc8wv4ScxisPbqDeXR5TgPKyMKec41BTobasynBIkL+hUIQEVCqNnU5+7q1GTv
         J2HOn5ePpx6O4W3MziPYkOhIjFKzNqjBiFAx0WtT4c4VLoiamPLToUbZU3TksrG6tMx3
         mgbQS869wUR0NlONs6LzQDf+0q76orrZqMZtWEfjNJEdtzMXvHJxZXOasNKqH3aSdd8Z
         XWVdQ6Oh74vKWnC0fX/m1zrAuHysSuM/mvbAp1ygAHYdTCQBjKK8ABCKoLvDvi0ciVyQ
         20zwxMyC/apvMIjFilESh43mHJJn0VaOxJ4cAnYRHShuSabTc3nPblHerdYVrL3wnXhP
         srKg==
X-Gm-Message-State: AOJu0YwbbhQt76JYbPDk7UNScmS1mj5NRxTf+MpfaMy3cOlbsYk/7fCX
	c+xlPGXcw2Sefbvy8NfZoCGxRtbuIU5+hp2G0b2hNRDT6iNaNyzp2lt9aHlTqKU=
X-Google-Smtp-Source: AGHT+IEMCsy/a+MiMSHWPUNa+kuvu9LDzb34kNddaRUMbVVgmr3mLn7LTVs5FWxj4etZ87zK3Tk5tg==
X-Received: by 2002:a05:6a20:9d92:b0:1cc:9f24:42 with SMTP id adf61e73a8af0-1cce1027549mr4694666637.20.1724983511028;
        Thu, 29 Aug 2024 19:05:11 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515534444sm17643255ad.147.2024.08.29.19.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 19:05:10 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/3] Staging: rtl8192e: Yet another variable rename and cleanup series
Date: Thu, 29 Aug 2024 19:05:05 -0700
Message-Id: <20240830020508.532945-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames pNetwork and bHWError variables, and 
improves readability by inserting spaces around opperators.

Cheers!
~Tree

Tree Davies (3):
  Staging: rtl8192e: Rename variable pNetwork
  Staging: rtl8192e: Rename variable bHwError
  Staging: rtl8192e: Add spaces around operators.

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  8 +--
 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 34 +++++-----
 drivers/staging/rtl8192e/rtllib.h             | 68 +++++++++----------
 3 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.30.2

