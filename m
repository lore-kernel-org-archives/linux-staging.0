Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA778A47;
	Sat, 19 Apr 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745071004; cv=none; b=A5/TtjOfgJdSfQGsculxpmwOAUQshQAIuDi4tS/IeUYqfIdW2J6oFLlObSCY+Nccge8MeCn4wlTIiAiqj42nxEnoc2fOcTxeVRu5lj0EvNPIwW4tIsdVOSUmkJcCc4m2P0vqrs7ILcTK1+vDVuyjq81YGSIqsvZtVlEVRkurcE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745071004; c=relaxed/simple;
	bh=32CJ5lqsP6SeFL28byG1FmT/OVtQTHdseuVPntwIxgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9XagZlOGTnqsN8mnjoQnKAvclxd6JyzAuGOZok/OvwHUtXsfB9Yip9EzkG5vHqhgvu+wVd8HJCLc1qpG6i3M5ORO7Hh3KYrKCS1jnxe/0oMehX5ZJ/+bQoNMFzPXBcTtWP+3VpGqs8+r2waYRJZPp8CXvfzEnDPXjA06mOVf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Up94qLFc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Up94qLFc"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so37138196d6.0;
        Sat, 19 Apr 2025 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745071000; x=1745675800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1T9iPTvrhyH2WPe+v9UKop2Oe53Fi14F7QzLPmeRS8c=;
        b=Up94qLFctnmqPCeerHBUbUOle2Ov64w86YiiQxlD2trlqhMYWQFvLwJRcsKi9p0EHP
         ywyrz9v+HkIfNW69l8wzptjIgRmK/WQlYUJ6oVFcK1k1NUWNOtFU+vkzSA99dBh+P0r/
         k6bUHJPPGztbtB6TKxqCQJ3UUzF5bBfcbgK9dYvkMfiNVpQMwjCZVPS4B5JFC9RvXGHZ
         jXEhKdQurBc/F5KS9zzIKoOgOm19dDXGbsrAC3nKlosYb3V4IUI+bRzfY31hltxXdAKG
         v6se0Ed1I72/Jk0iHwwqEEBeaogJenwCNiW6I/Ffp2+D8+Kpr6wFFQkvXzQ0Q+D4ItIP
         UZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745071000; x=1745675800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T9iPTvrhyH2WPe+v9UKop2Oe53Fi14F7QzLPmeRS8c=;
        b=iXt6Qn4aqLSMe8dOlwbG+QGY1c23Gq5EYRtsERdM2KZFUVaKDCguHwLDgdEtp5jdsd
         frYC7IP8pC6vfpfcQbgOL27b/voweVMYTmZNn9KC4oK0sCWI2FpPSNlm4NCoxT7KlaQO
         mkkZGKLBazinMLzXYyf1sD6JkfsaqK09SKN0rJxgKSwgDJ0bWMeEmIrJXivALXKWRsLg
         HrkI7XZlhQ/dYBpxXTt0TLH95n4/lzkC7rGmGqZo3Tjk9JwKNVyn0vb2Lv8cMp6rFXg0
         mlkhv1X5gUNGY0vsz24+cSP+AEN0D0WITtwgqSMg9bciuSLq88YFagtZChMvp62hKlW9
         nk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZwazkRvrHq/y4q6fcZUvvk7HR8yxJVlyLlhDtAvqQjXKwK8CKvFN+53QYPK02Uzxu9JF8bB2G14x/xMQyAA==@lists.linux.dev, AJvYcCWOCa8p/S/Qt7rnke7kTBGN0Codjwba39VIa6sHGsDW9J8s3UAx+7Mu2Q7imxELAEa3HhpvGCJUeTTQieiO16Kmiy89bA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc8hRWOKJgUlpSUpaCbVL7Uer4yKIHzqv5SPNE6zrKYrSTNYrd
	CadV0Oh98sNGMtqtbfct6fqHhfeyjOOf7MaxUuu3lS0cjqDwQeYZ
X-Gm-Gg: ASbGncvr5WJ6126USLzz9v6VWtUbL0nfKpWaERmGGMTi6vM/WIG6Yql5bNCCHEP5Qp/
	N01L5BLc5+Xh5F6peCKl/8hQdFzLU1PfAsd8ZTXw++KPZq1eShXG9wZPKU+Ci0+bidOrRdPE4fd
	fvGe9sNqxgdxjNzJIkhSLgyKaE6Wh6GAsyCutgXAdMDUJ91xNWmbJVEhGaXggDnWnA9Wqfk+JyE
	EcoArhgkAZ6x/qVlG0CXAGprreUgdY69HsKE3eAn6RY6VkviQ/Z6ymSdgOhzHKaDF6kffyxZ29n
	my21+sHaXCEG2+qqSCUJRSi281ssOaQCcPDEUo7ZX44FnnG2RcmnYqw=
X-Google-Smtp-Source: AGHT+IF6XYWp7StUvpSliLtmghbyco2BwMZGL4YQPcUII64a1QaKlsmbRaUVtyMvgWQng1VnpCCOXQ==
X-Received: by 2002:a05:6214:519b:b0:6ea:d604:9e4f with SMTP id 6a1803df08f44-6f2c27d0d27mr115357786d6.19.1745071000485;
        Sat, 19 Apr 2025 06:56:40 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac4749sm214350185a.59.2025.04.19.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 06:56:40 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/5] staging: iio: adc: ad7816: Fix channel handling and refactor
Date: Sat, 19 Apr 2025 09:56:33 -0400
Message-ID: <20250419135638.810070-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original patch combined a functional fix (allowing channel 7) with
several refactoring steps (introducing chip_info, renaming structs,
improving validation). As requested, these have now been separated.

The series proceeds as follows:
1. Fix: Allow diagnostic channel 7 for all device variants.
2. Refactor: Rename the main state structure for clarity before introducing
   the new chip_info struct.
3. Refactor: Introduce struct ad7816_chip_info to hold static per-variant
   data, update ID tables to store pointers, and switch to using
   device_get_match_data() for firmware-independent identification.
   This removes the old enum/id mechanism.
4. Refactor: Add has_busy_pin to chip_info and use this flag to
   determine BUSY pin handling, replacing pointer comparisons.
5. Refactor: Simplify channel validation logic using 
   chip_info->max_channels, removing strcmp() checks.

Regarding the 'fixes' tag: I've applied it only to the first commit
containing the core fix, primarily to make backporting easier. Is this
the standard practice, or should the tag typically be applied to
subsequent commits that build upon or are related to the fix as well?

Changes in v4:
	- Include missing bracket for condtional statement.
Chainges in v3:
	- Split the patch into smaller patches. Make the fix first
	  followed by clean up.
	- Include missing channel for channel selection.
	- Address specific feedback regarding enums vs. chip_info data.
	- Use device_get_match_data() for device identification.
	- Move BUSY pin capability check into chip_info data.
	- Simplify channel validation using chip_info data.
Changes in v2:
        - Refactor by adding chip_info struct which simplifies
          conditional logic.

Gabriel Shahrouzi (5):
  staging: iio: adc: ad7816: Allow channel 7 for all devices
  staging: iio: adc: ad7816: Rename state structure
  staging: iio: adc: ad7816: Introduce chip_info and use pointer
    matching
  staging: iio: adc: ad7816: Use chip_info for device capabilities
  staging: iio: adc: ad7816: Simplify channel validation using chip_info

 drivers/staging/iio/adc/ad7816.c | 94 ++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 40 deletions(-)

-- 
2.43.0

