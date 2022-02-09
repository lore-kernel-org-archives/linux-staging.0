Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94D2C80
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id r64-20020a17090a43c600b001b8854e682eso2785917pjg.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WbFobfSnE8stzLHhA9k0e0i8hXDiaZu/9/LOjHIwu8E=;
        b=fr4o/+4nviTwLuTChms4MwaGDGiGvK8YOtpl59fKdESATh4gQPPxSzKNUMBZsbvzLQ
         SGcDeoxiZnPvyVkvWy15du/nWpBzJrgJrz+3Rqho40ox6BqeZNnwW8HNEy8v/4QUFOWc
         yh+TmDXO/g8X9QRS9PLTzOgtECiX2Juzee6lna8nmJcP/lMl5bq1RK7Lb97pdEt6wOgO
         Cnd/2yMb6xoa6OP+2aHnrszeIvarrVaha0YIqdP/6BKkm97bFRYI+r+CYexp7Hw+ifmP
         O/gsOUN+Q27/58pvhfferc5oQHdBEJ2Qhteg+RNHabw/LPvJwcxVx08kyVeh+jL5CLEA
         ydGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbFobfSnE8stzLHhA9k0e0i8hXDiaZu/9/LOjHIwu8E=;
        b=rK9VS3PQMJ8WToWnQ+33hGk2Jovh24vpeucz8j6V35uyeSO8Rk3bBOcfddRMd2d6oN
         KEuRoemL+I3OG61ug2p+0L2H9inwHB6cvkztjYZYRQy7co8eFQNkzBVXH94EPgnIzvJI
         kaBk6SnQoHO+HDdz6p5j48sEtRPySVClRD+WM1a4RFJFfzK8Gt9ux8uxGpfJPekhPP2B
         vaCUA2IecoUTcD6o8qLxJs5aFV7PQkOrA4gy+/ApuBJdDa382Ugc/eT1KW0sPVhorcDN
         fDpRc09r5/fRw0F7Ty7eAteidgu1zrF0E+Z5pgoJiJTepa2z49iU/XPUCZ0MHvmfaSCf
         o9ag==
X-Gm-Message-State: AOAM531+h9rQrLzuRQNYhnJpMDROgNYM7w9KbGme7tikYjaY6BLQUPhM
	Zu+AngLkUlPVrDpnLo1rVi8=
X-Google-Smtp-Source: ABdhPJw+2ICMdS/UQR23E9I17lWoNWNMAeZkc3zCcftGaezZs2KNw0AF1PagI372poK1Mv6ZYwqSdw==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id kb8mr3451562pjb.228.1644424674327;
        Wed, 09 Feb 2022 08:37:54 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:53 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 8/9] staging: r8188eu: remove unused argument in chk_ap_is_alive
Date: Wed,  9 Feb 2022 22:06:06 +0530
Message-Id: <17af206986d64f34e85acdf67b138edb4ccc0312.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function argument padapter is not used in chk_ap_is_alive.
Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 27bfb43f306e..ceca6751cdee 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7157,7 +7157,7 @@ static void _linked_rx_signal_strength_display(struct adapter *padapter)
 		   "UndecoratedSmoothedPWDB:%d\n", UndecoratedSmoothedPWDB);
 }
 
-static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
+static u8 chk_ap_is_alive(struct sta_info *psta)
 {
 	u8 ret = false;
 
@@ -7221,7 +7221,7 @@ void linked_status_chk(struct adapter *padapter)
 			bool is_p2p_enable = false;
 			is_p2p_enable = !rtw_p2p_chk_state(&padapter->wdinfo, P2P_STATE_NONE);
 
-			if (!chk_ap_is_alive(padapter, psta))
+			if (!chk_ap_is_alive(psta))
 				rx_chk = _FAIL;
 
 			if (pxmitpriv->last_tx_pkts == pxmitpriv->tx_pkts)
-- 
2.34.1

