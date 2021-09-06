Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B353FCC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:07 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id t19so15069123ejr.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZ+jGlU52R+dGiD1XqdEMOHCz9GkCMtVwRo9Px3Ek0c=;
        b=Wtaj04NE/9p79YdiOTnbgbnSPryE3RcTaEy4bBb7/CqPET3ijXCvy1qGItaGdxYgmJ
         1lxnktaVel4LY/yfXXOO3ECEMtO3jb0SqdJu8hkA6iTKq183b+N1ZpBnkkhXF/8cX+FO
         MZpntaKskB/yglGiJW+nAyiXdSnnj03lsM8X4YgkiftxATQycoO2Sa6UoPNRAEJgehF0
         DHx6E1LeVXiUzZPkQ/QWS91fcICny3Fn1DfF4YF4EeNH69/nmRK8BS4YrT3KbV5SEY7p
         n2r4Uxc+IiRREt1DVjEwLxt3zqjC3yffzRWLLchxuqAdjdtMJh3Fih5u4twS0Nz46m5P
         uMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZ+jGlU52R+dGiD1XqdEMOHCz9GkCMtVwRo9Px3Ek0c=;
        b=c+sQJumHuRm1ur2OhslV8fg8u4H8f4zl6Id0ARk6ujilCP4Bu67/P2arl1qJqzk8ip
         11/F8GiL6J6MuhHfsKm/axnVgkJjaQyH/goXddB3gmkYhSTuDuCjAzOSxSwZ9J/C10fX
         F1leD2EA5KbvVrhXpFwBVhSXqS9XAXhmykD+W9Ftx0gkhmBY0ZMVHHynfblgQaLq26LT
         b4E48pVvxvoHuNU5cTQSIMrFFX6Mm6xbQJwE4YG4cDpWGtrRqgI3GnzGDVzmC9jbfzS9
         V8CgBMExvPKGGIlC9m57yXs0S0Tv6+nKFh/thUn2RK7FYn4Bb1xIDQRk5+RD200j29NW
         thjg==
X-Gm-Message-State: AOAM530zBZD+cM2OhqiDoremIEcS3pwZwDLUVYynCqzYN7IlWkNXobBc
	OhwW5loMsGF6AgQT4xTARJU=
X-Google-Smtp-Source: ABdhPJxE171L9SfstSamajQiExQr6WnW/FeqRWbOkdUIKHuWL1NDTqarMZqLwyi4DLsWw+CMs4Lfpg==
X-Received: by 2002:a17:906:ae91:: with SMTP id md17mr15164081ejb.553.1630954445458;
        Mon, 06 Sep 2021 11:54:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 04/40] staging: r8188eu: remove dm_deinit from hal_ops
Date: Mon,  6 Sep 2021 20:52:51 +0200
Message-Id: <20210906185327.10326-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dm_deinit from hal_ops and remove its wrapper
rtw_hal_dm_deinit(). Call rtl8188e_deinit_dm_priv() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 7 -------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ----
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index a3b3dd11ba6e..d467e734a699 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -12,13 +12,6 @@ void rtw_hal_free_data(struct adapter *adapt)
 		adapt->HalFunc.free_hal_data(adapt);
 }
 
-void rtw_hal_dm_deinit(struct adapter *adapt)
-{
-	/*  cancel dm  timer */
-	if (adapt->HalFunc.dm_deinit)
-		adapt->HalFunc.dm_deinit(adapt);
-}
-
 u32 rtw_hal_power_on(struct adapter *adapt)
 {
 	if (adapt->HalFunc.hal_power_on)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 765c8c4321f1..355878ec270d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,8 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->dm_deinit = &rtl8188e_deinit_dm_priv;
-
 	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8188E;
 	pHalFunc->set_channel_handler = &PHY_SwChnl8188E;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7d502701be27..61f4a6bcb7dc 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,8 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*dm_deinit)(struct adapter *padapter);
-
 	void	(*set_bwmode_handler)(struct adapter *padapter,
 				      enum ht_channel_width Bandwidth,
 				      u8 Offset);
@@ -250,8 +248,6 @@ void rtl8188eu_init_default_value(struct adapter *adapt);
 
 void	rtw_hal_free_data(struct adapter *padapter);
 
-void rtw_hal_dm_deinit(struct adapter *padapter);
-
 u32 rtw_hal_power_on(struct adapter *padapter);
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c5dc02d30349..039c05ffbc57 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -913,7 +913,7 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 
 	_cancel_timer_ex(&padapter->recvpriv.signal_stat_timer);
 	/* cancel dm timer */
-	rtw_hal_dm_deinit(padapter);
+	rtl8188e_deinit_dm_priv(padapter);
 }
 
 u8 rtw_free_drv_sw(struct adapter *padapter)
-- 
2.33.0

