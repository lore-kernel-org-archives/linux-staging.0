Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F97FBA2
	for <linux-staging@lists.linux.dev>; Wed, 30 Apr 2025 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992612; cv=none; b=hDd0x4MPhOVQOeGfsEDg1OnP/gvMQBEV7YShVDBxIs3xky8IsVkYoIYyUGgZZcvo7eicg086hNHCqQaEMVgE7f0Ct+1BMC3ImLrY3XcwoEYxLITa2zStWcg8TGJ/Huii2NvTACiTejs4mtzKTUCJYvywts+iyCgrZUSAnmAKskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992612; c=relaxed/simple;
	bh=13Qo05XeSWOf88djYrgymw4RZtXdKHMD66EO9HyNJig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T/BFzF5pGj8sp1Rqt+a2XSsWJFh9PkFxo+Q+Qzzf+TO3a0vRN74fq4hQNZW4hVNhFO9IUY7RzHgTDOgJ6rJWnZrZLjYKJ22N4henI5wVoRQOZoChbZWdbZNThAjECvu8XBlsf7C0RtKOp99dTsU/oD1rK6ozpeSKlJfV9Ir5rSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5425wrg; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5425wrg"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2240ff0bd6eso13936125ad.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Apr 2025 22:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745992611; x=1746597411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhUqqxVP/BLi7jqvWQjnBB9ROUrGfrNMOfm/brn9Rmo=;
        b=B5425wrgiIsWRaBJwCMEpukq1S1pyl5YHWwt4SKcn/080x2jKzF18h1Vnx2Eqj8O8v
         RfRSxRzQRlc1S/2Ro3BWgJUrs0PivGSuj93Lts4MIT21a8koloF3oOydsOwqyUUW680P
         Waz6+Tq6lwY7tdFQNTWVcaLMyhixtwa9ycnCLWqx1DXN28Im4tBgwETXvDpMjtDXiCd7
         OryJyTvb0w3PTcEwB+D3fXLsu4ug7ehimlj+O0QIipzs9pA0dPqMYK5N6eEVo4JmFBZO
         vK+Pval8jSSmlyutrIIgOxvCFnquIxFQ1ibuh0agigE2geqHBtf2VB+4JHw1Z5wFUUfh
         Ej8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745992611; x=1746597411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhUqqxVP/BLi7jqvWQjnBB9ROUrGfrNMOfm/brn9Rmo=;
        b=Wk7IM5BqLgezBGq1I3kkjl6rC3AAmfouC13VsMATEXygf+0dNkLyner0ThEuyIIYFv
         CaRZRZ5EktWAloV1u9FazeBBtKIW4l466fqdmvakDAEKzRcxD8F/0ZMhe6K+iliAyw/v
         7FTVk4Z8fY0/pRarC2XO3bWwnaCAZcWgpOR3/vJbTybfQY92MVB3iv+9Q52wvw5e+zUw
         9eiVGwrjMmDaQVmHEhqiISKwi6PkinAKvAEwSXuOSWUOPI3Pscrb878d4MIWd77Xg6TP
         +3ATMaP5z2ilhvVsSsXd4nYnJMkcLhHoA7035DbFcGgL2q7dUB37DIPTO8MBuTzlKDZo
         qgYA==
X-Forwarded-Encrypted: i=1; AJvYcCVrSdjvP2gau+jZn/lg3NMY5nHm5BJ58jw2jl27bXFmGotEiHGlOR0lPy6wHxJZJEN8Wj5XCdcZQFs7DVJa@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1mbAOLJP+dKrGt6AbAFoQ35v7nCS4aMabi3g1AU6aEI4wZauz
	mv1FCM5igrUOfWZbqfJp800OOCnvVoQWlLA17JwDChJwIkdEWv/o
X-Gm-Gg: ASbGnctSpl6xsHXmLnGVNBrDT2pSrqqYbEHdJ3oMRM9PrufSYkPto5gXe7FJ1wjfY6R
	HQZBTPjA3yGQNB62+ayqC7zXy2UwLBRnrDSs6lESJHWNxY98P8B/DB2dON9++EGuTXqeEKH3kcB
	exxSwLlxyYY+9F06Zu8E50zPBsAWm3WCHb63bOd7roQ62zF45LNEmyUcGHHGvslhn7IDr/T0e37
	oA1dKGK0dwYupDNQsVbph9qrOWBijrSUQCygnQ4R667vMGkHuF6n77UmMCiFDWyzQg5e6O9Kvgg
	X3mjsPGqsbP8KJRpZmYU9PHtv3zTA8KnWQwiyH3CBwm5sY9HqdR+yr8DQViAlqTzD27LAYS9nkd
	b+tUOSKIA4Kv9xg+4OnEEaWOFXr47r6BdnOg9BkKrdvExrRn+SGOfM8c=
X-Google-Smtp-Source: AGHT+IFQlsChKdvo8yeBzYHD3oG+sKW4TgLubiXBAn+sb5J1uDe59Z7thhcPMrDzNK+/LL2lhWM0iA==
X-Received: by 2002:a17:903:2cf:b0:224:8bf:6d83 with SMTP id d9443c01a7336-22df57b3ae9mr7881815ad.8.1745992610609;
        Tue, 29 Apr 2025 22:56:50 -0700 (PDT)
Received: from kerneldev.localdomain (162-225-124-171.lightspeed.sntcca.sbcglobal.net. [162.225.124.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221a82sm113383895ad.257.2025.04.29.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:56:50 -0700 (PDT)
From: Eric Florin <ericflorin.kernel@gmail.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Florin <ericflorin.kernel@gmail.com>
Subject: [PATCH 0/5] staging: sm750fb: Style cleanup for sm750fb 
Date: Tue, 29 Apr 2025 22:55:34 -0700
Message-Id: <cover.1745982772.git.ericflorin.kernel@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches addresses a number of cleanups attributed to
`drivers/staging/sm750fb/sm750_cursor.h`.

Patch 1: Rename sm750_hw_cursor_setSize to sm750_hw_cursor_set_size
Patch 2: Rename sm750_hw_cursor_setPos to sm750_hw_cursor_set_pos
Patch 3: Rename sm750_hw_cursor_setColor to sm750_hw_cursor_set_color
Patch 4: Rename sm750_hw_cursor_setData to sm750_hw_cursor_set_data
Patch 5: Rename sm750_hw_cursor_setData2 to sm750_hw_cursor_set_data2

Eric Florin (5):
  staging: sm750fb: rename sm750_hw_cursor_setSize
  staging: sm750fb: rename sm750_hw_cursor_setPos
  staging: sm750fb: rename sm750_hw_cursor_setColor
  staging: sm750fb: rename sm750_hw_cursor_setData
  staging: sm750fb: rename sm750_hw_cursor_setData2

 drivers/staging/sm750fb/sm750.c        | 12 +++++-------
 drivers/staging/sm750fb/sm750_cursor.c | 14 +++++++-------
 drivers/staging/sm750fb/sm750_cursor.h | 12 ++++++------
 3 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.39.5

