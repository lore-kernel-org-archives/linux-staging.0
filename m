Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636568
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 00:20:49 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id l8so14778866qtk.6
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 16:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oPKe+OwXS4FQrEpljcQT1B+U9YZotmfe4ShlDtQ1wjY=;
        b=uASj1Jr7Syl/8wpr8cRxsJ7ShBX/AwngdNU2SerDwGiPjOMLxotzv8pduv1MuHkgi6
         9mM6EUfoV8vMrV9TkUd7eydH+dQmFpQo9LgCT6Arq2LVTzNqeJMwOhMk4YcAr0XgkYMJ
         S4+zzdLUpmRtJXQLK3/b4EJ7RBXzaGbgVvm5WI7PKgMqtZoJfb5lep92n9zBB9tm9u0x
         wa7BZ9mgUvKnjt0r8TivwdDygwjw7Nn4j66mrZ0jRcSQtfyOSv+y1SMyCAFNQXG5HVvf
         YcLl1ElQIwnFANFG48wwy6Au09h7PC5jSkLS+qm+W8xGvxReY8Kf/fcBg23yuT5FOt3O
         Q0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oPKe+OwXS4FQrEpljcQT1B+U9YZotmfe4ShlDtQ1wjY=;
        b=gzdMiQcGI9x1s+ZNRvaEhkC7v3ysEDIsBiXe++0pf7lqJq/vzDV02ZYdO+XDyST3dw
         s8gT9pdb5jeYzBBR0LrGk4n4hkbJw5GW5M7Hx6R8pano59/Il4PG9ddmVH/HVg1q97qq
         6+u8RJhz8e9ja9qHyZImCaLsvp57bEZcTk6GbZUypI9JlzvPyw4dbqzeCcGyKvT8g35/
         YFh9E5mhBOqSFlURN9CrLGcwvO5b9s+chmTLBc20SXyPG1F1ng7Yzj8fgVaX2GctLd2u
         NL0tEuxT7uL+YzvJyzCyDnobEd6wEFjkSXpYmoouTUG+Q+pCT7SCJRn4Vi4LcvPBn90s
         s/Dg==
X-Gm-Message-State: AOAM530jlEYSz8kIr6ZKnUFW3sTVOaSERMwlq2qmDs4CHfdLybVHfgHL
	uLW/0bIw+4qPR33RqN/cb9/Mbg==
X-Google-Smtp-Source: ABdhPJxxbIYt62sxO3/2/hB7DTNXy97rihAodvBOMh50Reb2rva58sc8uYNOsn48fm3Q8ZRKZoNbhw==
X-Received: by 2002:a05:622a:1351:: with SMTP id w17mr39062295qtk.276.1638145249098;
        Sun, 28 Nov 2021 16:20:49 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id n74sm5681022qkn.83.2021.11.28.16.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:20:48 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: r8188eu: convert DBG_88E_LEVEL calls in core/rtw_pwrctrl.c
Date: Mon, 29 Nov 2021 00:20:36 +0000
Message-Id: <20211129002041.865-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211129002041.865-1-phil@philpotter.co.uk>
References: <20211129002041.865-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all DBG_88E_LEVEL macro calls in core/rtw_pwrctrl.c to plain
netdev_dbg calls, as although the information is potentially useful,
we should be exposing it using standard kernel debugging functionality.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 5d595cf2a47e..7fa4516af6ec 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -15,9 +15,12 @@ void ips_enter(struct adapter *padapter)
 
 	if (pxmit_priv->free_xmitbuf_cnt != NR_XMITBUFF ||
 	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
-		DBG_88E_LEVEL(_drv_info_, "There are some pkts to transmit\n");
-		DBG_88E_LEVEL(_drv_info_, "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
-			      pxmit_priv->free_xmitbuf_cnt, pxmit_priv->free_xmit_extbuf_cnt);
+		netdev_dbg(padapter->pnetdev,
+			   "There are some pkts to transmit\n");
+		netdev_dbg(padapter->pnetdev,
+			   "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
+			   pxmit_priv->free_xmitbuf_cnt,
+			   pxmit_priv->free_xmit_extbuf_cnt);
 		return;
 	}
 
@@ -32,7 +35,7 @@ void ips_enter(struct adapter *padapter)
 	DBG_88E("==>ips_enter cnts:%d\n", pwrpriv->ips_enter_cnts);
 	if (rf_off == pwrpriv->change_rfpwrstate) {
 		pwrpriv->bpower_saving = true;
-		DBG_88E_LEVEL(_drv_info_, "nolinked power save enter\n");
+		netdev_dbg(padapter->pnetdev, "nolinked power save enter\n");
 
 		if (pwrpriv->ips_mode == IPS_LEVEL_2)
 			pwrpriv->bkeepfwalive = true;
@@ -65,7 +68,7 @@ int ips_leave(struct adapter *padapter)
 		if (result == _SUCCESS) {
 			pwrpriv->rf_pwrstate = rf_on;
 		}
-		DBG_88E_LEVEL(_drv_info_, "nolinked power save leave\n");
+		netdev_dbg(padapter->pnetdev, "nolinked power save leave\n");
 
 		if ((_WEP40_ == psecuritypriv->dot11PrivacyAlgrthm) || (_WEP104_ == psecuritypriv->dot11PrivacyAlgrthm)) {
 			DBG_88E("==>%s, channel(%d), processing(%x)\n", __func__, padapter->mlmeextpriv.cur_channel, pwrpriv->bips_processing);
-- 
2.33.1

