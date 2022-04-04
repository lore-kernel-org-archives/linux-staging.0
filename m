Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99BE2900
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a6so7289986ejk.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MrgMLReyj9DEtjJrW6Fmcw5+9Z047O6Pl7Cse8bO7II=;
        b=oj+4MUjPCglwkn2+ftlkh1nxFR3M6fQV8y+6gZWVeQDtMldx0xHujOc0OLXqBMGHGi
         DqFcePhJnD+O/LFjRUtsPXxqvjrsAlFrTA/yE/HPcDXkPsjoAf470RRz/aDcQN9Orzzl
         cIrZxPU1TDkt9kUVzabsZFQHrcXDKdvnVZXd0U0A/a4mxFfpoYh5hfUoUqiWL2Axrgvp
         XzlXRruC62m3AYYL3Mzl0hRoM4qr22X1h4YD6+gzEkXzmBuyKWGC4tpyaBthSbNHGJPi
         vp6YY2bMs1wE2b8E8X1FIJetlBfYgRv39VX4bG1oQ/M8HJGGx6bOdIdkB637oq1o626q
         /uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MrgMLReyj9DEtjJrW6Fmcw5+9Z047O6Pl7Cse8bO7II=;
        b=tmnZADRrbGZX38Otv7Z6kH+TWzDz3ydL37I6n8TfQtJ25C6naHiJkaJYDhxhRDTSK3
         PT9hZ3k3kzLHzB1Wbeq8BAQ6f94BRYDhFgSm/G02mCs8C8oR8krwU6WxCYI4Tj9AyUOX
         P/ZFTxBwBBrYFTEfLF64cYLm4xq3vRy5BQy1CF9ULLOQx/Z6jsAZ/W5KkqXWD6bHfbm/
         LSqEDqjLY+5Kyu2Xqp9185j2jXtdyyUKhGbadXSC3ihHFHH/nJV2rn7XIQXm+MoJ7lVO
         nYCZzAopyVmZ9yuYkFJvA5LBrJCVVQnmi4rlCdvUQ0CG2oEbczCGGPOCSIfhBv2fy56A
         RT8A==
X-Gm-Message-State: AOAM533lSgSNHTiJF1yA6HsoX9ssRe0UfBY5yG+kKCczMoYvaRCsBULp
	KKsbkubjcWg7Nh+9KpuPV2s=
X-Google-Smtp-Source: ABdhPJxb9Lsvb7g5s2goW3nmb1HVqira1y4gyyfKEOObm8coZrEzPqM6DBtofIUuu9Wzgc1pQfs2pQ==
X-Received: by 2002:a17:907:8a0c:b0:6df:8b04:1a65 with SMTP id sc12-20020a1709078a0c00b006df8b041a65mr9559967ejc.331.1649060510235;
        Mon, 04 Apr 2022 01:21:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: ps_flag is never set
Date: Mon,  4 Apr 2022 10:21:42 +0200
Message-Id: <20220404082142.4639-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404082142.4639-1-straube.linux@gmail.com>
References: <20220404082142.4639-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field ps_flag in struct pwrctrl_priv is never set. It stays at its
default value 0. Remove it and remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 162792988910..1d7dba853c40 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -70,8 +70,6 @@ struct pwrctrl_priv {
 	struct timer_list pwr_state_check_timer;
 	int		pwr_state_check_interval;
 
-	int		ps_flag;
-
 	enum rt_rf_power_state	rf_pwrstate;/* cur power state */
 	enum rt_rf_power_state	change_rfpwrstate;
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 5a9374957e3a..390d1cc0ecb0 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -625,12 +625,6 @@ int _netdev_open(struct net_device *pnetdev)
 {
 	uint status;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
-	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
-
-	if (pwrctrlpriv->ps_flag) {
-		padapter->net_closed = false;
-		goto netdev_open_normal_process;
-	}
 
 	if (!padapter->bup) {
 		padapter->bDriverStopped = false;
@@ -674,7 +668,6 @@ int _netdev_open(struct net_device *pnetdev)
 
 	netdev_br_init(pnetdev);
 
-netdev_open_normal_process:
 	return 0;
 
 netdev_open_error:
-- 
2.35.1

