Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC73A8726
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621710; cv=none; b=DRMzo3ghAXtdH64Qq4Srs7hQjP0sQ3QOQVVWkGmptDececDQyyL/JFMqTxwN0Kr4XLDt2PIN52vCi+e1wsBdukUAyVGOlBvkxCKgJg0f1RkFyTWPaa/9v5AUAp+Zn8Chc9eEnM3ZQN64cz5dHPyIyder9NUNfeHfggNI/bSssi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621710; c=relaxed/simple;
	bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=pIa6mFmLyxexueZJo84E9EuPexnAuZRGUCDA334BiSytiNj3ygJ7wOxc4FXd9XfdwDi+DyHP+9dK2kN/j/GtDsfUrYkPosYSEek519E/dws3Mjo+qAzsJtAUACdNmB+b+xch30c6TwV4WxAJ6yJ92ycUqkgDpTAl3bGQ8Lf6xl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPgj+00z; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPgj+00z"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b93718302beso41907466b.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621706; x=1773226506; darn=lists.linux.dev;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
        b=DPgj+00zVDIOoonHLEvaswxXhiuV4kRkYUHqopfqGHhPDVz6SHgpgw48fuztM2U+G9
         oe48vCMbMJ7d+702n2jR6qbni/0SI+mSSzt6rbCa3N2KWBjkHxsMaK+1cQE+lrDsyPo3
         BoFXTTsz1HBrvVgIDWyziR9FVDcRs54J+8utynNP9JWoEXu2pQxXevwV8fnI+CsiYuHy
         F6iTHfuX6o8dw9hnA4QV1dT9ptw2QaJvfGzOE2Ri5BKK9pMe/N9k2s31X+DktPRl3OrL
         XDSKfa1dj4FMeT6dIxsz4e8BFlQezWmF7ZdxiBCx0pUNc3wjYFUusmu3lGaNdZ77RcK8
         I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621706; x=1773226506;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
        b=rQQ0nVGAf0w+3WIikhwlRyUhxOTGGqCR/HeeG4MXaKsObb/Ps9gv9qS5dZPgbPaNIS
         b1LW/H6N4NKL5OHYzyKz27yub33Z93tPjKNiG6JoS9HnPfJy1zvjuC05qiyLY5pRlq7C
         XCGoNiOs6NFjuV7BecsnCOm14dc7FaPb+fEnTT4aoSsI2qX5fmqS5twZdU46kyBnsAFb
         WRZ4+FJkebp0BVY915nc+dsOcnAtNf1wDcMEq4sqLVYCmWaPmwY7ZTzMxeWkxxWtgJm0
         TTCAeOWNa1kDVnAvnMg11zKGmYuDLgdyNEzWy/QFufN4WGTfnwPgp/U0wuzI46eL6j/z
         ICaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk+08gZpwwAizS4vWCZCLS5ytZU4QPq/9gFPl8oUrqV0Ojio2FKAero5PB4PzsjR3XT264xFvXHj9C1LP6@lists.linux.dev
X-Gm-Message-State: AOJu0YzIzKbqp7NwawyN+dm+7+JejWT/b/4DHzl2OHNTK1MFDrgjjOoI
	iRmiW9F0Bmf6mLWLFR1NiItPZhmgK6R0bptlKurP4YscdKxUFd7RDU6j
