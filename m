Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2572B34CE3;
	Mon, 16 Oct 2023 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNAGwtju"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso873104866b.2;
        Mon, 16 Oct 2023 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487304; x=1698092104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRniKyUz9iHO7Fz4n7LlSe4JaoEPWk/8N3r3s0S38yc=;
        b=mNAGwtju6yOqun5eD9HZwS4Ys/PP5Fk1q9PXpjL/XRyfEPGqfQ4LL83G2owM46XBrz
         zus2YsRvcEoWH44e3CFt5ctIUCy5N9NEgnPTLL8Qzvn1Gv8jh6ldxQG3EPcBPoUIqC0o
         AXqJU4P66ChG1vgD40PFnCCzyJtbTzSLhz6nHg7bktFMYKSTgtclV0p4PSe3oAzcn8qw
         FDvA//vjRQFvPv+bgpl0PEx5cAND5j/koweDvJuoJG0IElR6+rwhUMWp+55MwzTDtEFN
         5EopSNl9XLR+ew0xtAnFJBjZAj5zF5Re6D15LknZjRGIdPRGI8DpWsYtGaeGHFW91B/W
         OLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487304; x=1698092104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRniKyUz9iHO7Fz4n7LlSe4JaoEPWk/8N3r3s0S38yc=;
        b=tAYm2i5r2yiAa8NYphXjtrWSrD7jxNYa6lxKuN+fJP1g/OyFmHNMFAcvCR3AhwJwki
         8FjaMrMvNsoTVgEoh3yygv6qFUD+ny48QFd+YjmWJoQBm1CDuBeTNEJBntkpxdDy8BGx
         JdJCF7bwbWnhsm6WXWw++PDh3xv803d3FtVA4VVWnyCNM/zgX8IvBVYM06wY15EsmepS
         oOr4AG4xTlke0hyW8GpbSCoNkA65kNd//CVC7eyLH4HlWGcqrSqNfjNosFZOFQs5TvkR
         +AJfAU/KsZTInKOjBWvYNkP058H1UY2EvMDxiu0hTrilYqKwE0hiTUnVHXgA4ddJgRvy
         Y6ZA==
X-Gm-Message-State: AOJu0Yzx/5Pfu4nQAsf1EpxEKuJX1/VUGOQNL2qErgSa6SSp+4AiqsRO
	zDF4Nxi+MyBg0+F60Y8NXA==
X-Google-Smtp-Source: AGHT+IFqWbp0v+lRnIYAfoA8RbKDtJE6+FBX4X9Kzec6bIIB2oZpNU94+sLO+oRr4pQMPO6v2uYU3w==
X-Received: by 2002:a17:907:6d1d:b0:9be:5ab2:73c2 with SMTP id sa29-20020a1709076d1d00b009be5ab273c2mr104647ejc.58.1697487303797;
        Mon, 16 Oct 2023 13:15:03 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:15:03 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] staging: sm750fb: Renaming camelcase to snakecase
Date: Mon, 16 Oct 2023 23:14:07 +0300
Message-ID: <20231016201434.7880-1-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames various function names and variable names that were previously
in camelcase to snakecase to ensure consistent naming style throughout.
 This issues were highlighted by checkpatch.

Dorcas AnonoLitunya (5):
  Staging: sm750fb: Rename displayControlAdjust_SM750E
  Staging: sm750fb: Rename pModeParam
  Staging: sm750fb: Rename dispControl
  Staging: sm750fb: Rename programModeRegisters
  Staging: sm750fb: Rename ddk750_setModeTiming

v2: Ammended wording in commit messages for all files. 
    Suggested by Julia Lawall <julia.lawall@inria.fr>


 drivers/staging/sm750fb/ddk750_mode.c | 90 +++++++++++++--------------
 drivers/staging/sm750fb/ddk750_mode.h |  2 +-
 drivers/staging/sm750fb/sm750_hw.c    |  2 +-
 3 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.42.0.345.gaab89be2eb

