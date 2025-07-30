Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAFF293B5F
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872313; cv=none; b=PvzmbGprkqI5IK86AQzdnTpNcyox0oPwjaBmBfcQe8uP9N5N1655spb9JDI4/S5uGl05e9djtS10WiPzWsGYwMiur7H1V/xasHWYbUqnzCZLQPJW/Uf0BQc0OILq0iVTM2XJ/tE2tNZLszF3rf73m4o0esHEf8++DfVgN3idupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872313; c=relaxed/simple;
	bh=lKDLjwohNLI+W0RVqk5eQdA2JB7DSrHHNZBj5lBAqxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pn0ghYfzyiN6ObGxiBUWMMNBxq2dOJmQImbjIgNZp00VAB+S5oftWgigDnQSZeDO2ZQYQkRS3RIo3NLE8gLusLRbHOSskr499P2Lximk25k7fhIbl+bJk3uWgqLdTrVu/NFX97waN+2qmlRjBwFEmxpMNreOekbVl6MqnStR53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/81m+hc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/81m+hc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61589705b08so1691668a12.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872310; x=1754477110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhMrTUsGLhgSJHPnPXfJtTefZZIZgXJlXwMrdVYHlCU=;
        b=e/81m+hcl/BqVehODLCW/G1C1Q/RjpFbVXS6NUjph7YRE5U8q1g3y4QuxlM9A05Ux6
         vOfy5IoD2sEyegH+BVU4ooK4PWwMMayciEUMZHah+8IjY4T8qi6ghiOd3iFfquvMtXov
         YAUgoHqVDNNstdYjePtmoSozf/DSoEfYMHpWSDEL/TbMc0ne+UsR1azcIM45kCPmAtT/
         ABOkmM0hpDxebqCs3ZR1qL4Ju3eKiisozvrrBjGZ3e8QTbdfJcGmMG4YI/AZ+4XehsMf
         HNd23aa/BPVn1VZUU2PzObAF45sfQzb22zpANPbCY6RMOqshubGbmV+jYhqDY9Zdxi7T
         vpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872310; x=1754477110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhMrTUsGLhgSJHPnPXfJtTefZZIZgXJlXwMrdVYHlCU=;
        b=pHW9mvwT+721pMi6xzdDnn1rbDbEZEgRBGx7dr4lXxOBwBuQ4NHXQg9GmxbgBtv7YL
         6XHwUTngmVxQNw/mf/KrEK/BUdT5S6V1SCFasGN3a3RBFaBrlngF1tvndTARizUF/UMF
         tv+mQxpnRSyIIW9EuQrv99OYewB6uOr47HGFiLAWz4ByKTjCQQ+SURYcwPLUVDvVO55V
         yIl44e2+7+HSIJisjJKkfpIy+/bMcv5+6vEU78E1eU0mhssCruOiOY96ibaAS4L2k7qb
         Q6leV2+TM8ViUuvOnFIOGvEnNukzK+DaLqKAmphBh5UTzS+/QzQLyMTZUf5UT8S/7zdD
         Bt/w==
X-Forwarded-Encrypted: i=1; AJvYcCW6C0N3msOW6upVOo51F4qY8xZEIE6kqToVev1QkMYa+mKoFotrnuUMDId1knepGedChMzd5/mwMfdGgamS@lists.linux.dev
X-Gm-Message-State: AOJu0YysaPsQuebCGf6gChhwC64+3dSPFPubIJOit55xhFuq7bNmwqr5
	CH64iUPOia3OfotR+4KCQZoqw7/TtRZCjEuwf/4+KpoCY7+q8ALad4Yu
X-Gm-Gg: ASbGnctIEqlAGO90DwibmOUWqfZX9pzYDJIV1Otzwf3sXU4d+SYf/+nTG6ovNwPMe9I
	/XoYDKd2Xc0kDQreppyff65xLLBtJm3DKciNKtxwlcHoaqbmdad37BOgn+yQUcgXcRBu4gwj+iY
	nRMgTBmnQ38caA4o+LgqOFkVHDXYB+g5lXssfr374DRgCVsBZOjOu9GBXEJjthYVeQ/wBNS60jn
	cU2J1I+lP0x0qWIBhWFl+JyRDEW8JzzbriN4aQcJ2dr3BeTdCWBgzsX/+YO3YkBH1TyQmBQNLQ2
	Hi/Ao06NS58510OrI8mJtfUIkCj47dwhQuDRO2PGZN3xuVqo6kkYVHEiaocfFOp6yrCmu9XigPE
	ngE4yJzpBUQsD1/7WYzzoF26Z06UQKSoLof8Xyp07w8YLm1XEsg7dm4+5
X-Google-Smtp-Source: AGHT+IFl5bt0ZUUGxrvGIxVVDpix/kdV/nNNpynB66K5yBJja9o3i+UoUXrpiqXUsRGrAwqXDNHWRw==
X-Received: by 2002:a05:6402:647:b0:612:bfb2:386 with SMTP id 4fb4d7f45d1cf-615871d4abfmr2659229a12.28.1753872309609;
        Wed, 30 Jul 2025 03:45:09 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: rtl8723bs: move init_mlme_ext_timer to core/rtw_mlme_ext.c
Date: Wed, 30 Jul 2025 12:44:55 +0200
Message-ID: <20250730104501.150270-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730104501.150270-1-straube.linux@gmail.com>
References: <20250730104501.150270-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function init_mlme_ext_timer from os_dep/mlme_linux.c to
core/rtw_mlme_ext.c to reduce code in the os_dep directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 9 +++++++++
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c    | 8 --------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bc980d21d50e..0e685c0f2f2f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -374,6 +374,15 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	return chanset_size;
 }
 
+static void init_mlme_ext_timer(struct adapter *padapter)
+{
+	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+
+	timer_setup(&pmlmeext->survey_timer, survey_timer_hdl, 0);
+	timer_setup(&pmlmeext->link_timer, link_timer_hdl, 0);
+	timer_setup(&pmlmeext->sa_query_timer, sa_query_timer_hdl, 0);
+}
+
 void init_mlme_ext_priv(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..58e2d8e159d6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -426,7 +426,6 @@ void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 int init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-extern void init_mlme_ext_timer(struct adapter *padapter);
 extern void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta);
 extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 09bf363efa8b..d22d6cf3cb11 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -164,11 +164,3 @@ void init_addba_retry_timer(struct adapter *padapter, struct sta_info *psta)
 	timer_setup(&psta->addba_retry_timer, addba_timer_hdl, 0);
 }
 
-void init_mlme_ext_timer(struct adapter *padapter)
-{
-	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-
-	timer_setup(&pmlmeext->survey_timer, survey_timer_hdl, 0);
-	timer_setup(&pmlmeext->link_timer, link_timer_hdl, 0);
-	timer_setup(&pmlmeext->sa_query_timer, sa_query_timer_hdl, 0);
-}
-- 
2.50.1

