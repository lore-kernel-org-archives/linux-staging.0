Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B23F788A
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423537; cv=none; b=FKrTmXnRI+acTQEN6ihDKK9rHgWgJz19df2L2j7Fm9F1HLBjqOQ732Tzu07Z1kFLk9jBz/abbk5BEzM8kReOY2V4TL2ufOHigPV6nzoxRUcN6JeYgFTJTS7rJL3GtptRmQZNPmiPMvcH4qpcV68mgTTMQCFgV+btfUMXdr1Qn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423537; c=relaxed/simple;
	bh=93mIETFolTzbIB8Np1Esph7SbtMbvw0NXF6t3SyJN9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueYXaUA5mEk727BLF27JrwWZnBQsEL+fxr4bcqfBZemNUy2MDtrsRDXDMrJ4G0uZQVU94FgDpxydyutWXV1PXD+Q7r7bv3Baa3LQ9bdxz0OxX8b30/mA/Cl4qCXxdf3oYZih4KhPNtRlbPBpTy5OyFynVdQW3LDfmSuoXoZhjNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjdNDaCe; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjdNDaCe"
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2cabe9335f1so9969315ad.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423533; x=1784028333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+m081u25yOUWRFASyhIlVKOpQUZSGFlyf88nZCssxpA=;
        b=BjdNDaCe1s+5UBvtQBIhS5nYMDOv32Cc0jdCzzHK5mTV6Px4A6ofn7jbDRG1MieEYb
         6zt1oxNLhg9h7MYsg9kKtmg7XuYjclVSrj/tdvQp4DISEPrDe8Z4uwLL4hLZAuKAgLqH
         kk3yxhWMxKQs8kPLwE0gxety2Mah30hidsceHy6GVN2ajtY5a1IgPI2uC1NKdeQCQ+vm
         Ljf0GPV8hcAWekTGSXEmR1UIwgcDMotf751LsXPgjGEkiFTShU6MZqZD1TtD4evw4R4j
         BUXtakjZgghkIvsknN5/XW9KiDDxzxWSjX5RT0QKHNnw+4obHAD00fUaBtN3FO7rYD3D
         EBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423533; x=1784028333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+m081u25yOUWRFASyhIlVKOpQUZSGFlyf88nZCssxpA=;
        b=RLMOuCLXnMN3Y6Un4VBP+ym0dE+8Qn1+Lg69gmwtHJuAXRS2uHcALqpEqnRhxTC7eP
         jyPD/U58rb0gI3mpI3Yx0kYxU6gzPC0UXmYJOHub2R+5TtNGz+f3gQWxTSdvoNg+HmRj
         3KdtnwvmH+ulXOV0NGtkB4gTgf6mf7emD4YdZUTBYN3CjC41KWPPn6hGivKwWhy8RyLW
         n3FfANYD5IJ4JAIbSPIUrhOOdx7SXGc3wN6ClHh/6VHvQSG5Ga7GdR1DvQFUYaC4y9e5
         gEUc/OB5R/lLC5132Vd7nGiZtWYTfn4DJf8sFked6jV8wNbSAnNbsTgYrz8pHilCCYji
         8IOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2hKJI0BsZUM7wNP+H0bS0x1KcoAxMFZZ5TVD9UKyIjnaJKXRVXS18IsVteYP4mPJWWoiPdOReYM61w39s@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/EI7XORcTQT0Qu09FUiIPEp5SK8VeUguJo4BMkGbXNZILgeui
	tkPQXyg+0JdBUp1JaXIz6dkzmsiXz6TOi6vG9DBaHKImatvgFWZekhtg
X-Gm-Gg: AfdE7cneIREk9gkVEoIpke1/IDh1i2kxV+zJLG/GIMZtrhDoTvhZDxyXOi2oqROZt3p
	Q1Wv4wzq/lQ1W/9bEVLjJAneNF7eT1RqkqjqYK7ezxVcX1eX6t12foyOa858sPP9BnOuTCAeMq4
	K1YLwOvt1vuDe8oFMW5srdZYB6jLglxe4IxCEmw7tWBBbhv0VHpf4FfKNviXzzV2DFWocPQCs6F
	6T1G0iPUJnCcZ6lG7Uwe8LzB2Da8EhLbtbCfmqeH4NsLd5EJ+QcSznj+wC4Ftrqwh8QPXabvfay
	LYk6IeQSGcYAuyDgPg2rSwOc8Zsz008JYRSrtf7TyZlM2dosr+q6obDPWpUZ5w1kKvDe0xE844s
	sOhiroRUhoUR1cDyBZz+0jVASJDrTeq0VpvLfRTw730AS0Tl5LBJB+ztwwXFswscZZDInN4X/pY
	QcH2cblfbsmV4n6m88KyXkTZH3ZkYULp/uZJutjKGEbgsE
X-Received: by 2002:a05:6a21:16:b0:3bf:e449:3316 with SMTP id adf61e73a8af0-3c08eda80b0mr5890700637.14.1783423533003;
        Tue, 07 Jul 2026 04:25:33 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm6548721c88.6.2026.07.07.04.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:25:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	marcosandrade95963@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 0/4] staging: rtl8723bs: convert update_attrib path to errno
Date: Tue,  7 Jul 2026 11:24:59 +0000
Message-ID: <20260707112503.612-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series first simplifies control flow in update_attrib_sec_info()
and update_attrib() by replacing goto-based error handling with
direct returns. It then converts both functions to return errno
values and propagates the returned error codes through the caller
chain.

Changes in v4:
 - Resend the complete series as requested by Greg KH
 - No code changes

Changes in v3:
 - Split update_attrib_sec_info() errno conversion from caller changes
 - Keep update_attrib() using _FAIL in the intermediate step
 - Convert update_attrib() and rtw_xmit() to propagate errno

Changes in v2:
 - Keep braces around the multi-line if statement in update_attrib()
 - Split errno conversion and propagation as suggested by Dan Carpenter
 - Change update_attrib_sec_info() and update_attrib() return types to int

Hungyu Lin (4):
  staging: rtl8723bs: simplify update_attrib_sec_info control flow
  staging: rtl8723bs: simplify update_attrib control flow
  staging: rtl8723bs: convert update_attrib_sec_info to return errno
  staging: rtl8723bs: convert update_attrib to return errno

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 55 +++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

-- 
2.43.0

