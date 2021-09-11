Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF023FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 23:18:57 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g16so8403086wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 16:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gobYDgJ5gtvy9NhVq54xUT6ydjiqWzLgDvmpT5ugARU=;
        b=i33G7BcllSTev6kLlnGGtljMuU6DdrQHwDIARW+sekmAI89dE8OtHx0uJdaL6rEO0j
         y1JLQMZKvjNMk1lu/dlmx1h8pDRGacYEQXuCiE+AXY1EUnsleUKGb9uTQNoOfnbIhFyD
         LO/gnvJI/teS3KyKqzMlH0kOH1+ZIxZKN3ePiPIGgjm0tXrOk2Yra2001qLWB9G8h0tK
         TGU8SkLZYrWx7ahv5R0rx2H826qpHW9WCT4CH1kMUlBDJQqlsEuKzkXv1YOoW287ZnWt
         u85bTR2xHEs5TWYjjdQ/5Tp5hgo/GT7jydtS56wB+8v9jQgBDKK7rkYFkzZxsMRpWQN9
         HYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gobYDgJ5gtvy9NhVq54xUT6ydjiqWzLgDvmpT5ugARU=;
        b=2+RhmRgMufv5sIN08YhZ9Eth81Xkj0AZfh+vpnJgeES4olZ39gDwLz1c96uaQ7Rswr
         5TRORzD4wsePEhtElBKKPymJl49ZHt7Okol6K4x4mJAYIPHwL6BExDjYRZOICqd3E3Dv
         ViSRgMn55Rs0b5+gfzRDn+V0GQUEzUPiP90yxhwgWR9x2f/Brhapcm9Knf0J5iYGuCd3
         HwX4CSgzeoKnfFeC/hwXCfnTL0xkPosVdrKk21l/hgi0wT013oDgiLudqGKWV3pj4Hmj
         esP0LIcRTFMp9YyYpk64ZvJAGyjfNI0Xal9pfjEJHqyayyAgqcxCsicRROlmJM+1lyYs
         0k9g==
X-Gm-Message-State: AOAM5327yRAxUMMltjFkqbOLYMQWvCFFzFJh1TTvmrVNLgIAJo5iG9oX
	NS88y1OhwgcBz09kJ2Fstvc=
X-Google-Smtp-Source: ABdhPJwhfjgSMEGU+ilWQw4IlJtDT66qcmWiuFtwKzNnreFEa8KHU1cU4FTGN6uednaZt72on3UFYg==
X-Received: by 2002:adf:f208:: with SMTP id p8mr4828820wro.379.1631402335475;
        Sat, 11 Sep 2021 16:18:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id j17sm2852762wrh.67.2021.09.11.16.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 16:18:54 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove header file HalHWImg8188E_FW.h
Date: Sun, 12 Sep 2021 01:18:44 +0200
Message-Id: <20210911231844.16268-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file HalHWImg8188E_FW.h is not used in the driver.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/HalHWImg8188E_FW.h   | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/HalHWImg8188E_FW.h

diff --git a/drivers/staging/r8188eu/include/HalHWImg8188E_FW.h b/drivers/staging/r8188eu/include/HalHWImg8188E_FW.h
deleted file mode 100644
index 5ddcd283097b..000000000000
--- a/drivers/staging/r8188eu/include/HalHWImg8188E_FW.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __INC_FW_8188E_HW_IMG_H
-#define __INC_FW_8188E_HW_IMG_H
-
-/******************************************************************************
-*                           FW_AP.TXT
-******************************************************************************/
-/******************************************************************************
-*                           FW_WoWLAN.TXT
-******************************************************************************/
-#define ArrayLength_8188E_FW_WoWLAN 15764
-extern const u8 Array_8188E_FW_WoWLAN[ArrayLength_8188E_FW_WoWLAN];
-
-#endif
-- 
2.33.0

