Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453D1B0411;
	Sat,  5 Apr 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743822905; cv=none; b=VyziKNkL9SBmVfLzkbSoBdJtfzI0lBv9Z1LxXAgQvFdy2i3igM3rdak+7Byt/SR37fjsgd1UGE4zDmXpQOCjwsBtX5kUxpbrzT7AcHeRuZFMpD3rVRxzVmoWCxMvvLKvtbIm80HJhSe6diiioyvEndXC4YsL4NebXGIzF5OPk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743822905; c=relaxed/simple;
	bh=FaDCV0vblsYuERDwYstIhbGlbsR6rec8Z2iCzRgwIyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPm23E+v92JbOZw4TF8lfDUhSUpqaarZRSfGSulwB0laneiHp9X3SihclIFmWBswkN9udn/H9bCvOHSZy7EOft8n+RpBMMX42l/0X0/KZUVzN6Nz8yDBZ5KIs5VfCboJhspOcXqD3T8rKQFYI5MQyTAlAeuMj/8LQ+OXT4ULjyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4y9Egk7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4y9Egk7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913d129c1aso1841101f8f.0;
        Fri, 04 Apr 2025 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743822902; x=1744427702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5PzPw4Buo1LkvHHDyhNOl6/oB8IwjF4H1+iNNPSCcI=;
        b=F4y9Egk7h+v6m3FQDiLxk6oLSGH7wgifkxwGTTTsujOFmwAic7wFmyu+Xsvx5kLwAA
         sphMusmHawbFXIJKXwRr5ux7sbLTZxx15zx9k2vHmILW49svYrdBdU+PlrnK8OVZT5GH
         0v6XtT07RcY9PJHqNT2EWVkLI+8ddvDrlaklrqGqjFw1GHBTISnAT6tL5VUeUCPq6T+C
         UurUi8JGpMDMFjo/gxGkb1FRFdcHP5Mmpx51Jgo2bwkKgoUkfVOyIcN9rvBRnAZd2iJi
         2oXrdLqhTGX0XZrc7Ss0TxowDtJgy+0/KYHUt8ujx/8/3fjk2Wrmu7zI6VD5pZTd9tfK
         vbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743822902; x=1744427702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5PzPw4Buo1LkvHHDyhNOl6/oB8IwjF4H1+iNNPSCcI=;
        b=hzCSsAKSWUg21cPtFGKtt6XZ+GUFWF5KJ5nlp4u6zudOC00KEyJcLv7Ah4USexZ3zz
         jwNLkVwJPpxrFgZZ7FgngNrFD+NmftOb3FkImtmuWqgPU555q/d77RajkQPMFNI/KILL
         r9dsS76eeyrLjqEvkBC0Ndh4QgNqtu7fCGQkDp52x38KuLJFee195WaXrK79bZJqBykP
         el19Kz5zKG1xdsYl8vz/BrgsdPRLX/qtDCwEGkrbW+OuDH5FBFPTX97cCTlG49iGebJ8
         SHrRJgPiK3nIwDH5afw7a/DXLMp/oL6m/U7saLtbno5tysLzxB37g2CimTpK+FDq5R+V
         2+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT+KA8a4QPocuesm/cQetFxMHdvcz6xUStKiBRG9I4+dk/HYoy4VJtJIiktpMEhz4hONOGlPZ7pQKq3HIV@lists.linux.dev, AJvYcCW3UGdiqdzAPx3htHlxHksXXafK0u3XbI/hgPPrpkc6eI33LESNZM/LuPxqtlm9l+RNKRuSoam/I00Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwWSMYv5aNBcQxRzYPP50g9MD1lnOl1ZyI7m/MIUlRBLU85xoSS
	jKOSmZK+rUpdv+JQpCl0/gxFnpiSePNRksTWY0puOrj0xXL6OKzH
X-Gm-Gg: ASbGncsJ7vEC9tYAKQZJTHYeYYuQVuozRR/xvPwKBoAsyrofQ0k5tnOqAP9BkI8gE+I
	YMiBmHHUqjNqpb2KNy7gq8h9CYaPHiwXHY7myF8N14dokM8endByQu0tTqUs1LCqBzbVyFRO/aN
	IdGQ+a1XfT2CfHSm5HM+nP5V0R3aSbbSwTU9y33sxsqSuD5pszx/8RVG5SX1agdsHMTnQI8JJAc
	HdSdR1RoaZTsFDwgOfLT6W4uRM1qse3/GgjLBPKYPFDPtAkDNpA2cqn0pTobGDNF2wFmNusAKyJ
	UQXLe0BoKTxTk6SQX2NxaP6/v0xnQxTeOKFIU7e+MQ==
X-Google-Smtp-Source: AGHT+IE0vSAAtWKqhoLkdngcKVrEQ4uN3i8XPo8ttA3scwcSuIvdkedudjulMU7aJZGNd/kAbHh5+w==
X-Received: by 2002:a05:6000:4310:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39cba94dabdmr4379280f8f.25.1743822902014;
        Fri, 04 Apr 2025 20:15:02 -0700 (PDT)
Received: from pc.. ([197.232.62.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm5832250f8f.62.2025.04.04.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 20:15:01 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Simplify local variable initialization
Date: Sat,  5 Apr 2025 06:14:47 +0300
Message-ID: <cover.1743820815.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset address variable initialization at declaration.
Key consideration that code executed between declaration and
initialization is not necessary for initialization and changes
do not affect the readability of the code.

The patches can be applied in any order.

Erick Karanja (2):
  staging: rtl8723bs: Optimize variable initialization in
    rtl8723b_hal_init.c
  staging: rtl8723bs: Initialize local variables at declaration

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  56 ++-----
 2 files changed, 57 insertions(+), 154 deletions(-)

-- 
2.43.0

