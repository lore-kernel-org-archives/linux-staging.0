Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC21266EFC;
	Tue,  8 Apr 2025 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107653; cv=none; b=Sciol10529FFZSaBRMMNEWdTbIZx99JgbTdY1IVzdcjTq8I7fsYHAfWPV2q94oTie3FZ1iEvR82i29VI0gwhK8qyMr8JhKhqUdNnSJ496hMkckgQb50BC4h8hIKUHWsLmJo14012a2EM9SxsLObhtaCXMOBNkhfS3mAx8+EZyek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107653; c=relaxed/simple;
	bh=ZJUu2kUTtBrtb8QIr/T5NE5Nfo4t+UHcls6R0+lYS24=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m9Ro1i8TOMMt4ny2TBw+hfxCGfCuXboWRgSIT+ZPWV3cNOe4yKmiEO4ALMquX5WLq/OE12mV8YnYCE1f5E38OyE4eTyWZueoofRMRihqk5XzK1eyGmvx2540q4fGlH2UaeY82a47s2WdGs7rqZo6Uuu+hzFgi1111ocm/bt+ptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGkeik8f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGkeik8f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso29752075e9.3;
        Tue, 08 Apr 2025 03:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107650; x=1744712450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xeNglUB7597l+hXKgp8ZDR8E6Vs1eyzhEhyeNzv3D74=;
        b=mGkeik8fq8i77RLD01RFr64FKQRmM6gayP9gdauPeyMerR68L9lJPRJKekfaSDO7OL
         4HKCzEawZLcAA09LZfa/Vsogx0h1vJcgJnrvbt32xsyyofNbprYGXTttTpf3dfqKoiD/
         OXLMHeZwYfImIy5wEZtW/hRxFtrjdzbwtEOyFlP5kE+8DAelkP3ROq1hOcXaEgXLJ2qy
         gq0xN0PDXsCF5E48Ho7UBxlh8sYk5GG1QBYf/0KhNUFJQCLSoF/tGkewsCsr49xxJaXa
         G4XouMiqtlNZBO1TerMMzURAhbStRxAUY10WRqwsSGLK9UPSTcA1qUa/RSwYDci6t4x+
         wHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107650; x=1744712450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeNglUB7597l+hXKgp8ZDR8E6Vs1eyzhEhyeNzv3D74=;
        b=uwCDFUp3phIXALhkj4/Yq1DVdR4eWW2ZIuW3p2NcnCli5yPoHLnwtLP6bubRAO/C++
         ZdnqY3C9qTXTPOGsU0YcvHm1qmB5USVxHK8cv/kws6sRSiljw0ZY0CdaLfbm248veTa7
         0r5wRoNgcAadfY8HpbP2XLba1rcYsuHgr4n0PhAzQvk5Q07CABtraoAzPrWUyAyvP1Cg
         sLXKjBwZOm94DKXJMp3edyMgFR4IpzHgQqT8vbZJOBQBKGoc8eD5RbiUZ8YQb9rs3gj7
         Z5+jzM9eCDFarUZupsoOBTSlJvo7UtFInoinvbL4nszNuw0BFoSlP+xhoDxo917enuJK
         AvmA==
X-Forwarded-Encrypted: i=1; AJvYcCU3zdRFhVMu3V6KEqzW6aiFERav23NGPFVVwhGBf5xgBE0TyNuM4KlhLuOeYhMr+LmhGkAmMql11eKvjfti@lists.linux.dev
X-Gm-Message-State: AOJu0YwJFqQkIwsV6B6Wfi6ooEj94srtpUWdkXCROSfDDOP8C0B89Bsj
	BhehIs6CXRbo1Elecifk11QZ3lFfChBcPGaRuTgwaQ/XqIMJbUZ6
X-Gm-Gg: ASbGnctaY1dzhsQakj8zJLChmNn2n+xI8ewodyN72DgIFrm36FIOm71xWA8WboBQyXF
	AegXxv0wBf9x1269v5ZB+u02kX0aiQ96Me3Z/wwtQE1x7IPOyQBtTII/ulAiIfgOWtGOfEfwipI
	tSswHW265g0iovLmK72k/t8odLNCJO4Uh4gf0zYMAZXd/iiunZmJiJ/GDRzT4g7UOqxJpE+MW44
	jd9If3qyvR4hXuSjcCW/gjAiiXOh5cECluQHcu4XLVsWA1pGXjB/qYSqrk+l4s24bA0J1JAPq6N
	YRcx41UwjrXsfyV0jLVMulyerZo=
X-Google-Smtp-Source: AGHT+IGoCblA8039XA2SYcRuvHR7lv77+7fyVszqPklN9pnwKU/Q7bQYVLoa8hnC3VLSBmwSoVOR5Q==
X-Received: by 2002:a05:600c:1c88:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43ee06985d4mr96625295e9.18.1744107649775;
        Tue, 08 Apr 2025 03:20:49 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm159367605e9.2.2025.04.08.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:49 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 0/8] staging: sm750fb: change function naming style
Date: Tue,  8 Apr 2025 11:20:32 +0100
Message-Id: <cover.1744105388.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address checkpatch's "Avoid camelCase" for sm750fb module by changing
function name to conform to kernel code style.

The patches are required to be applied in sequence.

---
changes in v2:
  - Fixed typo in the commit message for patch 1
  - Sent patches as patchset

Richard Akintola (8):
  staging: sm750fb: change sii164GetDeviceID to snake_case
  staging: sm750fb: change sii164ResetChip to snake_case
  staging: sm750fb: change sii164SetPower to snake_case
  staging: sm750fb: change sii164GetChipString to snake_case
  staging: sm750fb: change sii164EnableHotPlugDetection to snake_case
  staging: sm750fb: change sii164IsConnected to snake_case
  staging: sm750fb: change sii164CheckInterrupt to snake_case
  staging: sm750fb: change sii164ClearInterrupt to snake_case

 drivers/staging/sm750fb/ddk750_dvi.c    | 16 +++++-----
 drivers/staging/sm750fb/ddk750_sii164.c | 42 ++++++++++++-------------
 drivers/staging/sm750fb/ddk750_sii164.h | 16 +++++-----
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.39.5

