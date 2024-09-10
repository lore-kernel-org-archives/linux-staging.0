Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C00228E37
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 04:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941048; cv=none; b=Byr4kaHxeQ+J8HpqiSRyaFLGLP22pkWRNlVHZqzFKnhQIuIeNGbgbthWiVDIpPTUVICh60RBQwKyWgJHfFLksOhKpW7yrXL5v7ujDgADgctGA08u5lciYNiZamFWaL82NFVMywhOjtWqBvo5mU03Dac91lMxLr2gTumlAKxKokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941048; c=relaxed/simple;
	bh=/gJAksFgmw0XJca2LxIhCdD460NHpee6rWYJ2Mx9jq4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ujXPQYd4FaoMPld8u7tFFHP1BJAeHnN+WdxhNSUQF0CtXgpfjHssFthkaZET4oTktHdBCvJ9izXZomcWeuTCz54X/Vouuk2OJnPOCFTYA95uAC9dlKC0tHSfiLPwbkPTp0FFd6Ja57lFA5mes3Yqym9HV9chx1FbbcYKyjuFdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu2AD8x2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu2AD8x2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d19bfdabbso401905b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 21:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725941046; x=1726545846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wedlIa7uUfPhH/VbGYP8ZCH9iPIQwhmTlK3bFiNPCr4=;
        b=cu2AD8x2WbFdmykj7sz1MtAKPABKa8biIre0f2vucMGsq5KG5rXqbK+94IRfSH/qnf
         a95gybtrWAtT1bmGsbECUvqO3dmgdBMJK2RVW2E1PawX41Hld+F4wIZO77FhWeB/ATmD
         TleKHk36/EE2ECtPgxcB/aWt3Fmq9v4wI30VJSheVZaYsHk12ajjGJGfKIik2qTflRFm
         bY62WDsMx3RhCvNdQafqTcUcQHXOo2Qz8KzA6gqMC5R25EYVDu6t3vOHDAU2BUZPQIyf
         9/rdxmHlfZubalYh+OLci4WbGlcS0srlWMF4jPdrSkZeSH81L9GLk10MN1LsCWoebPAZ
         LS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941046; x=1726545846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wedlIa7uUfPhH/VbGYP8ZCH9iPIQwhmTlK3bFiNPCr4=;
        b=t4B+y83RUVHrKU8Q6HcqmE/DDLDUXDSNC6Pdx7Q5SP4NYbK6m/cizQyZQ4h6K8RzFw
         BCnIUv47Uuz7W4Ldo/6tfIVrPR7Dy4gcmF+XW5f1hJj6CuFk3Sckz/qwv7ZTUImulR2V
         X3clZvz/w46VBjwEAY3oUqfedzVZqG3UINnHCQdWIXY0/OJ8UgLvk12BVg/dm81PbYf/
         CWQk5RyNGmQpNfOniksvBhyMj7S6p65expQtNQ9JvwW6Dk8FUqINqfzbeJH47xy/kTPY
         MwkfVwdq24/g5xMbcXebIfdan7CCHCCl/rLLr77RxZbz1o6wuuMAc/vfBlBj2DkEES8I
         hD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWj211V9UxwVI+jPwWPAXf5leNbVw/EIhOjFfFdi8GDGdCfueumxLhjPJXNAU7nS637YO0QnGjBBzmVgeBJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzxCA+AjSRUpwCtBP7e36Ea/49gpsE/kfCtPs4SEG/GYj3tC/+S
	zO5eYRoWpTgeKslyFWo4OYaBOqIvWYxn189fOaDqRcFA4Z4fTeQQ
X-Google-Smtp-Source: AGHT+IGRuF82h+ayxgwhBkurm64jexmcAas2NnpDXYe4MXsPsNlz3EwcHAteMIGLIA64it+lErPW4w==
X-Received: by 2002:a05:6a21:9992:b0:1c6:bed1:bbd0 with SMTP id adf61e73a8af0-1cf1cefb853mr7113079637.0.1725941046359;
        Mon, 09 Sep 2024 21:04:06 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909095275sm471902b3a.129.2024.09.09.21.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 21:04:05 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] staging: rtl8723bs: Fix spelling mistakes
Date: Tue, 10 Sep 2024 09:48:45 +0545
Message-Id: <cover.1725933169.git.topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes various spelling mistakes in the
rtl8723bs/include/rtw_xmit.h, rtl8723bs/include/rtw_io.h,
rtl8723bs/include/rtw_mlme.h and rtl8723bs/core/rtw_xmit.h files.
This patch series is created after receiving feedback on 
individual patches.

Roshan Khatri (4):
  staging: rtl8723bs: include: Fix spelling mistake in rtw_xmit.h
  staging: rtl8723bs: include: Fix spelling mistake in rtw_io.h
  staging: rtl8723bs: include: Fix spelling mistake in rtw_mlme.h
  staging: rtl8723bs: core: Fix spelling mistake in rtw_xmit.c

 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_io.h   | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 2 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