X-Gm-Gg: ATEYQzwevp6QWuhgZIoUSAtZe1f9Zm5guaqoU7Blu7Xv6qG0JOdSWc4NaM+0qWEhqcz
	WSwoHPsA+1yWYQP90/TL5nty39Qv1re/TN/H2JvIInzqlBRaKPFN7P6+/dplMlxQ2fvnEDynMOI
	hAI3GToW+PWgVSc5mvfeFKBgRhR6AKd2qEzvf7JLqOoRBsEdd3+DHLeEdxOgh/RzFwegdttyEmS
	2dt/nP7Z/xn8AHP4/QVVoRVv/qVcYRYNeg8AVwwrRPq5GVmxwDauDW32DcmrQ3Qtc5mp4CCUbsx
	22YBW3U75OT8SWLorsLHEetpzN7QqC969HKeJFQBik84Fr9PYDvoSLmku+suGCVk317ue9UIj5q
	kA2govq3CI4MgAE1Yhl/3+sv4Ri3qEjMpuJdqdMiDWF7ZlnUbR4wjZZ/SQT1d2AZFtr+ZFWaUqv
	KUxFRtW91a+eI3gQwgRlH2gtNoSXqMjRVrXuabyL182LqdoeBjDI94JqKdQn4JqIwcjH2wLcO0h
	EAZi5uVnBt1arYST/YMd2BsbhsV16dbIv3AxAyx14IccNYjYmBNVaS8cwCoCE0GWztIZsvb
X-Received: by 2002:a17:907:94c2:b0:b87:2471:def3 with SMTP id a640c23a62f3a-b93f1584b7bmr104102966b.55.1772621705369;
        Wed, 04 Mar 2026 02:55:05 -0800 (PST)
Received: from [88.202.160.248] ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666d6sm720698266b.37.2026.03.04.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 02:55:04 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------XnJugc9jmN0okhNKc0vaSIQa"
Message-ID: <4e5c94d5-882b-451a-9619-fe4b4783f1a3@gmail.com>
Date: Wed, 4 Mar 2026 11:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
From: Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c

This is a multi-part message in MIME format.
--------------XnJugc9jmN0okhNKc0vaSIQa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Fix block comment style in nvec.c to comply with kernel
coding style guidelines.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
--------------XnJugc9jmN0okhNKc0vaSIQa
Content-Type: text/plain; charset=UTF-8;
 name="0001-staging-nvec-fix-block-comment-style-in-nvec.c.patch"
Content-Disposition: attachment;
 filename*0="0001-staging-nvec-fix-block-comment-style-in-nvec.c.patch"
Content-Transfer-Encoding: base64

RnJvbSAyYmZmYzI2ODBlZWFiOGQwZjRhMDdjMTc0OWE2MGJjMWMwMzQ0ODNlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgSG9zc3UgPGhvc3N1LmFsZXhhbmRy
dUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgNCBNYXIgMjAyNiAxMToyMDo0NyArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIHN0YWdpbmc6IG52ZWM6IGZpeCBibG9jayBjb21tZW50IHN0eWxlIGlu
IG52ZWMuYwoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEhvc3N1IDxob3NzdS5hbGV4YW5k
cnVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9udmVjL252ZWMuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL252ZWMvbnZlYy5jIGIvZHJpdmVycy9zdGFnaW5n
L252ZWMvbnZlYy5jCmluZGV4IGU5YWY2NmEwOC4uMGU2NTVmNzllIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbnZlYy9udmVjLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL252ZWMv
bnZlYy5jCkBAIC02NjAsNyArNjYwLDggQEAgc3RhdGljIGlycXJldHVybl90IG52ZWNfaW50
ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldikKIAkJCXRvX3NlbmQgPSBudmVjLT50eC0+ZGF0
YVswXTsKIAkJCW52ZWMtPnR4LT5wb3MgPSAxOwogCQkJLyogZGVsYXkgQUNLIGR1ZSB0byBB
UDIwIEhXIEJ1ZwotCQkJICAgZG8gbm90IHJlcGxhY2UgYnkgdXNsZWVwX3JhbmdlICovCisJ
CQkgKiBkbyBub3QgcmVwbGFjZSBieSB1c2xlZXBfcmFuZ2UKKwkJCSAqLwogCQkJdWRlbGF5
KDMzKTsKIAkJfSBlbHNlIGlmIChzdGF0dXMgPT0gKEkyQ19TTF9JUlEpKSB7CiAJCQludmVj
LT5yeC0+ZGF0YVsxXSA9IHJlY2VpdmVkOwotLSAKMi40My4wCgo=

--------------XnJugc9jmN0okhNKc0vaSIQa--
