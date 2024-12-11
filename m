Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1C1C3F27
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960097; cv=none; b=a4hMKAHxjiDW2cnN5bj9wdw1muruw3yHQ123grYdfKKjYzForBvDtZQs+FzD9uwi96s/yrX+dVwfC7S6UPN41f6CziPPlSuwmqhx902Am1QQPcqwcetz6NagY7C3NMGREkS1KurYRb1fF7gTrk+O4SghZxUTgT6e9BywkxFt/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960097; c=relaxed/simple;
	bh=eMLic35cf/eX08d8I2ED//w1v1wA9RtWBLf//qQKFBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFctX2ttAXwjHHS00+G/drTPrcjQP9HOP+dnF+QQ0xU6WF3EItTLpiiRbSwYc+OpvqCz6fQ85cDX+eaAtvIn0bD67OBeu1wqznNkckNJB6PtlIsu8MwcXmMx7Ym8eDfWO8kpdD98DxvbYJjOsC+RjWxrqK3/rqxoJC+enz1zhws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAsoUXVu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAsoUXVu"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so48956a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 15:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733960095; x=1734564895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Tinz4BBwqpe3R6VLjSQyHb2GEpopW54u5t8XOl8EY=;
        b=HAsoUXVu4kEH2ZSK7YZq/mIuhIhhmPilVei1FkT12es8ZS5qrW5oISf8+1mBmmQY1c
         lrhq8iuykrQKUBjtR6bnck+5zZptbMhzbVaVW78igG9uvmXH/vBKajse7DpGzI81la3p
         YgYKnCHcFHxynsAX8Ozo0YRY8Kf61C1biD38PE6WEBGUBm7sf1Hlde29RGts8lGFrWQE
         b6J0OKA2QW5J6SkibouYgF8fLCBlARBC42Ud6qbkqlDLPAKwLMXE44q8i21sg0JFUWgv
         8PwwIST1+Hj41e3vP4WhZ66/29o3Npv4T9xnObx4EXwbqOMKbQB2ehKh2YkFyuFNp2HV
         16ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960095; x=1734564895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1Tinz4BBwqpe3R6VLjSQyHb2GEpopW54u5t8XOl8EY=;
        b=BmS3/czNh/7O/8kWkh6woHk7E3m9Uj/HvMtTOYRz8UIr9t4BTgVAXbUAxNpZdsOTZH
         cqGzQ1Ej0wLOhK0p1LZtU8Cs/0n3NNlcvYwYrminZJYw2IBfUy5lTG1tcsArOGPjaNVh
         YkovO8sG35+15VPzcZSHWAH/Dq/RNdg4I7d7D8M8Vg23wur8EPI6B0Xcxy2EAZJ7DSpm
         KvGHMFav1kOf9bgS7w/vrFy6ycTMEwTX8oBCSu7r0OAG84w2wLRdxvfpDbL9/wT80FzB
         M2yja7e9USuijSCDkt97AGtkycwG9IO11m47ELbVHqevs8hrQAg9IZiYi9H/IRZw9Gvg
         glJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwHiulJpa4Xv19TpCNfs1Tv3MwtlfxEObu30dobz4I4le+Ks0jJ5ZWNiHTYzGSWS+2m749F2G0LYd0+4cx@lists.linux.dev
X-Gm-Message-State: AOJu0YzqyHWQ03ujJsMtFN+vyMk5bRBiy811UjIyx+kEuAj/nk+D6kxa
	JjgXGWisjti6WiGD2Ne2CgCdj73ZD3ypNB+E4QPBQ7lnY0wtBYY6
X-Gm-Gg: ASbGncvEqJkFQI7gGK5LRP0g9fYzksVCfjfIWT2cMEzPPZXBAVOUD7tzM9mp648x2rw
	hkOR1GoH6kpihZW13LnoBBo+g4yeFKLm2XvMiU8XvPJkVBb62OL3ekRtfqRmr9Bska0Rf1iHy1F
	l8UrAldaaav51RO+WZ367PJ2A7UMc8kTPgRHADeEzaehbuQwZ0T422KiFjl9h77kQjJ6KUIJ7UX
	zlv8cdata3nyiyW/b4KSG+YVH8E+QnwUMYGYnysB+WVS1fh9RS3fvM6wa84cenX0ahA5qeQUV7G
	p7Er
X-Google-Smtp-Source: AGHT+IG+WQ9mstysIjwHMPfhE+Ar1lGJ9FUQmUcjyUC8/XNA91MVn14I6WJqJR/yBHRF9KjOcRXhVw==
X-Received: by 2002:a17:90b:3812:b0:2ee:bbe0:98cd with SMTP id 98e67ed59e1d1-2f127f55039mr7960606a91.7.1733960094982;
        Wed, 11 Dec 2024 15:34:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef8a933fdbsm9229485a91.41.2024.12.11.15.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:34:54 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] staging: rtl8723bs: remove code depending on cflag
Date: Wed, 11 Dec 2024 20:26:38 -0300
Message-ID: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The proposal is to remove the code isolated with DBG_RX_SIGNAL_DISPLAY_RAW_DATA and
all the related code since it was not compiling and there is no information about it's usage.

v5 is just joining 2th and 3th patches from v4.
Tks again and regards.
---
Changelog
v4: https://lore.kernel.org/linux-staging/20241210210741.17101-1-rodrigo.gobbi.7@gmail.com/
v3: https://lore.kernel.org/linux-staging/20241206230110.11893-1-rodrigo.gobbi.7@gmail.com/
v2: https://lore.kernel.org/lkml/20241125225308.8702-1-rodrigo.gobbi.7@gmail.com/t/#mf22f30a9c689bd793988d7e7a58c0b119206116c
v1: https://lore.kernel.org/linux-staging/2024112500-authentic-primarily-b5da@gregkh/T/#mea4fba3775a1015f345dfe322854c55db0cddf43
---
Rodrigo Gobbi (2):
  staging: rtl8723bs: delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef code
  staging: rtl8723bs: delete HAL_DEF_DBG_RX_INFO_DUMP enum and caller

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  1 -
 drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------------
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 18 ------
 6 files changed, 84 deletions(-)

-- 
2.47.0

