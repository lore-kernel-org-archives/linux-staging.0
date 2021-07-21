Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549872
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:33 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hd33so3272707ejc.9
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UCrbf7xZnamg8tDtV6cJsh0yMaGNZ9OI8Hc1T5lyPlo=;
        b=N8vYX2V+Jsz0GNXOg+HfwhTVeAGKy3Ay5RmkgDTtWuWg4BhvuYAiRooEQzs/b+g9H/
         T5y4NxtAqeBgS4EfuXq+tM4C4IvYWyI2Ffa8XP1dIND0qz10Ug732cHmOxNXv7g5x5HD
         90rEayRSG8Hr/Tr+KPzKG0UZ3WEjh9TsWzfH5fapBVV7tEjTCmgrG6vU5WeZY3FIk2mb
         29cZWc3g+aa1zY9rI9vL6hLmN2SD1+83MzeU+C7hbz4C39mOMHb4SF+Y67zJNEqw0xww
         /NDF+dZ3ZyZWaXADTDQbwDBcRezahkS5qlWQm+t9oLC9npGP+KFyRQGLpIFFB1GI/Cm6
         pJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCrbf7xZnamg8tDtV6cJsh0yMaGNZ9OI8Hc1T5lyPlo=;
        b=EXOPhnLKwlkIDGfQkkJlbrixWIQC4ZlYPZDp4pyy7fLdZKA9LMil2sZAFCq2/SCCYN
         BZ4g4jFjrYimF3nR6NTxqU98QfOGLun8EwlB0ceYKCoQWZtvqG0RSQogCzqM5ViXobWd
         NdNSjEYu2UQW8ln3pHZTk9wvHVfmw1a+5QLYrYJiNgUZXStn0WG3ncliaWwBUBFEjTHU
         GpzVAuj0e7eOg0RCSa4+ZGgY/TfrgQjz1D+XW73lNrhu+HxJZCu47HMDrVrt+Py0WTog
         SwrCA3hPT8nQySlop4b+rCNseVoTYXBRZjQtH1rhm2Lqv6xIlBQfX8pyhq5ULK2TjgUR
         li/w==
X-Gm-Message-State: AOAM5325IKGPY3NUfv1O5KfP7UxuTgLjyAeBmqITTbdqUUv7e3GY9OV/
	0fc3ZlcqrorQSi5KIsBK29Q=
X-Google-Smtp-Source: ABdhPJxebeem8ApwO59CwG+Dj99aoP1jcf3dj/+dncFVYQKaWtAJNREfCh+di3okkaRc0y1NVYBI3Q==
X-Received: by 2002:a17:906:63ca:: with SMTP id u10mr28403724ejk.411.1626874651483;
        Wed, 21 Jul 2021 06:37:31 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id ov38sm8342356ejb.105.2021.07.21.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:31 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] staging: rtl8723bs: add spaces around operator
Date: Wed, 21 Jul 2021 15:37:11 +0200
Message-Id: <e9f65e7600a3c935ef9c310e782790e04cc1f17f.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit hook checkpatch warning:

CHECK: spaces preferred around that '+' (ctx:VxV)
29: FILE: drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:2238:
+			hal_get_chnl_group_8723b(ch+1, &group);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a680fc1d4bea..d9a2d3e6a56f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2235,7 +2235,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 		for (ch = 0 ; ch < CHANNEL_MAX_NUMBER; ch++) {
 			u8 group = 0;
 
-			hal_get_chnl_group_8723b(ch+1, &group);
+			hal_get_chnl_group_8723b(ch + 1, &group);
 
 			if (ch == 14-1) {
 				pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][5];
-- 
2.20.1

