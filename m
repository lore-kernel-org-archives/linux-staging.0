Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85C5251
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8bWY9z2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e2308198dso455212a12.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697905490; x=1698510290; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zM4j+UWtHyAIeUJSqcofDKhmj9PliyjRNP0hCeOXAZA=;
        b=K8bWY9z2qfWGSUtbP8SrWimkLkM8ghmxZi4Wyy6V2pRDtlsAeWbhVXL/Ru9tMXm3b/
         L2Mwf9oDaLKo4Rw1crTZCkyfTxrH5R0EgN4xd96LduCCAr7orubpcVai7SAYwkxH2mH/
         cknpxS33XeVGeaD7rn0kfJQ1u7GyzewCbNriuAVr6eGVu7jq97Tj7FeRGhTnHuklTCXK
         ro8ax945x5dzMTog5TFQoe44TDPFboxBrNqscKzvMJx5mIzzG5HWeVuJO4YfmgwZXdBU
         hYPK0LiZ0Puix0TkjB3uPWzoENOFXMZPPP2zaxm1cSi1hs1H/5haJEUjvxAVREY7iTFd
         J+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697905490; x=1698510290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM4j+UWtHyAIeUJSqcofDKhmj9PliyjRNP0hCeOXAZA=;
        b=FNwc1a1lTjSJqVtrFRQGiqwi7z+DEAeVu1l6H6Q5/DtqjHWnFZcwAXCDPNKhLMPvVy
         NKkTu0ajigw/0sId7U0+UVsb0+dxQ2SX79jYm6vHQ58Bh5kfQ8wNPoJFlC1WP99dH85m
         nL3IzV13AzCX36iwVbfiCHEtAwdvh1jbR02Lh0VtfhliSNKgrMwEYgsDC1D7qXA54fzH
         0awt3/59cDhL97AkDFsLvFwx4M+jlYZdLTZBbH9CK74NMAvwFQlGiL1cLc8CB0AcDjHk
         51qVZL2fm05OSv0L4ladZar+XZfBMOj0s4rgAsMxVuy1cRsWuSCRPvekQuPBGNW9pAUa
         n76w==
X-Gm-Message-State: AOJu0YzN9ECH7wMEyDKPUsP3XLE3JywsLCgSQvI32+dHc7QqTc5X6kHR
	K04BLuu4iKOg+ui3dPvz/ZA=
X-Google-Smtp-Source: AGHT+IE4kCNgQuqBd5RS78AC6aI29gAYnwhpNNAiOE0xr+IbsDCnF7gnbml1SQ4tgtTKOCQ7u2R/AQ==
X-Received: by 2002:a17:906:2250:b0:9bd:cab6:a34b with SMTP id 16-20020a170906225000b009bdcab6a34bmr4118802ejr.0.1697905489772;
        Sat, 21 Oct 2023 09:24:49 -0700 (PDT)
