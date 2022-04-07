Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552922564;
	Thu,  7 Apr 2022 12:59:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u3so7762521wrg.3;
        Thu, 07 Apr 2022 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVP0DeosChaP4vnFzIKGWwoOlpAbwuSOyH45+/mZoL0=;
        b=EKN2hIRsBqehxl1LPwDXn+MG5SyKoqhVpkpyr2FlER8hbxE9Ay7WNPPw4ChApC65YQ
         J30V9zKdRjJj8mCycqBYe6r/yZbYQ0Syua9qMK/XX+36rrCYQsATeqXHCoUQ9wc9vX4Q
         FSlomHsQTEMFxVm7f4qT2/pO9mm/xpdt0tgcZlCsItIrg93Wb/3T2aD77sBXVXPboyt3
         LXBikbAHA50KRnYq74MsZDjdGerLMWIh4JIhh2PbGZJJDz/TUc1izmizbOFwGvt7GfZ1
         smc9IZOkpFiM1D4yqyI865GU7OL7PJcOQzjADzTNCkCAPlwgZwdDXZ0OpgG9OVqBzL4i
         BO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVP0DeosChaP4vnFzIKGWwoOlpAbwuSOyH45+/mZoL0=;
        b=gTiD932kqL/gdaZziMId6ai7RCsw3NzQFFqOMBIzAdp8tXPveSBWzYQ9wlfEABFYly
         VV/26tDtP/OJvpEOSbF4przmFEVVEolHV/bKCEJJiQuF3yiAP+UirW0kLELKz01tSBj5
         9j+Yx1ezhvN0TyNv34S3WZlfgGWrfcSLGAihtqewZns1ZhQiu/zCA7Uy9yk+QfkR3zZI
         cQi3PWVP8QmFrXAy8nYAtwpXDTFSLVXws0R5BmfBeD7xC1I0OyvCoAiGEbrvbTO/5uZl
         l9iSGuXUL4rraZyBUg3Wvwzg9Gx7RTmfGDN+N86hfcHBusFTcfBOg2X+6cI6NzL72C8b
         qXOQ==
X-Gm-Message-State: AOAM533r5ISjcLqMg49TjarSIomyKvob6WX1uMHLLkz4RD4EQnakqwC3
	iVE1KwUtdbwN/9kBwDkXaz6ARG8UCsY=
X-Google-Smtp-Source: ABdhPJxshfU1NOlOOLmqcrimT11cLGwoDeMBpIbUyzbLG9YPscs+Pk4CihETUqSB0wB9UMgpKC6DVg==
X-Received: by 2002:adf:ee08:0:b0:206:1b1e:bc20 with SMTP id y8-20020adfee08000000b002061b1ebc20mr10973407wrn.541.1649336393481;
        Thu, 07 Apr 2022 05:59:53 -0700 (PDT)
Received: from alaa-emad ([197.57.231.245])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0038cba2f88c0sm10704711wms.26.2022.04.07.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 05:59:52 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH v4] staging: rtl8712: remove unnecessary parentheses
Date: Thu,  7 Apr 2022 14:59:47 +0200
Message-Id: <20220407125947.8525-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

Remove unnecessary parentheses around structure field references

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
Changes in v4:
	edit commit message to be clearer.
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

