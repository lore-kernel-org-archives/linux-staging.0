Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BD6D00
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 19:32:19 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id y1so22061879ljm.10
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 12:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=BGJNbfrqvXQ7YZKTbOhkcicRAhCvNB362hxy1D5Wp7I=;
        b=eCGFsHJjM1Kn/fofJc5xWmawS6hTP0oJMLC1Ju0X6LDktS0MBvv5rZcrmmLQxsTecL
         xDjpn+zcJrZriI42/ajIRrlsYaX8FUeSGVnah/xvVNm34KCIaQGieyCpTDjHmESojj94
         gvc80nOUVMl+6q9pF8WKOCodnCEdH0Mfec+pPjJDR9G5aO54HZYEnWXogCn7T2Lk1Eo0
         cZGLNlpp/Px98tLR+5yG1GSVddos1cX1lFulrnXNm9DTRk9yGsAoOJF7JFZhP/ZAxG3z
         eyiCuuiZSQVkEyQEh9/znW18PD0yzWHwbWvdc0gDFkVb+kVLUVBjW0Zpk0+v7WpDxluq
         f3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=BGJNbfrqvXQ7YZKTbOhkcicRAhCvNB362hxy1D5Wp7I=;
        b=DxDbLkyCxF2qvCawHCFGHSwHBatoRmC4lI8TiOnwWljcRaHBodBu4UYO1D9XJIxNxO
         P56wufvodY1wjoH7fdPllzy+LeqAtvF4igiBGM0pLx9EQCki+LBAy21ni4D6R4yVAmNl
         bsWNPDA0GNfuUVW3vkB0o9LD/hAFjUhPUWhFMR8klXKyeTPp2XnvVWQ1M5jhvofD38g6
         hPuPhmFi0O6BWpzYY7Iz3lFHXlXkz4zVIvgC0Ux/bPf51vtAunlYpW4IGRVebPJW15br
         m+Qs5f1FdcXfBEBRFARDempPpyWbVDkpaEEOmjbeOQJP1rhdt6C/Jh66o7VJFRXkCsxx
         28+Q==
X-Gm-Message-State: AOAM533sQ0h0y+hqRqTmsaEcHCONPadIESP705n0wJFEH6NlXuS3q/EQ
	hxmfXD4dBv8yvahqm6PGGN8=
X-Google-Smtp-Source: ABdhPJwQG4d5XvB4QyfkaW3I4rf6tge4vYmGDkdNtaK8ULajoegD4824Yb3YDClxehK30p1DtUkXEg==
X-Received: by 2002:a2e:3913:: with SMTP id g19mr3146110lja.294.1617823937326;
        Wed, 07 Apr 2021 12:32:17 -0700 (PDT)
Received: from test-VirtualBox ([87.116.183.186])
        by smtp.gmail.com with ESMTPSA id f16sm2500686lfm.155.2021.04.07.12.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 12:32:17 -0700 (PDT)
Date: Wed, 7 Apr 2021 21:32:14 +0200
From: Sergei Krainov <sergei.krainov.lkd@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8712: remove unused variable from rtl871x_mlme.c
Message-ID: <20210407193214.GA284402@test-VirtualBox>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable from rtl871x_mlme.c

Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index 8a97307fbbd6..4f41e321ea63 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -656,7 +656,7 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 	struct sta_priv	*pstapriv = &adapter->stapriv;
 	struct mlme_priv	*pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
-	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
+	struct wlan_network	*ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 	struct wlan_network *pnetwork;
 
@@ -721,13 +721,6 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 					    scanned_queue,
 					    cur_network->network.MacAddress);
 				} else {
-					pcur_wlan =
-					     r8712_find_network(&pmlmepriv->
-					     scanned_queue,
-					     cur_network->network.MacAddress);
-					if (pcur_wlan)
-						pcur_wlan->fixed = false;
-
 					pcur_sta = r8712_get_stainfo(pstapriv,
 					     cur_network->network.MacAddress);
 					spin_lock_irqsave(&pstapriv->
-- 
2.25.1

