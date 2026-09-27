Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB16846A
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790471862; cv=none; b=hcoM3RZ0qKOsmNEeZr6O02DZ9FDy+0XUFeNCMFQ4rJdxBNOoSGiIlUXtVRT6ER5oWE9KN0Yl1WuM32ob5Czz7dlzTt5wQtNE8Z3qZGhPuzOyPcjuRCKSsT2l4/zqX4HvW7v1bvzxgibvU4RhlsTJj0AFwBJB1qbNzjWJf4+Y3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790471862; c=relaxed/simple;
	bh=ePnRvq3UMM+sa2D8dc9jnBVFW8hpD++8XhlbdDDl/iI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RcJxqJ9XVvY60XcxJqOYsqj/I2Z1h1Lcekv6yC5uKCLek0b2iT9fIRMjzqHEPuXXWIZC0lvOV7HUA/7O9bK6eEPRywkAOpfyX+IMrl+bJqmox5CH949hYuhJPIaIgUg/XFV1XKNQEAE3jKMYRqLrWKgeOaXk7BBKWmt1PIlbI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPcDc2ej; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPcDc2ej"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso510073241.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 18:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790471860; x=1791076660; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AZj1MR82XkpbobvFczq8ok2+SpPrjJF23vq7+BjVWUU=;
        b=KPcDc2ejVLoP8mXTTCRH5p9NupoEzbaHDl3RwJnIowN9c8JStcg+wxMvDfCPttoxh9
         b3Gb7S0GveQiP6gwuvHiFVkDpBatp34SCZx66ilatw5+l7t0lhuE/+ddl/x9/Ita4WXn
         Fi37EIOtm2buMvoPSt9fSWgXs2+fGql3U+I774K7BYwoTlt4za+2y5K3vsvm1vam+yO9
         CdUBUHMB1GXRTmilhZLh5Hs9eA3Cffs88/PwTclVAsxJy/nYhB5FZKTrRwlKJe3AtV4M
         6j6SBrlSiXWZ2I3hP713Zz93WT9tGz3ZpsOQqz6v/BFBIx5eGrf5UhzJ9gcLKaG/ZSDU
         Fepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790471860; x=1791076660;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AZj1MR82XkpbobvFczq8ok2+SpPrjJF23vq7+BjVWUU=;
        b=LZGPVLPDBTFXwVNYyjkBBtoLqLyC/BpNIk+pFLKG0RoM4ldhsSA4oaBc1P6sWqLXqL
         tGDt36Tl8rOUiAC9Jizq91gFHfHw7FyysAwsRnDph9LFmuWzb0m6eQpuUkn4W9nLg3B2
         Av68LQNJCx5sDqumQ+csCECAlfVA5lv6REaNlR382H1Sud4isBv4Y0kAdeCyucIMz51D
         CUEGH+srokB7/q2EGz08xhpdWzVpbbHNcxWzjGaw0Qa6vFhOD9LRF+Hg6KmpazRnFO36
         8y8tKsWP45koik4zV6qiwi7z5k7OuOqdYSUInw4zlKsuEjQLcB3zibpzhIeieCL2hBB0
         8gBA==
X-Gm-Message-State: AFq9FYJyP3FYJIhvjgjqBafC1Zf7FxqI8laWnLhrGiSUfiirVKu0zPyf
	JCYerrWckkwVoBlIw9K/vUhWNd77mid7HIgfxhfKCYd6Gz2lTToXEHyk
X-Gm-Gg: AYBFou1NA3dTQlfbp6KuIdOCXfH9p5Bra8WK5AawwML3nGKHRvXquP96ux2kVoZ/8u9
	2WicI8LWl8ROYXRIeqx0gh6eOLk4q39MYLOno+w2hBeOMaXr7lwJVH8SlZeeVoRk8zW7fnAuG1k
	muEY7hgD89yEPXLn+8Jimx3ZtRhY+yXKHkWnIdtgGW3DaUu2O0Dos72YDA4B5dZXMZD7xrpp8s9
	uqSISAwbCUBLp69m/TseuNprHdKTBpomp4xYDVo7Wn6v3U2FhCCRSr+oUSL+e+tMzRI1tQVN+Ka
	Ftrd+6y+WTlIuOm8+aPm2FL/JFKrLilBndaQWfsgGH4NFm4nI6AMIxzdPjC9c3QyFt2yJ3Chhal
	HckBdRhGhsbP7w4mPyDpB6SfNjrgwUZrASx0zSYwsmGg1VEtybb6piCqKuIo7RqlI++TGSYKjP2
	w8NwucvXGZuQN+GM/BVZmygqBXLejmgVjvR69nhO8kf0tpkdKqvR1yeo+v
X-Received: by 2002:a05:6102:4429:b0:7a2:2a4c:606a with SMTP id ada2fe7eead31-7b1c5536ae3mr1905560137.15.1790471859988;
        Sat, 26 Sep 2026 18:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:78b3:5cda::1002])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b1d413asm820433241.10.2026.09.26.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 18:17:38 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Date: Sat, 26 Sep 2026 22:12:23 -0300
Message-Id: <20260926-rtl8723bs-tx-pwr-limit-v1-0-989dcbc113fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdtuGoC/x3MTQqEMAxA4atI1gbaCKPxKuLCOlED/pGWGUG8+
 5RZfov3bohiKhHa4gaTj0Y99gxfFjAuwz4L6jsbyNHLMRFaWpuaqhAxXXh+DVfdNCEPnkPgiZ0
 XyPFpMun1H3f98/wA7wwFz2gAAAA=
X-Change-ID: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790471854; l=1530;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=ePnRvq3UMM+sa2D8dc9jnBVFW8hpD++8XhlbdDDl/iI=;
 b=Jks1UthAo6nYxCSO90vZ/xP1AGslNfQhYyvU2ijEGDp9kIDJXEydZf3QI+/KSukdZMwZ/gIce
 AAWx3Jo0pGjD+A+My/G0eWKFkYr7vZ4//EOTxclpNQlmUcFOlALKXqf
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function PHY_ConvertTxPowerLimitToPowerIndex() has several style
problems, such as mixed-case names, deeply nested code, and redundant
bounds checking.

Patches 1 and 2 rename mixed-case names that are on the same scope as
this function, struct fields such as TxPwrLimit_2_4G were left as is.
Patch 3 removes redundant parts of the code, and patch 4 solves the
nesting issue by extracting the inner loop into an auxiliary function
like it is done in rtw_phy_tx_power_limit_config(), at
drivers/net/wireless/realtek/rtw88/phy.c

Checkpatch issues a few warnings and checks for deep nesting and long
lines, but these are solved by the last patch.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Leonardo Martins Martins (4):
      staging: rtl8723bs: rename PHY_ConvertTxPowerLimitToPowerIndex()
      staging: rtl8723bs: rename local vars in phy_tx_power_limit_to_index()
      staging: rtl8723bs: access TxPowerByRateBase2_4G directly
      staging: rtl8723bs: extract inner loop in phy_tx_power_limit_to_index()

 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 88 ++++++++--------------
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |  2 +-
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  5 +-
 3 files changed, 32 insertions(+), 63 deletions(-)
---
base-commit: 8444548bd905f22093729065408284a6b46f7eee
change-id: 20260922-rtl8723bs-tx-pwr-limit-9a19bb9f901e

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

