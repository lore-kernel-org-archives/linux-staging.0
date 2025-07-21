Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC122D949E
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116267; cv=none; b=tOJ8L5DuHd8YJ4AvF+69jCq5A8h4XWWxplwoUjjn3u3vtrm0UQqiD0LkMt/EmqiIDSX2PGuwE+UWW/nFeJWIWlU9DD+JeqYPnomJvCzwC++pvw+Zuk0yCoFCwFfvGHcAup4VZ/G78OawzGFF4N8wS9Yb+0aESSbjoS9CnL80pXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116267; c=relaxed/simple;
	bh=O7nGlE2cUnoQsJ87vOVZuT5VL9XavOP7p041iJsJGAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp2dixTPU6oDU9GFW5j4C9YrG4tbQZUtnHzaa2KA9sp5ouv6EKd6PUynMpwSeMggC8nRtxozVxS3IlGZ72rgcKZ36vS0dZr018VbUNzOusH4ijC6GDmSycLisXiQl3tOjXTXLUve/gq6wDT+BGW++bgz9oRW0377FH/7u2QEOkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ageY3N4n; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ageY3N4n"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8041135a12.2
        for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753116265; x=1753721065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKskQkPQDwDVwakSdk6+iW0gLfYzv7Hl13YRRQgIlwQ=;
        b=ageY3N4nuNaWDjqDG+xVWIIUIymhbrLhE+h06krg7q4eSetQggGDI8J0jsX+gQGnxN
         bnvm8y+0kqwOvQsncppodmV5EuEtaDkFi2bgegcst3KlRQ4rUGZua/ym2fVl7XSFW8cM
         hd0eGkZ07G2hctvgORnTXMs8D391IvINFKqqvo8TOIpUwbWU8Sa+PcJyKxLJJswQYaBy
         GROpB+UQCduBEKcVwrOlm2tmcA+8NpVu/tK5AbDQf4pQ9BrqUHGoQ3X/dsI1YO9Vcb6z
         oTHaWUgCyafAJu8ztamJTwQtlU9G7KYKMSID8QeP71K729p3vn+me0sPR4/fVHVTxJH3
         OL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116265; x=1753721065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKskQkPQDwDVwakSdk6+iW0gLfYzv7Hl13YRRQgIlwQ=;
        b=q547eE6ph9f3x+qhD7QwoZRb1goRUoLNNeZC8ReKw5DLm9KBapW9UoH1xvwAqtMGs0
         TwA4z1+v7JMBeriINsiibtw3ERtYtEumeVacJtQLvDC5agzGc6sBtP710wdyZ+dw4uAr
         k25mLRqMK3MIEayg8eX7SFJaey8eXc50NnAxUBy1IMVC8koxGmHsagDQ+NL3EZO68Pc0
         r9tkrL8gq/zwKF4MqPjQnJF1gat6tbm4gNG1AvLiBjjOp5qtbk4TCqWItMYuO8Ttz6kM
         k+PbvP2ae9trMqaDQahz8j1X+N7VSdECBfHrTHhw0DBeikDZWGPxMPv+trNj5K9FSXWY
         P5xg==
X-Forwarded-Encrypted: i=1; AJvYcCV+BHcj1QD9dQLqllWpIx7G8PZV5b1swgpIUFQ/AqexIGkpzHoQEZgSq4Da9VKmh8E853Y+JztakP8GiHYU@lists.linux.dev
X-Gm-Message-State: AOJu0YzBYKb/4eD6/mbVbIdn8j5CiMSQ/5WJCDH3nn8aT3YNMVFtHGi4
	jHRz+fH0B5qExwsE1qjI035tjVZ9EBNXpq1NOhZuvi/iM8KQGX0KbXL1
X-Gm-Gg: ASbGncvAigviP4Xr/qpOmmkuIwOPKIuSZ5a6Gr2cBNP3GMqJ2ndyyz2jkyb0ZtOffTG
	RZH1WegEeDw02K7iV2U63EcAwBuls1a1X8263ayzRoFzgAKCuyV1ImoBhrYCE9PAt4xpoJhMDux
	eYrLcBKaUvJakqkR+0yBZRJm2P4FUz/MenSsmDx6EPi1GwaSl+oRt11naWoHieO6a7Al/SHvUjq
	rbXB++X4lk+zuOkEvqecNt2iDzO/gw+3/AxS8rWDSGD8ea1MjsSeky4vOGZKwQr4TNq0wvreLJI
	X/5168FTCgeykv6wtJQrU+btJIAgSMpGVuDoLzaecw94JauKlRo+YMznSoWnFN4n7v2nucg6527
	tPGL+ItTesJAyM1Ijptw=
X-Google-Smtp-Source: AGHT+IEIY+6MxOvCrh2HOD/KC/SO7Ewz3vmGpX7AcSRvRANm9qXC6XIwEIMtliVBiPMsW0gORPG3CQ==
X-Received: by 2002:a05:6402:254f:b0:60c:6c85:48dd with SMTP id 4fb4d7f45d1cf-61285bf83d5mr18607084a12.23.1753116264269;
        Mon, 21 Jul 2025 09:44:24 -0700 (PDT)
Received: from zephyr ([77.237.184.54])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-612c907a5b1sm5662655a12.53.2025.07.21.09.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:44:23 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH v3 0/2] staging: rtl8723bs: fix coding style issues
Date: Mon, 21 Jul 2025 20:13:41 +0330
Message-ID: <20250721164343.8395-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses several coding style and comment formatting issues
in the rtl8723bs staging driver as reported by checkpatch.pl.

Thanks for your time and feedbacks

Ali Nasrolahi (2):
  staging: rtl8723bs: fix comment formatting in basic_types.h
  staging: rtl8723bs: fix comment style and formatting in
    osdep_service.c

 drivers/staging/rtl8723bs/include/basic_types.h  | 13 ++++++-------
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.50.1

