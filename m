Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F135F483
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796308; cv=none; b=FZbT79JPbmjv6PkG+2jO8m4j4GYjEx5dCWDOcpRTz0bCmkFPZx/1rv2xRTO/dfVDw1zPSIi7trsp9u44+6jF19n5Sm030s3kYpSrZl64e8ZmkJbKcWkBy6LZoHLHThXyBkRIG0uljAOTtDQJm3HiXDWSGo2TSG7Z/Pm7/Fr8hP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796308; c=relaxed/simple;
	bh=v42P2k72Woz6J76qKMysoIc0sUzF3aS1VgyWO5VKJ0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UoC5UC0YfhagrLggNDWk/AZ/LHZkLwGT/o41aMINFgsofTug/H6LGRho84WkDCh6xfQjS4LvF0LERjVWnztcvyaQ9pF+ibF5Dh4GnogcJ0ZyaSt/jvrBUNW6vs/fhVHH0JE9vo7eq8kquScn//ILDEHXGY3NxH3PPXAH7SQhTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4wr2LGB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4wr2LGB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so8972825e9.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706796304; x=1707401104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/n/G7y1xsFEdDjXEUwUFzAE/EZFxG1nYhtSYneXxk4=;
        b=b4wr2LGBiAVPk4lHRhDfPYSU0ynS91p246ACP1itLwGSh/y+Ny+CRwz3tsTCFB+e6j
         DH0zgvyop3YmIt/Jt7elMSSsSddYBiBIHWt7KcBIgdWHbT2uB05Ue2wY2rIFpPTuprid
         DDDkxcdl2/g2Rm7bNsg4HaliseoHXAvfDK8eOGOCAoeP0cJmLjloViugp+QUcS/4ItHA
         uZBH4AYDzsW1VTKTAnKkV/qPZl3RND9PnSqel68iH0a8xsaDlcBAE5evr2M3dFJm1Z78
         Fy4hDD46iH6lLJN6AGUi/Am8MKCUXt71PNZNmKgzFqVBDu3alxcOB90UB5mip7BRFpKE
         rCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796304; x=1707401104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/n/G7y1xsFEdDjXEUwUFzAE/EZFxG1nYhtSYneXxk4=;
        b=gh0PwxIOyLT3gQeWR3hujBM+co+3XzCxXUbF2xYDeoKAMHuex3mj65BWm0cm9UBX4Z
         7ur0lM2cGDTl38/41JJzDVyHOtAv2hCTKOu54CzTW90m90a0/nhhZ4kLyoyXz5VPPR0D
         zmy/G1Vdnok1YVEWuyaZWx7JICw9r2OUEZ1AuN/Oqe4NtmeCXKS1ROb+JMDKbRh2PwfB
         1SbTEo3Dj8MvcxNoIivu/5214DIS/32SfE9i7RSCREnRpZePhHZ5H5UVIPJDtHZim+K8
         /7cgqxPik40o6OEIgdC89MxVuMmeLf6o7qy6Yad5N/nuStGmdj1A+nu9c+4GZC5qDoBD
         2uDA==
X-Gm-Message-State: AOJu0YxLR4YuJ1ZwPC67vwG0Hy5bAB6/iHE7Sn/zpSDTr/yDqOwkzSCA
	gS56Xe16XXCy4A1HQ/TrHVif1oVUWFrYRwBTTOCwYqLimMTXvMor
X-Google-Smtp-Source: AGHT+IHYNFWalKfTf5szVjprOobJA9ePlGwlDSQKiI3RYDX51/H+K1FrLeUMSS+koI/5TievCiSTzA==
X-Received: by 2002:adf:fe12:0:b0:337:b6f7:e7ea with SMTP id n18-20020adffe12000000b00337b6f7e7eamr3615866wrr.66.1706796304407;
        Thu, 01 Feb 2024 06:05:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVptKwX+H7vJ98HXgd7uIUir0ZVDzaRJPs5pd7hqg0+UWEFVto4EtP9eTEV7AhfBbm07z4rwlW3nnx853w+yvC/7Lm5A57KzRxjGich5hVYn6HoXvG1ox+SUoB4Fq5qpZqZRTzyI8hEm/aobmb/xWgAnY3+MJT7THa9ycmfWSTWHb/TRs6fQnUWeCTNsw2KJW3SMt5ltbpIaevgXRVcxoyHlV2mivhw
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d54d2000000b0033b14e447d1sm1697345wrv.1.2024.02.01.06.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:05:04 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Thu, 01 Feb 2024 16:05:01 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH v2 0/4] Staging: rtl8723bs: checkpatch fixes for rtw_mlme.c
Date: Thu,  1 Feb 2024 16:04:55 +0200
Message-Id: <20240201140459.438479-1-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix series for rtw_mlme.c

---
Changes in v2:
 - Remove dead code
 - Fix comment in _rtw_join_timeout_handler()

Meir Elisha (4):
  Staging: rtl8723bs: Remove unnecessary braces
  Staging: rtl8723bs: Remove extra spaces
  Staging: rtl8723bs: Fix block comments warning
  Staging: rtl8723bs: fix else after break warning

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 227 ++++++++--------------
 1 file changed, 81 insertions(+), 146 deletions(-)

-- 
2.34.1

