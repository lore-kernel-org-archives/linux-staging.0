Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B220EA;
	Thu,  7 Apr 2022 04:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Hb3fQ72S8kwAbM+KS3Vg2Hf5vL+s7WtSbsiDvS5WHCU=;
  b=L2Rah73/y/lODEkv+pnO0oc8qwWdfoNi19axFMr/wGC4R4io84GXPXoY
   +ti2mkiI90FqH6N23M6gv32apMRMGgzCsFhJKIAOycrhvBq5fUIQ4t//1
   cTCN/5n92hy/cYGFcVDfofk3kdaE6U6P2fR5RBCfBEzTmKYh0B38c5m3L
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,241,1643670000"; 
   d="scan'208";a="10799887"
Received: from lputeaux-656-1-153-249.w217-128.abo.wanadoo.fr (HELO hadrien) ([217.128.47.249])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 06:04:30 +0200
Date: Thu, 7 Apr 2022 06:04:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net, 
    florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8712: remove unnecessary parentheses
In-Reply-To: <20220406215051.20483-1-eng.alaamohamedsoliman.am@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204070601380.2191@hadrien>
References: <20220406215051.20483-1-eng.alaamohamedsoliman.am@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 6 Apr 2022, Alaa Mohamed wrote:

> Reported by checkpatch:
>
> CHECK: Unnecessary parentheses around param->u.crypt.key[16]: 85
> CHECK: Unnecessary parentheses around param->u.crypt.key[24]: 87
> CHECK: Unnecessary parentheses around padapter->mlmepriv: 603
> CHECK: Unnecessary parentheses around wrqu->encoding: 1497
> CHECK: Unnecessary parentheses around wrqu->encoding: 1592
> CHECK: Unnecessary parentheses around padapter->mlmepriv: 1593
> CHECK: Unnecessary parentheses around wrqu->param: 1673
> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1967
> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1977
> CHECK: Unnecessary parentheses around pmlmepriv->scanned_queue.lock: 1999

This is not what I was suggesting.  What do all of these things have in
common?  How would you describe them in a single English sentence?

>
> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> ---
> Changes in v2:
> 	- Edit commit subject
> 	- Edit commit message
> 	- Fix the same check in more lines
> 	- Remove space before '.skey' in
> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.

This is another change (no parentheses involved), so it should be in
another patch.  Also, all changes should be described in the log message.

julia

> ---
>  drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> index 3b6926613257..e11332352285 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> @@ -81,10 +81,10 @@ static inline void handle_pairwise_key(struct sta_info *psta,
>  	memcpy(psta->x_UncstKey.skey, param->u.crypt.key,
>  	       (param->u.crypt. key_len > 16 ? 16 : param->u.crypt.key_len));
>  	if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
> -		memcpy(psta->tkiptxmickey. skey,
> -		       &(param->u.crypt.key[16]), 8);
> -		memcpy(psta->tkiprxmickey. skey,
> -		       &(param->u.crypt.key[24]), 8);
> +		memcpy(psta->tkiptxmickey.skey,
> +		       &param->u.crypt.key[16], 8);
> +		memcpy(psta->tkiprxmickey.skey,
> +		       &param->u.crypt.key[24], 8);
>  		padapter->securitypriv. busetkipkey = false;
>  		mod_timer(&padapter->securitypriv.tkip_timer,
>  			  jiffies + msecs_to_jiffies(50));
> @@ -600,7 +600,7 @@ static int r8711_wx_get_name(struct net_device *dev,
>  	u32 ht_ielen = 0;
>  	char *p;
>  	u8 ht_cap = false;
> -	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
> +	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
>  	struct wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
>  	u8 *prates;
>
> @@ -1494,7 +1494,7 @@ static int r8711_wx_set_enc(struct net_device *dev,
>  	u32 keyindex_provided;
>  	struct NDIS_802_11_WEP	 wep;
>  	enum NDIS_802_11_AUTHENTICATION_MODE authmode;
> -	struct iw_point *erq = &(wrqu->encoding);
> +	struct iw_point *erq = &wrqu->encoding;
>  	struct _adapter *padapter = netdev_priv(dev);
>
>  	key = erq->flags & IW_ENCODE_INDEX;
> @@ -1589,8 +1589,8 @@ static int r8711_wx_get_enc(struct net_device *dev,
>  {
>  	uint key;
>  	struct _adapter *padapter = netdev_priv(dev);
> -	struct iw_point *erq = &(wrqu->encoding);
> -	struct	mlme_priv	*pmlmepriv = &(padapter->mlmepriv);
> +	struct iw_point *erq = &wrqu->encoding;
> +	struct	mlme_priv	*pmlmepriv = &padapter->mlmepriv;
>  	union Keytype *dk = padapter->securitypriv.DefKey;
>
>  	if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
> @@ -1670,7 +1670,7 @@ static int r871x_wx_set_auth(struct net_device *dev,
>  				union iwreq_data *wrqu, char *extra)
>  {
>  	struct _adapter *padapter = netdev_priv(dev);
> -	struct iw_param *param = (struct iw_param *)&(wrqu->param);
> +	struct iw_param *param = (struct iw_param *)&wrqu->param;
>  	int paramid;
>  	int paramval;
>  	int ret = 0;
> @@ -1964,7 +1964,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>  		return -EINVAL;
>  	data[32] = 0;
>
> -	spin_lock_irqsave(&(pmlmepriv->scanned_queue.lock), irqL);
> +	spin_lock_irqsave(&pmlmepriv->scanned_queue.lock, irqL);
>  	phead = &queue->queue;
>  	plist = phead->next;
>  	while (1) {
> @@ -1974,7 +1974,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>  		if (!mac_pton(data, bssid)) {
>  			netdev_info(dev, "r8712u: Invalid BSSID '%s'.\n",
>  				    (u8 *)data);
> -			spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock),
> +			spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock,
>  					       irqL);
>  			return -EINVAL;
>  		}
> @@ -1996,7 +1996,7 @@ static int r871x_get_ap_info(struct net_device *dev,
>  		}
>  		plist = plist->next;
>  	}
> -	spin_unlock_irqrestore(&(pmlmepriv->scanned_queue.lock), irqL);
> +	spin_unlock_irqrestore(&pmlmepriv->scanned_queue.lock, irqL);
>  	if (pdata->length >= 34) {
>  		if (copy_to_user((u8 __user *)pdata->pointer + 32,
>  		    (u8 *)&pdata->flags, 1))
> --
> 2.35.1
>
>
>
