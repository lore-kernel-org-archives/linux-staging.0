Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE42A70
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:21:08 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id sd23so4382795ejb.12
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u3axE6AJxT3yRAZr7qJdeIcOX6qBh+IEsk+878q7teU=;
        b=tPJhLJE/GS3CSfw9zeYQOAdEh2Bua1XB7hmiTU9oLEsHl5o1t6igaX23XQNYv2Viky
         00DTp6grzNQzp/7p6dMIZh3Enmy2cuQCqdKQNfxV4OAuMQfZFBA2J1nAZyGm8MX55Zqg
         VlygX+wjnBHJEn5MfxT3AMYEKfBCkpxe3GYhYG0yuvnQqOGtfglA2h1uQVJThvkkEzDS
         hCQQ/3AnuambV65HPtZpL/DuAXTcOfros+r8PWW+SLUGEpnlTlxhwtPFGR7sTmE6iWDn
         Tt3RzhL1BzLkXmXqCk7TSwRHILpRYqNA3jQjKLQRrrVil+PAcJOsbj6wNRrS/BCt602C
         tP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u3axE6AJxT3yRAZr7qJdeIcOX6qBh+IEsk+878q7teU=;
        b=G9EIKGgtHtO5MIBD+wicBBqUNqV8VbK5RlOvHpu6zdVXJO8z1R+jIlNs16ZruThFMN
         i2zAe9fQIcUFxDqTbwm3O89MuEM760yW4VH/m5fDp8U766j9ejHgKY8T7q1ENVLH7gTN
         TAKXKficCJw+ZaSRWVpSPvP04ndF2PIpggj6LsRkhTNCFqqhtF5RnIlkA8B5t4dk20xF
         dR9EIfH2LSEtCdoNq7uQjy8R6FjsPDCXdVSp088tLDHwCTQPEj7N5q5LciEWoLX9yUuc
         clnJhE4NeUkUK0AjLbH05C9lOglBsOYpzccW91Tlok2ntW0+VKu4/KJQbtQ2PFym5nXP
         6NGw==
X-Gm-Message-State: AOAM533yZYtWEIXJ0ytOmHS4A3tVZCpT9D3DWaVrJ8H6ICjPBZ/OgbV0
	quMy/uZBJ3Dt1IM1P6FEd5kYX94WBuyRAA==
X-Google-Smtp-Source: ABdhPJySQ0axZVKA8urHBmig6TdgQJzTL/1r69S51bft5v0kiuuCwToSQ1ditfaCxPEELHZz8r109w==
X-Received: by 2002:a17:906:3c1b:: with SMTP id h27mr5592595ejg.182.1618064467371;
        Sat, 10 Apr 2021 07:21:07 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id gt37sm2688713ejc.12.2021.04.10.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:21:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/25] staging: rtl8723bs: split long line
Date: Sat, 10 Apr 2021 16:20:30 +0200
Message-Id: <28c078c685059c9b883b563f2c08cfb1d49cb82c.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

WARNING: line length of 103 exceeds 100 columns
168: FILE: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:1086:
+			if (efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest) == false)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 00115a0c70be..54cb1ab8d4cf 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1083,7 +1083,8 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 #if 1
 
 		while (AVAILABLE_EFUSE_ADDR(efuse_addr)) {
-			if (efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest) == false)
+			if (efuse_OneByteRead(padapter, efuse_addr,
+					      &efuse_data, bPseudoTest) == false)
 				/* bank = EFUSE_MAX_BANK; */
 				break;
 
-- 
2.20.1

