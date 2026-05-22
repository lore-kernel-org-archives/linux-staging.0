Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B038D007
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 12:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454230; cv=none; b=m0pjNrc9IBkDtlG+N3440OeNixhDXt0kmbgr1BW11u8xvQef9+yCIwbsqbXpsqaD3kbsgeu9Je4f2Wo1yxcPpgqWYCRyeUUtMpBAE8f8rHrya0407GFRhabXAetR5o1iQ8HiysBVcoWflZnztbzJEwi3tHo5ccp5n/XrUQWP264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454230; c=relaxed/simple;
	bh=qPlkcyWJ2JQl7S/kKSEalPtfdFeXaI/0wc+SQ0G3x/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z6I3Dw/pLmJQdz1b8bhhu4DrztITeE77+Dd5scXjy/dwqnym0tNo6Jv6UHYeY6LXlpeUN49g8MS+al8lrOYKVJUPZ8EODm88cTDbyZZ2bFDHxskBwlEp4lRN0lvM6S9cjM9QR3htEkoqbEHh+756iHk+uQVdPGIe9S6don+WuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvbJnrc4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvbJnrc4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-836ebdeb969so3412082b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779454229; x=1780059029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKhyEwOyUhCl1KpiKYoc4wrLFquBNwjCVKeI/b/pyYY=;
        b=OvbJnrc4jK2+5pWE9FLSVBm9kUZWgD03cCyKM1Wgft6fzbbg550n7ZgOuoXO2ZZ6er
         66LfglJ5He0dG/zZ2Pf+9iz3trCFXOCNGvhkkIcEZK6jlBA8WgxAm0EO5ulrd9Ep2kqk
         aPI2az4wx+g7uZ7BS6DaaAS+HDeQLkyWXcifiQ0QtpCq0CoUcH/U4aLe6KV6NuNpU3Xt
         sxBgJHb7ArSYeauMCy9un8VWNre++rtBEtrH7fr0B/yspCf37J2eE32Z7Y33Y5xE/Ezx
         VeFsU3jWVldmDducjI9gtZRqqUBOftXosfcYgzfeZb2um0M7yCMKuRm9ehH/qeVHV/Pj
         UFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454229; x=1780059029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKhyEwOyUhCl1KpiKYoc4wrLFquBNwjCVKeI/b/pyYY=;
        b=E1Wos+DYMtPksDXuT0uL//lcYfZqmZu1DJA1cYA7sjf/5S5/Sw3yyAIy2qRgAeLKpq
         GfwCMlQUi9qxcWauxlLgfVbU3whDnUuJlO85MEyx4Ul0VA5THQ1E2jsnk2HQsRb2y0/x
         sMKppfv7kbKpHXd0DLz9pcONNcwAa967hd/1LHBtm0WD0QHTO24IyHhsTusd1L3fzyLr
         wvy3hiAorbE5w5EGmMghF0qPdBDjHkTZiXBKM03eJlmTwXOweD7u2DBxU1Ia15aFLqh6
         PHentMiK/1oNIN4Mmm+epI6YbEVly7AbWR6gQ6qiGcVvRVptCZciIMDJFS9LuAf/7a9w
         e+xQ==
X-Gm-Message-State: AOJu0YxB9kDp/XLVnsljEoBfXYZHCvHT+5NnH42zECkd1GCgrIz8HYJI
	hWi1Ay6lFrHXhaISStV68X7UdSHbKQgCBlHttRuLEG7sxz9LSEtp+3aCSPgOgGza
X-Gm-Gg: Acq92OG0enuuYJS86pQZLTDe56iNXX2QPzlKI5PxmvYfIurLYzrkD6XIz/gzIQs08D7
	mQeXWBxMJm11TzSC6NRcrtYcE52aHFNgd6q2MsSRx+DRFuGGa62AXUkh71ysAf4gwgg6KiJivtO
	UQe32i6qcqgyNCHTNciuDBp9D5Ja/kS5WJKU6x3Bb6xOEEnrpUU/JUMlhecxl5NtSVrDI0q+1Qh
	JZCiJR4Q35qP4jOsRisGTpm+U8jTDQTsemGZlrMywr9x+zV/0xjBlifhjCDdrtw2LVz1tt0Rd69
	jEMICp0paaheXojJDmEWbS7hfHZxn6Mx1AxAmal0anGmrm8RWDKjDXz8ZSIxG/RD3bFYKC74TGx
	CQC6yzuIrCs/fQrcdH3HxSUyjpQLGdUxQXTMkizIM4rgCzB1LZnG7tTKAnx8oaasszqZeuOC6On
	XK4P3ENFhsQSA7mB5bp2rMIx58kDlNMcskGSma27utTsrgzDmcmqUEUjujQRMqC3JkD1lmX82jM
	pBotQ==
X-Received: by 2002:a05:6a00:e8a:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-8415f153809mr3804916b3a.12.1779454228655;
        Fri, 22 May 2026 05:50:28 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:89f5:dcc3:dc82:bba5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea14d0sm1772121b3a.37.2026.05.22.05.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:50:28 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v6 0/2] staging: rtl8723bs: efuse signature cleanup
Date: Fri, 22 May 2026 12:50:20 +0000
Message-Id: <20260522125022.29700-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series reformats the multi-line function signatures in
rtw_efuse.c to single lines to fix checkpatch.pl warnings.
Patch 1 also fixes missing braces on the else clause in
rtw_efuse_read_1_byte(). Both patches have been compile-tested.

Changes from v5 to v6:
1) Reduced series from 3 patches to 2 by combining the signature
   reformat and brace fix for rtw_efuse_read_1_byte() — splitting
   them caused a build failure between patches.
2) Compile-tested each patch individually before sending.

Moksh Panicker (2):
  staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
  staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 15 +++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

--
2.34.1
