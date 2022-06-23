Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049C43C5
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 02:24:51 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a15so10551649pfv.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 19:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GIwgs9N4bBMvvxMqYn9jQ+VVwblxOxFZPXSHiSI6CI=;
        b=MrZn3gi15FHEA6GZRBRyFhCCS1LMfftSQH3a5Kpg6bl+kdanOHSIuZtt6bnugAkAKP
         zroGFotkiIuLlOGzWQeRMphIb6PikUx7DnBNTvb1KeSjwvvsYjkf7Lnj0oUAj1njujQO
         c3P65LP7W0Jbp9Y47ZeRNulmKxbloSDFYwUEcRhSwAufrzqMsFZldcBtUF5ZE1jorNNA
         K4W9qdCwm5zDEZbFGcS4FJci1zJJybcN3dKFNigKIBc/O0oVNAVops3t95pETGMtwaef
         CxvR3UGTsFSunHFZF3cNGjLscxNaW+xVUnXhqCDmVHw00AugJpT7qDH8OUCXg6xYbpFU
         NxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GIwgs9N4bBMvvxMqYn9jQ+VVwblxOxFZPXSHiSI6CI=;
        b=XdJzDx2+v4xecTtm3jsyz6rBMgQaAYf+xt+hvfxOOSXEQJ8UEnyfDsS7PcJbwaseiY
         f38TJjMQwlObDKkYTLpC2mMKU7L3wJmmdRi8FQ8SujGwTUFQ9vMcaQQTJWNa01CG/UsO
         SCq/UIcSU7TRQFipnVp5Z961JeqJWGLr0UPrEiqJGfcZhcnpC/0OR2e4TBld+hNN9QDc
         Fc71XWDrS2DRvIToNQIR9VthW5dOYT5EJiberSHL5vCnH3H1o1jlEAvAdQncNWYyEDKr
         fhyzJaqaRWnTeR8UXFE3sDUN94hiULnT3m2FVJ6IrWWV9HlB0an2usC+3B4wnTVkNGA+
         Zfiw==
X-Gm-Message-State: AJIora+LkR/7UrkPzjfwfYlKfcylpp6IJP6SvIag/wUUbEvV/MSkRkGe
	PdC6BbS599fjM52enzOdZMM=
X-Google-Smtp-Source: AGRyM1vb7Dl3ZFY5YBzJtriFxbVesli6ucO0W07ahpux11iJqX54+BagZDriirQpsbfLx3OCcxIGog==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id k16-20020a056a00169000b00517cc9e3e2dmr38699096pfc.0.1655951090760;
        Wed, 22 Jun 2022 19:24:50 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0015e8d4eb273sm4252922pll.189.2022.06.22.19.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 19:24:50 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH] staging: r8188eu: Make rtw_signal_stat_timer_hdl a static function
Date: Wed, 22 Jun 2022 19:24:25 -0700
Message-Id: <20220623022425.395000-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make rtw_signal_stat_timer_hdl a static function instead of a global
function.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index cc91638a085d..599d3e55be76 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -24,7 +24,7 @@ static u8 rtw_rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
 
-void rtw_signal_stat_timer_hdl(struct timer_list *t);
+static void rtw_signal_stat_timer_hdl(struct timer_list *t);
 
 void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 {
-- 
2.36.1