Received: from [192.168.0.103] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id pw7-20020a17090720a700b00992ea405a79sm3814585ejb.166.2023.10.21.09.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 09:24:49 -0700 (PDT)
Message-ID: <29f6c726-fcf2-43c7-a638-a551338a1dad@gmail.com>
Date: Sat, 21 Oct 2023 18:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: clean up comparisons to NULL
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231021121947.14516-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231021121947.14516-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/23 14:19, Michael Straube wrote:
> Clean up comparisons to NULL to improve readability.
> Reported by checkpatch.
> 
> if (x == NULL) -> if (!x)
> if (x != NULL) -> if (x)
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> Compile tested only, due to missing hardware.
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_phy.c    |  2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |  2 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  2 +-
>   drivers/staging/rtl8192e/rtllib_crypt_ccmp.c  |  2 +-
>   drivers/staging/rtl8192e/rtllib_crypt_wep.c   |  2 +-
>   drivers/staging/rtl8192e/rtllib_rx.c          | 24 +++++++++----------
>   drivers/staging/rtl8192e/rtllib_softmac.c     |  2 +-
>   7 files changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> index bc06c2cab35d..a5e16bf99cd6 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
> @@ -513,7 +513,7 @@ static u8 _rtl92e_phy_set_sw_chnl_cmd_array(struct net_device *dev,
>   {
>   	struct sw_chnl_cmd *pCmd;
>   
> -	if (CmdTable == NULL) {
> +	if (!CmdTable) {
>   		netdev_err(dev, "%s(): CmdTable cannot be NULL.\n", __func__);
>   		return false;
>   	}
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index 9b280cee0ac1..76ec4ed967c4 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -112,7 +112,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
>   			rtl92e_writel(dev, WCAMI, TargetContent);
>   			rtl92e_writel(dev, RWCAM, TargetCommand);
>   		} else {
> -			if (KeyContent != NULL) {
> +			if (KeyContent) {
>   				rtl92e_writel(dev, WCAMI,
>   					      (u32)(*(KeyContent + i - 2)));
>   				rtl92e_writel(dev, RWCAM, TargetCommand);
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index ec8e7d5fe634..4371ab1239ee 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -805,7 +805,7 @@ static int _rtl92e_wx_get_gen_ie(struct net_device *dev,
>   	struct r8192_priv *priv = rtllib_priv(dev);
>   	struct rtllib_device *ieee = priv->rtllib;
>   
> -	if (ieee->wpa_ie_len == 0 || ieee->wpa_ie == NULL) {
> +	if (ieee->wpa_ie_len == 0 || !ieee->wpa_ie) {
>   		data->data.length = 0;
>   		return 0;
>   	}
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> index 5621261d66b9..cbb8c8dbe9b0 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
> @@ -52,7 +52,7 @@ static void *rtllib_ccmp_init(int key_idx)
>   	struct rtllib_ccmp_data *priv;
>   
>   	priv = kzalloc(sizeof(*priv), GFP_ATOMIC);
> -	if (priv == NULL)
> +	if (!priv)
>   		goto fail;
>   	priv->key_idx = key_idx;
>   
> diff --git a/drivers/staging/rtl8192e/rtllib_crypt_wep.c b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> index 062285e4d939..21c2b7666d6f 100644
> --- a/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> +++ b/drivers/staging/rtl8192e/rtllib_crypt_wep.c
> @@ -35,7 +35,7 @@ static void *prism2_wep_init(int keyidx)
>   		return NULL;
>   
>   	priv = kzalloc(sizeof(*priv), GFP_ATOMIC);
> -	if (priv == NULL)
> +	if (!priv)
>   		return NULL;
>   	priv->key_idx = keyidx;
>   
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index 124c1651856b..ecaa4dec3f94 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -63,7 +63,7 @@ rtllib_frag_cache_find(struct rtllib_device *ieee, unsigned int seq,
>   
>   	for (i = 0; i < RTLLIB_FRAG_CACHE_LEN; i++) {
>   		entry = &ieee->frag_cache[tid][i];
> -		if (entry->skb != NULL &&
> +		if (entry->skb &&
>   		    time_after(jiffies, entry->first_frag_time + 2 * HZ)) {
>   			netdev_dbg(ieee->dev,
>   				   "expiring fragment cache entry seq=%u last_frag=%u\n",
> @@ -72,7 +72,7 @@ rtllib_frag_cache_find(struct rtllib_device *ieee, unsigned int seq,
>   			entry->skb = NULL;
>   		}
>   
> -		if (entry->skb != NULL && entry->seq == seq &&
> +		if (entry->skb && entry->seq == seq &&
>   		    (entry->last_frag + 1 == frag || frag == -1) &&
>   		    memcmp(entry->src_addr, src, ETH_ALEN) == 0 &&
>   		    memcmp(entry->dst_addr, dst, ETH_ALEN) == 0)
> @@ -130,7 +130,7 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
>   		if (ieee->frag_next_idx[tid] >= RTLLIB_FRAG_CACHE_LEN)
>   			ieee->frag_next_idx[tid] = 0;
>   
> -		if (entry->skb != NULL)
> +		if (entry->skb)
>   			dev_kfree_skb_any(entry->skb);
>   
>   		entry->first_frag_time = jiffies;
> @@ -145,7 +145,7 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
>   		 */
>   		entry = rtllib_frag_cache_find(ieee, seq, frag, tid, hdr->addr2,
>   						  hdr->addr1);
> -		if (entry != NULL) {
> +		if (entry) {
>   			entry->last_frag = frag;
>   			skb = entry->skb;
>   		}
> @@ -184,7 +184,7 @@ static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
>   	entry = rtllib_frag_cache_find(ieee, seq, -1, tid, hdr->addr2,
>   					  hdr->addr1);
>   
> -	if (entry == NULL) {
> +	if (!entry) {
>   		netdev_dbg(ieee->dev,
>   			   "Couldn't invalidate fragment cache entry (seq=%u)\n",
>   			   seq);
> @@ -276,7 +276,7 @@ rtllib_rx_frame_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
>   	struct ieee80211_hdr *hdr;
>   	int res, hdrlen;
>   
> -	if (crypt == NULL || crypt->ops->decrypt_mpdu == NULL)
> +	if (!crypt || !crypt->ops->decrypt_mpdu)
>   		return 0;
>   
>   	if (ieee->hwsec_active) {
> @@ -316,7 +316,7 @@ rtllib_rx_frame_decrypt_msdu(struct rtllib_device *ieee, struct sk_buff *skb,
>   	struct ieee80211_hdr *hdr;
>   	int res, hdrlen;
>   
> -	if (crypt == NULL || crypt->ops->decrypt_msdu == NULL)
> +	if (!crypt || !crypt->ops->decrypt_msdu)
>   		return 0;
>   	if (ieee->hwsec_active) {
>   		struct cb_desc *tcb_desc = (struct cb_desc *)
> @@ -998,8 +998,7 @@ static int rtllib_rx_get_crypt(struct rtllib_device *ieee, struct sk_buff *skb,
>   	/* allow NULL decrypt to indicate an station specific override
>   	 * for default encryption
>   	 */
> -	if (*crypt && ((*crypt)->ops == NULL ||
> -		      (*crypt)->ops->decrypt_mpdu == NULL))
> +	if (*crypt && (!(*crypt)->ops || !(*crypt)->ops->decrypt_mpdu))
>   		*crypt = NULL;
>   
>   	if (!*crypt && (fc & IEEE80211_FCTL_PROTECTED)) {
> @@ -1171,7 +1170,7 @@ static void rtllib_rx_indicate_pkt_legacy(struct rtllib_device *ieee,
>   	u16 ethertype;
>   	int i = 0;
>   
> -	if (rxb == NULL) {
> +	if (!rxb) {
>   		netdev_info(dev, "%s: rxb is NULL!!\n", __func__);
>   		return;
>   	}
> @@ -1369,7 +1368,7 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
>   	rtllib_rx_check_leave_lps(ieee, unicast, nr_subframes);
>   
>   	/* Indicate packets to upper layer or Rx Reorder */
> -	if (!ieee->ht_info->cur_rx_reorder_enable || ts == NULL)
> +	if (!ieee->ht_info->cur_rx_reorder_enable || !ts)
>   		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
>   	else
>   		RxReorderIndicatePacket(ieee, rxb, ts, SeqNum);
> @@ -2510,8 +2509,7 @@ static inline void rtllib_process_probe_response(
>   		if (is_same_network(target, network,
>   		   (target->ssid_len ? 1 : 0)))
>   			break;
> -		if ((oldest == NULL) ||
> -		    (target->last_scanned < oldest->last_scanned))
> +		if (!oldest || (target->last_scanned < oldest->last_scanned))
>   			oldest = target;
>   	}
>   
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index ff98b41c94e0..42d652fe8601 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -918,7 +918,7 @@ rtllib_association_req(struct rtllib_network *beacon,
>   	int len = 0;
>   
>   	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
> -	if (crypt != NULL)
> +	if (crypt)
>   		encrypt = crypt && crypt->ops &&
>   			  ((strcmp(crypt->ops->name, "R-WEP") == 0 ||
>   			  wpa_ie_len));


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
