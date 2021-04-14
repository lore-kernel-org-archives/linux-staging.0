Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0AE6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w18so24900686edc.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1xEJfVPK/KJcyn6yk0NvIQoWVbimOipuoswkuSyxmY=;
        b=R6J1yskmrnGQpY1neW/kEEUuOTWsef3Ud7PkyUOZbMXEa3lakTG9PI5NePTz2Vlk5M
         8TTsIaIOUQY6u4Yiz45Q/0pfw/bqE4LGVIoc41BvuKqvUBRUxP3CwoIj9EhYXTPFsBe7
         DrqvtdW/EpoU/pfq4XNTvK4gKJn/pujQeiTV6JXqCIhKQqj+z05QYBe/+lFpGUGJHlvn
         +cg0Ff7nrrcCA3WoSU/1y0lBEHJV91404kTJ62nOLe+Iqz0bwDL2k9adLuesbcJ7sY8b
         4nuUUFKBsM7Tf0vp+o5x5D9sxOSZHNIbdvmdbEKI7MHzTX5Io+1iLEGbR0FIvGo2qQK+
         hDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1xEJfVPK/KJcyn6yk0NvIQoWVbimOipuoswkuSyxmY=;
        b=bu6ewS1gz2toY2cmVOiqFV7rbPV/q3Bkcp5AAiBlql2llXSpE1/Iw4bzjRLj+y+dFp
         OnGL3D8s04f7qtH1wnS5+gGGd88zGpLseaeMUZOmmlH2aRZde82CrzAoNzQS66DtROZM
         giR6kkCu0Y4Dh0K+Yii5cHjMWArWJ+696sRGNtHQNrjXyHBoE0FuIUfbOUQ70dq4cypE
         UYvglTNIcHRxUJDh3BRO9lzyt03KTFEQaInh3HJoJWzdSKwv+UkFs6fMkf3AKHq7/pjg
         8q1NfkMtEBj+8e8M3rM+rzg4afardekh4dGVjMh4iyefjm2sW59+umezJUOPvA4MpvY2
         dQkg==
X-Gm-Message-State: AOAM533v/g9ve5xgYttuN8j7qH+YLuN3knigIHAqb0k1QZBhOm0bILU7
	whChFZBbqJfgm/HjP6GUoE800Q==
X-Google-Smtp-Source: ABdhPJzGmm9NN5vcyCvxsT7nJqdnxo4NTz5CHnbER1eUkJU8WR8j6Cvho4PPzgItkyxumLFrpL9nMQ==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr162513edb.189.1618423915476;
        Wed, 14 Apr 2021 11:11:55 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	WLAN FAE <wlanfae@realtek.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/57] staging: rtl8712: rtl871x_mp_ioctl: Move a large data struct onto the heap
Date: Wed, 14 Apr 2021 19:10:52 +0100
Message-Id: <20210414181129.1628598-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8712/rtl871x_mp_ioctl.c: In function ‘mp_start_test’:
 drivers/staging/rtl8712/rtl871x_mp_ioctl.c:204:1: warning: the frame size of 1136 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>
Cc: WLAN FAE <wlanfae@realtek.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8712/rtl871x_mp_ioctl.c | 29 +++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
index 31414a960c9ed..adbeb46770d7a 100644
--- a/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
+++ b/drivers/staging/rtl8712/rtl871x_mp_ioctl.c
@@ -149,26 +149,30 @@ static int mp_start_test(struct _adapter *padapter)
 	struct mp_priv *pmppriv = &padapter->mppriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
-	struct wlan_bssid_ex bssid;
+	struct wlan_bssid_ex *bssid;
 	struct sta_info *psta;
 	unsigned long length;
 	unsigned long irqL;
 	int res = 0;
 
+	bssid = kzalloc(sizeof(*bssid), GFP_KERNEL);
+	if (!bssid)
+		return -ENOMEM;
+
 	/* 3 1. initialize a new struct wlan_bssid_ex */
-	memcpy(bssid.MacAddress, pmppriv->network_macaddr, ETH_ALEN);
-	bssid.Ssid.SsidLength = 16;
-	memcpy(bssid.Ssid.Ssid, (unsigned char *)"mp_pseudo_adhoc",
-		bssid.Ssid.SsidLength);
-	bssid.InfrastructureMode = Ndis802_11IBSS;
-	bssid.NetworkTypeInUse = Ndis802_11DS;
-	bssid.IELength = 0;
-	length = r8712_get_wlan_bssid_ex_sz(&bssid);
+	memcpy(bssid->MacAddress, pmppriv->network_macaddr, ETH_ALEN);
+	bssid->Ssid.SsidLength = 16;
+	memcpy(bssid->Ssid.Ssid, (unsigned char *)"mp_pseudo_adhoc",
+		bssid->Ssid.SsidLength);
+	bssid->InfrastructureMode = Ndis802_11IBSS;
+	bssid->NetworkTypeInUse = Ndis802_11DS;
+	bssid->IELength = 0;
+	length = r8712_get_wlan_bssid_ex_sz(bssid);
 	if (length % 4) {
 		/*round up to multiple of 4 bytes.*/
-		bssid.Length = ((length >> 2) + 1) << 2;
+		bssid->Length = ((length >> 2) + 1) << 2;
 	} else {
-		bssid.Length = length;
+		bssid->Length = length;
 	}
 	spin_lock_irqsave(&pmlmepriv->lock, irqL);
 	if (check_fwstate(pmlmepriv, WIFI_MP_STATE))
@@ -185,7 +189,7 @@ static int mp_start_test(struct _adapter *padapter)
 				 tgt_network->network.MacAddress);
 	if (psta)
 		r8712_free_stainfo(padapter, psta);
-	psta = r8712_alloc_stainfo(&padapter->stapriv, bssid.MacAddress);
+	psta = r8712_alloc_stainfo(&padapter->stapriv, bssid->MacAddress);
 	if (!psta) {
 		res = -ENOMEM;
 		goto end_of_mp_start_test;
@@ -200,6 +204,7 @@ static int mp_start_test(struct _adapter *padapter)
 	set_fwstate(pmlmepriv, _FW_LINKED);
 end_of_mp_start_test:
 	spin_unlock_irqrestore(&pmlmepriv->lock, irqL);
+	kfree(bssid);
 	return res;
 }
 
-- 
2.27.0

