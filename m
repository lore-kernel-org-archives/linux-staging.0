Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F634DCF7
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239764; cv=none; b=bKoUtU3JjuQ0a27BggCCXJRMXnHZPLhj9NWjni1Z31ken+T7b4lSyUadSnvxnP8RSFX7Eb12d63Bs0FvVEsUF4u94XTWXvMtwyO3BDAo/gIRPqrNUJ363NA9mAr8fX7uprrErGDLqDJjI/HfcB7brQp1k/AH0g3earZ14zhvNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239764; c=relaxed/simple;
	bh=SJ+8fSiZzGoy8O3WH7jbALrBFsshx6Mhrhd5vRl+XdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzvHT5aeYGGT/el7zUPf16/YiK+B/sDqdXt24CsMNz7s0A9rpE5sSr1/tBYwIP2RukAGWiv6Y6EUjwjpyHq/vwdvFKxEXVZ9dlugMUO9ooIvsZnMijwUBbQ3rP97EBMVQ0u6l9eYvTs2gzrfYpP9j/dnb9q++svmwzZDeC4uyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecvvWD0k; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecvvWD0k"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so5721634f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239762; x=1768844562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efI0VYyD3fpMPSVnjmUvorvIAU/KRcLF37zm9w9+9VY=;
        b=ecvvWD0kOOGQlcXtrvwcYQZN8ALsS9oSThATkwTCORUtzTdIezwZC2IxHdlVS1nM6X
         GToBZR5eSVERO1mSV6IXE7lmjJkuIBo7l7oZu4Ij7XcVv4RgicqLOkFnlaO2PwdBZSGR
         o5d0kxY1BKvpWwFTP10jW3tmN7wm8SrDese9SFExuJ1bHng4f2bqXOGeaFHA64ERFyHv
         cdbX7LwXp1t9SlOrc7eqiu06MzIX/RYFtOePsm3iA8CM/Pi+RXJbNlFL57QBP+Rt775f
         +3XfoVT30Nd1SnP3M+9WDadWpMDUbvpOWbU2qQZa+2mOXZDefGXtBAIxCe/y/2Q8YyuG
         T+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239762; x=1768844562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efI0VYyD3fpMPSVnjmUvorvIAU/KRcLF37zm9w9+9VY=;
        b=g00PcHKUvbobfm2IDDq/R6cOfZrNG8KEG+f3H3XL3ph3qaa4tejUNOi8DQbg/RZ1Hk
         YM3UbFyANVozBkshDUkVOKbB88RLsAQ345BrRRBrzrZYaFvw5AAmmcidFIHIsM1q5dJm
         3aXKJmOntNMdXT0PSl6t0HEXZvGb2FVlO891S7vlzoBfs8Xy2IdaTxjaEx2g3q2WQ+au
         27KeFIe2ZzHyTlVmvx1/xRMUZuCX3MMNCTBfC6OxkQDgtQYINplnKHTv6UyxQD3DPhu6
         JlJQOnC6REKaVALgmxR3aLJOPFIXZKJmo9JYGm6mllTWn5477v/YlgClMlk5F1trBtBQ
         llXQ==
X-Gm-Message-State: AOJu0YwHDmbKPktTqkDm1WVsDb1M9ec+/bKtezX9tGgeZgEaGLdXgm7u
	6FcTPL+k2G7t1lRuaZ2mwLeu8WR1O/tFkStY2kkZXxd1LpM4Rj4FSckX
X-Gm-Gg: AY/fxX4XTkz01nttc3nVw4IeWc4yE31lVq/GsIsyQrUv5Wesfxzh1QitnI3EU5dg9jZ
	9u3Sh+7TMr+EvnI4oGBBof+RMHsv/0TR0kmxA5bR7xbkDuPVU2lqiPOLG29FHSimsO56nmjp8FN
	WMNWIHwovhZOMwDcs1JWEIapAwjE5WY/9MI7upsmfl3Cwf9wSEp5TFI6eRUKUion1MQ9q3/7Csy
	r3FvhxBygoJE/65DCgdFevDjLPEvkfle9FbJBy1mImtTLkKdqEqndx2SjEEAlUKIPf7alW2Yg3Q
	wU401kezrdDjPYPD3N4xYxgXK5G/QHaq7o4nDkpbwVcMzYVeTdIo0Q0fubhDC5edruhskZ+GubR
	hch1j7BzH+keRS0TYTIAZkzkNcdq2hnWAiPyKINsUjcovWF0PeOxST//HgIqpJE7njSvqOL5U/z
	IC+FWEs4XfbNe5btGfU0ohzQbK/k8xcjhlNMIsq9E=
X-Google-Smtp-Source: AGHT+IEezdKC5EPVVs7jW1vbZtlB2neiVpS8Q+u6eb0Uz0Dv+BZ9UUd1ZrO1uRVWAYDYXHRvyyQCbA==
X-Received: by 2002:a5d:5f51:0:b0:430:fdb8:8510 with SMTP id ffacd0b85a97d-432c3790ca4mr24312684f8f.24.1768239761543;
        Mon, 12 Jan 2026 09:42:41 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:41 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 00/10] staging: rtl8723bs: HAL coding style cleanup
Date: Mon, 12 Jan 2026 22:42:17 +0500
Message-ID: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes multiple coding style issues and checkpatch.pl
warnings in the HAL (Hardware Abstraction Layer) of the rtl8723bs
driver.

The files that were touched:
- HalHWImg8723B_MAC.c
- HalHWImg8723B_BB.c
- HalHWImg8723B_RF.c

The changes include:
- Fixing block comment alignment.
- Adding space around arithmetic and bitwise operators.
- Removing blank lines.
- Add blank line after declaration.
- Fixing lines ending with an open parenthesis.
- Fixing line length violations.

These changes clear all checkpatch.pl warnings/checks (excluding
CamelCase) for these three files and adhere to the kernel coding style.

Mahad Ibrahim (10):
  staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_MAC.c
  staging: rtl8723bs: Fix spaces around operator checks in
    HalHWImg8723B_MAC.c
  staging: rtl8723bs: Fix style and formatting in HalHWImg8723B_MAC.c
  staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_BB.c
  staging: rtl8723bs: Fix spacing coding style issues in
    HalHWImg8723B_BB.c
  staging: rtl8723bs: Fix parenthesis and blank line issues in
    HalHWImg8723B_BB.c
  staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_RF.c
  staging: rtl8723bs: Fix style and alignment issues in
    HalHWImg8723B_RF.c
  staging: rtl8723bs: Fix operator spacing issues in HalHWImg8723B_RF.c
  staging: rtl8723bs: Fix blank line checks in HalHWImg8723B_RF.c

 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |  73 ++++----
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.c |  40 ++---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 158 ++++++++----------
 3 files changed, 127 insertions(+), 144 deletions(-)

-- 
2.47.3

