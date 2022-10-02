Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9823AA
	for <linux-staging@lists.linux.dev>; Sun,  2 Oct 2022 07:48:50 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m3so10860121eda.12
        for <linux-staging@lists.linux.dev>; Sun, 02 Oct 2022 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PQPZkn7E5IjiLWsvX5daUSv5IaF5YUgb6ZmfCxE/RZQ=;
        b=ZrGFv4b2DSYT5IqxyTQV6K+cYO43+OVSR1ZWMZJuvFAGqI0NmptJj+Z6x2AQtZOjUD
         lYBMiKS0GaxM1YygX6HIYW+II+2kSiR6aT+hcdfg5PKXY+AZX1l1pINWukruQW5SZBAn
         aGtK7FpfncUs1rxIgusSpUpGvIDKriOeBXyvWjnTq81VZBFEz9F7UXuGjb4X1mg1i4Zr
         FndW2PsjTolR9jG/jbWBiUIeBHXkElQur/4OF4NnKpQ/VvZNXhnID159e7PYGM9YCWPQ
         8drgIIgM44WtoYLjBDkK8clu0ZgjS5trJ8trCfFeRIGXr8jDuH5Yzi/8qLs8WO195mmg
         6QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PQPZkn7E5IjiLWsvX5daUSv5IaF5YUgb6ZmfCxE/RZQ=;
        b=cVQxYqAsLQYvyIBxoxVRAtgloJk50J4XKFtcmZrqr9lvinNxmeT19wIhYlXQqsXxvA
         Z4Mt7WeVRQhDAgF+iJUG2KwtQCy52VCi+UFWStaaDI/tKJqJLil7C5c9PkGsWVqTvCyK
         r/kQIsJRyfJ4Kg1y8XePHJd2wEICTkyLRpredA6sFEuUvaDajULFayhRB2rRFsCBvFkV
         DRiDG+8Hz6bq+gxiZIJb6MDTD42wsLwFLBMx3nJzU59dQL1pSVuKK4AUJ8ARupEyYaZr
         zCNNpcAZvop7LLpFMzZuu+KSKNf7s7wa/ocW0jnuHe+O/DaFNqSoQnCHsyu8SKC7KosV
         ds0A==
X-Gm-Message-State: ACrzQf0gQyV29WX9K9ExcjFVBDKSlXbHya9zaxAIrwI+PwYXTavF7rLo
	cgNYkTo9mP+PveIoAW3nmZw=
X-Google-Smtp-Source: AMsMyM7ZRWsWpq6K7vtK3ZZdsgqx0pVubQ570QaJcYyengIesZq4nhM1VWgrAV0/f3zPOYYiKlRUsw==
X-Received: by 2002:a05:6402:557:b0:458:7488:8958 with SMTP id i23-20020a056402055700b0045874888958mr9907041edx.242.1664696929291;
        Sun, 02 Oct 2022 00:48:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id q26-20020a17090676da00b0077ce503bd77sm3608536ejn.129.2022.10.02.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 00:48:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: convert rtw_init_mlme_priv() to common error logic
Date: Sun,  2 Oct 2022 09:48:26 +0200
Message-Id: <20221002074827.8566-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221002074827.8566-1-straube.linux@gmail.com>
References: <20221002074827.8566-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the function rtw_init_mlme_priv() to common kernel error logic.
Return 0 on success and negative value on failure. This is part of
getting rid of returning _SUCCESS and _FAIL which uses inverted error
logic and is used all over the driver.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c   | 12 ++++--------
 drivers/staging/r8188eu/os_dep/os_intfs.c |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 5ca03d6cac32..1f69e5c57d5d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -224,7 +224,6 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 	u8	*pbuf;
 	struct wlan_network	*pnetwork;
 	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
-	int	res = _SUCCESS;
 
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
 
@@ -245,10 +244,9 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 
 	pbuf = vzalloc(MAX_BSS_CNT * (sizeof(struct wlan_network)));
 
-	if (!pbuf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pbuf)
+		return -ENOMEM;
+
 	pmlmepriv->free_bss_buf = pbuf;
 
 	pnetwork = (struct wlan_network *)pbuf;
@@ -265,9 +263,7 @@ int rtw_init_mlme_priv(struct adapter *padapter)/* struct	mlme_priv *pmlmepriv)
 
 	rtw_init_mlme_timer(padapter);
 
-exit:
-
-	return res;
+	return 0;
 }
 
 void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 490e0c7dc034..d8b8a5291e40 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -473,7 +473,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 		goto free_cmd_priv;
 	}
 
-	if (rtw_init_mlme_priv(padapter) == _FAIL) {
+	if (rtw_init_mlme_priv(padapter)) {
 		dev_err(dvobj_to_dev(padapter->dvobj), "rtw_init_mlme_priv failed\n");
 		goto free_evt_priv;
 	}
-- 
2.37.3

