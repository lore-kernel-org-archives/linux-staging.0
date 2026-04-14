Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16B3CAE90
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160737; cv=none; b=uJCeAIBD7qnWREhUXH69aGvhPpzgXwzjiHGsBNs1uu6mRScPTQXu12ikM7NXs9s+7AzBYPZJtxesbF1aNTDVkjTEAXDkYfUFEOe7Lj59+hkA0vj6UKIiHgjQlmNKuT8hbusOlYjqRjIyczQ2mIKV6UySe5/hFxjAN7epRJY3t04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160737; c=relaxed/simple;
	bh=O/gA3JZTtlJhy6lu6Kj4s69DdDMg0d/TTJGZkbG9Rr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtbQtPK8rOkQ3p8tZStvhfVZl1qeeTzjjnYR9v+CSkFE2XNZfiIta9z00wRzGHEYD3tVYKg1e0F4VrHrzkbjnMvZTEo8gMu6DnLHAtcij+SFSQbiFIkKAbqRC2x/FMAr5Bbg+8cPDKuOhjRi+33EszKElKB+o/sX4wFXh+wD4gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQMSF/sW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQMSF/sW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2b636b944so6077242e87.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160734; x=1776765534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFeMTN3kLdEalxbfwBj71lf1FG0qXeEfD0DYDXiDEck=;
        b=XQMSF/sW6sgE25Xbh0Bf4RhV3bzrUz4+UJgXJ56pHHuEGIYF8xa/jgtdP16zElSrAE
         +GpjEhm+EEg0gYb43HXmwV8ji1DwaMi3mdq5nXV8x4IYODdsyCcVDBmuW28+1nSsOpPx
         ns7DxB1p644+9MSvF49MkDPJZ952acw3744B+kycL62BTlVaupX/lNnaCoqTLGg5VMMo
         DX9kx9qX93wWO9ZwA8zBteCK9ZMpfDP12Jzf/NuNINplKXTCGRsVAv/ByuDPFngtnoTR
         ixXQnTlP4bFJ0pPfNc5CK+WLdcHGCZoDKg25dgifKWhKHNC1nSKnNAFTQOQvcAoTxLs0
         vQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160734; x=1776765534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFeMTN3kLdEalxbfwBj71lf1FG0qXeEfD0DYDXiDEck=;
        b=sdxOlMMivW95hOJPRaZZdOG0QkSJ8SYr+sgZ66jBDbn5VohsqhrJUd1PmvjpqMQfGZ
         gz4O94/V/bI/EgfpBcbyT4n69X5p0IhFWY442jYpH9krsxVM6fdzbT1iyg3iphTBlhmN
         ZqzeSVXycOfdN4XXiVjNi5LFHxmKUb0a5ygDkY4gtFTyo1JY+ZblvTzhh3XzZUuJ+hi2
         6A4fISaNUZe/IUuCMUvNjYxikF3M4PR2NWR49n137j514hpe5AqGG3wRH57+TqfmkMYm
         1zXraEbWKEtMth2HxpM4K1ad6+YmYSX2a8ujPmtQRFrVk2kEpvknKLusHcIPsOWob2PK
         ilCg==
X-Forwarded-Encrypted: i=1; AFNElJ+YWM/lKxqfNAxSpBQ3GJ/L9lt4upKC3kthgFOCu4aXLb1rMBc/k2DOj8cmErkEPjcf2lvxjCdCejtzT43C@lists.linux.dev
X-Gm-Message-State: AOJu0YyLapyUDMn86sFDUrg7zPlFF0asbvbPMyzpEXW8Iswp4Le3B7Bt
	YNN+3mHBGqo4awT/ilG71wjLQ3ImWJ0j9bOfnQe52Vh6dG51Cdl0O38P
X-Gm-Gg: AeBDietZdRuMfjVGLo5uXS0tLLwlTgiVE4eltCB1ZSQ7Us4QpDUofjM5LnVWssjcEjP
	nCrbZFeg7I8pVD+mUZcMQDUR5Ka1BNc4LLUw+rS5mej2uMm7tLHakJNGsoXituAwgi8vPb1j+L9
	buAUMV4LZD6pRH7HM4lt+B8Ab543MFc4wYZGSGYclE23z0zuDF/WXTV6SNUB2AnGCepWSSWcfFD
	AyNQqLM/NhNzDCiCHkqawZzMeNVcaMhUU1v52RYDBiO9ODFQFsha7sHvrVL82e+XLP+i7po3zYf
	N/6DMd61OIH+IDk13HcqWeyTMls/BCWsvTesA0SAxK5KxcQbxvyr70sm3l0mG2Wp8t5ClRdt29d
	++vvBqS/zwVOec+cn4FN2fzr2rdlHXqA4yBjk8VxfLrAWAYZ2SNTzvjh2FjnNAbAt5s1U07byYP
	ITetoIfeWZVIgVFQ==
X-Received: by 2002:a05:6512:3b0b:b0:5a3:d381:2a7c with SMTP id 2adb3069b0e04-5a3efb3c2abmr6377882e87.31.1776160734198;
        Tue, 14 Apr 2026 02:58:54 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:58:53 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 0/9] staging: rtl8723bs: coding style cleanup in hal_com.c
Date: Tue, 14 Apr 2026 12:58:24 +0300
Message-ID: <20260414095833.76480-1-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up checkpatch --strict warnings in
drivers/staging/rtl8723bs/hal/hal_com.c. All changes are purely
cosmetic; the compiled .text section is byte-identical before
and after the series (verified with objdump -d).

Marc Finkelbaum (9):
  staging: rtl8723bs: remove extra blank lines
  staging: rtl8723bs: fix space-before-tab whitespace
  staging: rtl8723bs: fix block comment alignment
  staging: rtl8723bs: add spaces around binary operators
  staging: rtl8723bs: add space before inline block comments
  staging: rtl8723bs: fix Yoda conditions and == false comparisons
  staging: rtl8723bs: reformat multi-line function signatures
  staging: rtl8723bs: reformat switch-case blocks with braced bodies
  staging: rtl8723bs: wrap long lines and fix argument alignment

 drivers/staging/rtl8723bs/hal/hal_com.c | 296 ++++++++++++------------
 1 file changed, 146 insertions(+), 150 deletions(-)

-- 
2.53.0
