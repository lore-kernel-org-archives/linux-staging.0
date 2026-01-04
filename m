Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F441187346
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767524810; cv=none; b=InQiWqSZvTfRo7Ix0NJ90rYEbamNlf90o/dkgcLe7a4KSLrMMafa1lPj+d1rvRewNeuWWZk1ViwY9k6h+HCYe2pXqfBawmTNNKL8YYWkxTA98jcT3GQCYy3te3iwUDYAU1JN19ctgahygj1zQqfLDcpgIYihbSkgXjZ/knPvz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767524810; c=relaxed/simple;
	bh=eDHeyoZczKr3AyHj3CQ3Ty67UKiPmoUz2PAKeg50fG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ag8fTpMnlFSW1cY0NkAD87DWPgjiNOeiC9cGQTKLV7LG38Lw7JZLfGVp1pBbc/KkYfSZUsRvQk7p3uY/Hy3A7ZqBlEeRe+Q23G3ehZs5d6e87nS6cBpF83LB41J5i8Bry7jWJaCDemakHklya2+XZS4zxN8n3vyiHlhWqHOgYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLaACPeZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLaACPeZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc0d7255434so7828363a12.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 03:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767524808; x=1768129608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUCt/I1JDgpKPWl0wJY+VdRCfc9g+GhZhdDVLk6Y6Gw=;
        b=iLaACPeZFQxR3Pbh6drfNiRIXug8xw5imUcT70pWFG8ty060OWd+fbfXy026WoFwls
         ffliNG7sB6dG3F3ub874u3ZAvBkDXvc2dNSPd5I9ukqNzguaTjhtlZQ1UaWUHTNhwXQs
         6WlARcE6dH0u/wDNyMncM9hsk4RFciWj04I6EWf/CrEIdDdwCaqf8HH2xY/Jasg5++pz
         /l3bnLfNbDrAxTm4pdd/ZmSLxa1srxlUS52yiqHS+TlQuk7SyOowZMdpm7RDbIkR7/Az
         IPv2OfRH1Uf6AoCAArwBrdxzOrNnRLLm04KaEZhbZKHcTITTZzGNHTu/QB+R4cjut1Jo
         PAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524808; x=1768129608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUCt/I1JDgpKPWl0wJY+VdRCfc9g+GhZhdDVLk6Y6Gw=;
        b=E6Hfze8xzqnWJ/sPEoEH2no9U3T1rezuzlfNPBrdmUJbpuQ7ql+Q02CQ5cs/vKTf65
         YXDBLMOKJwadq6O3KXowHM9CY3WQK/l/TTq+v4x3OZCKAeHb9cDSA6eBu4zTJyyevCg5
         c2yy0yjMnWW2ZpkJ7KUT7TYLMaGM8croMOGATQRTXNMimnMPI+3+tPHC9p6DrAL5YHmh
         xAnEL1kvp5cO3tg/T76FkOiCZXzk3RBXLr2qVc+mCjbYNauK8TI0QD+kNB3ffCXmt9zM
         jB+EqfXAewItYV4jGaXxxjHoTz7hmWxsAec+txKnXwbKIzWPBfHdnVFF8Ey3gG4Fxc1+
         cVCA==
X-Gm-Message-State: AOJu0YxxgcM7XM0aD7yt2kL+lcUNHwJXKVaMmjzbMeWkldn0Uynze8Ym
	hlpVaP7pbzKecECMQZI88u286v9OsWet88QbtWIwdYmPAn0mQek5xQfe
X-Gm-Gg: AY/fxX7PR5Kj6aVw9tKuDGFUjqeuf62Ykq90pocgrWwdzKm2HHWxDxb+J0r09+GwdlA
	TmS2D5gxPC0FZGzi3PTq1yv6kHXFyW0KUqt0MzXd2pjU0PkGKtxE+PXarE3Kd3vi1oAQ4z/BN5i
	3dWMkMSx7bPeyqpjmj2BeiELd3JyTqSHVf1uxGB9J5S66FMGkz518qlZZI1V5PRYnw4pcV0qGp9
	C2dxABM2X6IJ+/YchdDnf0DPZTB4GgVD7yBlhNTeAooQjEJkrDswun5TnTNIOMqrFqJHlBkqmS5
	oFkVCMoAkRZf+G123RzptSp35HvagdMky4FwTXnSvLRo4sxK1TPfqW63ZBz8apwBSFab2BE3Czr
	AAS6/48DxkL1gOIwMwGmVSTNzRcQLh8pIhPMkbn1AK4cv+HAbyt2qg8CXIXq8w9QryGYOcD35mS
	kMok4/mgqWjTzodFb0s46Me4r3HVS9mE5048yYmu56bn13i1flVF62KP84mKt4xk/ttl8BJ5/CB
	dYrEBZ1Sl8=
X-Google-Smtp-Source: AGHT+IEJJ1hrsUL+EWG+/LYHmGIsftevAAvshlZviJRsmXOHXp8IxBwsGTPWSTtldkfSDqfO6NUI7A==
X-Received: by 2002:a05:693c:4146:10b0:2b0:738e:287e with SMTP id 5a478bee46e88-2b073904fd7mr23927432eec.30.1767524807784;
        Sun, 04 Jan 2026 03:06:47 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:06:47 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 0/4] staging: fbtft: reduce stack usage by avoiding large write_reg() varargs
Date: Sun,  4 Jan 2026 19:06:34 +0800
Message-ID: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes clang `-Wframe-larger-than=1024` warnings in the fbtft
staging drivers.

The warnings are triggered by very large `write_reg()`/`write_register()`
varargs calls, which result in excessive stack usage.

Switch the affected paths to send a u8 command byte followed by the u8
payload using `fbtft_write_buf_dc()`. The register values and ordering are
kept unchanged; only the transfer method is updated.

Patches:
  1/4 staging: fbtft: core: avoid large stack usage in DT init parsing
  2/4 staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
  3/4 staging: fbtft: ssd1331: send gamma table via fbtft_write_buf_dc()
  4/4 staging: fbtft: hx8353d: send LUT via buffer to reduce stack usage

Thanks,
Sun Jian

--
Sun Jian (4):
  staging: fbtft: core: avoid large stack usage in DT init parsing
  staging: fbtft: ssd1351: send gamma table via fbtft_write_buf_dc()
  staging: fbtft: ssd1331: send gamma table via fbtft_write_buf_dc()
  staging: fbtft: hx8353d: send LUT via buffer to reduce stack usage

 drivers/staging/fbtft/fb_hx8353d.c | 38 ++++++++++++++++++++++--------
 drivers/staging/fbtft/fb_ssd1331.c | 29 ++++++++++++-----------
 drivers/staging/fbtft/fb_ssd1351.c | 35 ++++++++++++---------------
 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++---------------
 4 files changed, 71 insertions(+), 63 deletions(-)

-- 
2.43.0

