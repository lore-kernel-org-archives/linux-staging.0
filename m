Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010022564;
	Thu,  7 Apr 2022 12:48:32 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j12so7702696wrb.5;
        Thu, 07 Apr 2022 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVP0DeosChaP4vnFzIKGWwoOlpAbwuSOyH45+/mZoL0=;
        b=WJ+kAroNj7E7A5y908A71aFJJj+nAvEUf4Ay0YLozhvoTHYxB902LFt2Od7TY10Wl4
         MDtb0HNH2KI/aBYiddHdz1k5GRwnn5f0NxSBI/KuW8tYFoLP3fb7MV7vZs4Os7EQarFN
         Dgs0YtQuP/Xuvpln1PFj/fDipk+nDKU5ckItz0m02ENbvnF8DuxySx8L9k9muCsMTORC
         AOsHmomnvr2/rP0bfrxp7bPq9QSMKEOoWHbW/JLLg0fQjhDOgJu/5bKzY34INCmn6LgK
         cUnRng5ayAzLyosP4ozBSF4L8uDB0FEaAlbbZiozeQWVnCoBO1Oa7znXd0VU+IHOEkvq
         tevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVP0DeosChaP4vnFzIKGWwoOlpAbwuSOyH45+/mZoL0=;
        b=JuNTmowusC4RTHZozQPdK1pqbE7MaXLYHFxOxxLf16MfYEzBTT8LwQaTHUjPPANmcY
         g92e6FrJGh0td9Vxmaut5KDn+oMEKq26t+7YZ92P0z3kdPSdXHCFUnqeYlvJ6K/NaueC
         rTBgO7nDZSye7jiGFQocGnKCkHe534CObFtnMPbSVzjHMGi8QwumFkrQIg4t93ciP3OG
         Krb9dW7qH7sAF9HwzLwug3m6+tTsuJjO/8yxi5AwsCF3iKCEEG8p0L42I7CzonGLwsk8
         2mgW/oAcF7coH9rKvd6+/9nSnPQW9e6RVqgZ3YIL27ttqz+KGdAoDhpRHaeRpAlNwPj0
         +zVA==
X-Gm-Message-State: AOAM531r0uqYMJ92DpdT4Pwyx4flNu7uFYx7bcHndcjSMgwg5021c+pD
	P7T9vN6iblcr+NB2o+ke/dfemI6mnfY=
X-Google-Smtp-Source: ABdhPJwcz9vVn9c0DLHAhAgTiD1FsFIPhhJ34CoOVsuCWnlvNQU1WIQX8uuwY6ONIZ02Z+NbDhdpng==
X-Received: by 2002:adf:d1e3:0:b0:204:7e76:8a70 with SMTP id g3-20020adfd1e3000000b002047e768a70mr11019097wrd.580.1649335711115;
        Thu, 07 Apr 2022 05:48:31 -0700 (PDT)
Received: from alaa-emad ([197.57.231.245])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b0038b7c4c0803sm8172229wms.30.2022.04.07.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 05:48:30 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH v4] staging: rtl8712: remove unnecessary parentheses
Date: Thu,  7 Apr 2022 14:48:17 +0200
Message-Id: <20220407124817.7714-1-eng.alaamohamedsoliman.am@gmail.com>
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

