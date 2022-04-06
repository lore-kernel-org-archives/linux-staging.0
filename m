Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0284233D7;
	Wed,  6 Apr 2022 22:41:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q19so5279276wrc.6;
        Wed, 06 Apr 2022 15:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8PdPV1uVTDYxkLHZpucjakBPCEtyMndpTWZ3KCVf2kQ=;
        b=K/tka2qPIv59qfxLtVw85vpJCBHTa4X/TfcLU8fXpOOmkj9qIIPBbk9vwtIYubM4N8
         /CHCJA9Nuw17U/Rg0CNWZZnowuyaDnel/AKEQf9olZ//Wy82de74xU0rXwOLY070m/g1
         5NECkgaXaHNJD2iO7jz0iVAl7NvFlVQwOYWLsPZ0OevLwJn9xB5RqZBQ4qClieiBWQge
         A3er0Ic9++9HJc+jvruVD1RJQVugkLn/wjdFpAiEQh3FhHbplDzPT6ZaJWXjfs0qxd47
         kRX8Gwfi9lk6r1ZPvB33yBvRw5MX0qnumpDo4nxhQnPCUidW55hA1fP6yCvIcgrT9Mmv
         JqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8PdPV1uVTDYxkLHZpucjakBPCEtyMndpTWZ3KCVf2kQ=;
        b=tjpo17zONt7BGof52ALkvJtZlqA8FOfS6P4jeUmgyTU+h8fWggbvVVNHx/E5tCgnkQ
         MLFryQ6WsoqzYFFFZ+r+wATPOQqxevh5Gy5fzLhYX0Te4lU83v9EsCLohJY89Gv8fO87
         UOw8huL0Sk0WYI0lYIkqKP0UUW1qQQLmnxYM/3HQEgBf5m1SYSX04k8lM0Vg55WSsW8R
         zld5QLT6jMTbVdvMEWzo4hz5RuJoBh95s193poH+kHuWDsBzioh8qEGi/9zN5htv7/sf
         Zv+UUSNl8KV7yKj0yP396Kha4oZudfZGdlIR8iohrb3Y0cCHQ6W+wz+4n7MTmmTcCJrG
         8XSA==
X-Gm-Message-State: AOAM531JxlcG6PWOBbavaMl+g+ulOYV1MNUI0AyftQYHg+H4+JSZZrD6
	UHhqkNr94Nlaf2KxrPCYClI=
X-Google-Smtp-Source: ABdhPJxwsnlYTRbN7V6B6qVajUOiZuW5HksGNi+sv85WHI0qJWadDMtKjxlO5PV/pjuM+1Zs6sA0+w==
X-Received: by 2002:a05:6000:168e:b0:204:f92:53e9 with SMTP id y14-20020a056000168e00b002040f9253e9mr8589680wrd.349.1649284863065;
        Wed, 06 Apr 2022 15:41:03 -0700 (PDT)
Received: from alaa-emad ([197.57.231.245])
        by smtp.gmail.com with ESMTPSA id t15-20020adfeb8f000000b002060d26c211sm10218518wrn.114.2022.04.06.15.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 15:41:02 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH v3] staging: rtl8712: remove unnecessary parentheses
Date: Thu,  7 Apr 2022 00:40:57 +0200
Message-Id: <20220406224057.5260-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Unnecessary parentheses around param->u.crypt.key[16]: 85
CHECK: Unnecessary parentheses around param->u.crypt.key[24]: 87
CHECK: Unnecessary parentheses around padapter->mlmepriv: 603
CHECK: Unnecessary parentheses around wrqu->encoding: 1497
CHECK: Unnecessary parentheses around wrqu->encoding: 1592
CHECK: Unnecessary parentheses around padapter->mlmepriv: 1593
CHECK: Unnecessary parentheses around wrqu->param: 1673
CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1967
CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1977
CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1999

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
Changes in v2:
	- Edit commit subject
	- Edit commit message
	- Fix the same check in more lines
	- Remove space before '.skey' in
"memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.
---
Changes in v3:
	return the space before '.skey' in
"memcpy(psta->tkiptxmickey.skey," in lines 84 and 86
---
 drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index 3b6926613257..f1e352b7f83e 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -82,9 +82,9 @@ static inline void handle_pairwise_key(struct sta_info *psta,
 	       (param->u.crypt. key_len > 16 ? 16 : param->u.crypt.key_len));
 	if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 		memcpy(psta->tkiptxmickey. skey,
-		       &(param->u.crypt.key[16]), 8);
+		       &param->u.crypt.key[16], 8);
 		memcpy(psta->tkiprxmickey. skey,
-		       &(param->u.crypt.key[24]), 8);
+		       &param->u.crypt.key[24], 8);
 		padapter->securitypriv. busetkipkey = false;
 		mod_timer(&padapter->securitypriv.tkip_timer,
 			  jiffies + msecs_to_jiffies(50));
@@ -600,7 +600,7 @@ static int r8711_wx_get_name(struct net_device *dev,
 	u32 ht_ielen = 0;
 	char *p;
 	u8 ht_cap = false;
-	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
+	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
 	u8 *prates;
 
@@ -1494,7 +1494,7 @@ static int r8711_wx_set_enc(struct net_device *dev,
 	u32 keyindex_provided;
 	struct NDIS_802_11_WEP	 wep;
 	enum NDIS_802_11_AUTHENTICATION_MODE authmode;
-	struct iw_point *erq = &(wrqu->encoding);
+	struct iw_point *erq = &wrqu->encoding;
 	struct _adapter *padapter = netdev_priv(dev);
 
 	key = erq->flags & IW_ENCODE_INDEX;
@@ -1589,8 +1589,8 @@ static int r8711_wx_get_enc(struct net_device *dev,
 {
 	uint key;
 	struct _adapter *padapter = netdev_priv(dev);
-	struct iw_point *erq = &(wrqu->encoding);
-	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
+	struct iw_point *erq = &wrqu->encoding;
+	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	union Keytype *dk = padapter->securitypriv.DefKey;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
@@ -1670,7 +1670,7 @@ static int r871x_wx_set_auth(struct net_device *dev,
 				union iwreq_data *wrqu, char *extra)
 {
 	struct _adapter *padapter = netdev_priv(dev);
-	struct iw_param *param = (struct iw_param *)&(wrqu->param);
+	struct iw_param *param = (struct iw_param *)&wrqu->param;
 	int paramid;
 	int paramval;
 	int ret = 0;
@@ -1964,7 +1964,7 @@ static int r871x_get_ap_info(struct net_device *dev,
 		return -EINVAL;
 	data[32] = 0;
 
-	spin_lock_irqsave(&(pmlmepriv->scanned_queue.lock), irqL);
+	spin_lock_irqsave(&pmlmepriv->scanned_queue.lock, irqL);
 	phead = &queue->queue;
 	plist = phead->next;
 	while (1) {
@@ -1974,7 +1974,7 @@ static int r871x_get_ap_info(struct net_device *dev,
 		if (!mac_pton(data, bssid)) {
 			netdev_info(dev, "r8712u: Invalid BSSID '%s'.\n",
 				    (u8 *)data);
-			spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock),
+			spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock,
 					       irqL);
 			return -EINVAL;
 		}
@@ -1996,7 +1996,7 @@ static int r871x_get_ap_info(struct net_device *dev,
 		}
 		plist = plist->next;
 	}
-	spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock), irqL);
+	spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock, irqL);
 	if (pdata->length >= 34) {
 		if (copy_to_user((u8 __user *)pdata->pointer + 32,
 		    (u8 *)&pdata->flags, 1))
-- 
2.35.1

