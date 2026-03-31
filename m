Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661483A1E8C
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972419; cv=none; b=ZF3cqatAXy2T2cu2zetheyHjilCtsqSXGZLFdsxMSCt8J5+c6xiK8yTWQ0Hzl7kFl/94zpz5F5xznuYTrw2HO1W2rDaHJVRepYNz3QuvMSO9QpRxwLR1X2/FbSbcwQYZ9EszL8vz9n8txbxk/qv7jPQpJJBpZ5IRTUTC8rDf1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972419; c=relaxed/simple;
	bh=JDpoZPr1oJgantLhG+L9pJKcRbxl93/8CVJRz3G8d2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrVgvWlII2dk3rnW4YYdTjWKtXcbyRmglaaX4DAcO09gPiLmpjkpLZ5S+UnN2f+Oe+8EyVIzp6OF19TyKFKhYK08rbLDXnauLeAFELonzPZEYOQYtsxlv/V0xXcUXfwYEaaR/t0Ygc5DN27zrFVWIT2JR+ToYeWh83XBxU5mt8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYiPsA8B; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYiPsA8B"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38bd3bc3061so43701161fa.0
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774972414; x=1775577214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VfhFG8ZeR2p6aybSuK4MZ3Ds1ArOFqjDJ6UOStPsKN8=;
        b=YYiPsA8BblV3xcVs7pqtXScOm0uNGMsrrxxekgmPnMYmvRIbBzGg+UEpC2HgpQdjOu
         ZBPfTzVoSMJX+defJYpyaEiiFPviT7ImMyy124uPybT1IfK+F7DXG0onFnfXEutquyYe
         RggVr85GQsmQyQdZHZ/GE1WdEbmAXjT5cctDOPrIJOg+cD4c83j46XakUi/Vt+CHrvpt
         UtzAzRjGBwkwWBVLUELQL9YilkD1KV3vZBbSFR9WE33jReRdnM4GrWZlK/ZJxCxoM6/3
         hNnxjnRFUf7QSpUTw7e0V4O2+vn8vj2ick2E5gqrf7G194hTOTAtpFHMNccG4MhweX4A
         H1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972414; x=1775577214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfhFG8ZeR2p6aybSuK4MZ3Ds1ArOFqjDJ6UOStPsKN8=;
        b=lJZy0cQnHcoXWlvzec0ApqnnTs4/zkIneKXekUfNSGE1HmTF/pXcGmM4VCF5Oz5aS9
         dVYY8aGKAbkcyCPpZKVboLkAqNuav2yAfJHJZ0XDwN8XCoMnONtD1xRzaRiekd1lUL72
         gi0D7tP9xa9oyPxjAYW3w364WgJZA5OoWFwsfAZU1GvdGVhDLYhQHF3eG2J7RelZt3oU
         0Y/cC4k+XTWTtl9OLwO6bp/6Lgg7ombMHCs4qiqlnZXyT3/Uyi/MjweO78PMQp7RtG/N
         9mQlEhDXrBYfvrRedy8xkelTZYRAPEiEZ9zgz9A5deJQlXdfAZh2kn7VedVrVU0v01zx
         76aA==
X-Gm-Message-State: AOJu0YzEf+sG3qEpCctzYFDn1BoZ3777MynT9dI6zSDKK3qeNBoSxS2C
	YOlrPzmJ/u7XSTfW9YuH22UA1eHhZbr9LRtNwKUKnRbNqeMWocrFVs6+
X-Gm-Gg: ATEYQzyG/ztBAK4QhP0Y8atzOS+rPkd1TdcuIVdWI+bn2WrF7WTRXTesgd+Dxdlsvly
	s/0BqMcKPNCevvTeQLK/X94lP3p51UI4rOGotALVzrzEEnFM2Cw4Z4MKwllu/Y37fJUyFB38XDB
	pGbRGTV7pPOc5pKrzLtXv2HKQQieSRlagbJhUFcWaBI9v2aLTSpK7i2YECCqbb1B1Eo+uVMr//B
	PgN+CH/4f5SZSDpMC/gwq3Bo1qNx7Yu5XhehtxsvDB0iuj8sLnnySPX9Xfa6rV9eyhnDsiaO3mT
	31NJPv/HioLCJ7fq5k0IQix9biWuq4Dr1hEXPPmdY4EDj1//Ij+uMZWd8pjWlhtyqnPJo8A3yp2
	aiw66IySUcX8knVpOSlaCjpEUDq2Bq15n0WgDvAmKoci6mTVLSH70xeCAokj8Ok7KBQxRfFEhk0
	TssHarVNoy/7nqB3mHwV1MJQUIlPRJ8nT0ic4IPB1lg3UFrPDfU9mnkWDEYT6u2g==
X-Received: by 2002:a05:651c:110e:b0:38a:49d1:3d with SMTP id 38308e7fff4ca-38c732638e5mr52780871fa.17.1774972413981;
        Tue, 31 Mar 2026 08:53:33 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f31sm24553351fa.3.2026.03.31.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:53:33 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v3 0/7] rename/remove functions and code style cleanup
Date: Tue, 31 Mar 2026 17:53:11 +0200
Message-ID: <20260331155318.185117-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the feedback on my last patch. I have adapted the following:

- Split each global function rename into their own patch. (1 - 5)
- Placed the removed functions in their own patch. (6)
- Created one additional patch for removal of a "space before tab"
  warning. (7)

Br,
Linus

Linus Probert (7):
  staging: rtl8723bs: rename global function to snake_case
  staging: rtl8723bs: rename global function to snake_case
  staging: rtl8723bs: rename global function to snake_case
  staging: rtl8723bs: rename global function to snake_case
  staging: rtl8723bs: rename global function to snake_case
  staging: rtl8723bs: remove unused global functions
  staging: rtl8723bs: remove space before tab

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 22 ++++++-------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 33 +++++++++++--------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 14 ++++----
 4 files changed, 37 insertions(+), 34 deletions(-)

-- 
2.53.0

