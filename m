Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20291C5F11
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644333; cv=none; b=bVjVNIuHs/1CFDCDKNgoJK7ZNghd/mvExCRUzsTM/MYr2u0eMfUrUASF5BTt0BOOQV6zjWm45S3et9UZl1dBiYzw18uDYqI3tVltGcm2UrJyVj5+bBZW60LU3JsSwjgJtT5tCXK3EDW1TUplLtDDyfo4qrg5+qbGVLYXBbD5Aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644333; c=relaxed/simple;
	bh=0HomQSozcsc+zIPGXtL1VoXYi40CIigI9arH+ZAaT7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRqUZeIi/f5fBdWoAy4CcfqBbjCBVkH77o5FXRPTQ5HYpcz3ybV9EvCsk5PMtH1deOowqjht1F2SrDQfK+ThR3yT2bdZYRpWoeUwwSiiHdRGwNLNlXwcs/CNBc+gjQ4bnX01hqN2AKeYN30ml/xpV0OhuwjNB8TStxyuHiln6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKAeNMX5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKAeNMX5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35691a231a7so3383510a91.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 03:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775644330; x=1776249130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCHEHQb+TptDcSsDGPYEXLY/vTvrZkj4Pa5oPh7eMaA=;
        b=ZKAeNMX5hgbfvcmU8UztD1jJJLzyuuxmsSS4FoBdeMm9de5FA541qtO29NMNZodIa/
         GmKcDw/XZGecP2wqClJWw8Y0etHySio71gD2CLs/423mSLxlmpk4RDUCYFZ+XbecmB7Z
         An8anU84K0KDv4M5rJPmSRFPOC+qmx9rB+JKcntwE5kkoF0B4LTHW29VtrTGufXcEOY3
         8cIORWfrn3Vf/bXvDIEDJFEyQVBOEO/bFBexmnMJLLC5n8cdyZlYU48D42qeUcwkaMLD
         gMNfjBDKWxj8LJre4AflxVzz35AOuuOfNnP+dE7JSB1LkapF+bb2Eru3gPcMqB2rcWeS
         e+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644330; x=1776249130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCHEHQb+TptDcSsDGPYEXLY/vTvrZkj4Pa5oPh7eMaA=;
        b=WMld21+CEuUEUzghKpQp7PPkFi1M+97+BazShjPQssnbdI5LJvWh0fTADT8eQcAL0S
         CpxPY4PQF2bksBTW4qM3usiCUWo8nH2UyUhstmlHjbU9aj3a3uqL69KK22pvlif4rFKT
         ZtRHbRB6QPIbxyJNZ6pJx/Pd7dkTasgEOSM0Df3lS0swco8eqE50ilkzza59jwYgSNI7
         67T4eL6WkyT4XLykyftUOT4fTpWUoUwLY7aK8hAPAN2t8bEA33clJd0ATagvIZgcc/Pb
         uWT2uB+fEhI+bUFkni4Vq7tccaUJ/4te4X1Vp+sGFS4j/bgf5PTr4RT37BwXeFyF/+nH
         ZCnQ==
X-Gm-Message-State: AOJu0YzCtypNwn8HUrKJW2VSfwoFPxMrC4lbxSmDHihXYNG2fDRh1JzF
	yaUS6vkUt+EUWwvADBjrcqy7sZk6ji6uhm2GGy4++ytfcoDSA5J/ADik
X-Gm-Gg: AeBDies6p7Y9e4cv8vCx7UGSbnmrrge9XZmd1PgwWglAd3B8a4J5P6RW9fS+aqk53Dq
	iH/L+ct9hROkyCkyOVzLhVD0K+q53yBWgoIg+a2hoESqTKwJi8ETFGyGGoVu1rNnjClc28BnKRv
	AKvYQuNxhbI8B1KI2/08QaN8t2M7x+gEQabQYFMy2Q2pye7K2gv8SbXsnDFNsmWnAg6Dvp6/9we
	HPkheaQvgQAKcFiwZPEihWMBvOhaBEBqCsJdJCKAWDlmrBiNs5pLfzvrmFk6hutE679KFZUMuMD
	+8ua3+CwC7bUNyXzhckfM8yJ+NJL5t4Z3Q6LgVa8HPWKDr8wB76TX3x2KQhXJPrpqI/AgZiSvEg
	SA8ufYxFA+Dy2ndQ8q/Bz/EVsNN/M9KexUEZerFaHlIpA7XBzZ26QD1aa0KwJiPC8YXluy933Nn
	6n0XHjVR189QVVFFbQQxT9N0Ad2wiZPfW25SoPu6lKVYP8lYVANmQQE6fRLdUth4Bv
X-Received: by 2002:a17:90b:48c6:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-35de697359emr19357685a91.18.1775644329946;
        Wed, 08 Apr 2026 03:32:09 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-35dbe5e4ba7sm25585609a91.4.2026.04.08.03.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:32:09 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH 0/3] staging: rtl8723bs: coding style cleanups for rtl8723b_phycfg.c
Date: Wed,  8 Apr 2026 19:32:05 +0900
Message-ID: <20260408103208.7682-1-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tas0dev <osjin83@gmail.com>

This patch series fixes various coding style issues in rtl8723b_phycfg.c
as reported by checkpatch.pl

The changes include:
- Fixing spacing around binary and bitwise operators.
- Formatting type casts and aligning function parameters.
- Removing unnecessary blank lines to improve code readability.

These are purely cosmetic changes to bring the driver closer to the
Linux kernel coding style.

I wanted to contribute to Linux, but in the end, I could only make a small change. I'm sorry.

tas0dev (3):
  staging: rtl8723bs: fix spacing around operators in rtl8723b_phycfg.c
  staging: rtl8723bs: fix casting and alignment spacing in
    rtl8723b_phycfg.c
  staging: rtl8723bs: remove unnecessary blank lines in
    rtl8723b_phycfg.c

 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 65 ++++++++-----------
 1 file changed, 26 insertions(+), 39 deletions(-)

-- 
2.53.0

