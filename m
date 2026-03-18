Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DF2DF155
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855300; cv=none; b=PMK15LfCPO+/5UxTulZWLzdQ/RCVGSe2hzAEZI/EAGpuyqP/X2HkQuUAcHaem3MlY7m2GwFp9s4OVBIaIFoIV0QZxNUAVPUkqlvBweVxKLcy8jT73qXffeayTkK4v8CiQRKUS0QwGnhUcNbCRZDqLtpwkIqPCMAaP6Z+YqWA44Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855300; c=relaxed/simple;
	bh=HVL9JcuJJwe/eCTwUdao1yOahP99oeFx4kBMvT+jP1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOG3PS+3APXDHGsIwUFXupUlwTs1G9SMzdglzu64TrIavo69gN2cBS29yRLprNpiORCipa9R9acwhTxiPqw8DwDScp09Sh4IBx/P9FQ/VU6sTkOx5tjmQz7Ii4yIbQBBDvOvXocYaFRK+Dg3lu2TbgtG+Zg25inC/81Ibsh2xcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGgALOg4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGgALOg4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so123281a91.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855299; x=1774460099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49tSaoOy3FsaSDvjZTaErELVAoylTB6lCBPKg4WidfI=;
        b=MGgALOg4GnXe84zlS0I4Mr3gVid6Qtynj3BmUzvywNb8qqe0vs29bHcgIg9fZxT4ht
         GSplvwePB/jXpNdyRoyzsC4lF6QZ834nZ2gToP/dJI88Y2kdeR7aqA40hC9VKNGDSwbv
         KEpq/0LVon7upRWRv7M+Y5uT7KrXIrEb/7hODJlnabIApufnUr5RwL+0lQiAWl5SStGp
         FRhlpu43tpDX0Uim9gcK16o+JhkOg1jwz38I7hthepgH1+olQC73WDxvmjmlLFRhdGcy
         qjC6tSps2A2eIND9maZZspa/DGR2gfDprHptTAZJmWhr5xpuchqIWY7tcyw4KCKbzbGF
         tjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855299; x=1774460099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49tSaoOy3FsaSDvjZTaErELVAoylTB6lCBPKg4WidfI=;
        b=Dq7uvfElGKhjGKxSAUSlgoV2ih4s6dUTjpVt68KZMjAz/S7kW/K6cGfBtWWiWSx6ph
         CK9xwyuXx/HakxLxtERyU3s1Xkple+mRGbV4FeNBKrvYdX6o/tVhLykQRIGQvnTGGymu
         kBTiFF74DiHT1jmyRgpNcZC/zTeZA61eMQOPFU6b942Qo5kzNHHWUABZACmUCiyrxcWX
         UHaxaypN/M/pcoXZTkChtG5wUIxAoJM0klv6VKUoe65IXkJyN2Ykt0SuGF08lrE4KAPV
         4MvTtkz4me2V6r54i9no8xvSk9XRV0z+TwGLgMHm4WIUovZdwzWG7oQ8FpIJZ2MFXLUL
         yp5w==
X-Forwarded-Encrypted: i=1; AJvYcCXpZzEci6FedZx3KibZAwxHa89tkTQJVFNVy6peUye0O5Y37O5UnRWKVGDwY+ku1w4RBPoE2MQdMDfDKM28@lists.linux.dev
X-Gm-Message-State: AOJu0YwbRx0O21bTAQuCuBlpmNZ872ytavTSShRlmrTJ9wMf2z6/XSBp
	4rJQG/rk2fXJvpmkmwYAJdMrsjvzKvg7qjwLu96Ev18+HxOAExj4usiC
X-Gm-Gg: ATEYQzwxs581e7kvGkvSBuKFNwiQgtZJ8zS4sTqjmp2nf4gXh/E/6tLqBuqYJ3RS6H3
	pUG/6pQzoFrdjf4LFO/M9Fas0c/XtEYAanrj0Qp9Hryj8l2fLZsn4VNEWs8DYs6+BHJQcXRSsjK
	jGCVlnEKHMOa6NnPDhl2SjFX28vUH8dIxjcm+A6J/3JWSM3amfCJT0HeLLcRViUM1vrVgqr8KA7
	RVzMvKrJWn1+qHbJBkTl+mFuk0vJLW0N1z1v9KYNxiBimzQqjRfg/8e2Yx40cAi4OUykMi5UpWO
	L9Snvn52ecK5wBV0DCV7FdF7FGvWAvcS34LkpPoOf5YQnX7inLWblkRLz5hzlsxxyzanVCWDZjK
	Hs1Vhs4DiVL9JBNlp4yQeKsftk7SZjUqtR/V/s2WRLjK8IQPb30utS4Hp4sGu0WgyePy+hOk4ae
	5ypH4qhEjToSaJ7qSXZvtPZ82fJ/MDbqxrn7M=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr3884224a91.13.1773855298811;
        Wed, 18 Mar 2026 10:34:58 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm247103a91.2.2026.03.18.10.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:34:58 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 0/3] staging: sm750fb: Clean up CamelCase names
Date: Wed, 18 Mar 2026 23:04:37 +0530
Message-ID: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series renames various CamelCase enums and struct members in
the sm750fb driver to standard snake_case to comply with the Linux
kernel coding style.

Changes in v2:
- Wrapped all commit message changelogs to 72 columns to fix 
  formatting as requested by Greg K-H.
- No changes to the actual code.

Shubham Chakraborty (3):
  staging: sm750fb: Rename enum sm750_pnltype values to snake_case
  staging: sm750fb: Rename struct init_status members to snake_case
  staging: sm750fb: Rename struct sm750_dev members to snake_case

 drivers/staging/sm750fb/sm750.c    | 34 +++++++++++++++---------------
 drivers/staging/sm750fb/sm750.h    | 16 +++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 26 +++++++++++------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.53.0

