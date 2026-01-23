Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802E37AA8F
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162286; cv=none; b=lNQRlSCT84yYrXBfETQq78nDcOhJ12pW9cyZLS+V2N6TBqkUVke6indGEY81TAp0+kANkUfGq2VnJJJEbcTODZWlDDCbWPf3rXu6gXk1TkINoqGYNmfDRIETCTAkY1PO8tqQrGdVkZa7vpqnNPBfOQc+Yc+NKbqQazLMyndJ/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162286; c=relaxed/simple;
	bh=UoLxzyRP2SmjBqveoF7RiLaY7oEic6L2ac/RwjORuOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxxsqknuaxGaJxrCRi9GrbwDj4f+PGK0qcwaFBgaXlsS+0x9ypCEMwFK9LfSTQyk2maHSeNREGmjdtckp89Y8lL01XSLIpQ1IQ8UKdtxIffH2dJMR7tH4n50QsAmHP21GFQkLl8GdMTgUkTMfYSbnZm5XeWXMQCeHik6cDvxtqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fn9zc2Vt; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fn9zc2Vt"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c613a0ca52dso1239127a12.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 01:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162276; x=1769767076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RN3Nw68x419mudjsjrkCYTI5E1lhgY+MYawm9y3fvQ=;
        b=Fn9zc2VtaoIlvhxoncdRfBDFlLH0Tu/AxfBgLakRHYWgM+2aQ2A6hfK3EZJhviSFBU
         ZvM9Uu43i6EVB2PfZpgonaDyeAbZ2ysiQio7n3fYEH4c5jm/++3bdMbekvBwlEXUM+ef
         /7xIqEJRe+un7FfHe49hOySt8GEyWMYm9nJFBSS10c6Jdy1aXRtz1Kb0/sn+5X3DZ6bB
         mubOwAPl6quNBHCygCQQc7pcsSoyTdBOIO245+O0ZPa4XpU9AEKT+fXsUpRP4MN+UG5H
         USC8PQIV0KG34URkxcvFH2CXPpFnGoA64l/sf0QbMUOngbi2VQNRdeMgnxsP2T897GpE
         iTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162276; x=1769767076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RN3Nw68x419mudjsjrkCYTI5E1lhgY+MYawm9y3fvQ=;
        b=DBjljsFBy8fl4OBiQLERC1RKAs4sIV3zauWKBt2IWtCNNENTJfwhphslOSPNIQAKNi
         23OQQ5Wyd37ugLsvlpnH3avrNteCX7Bu+gp/atShJ3pXRxy+f6O9yQBjGWsur9aJcrKW
         59+PiX8ld9zBfME8joIrwhTnzVSCp06tZHzxuzO9DfAZFMguxW2mJ55Lg/LO5C+rbhRX
         xL7XLCPw+c3m0WaCMxRdmBjZw2YR0TFQk8VBxTOoF/CH6WPC35+VBoz9ZG8P/4A0+6SK
         ZEHG5mGwvMUUm5/fNf02DiwenO93XkrYe1CAJ1e6j4wKlmpHknxARiNP8TT10vfX7uTX
         GkkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKdEdtHn0tNyOb5FP8Y0a8ftGucLHJy702cxkcz8OdTFfhsh5vN/WurPsakbb0UFWdp/SEi86IjGay4RqC@lists.linux.dev
X-Gm-Message-State: AOJu0YxA9jF38RRxQJKE/yD8rPbAVpqfJ8kPs5Zg8DufNkTPzlPmV4GM
	/jCjaM7bIsX8wUOJQUruVdsHoX4w3iv2lCXT3sph0eyNh9uzPP89cPs3
X-Gm-Gg: AZuq6aL+cfedBcL3wgUWEE+ZuCqgDBl7icz8FebSJcrr1IIK36rVd5YNwWjONVe8AFX
	C146S/wMqSWv941FkZi4oy/WR9fKSYj2kGM0pQdZOrnbrvLgInY0THfpL4yc6XzE4WvDAbasa+O
	KFrwQp9E5+Mtja30ejV3R3jsKAQlWhxCytJxWjsC2/EQtGj7ic5UAYDfUHxZZeWu/u9vuN3TNvS
	aszb4gkVY/fpmEvERuwARwTIGzvjIgEVO9JGTQzimrLNgjY5S5dFUqOcfohWwDB5qwU3Sb8t6Dl
	CEDvJMoedWCAwlQKug2H3Q1tSwJcSUJPcTkqzzXF5WXSLe9dpeT9OnrMaqH8J4zAjKPbknVVQCe
	EQ5aTPmQU4xYCuQ5vDwP3VdF+HOwI/gBb72DygFIevXM1BhHD+tf04q7uSffGtZ9jjPie4YYxNO
	D9IDPHQjODSwOK/TPz23ML4xX8ty0YIQwc
X-Received: by 2002:a05:6a20:3945:b0:366:14ac:e1f9 with SMTP id adf61e73a8af0-38e6f85df41mr2743973637.75.1769162276381;
        Fri, 23 Jan 2026 01:57:56 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a412944sm1564838a12.24.2026.01.23.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:57:55 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix coding style and logic in rtw_mlme.c 
Date: Fri, 23 Jan 2026 01:57:31 -0800
Message-ID: <20260123095733.49301-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
References: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes several checkpatch.pl issues in rtw_mlme.c.
The previous single patch has been split into a series of two patches 
to separate pure style cleanups from structural refactoring. 

A logic regression in _rtw_join_timeout_handler() from the first 
version has also been corrected.

Changes in v2:
- Split the original patch into two separate commits.
- Restored the call to rtw_indicate_disconnect() which was accidentally 
  removed in the first version.
- Improved commit descriptions for both patches.

Michael Huang (2):
  staging: rtl8723bs: remove unnecessary boolean comparisons and
    whitespaces
  staging: rtl8723bs: remove redundant else after break

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.43.0

