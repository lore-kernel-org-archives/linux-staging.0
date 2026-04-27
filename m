Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B826D4F7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269057; cv=none; b=TzHWafvfiB58+9zKrpH17ZIXulE9yODDkx1WUvpw3033RH4qHCbMMQAvs/1vfgir2Gw0HSg43GMD4eZRcDqvkESldp5Ys9oxJrXhOeALwBaPEnckHpSr8WiJVXJPwuT+3c4s/aqNJGWe7MutaiXGL6eL8uW7sTN2ornEkDPop1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269057; c=relaxed/simple;
	bh=E5ycvYj9DHpM/TkWe1akPlffm2vLT4PJixMuwG45TEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dNEXtCtNtR385ZDDH1wGbVp+FNM089/dD4iALVq1KZ9SkdsOl6Rm6nzF1ywVL5+JDDdBw3HMHpbsBza0LSle4XQ2xowrMdh55nS/p037kCVoB5mNkTM2FllI74mWePgiut/6tvhWh01Y+COyjxe8oH7YAeeKL+Ld0oYEX5j207w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ukClG5Bb; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ukClG5Bb"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777269051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sPpJwoI17yxowyGWDhSmRnAV1VtXKZ2+Q3fy1pcaJ5o=;
	b=ukClG5Bb1uOXr70Z1ea4RgGt6JPweO3H/NLKuClJqaeC3B6tvp2+DXQtvXj+9wMwFHw70p
	pMd+5pkKve6cdP+D0tynaaLx5ABeO/dWCqA+azFuzo2NpFEo0WXv3A9TBM90gV5qUNYdRI
	AxvmIpx/yXeCF5oxpUHRQ6DgxCBKwqE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 07:50:46 +0200
Message-Id: <DI3PAOMCIRAL.3FHL3M7JUSBXT@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <gregkh@linuxfoundation.org>
Cc: <luka.gejak@linux.dev>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] staging: rtl8723bs: rtw_mlme: fix lines
 exceeding 100 columns
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-3-me@cipherat.com>
In-Reply-To: <20260426225552.87114-3-me@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 27, 2026 at 12:54 AM CEST, Salman Alghamdi wrote:
> Wrap long lines and extract local variables to bring all lines
> within the 100 column limit.
>
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 284 +++++++++++++++-------
>  1 file changed, 201 insertions(+), 83 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index 268f294528e6..cdc631464565 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -52,7 +52,10 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
>  	pmlmepriv->pscanned =3D NULL;
>  	pmlmepriv->fw_state =3D WIFI_STATION_STATE; /*  Must sync with rtw_wdev=
_alloc() */
>  	pmlmepriv->cur_network.network.infrastructure_mode =3D Ndis802_11AutoUn=
known;
> -	pmlmepriv->scan_mode =3D SCAN_ACTIVE;/*  1: active, 0: passive. Maybe s=
omeday we should rename this varable to "active_mode" (Jeff) */
> +	/*  1: active, 0: passive. Maybe someday we should rename
> +	 *  this varable to "active_mode" (Jeff)
> +	 */
> +	pmlmepriv->scan_mode =3D SCAN_ACTIVE;
> =20
>  	spin_lock_init(&pmlmepriv->lock);
>  	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);
> @@ -125,7 +128,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pml=
mepriv)
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon=
_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_pro=
be_req_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_pr=
obe_resp_ie_len);
> -	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p=
_go_probe_resp_ie_len);
> +	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
> +			      &pmlmepriv->p2p_go_probe_resp_ie_len);
>  	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_ass=
oc_req_ie_len);
>  }
> =20
> @@ -369,7 +373,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct=
 wlan_bssid_ex *dst, u8 fea
>  			(d_cap & WLAN_CAPABILITY_ESS));
>  }
> =20
> -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queu=
e, struct wlan_network *network)
> +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queu=
e,
> +					    struct wlan_network *network)
					    ^^^^^
This is not aligned correctly again. Please align it as following:
struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
					    struct wlan_network *network)

>  {
>  	struct list_head *phead, *plist;
>  	struct wlan_network *found =3D NULL;
> @@ -420,7 +425,8 @@ void update_network(struct wlan_bssid_ex *dst, struct=
 wlan_bssid_ex *src,
>  	long rssi_final;
> =20
>  	/* The rule below is 1/5 for sample value, 4/5 for history value */
> -	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&=
padapter->mlmepriv.cur_network.network, src, 0)) {
> +	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
> +	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
>  		/* Take the recvpriv's value for the connected AP*/
>  		ss_final =3D padapter->recvpriv.signal_strength;
>  		sq_final =3D padapter->recvpriv.signal_qual;
> @@ -431,11 +437,15 @@ void update_network(struct wlan_bssid_ex *dst, stru=
ct wlan_bssid_ex *src,
>  			rssi_final =3D rssi_ori;
>  	} else {
>  		if (sq_smp !=3D 101) { /* from the right channel */
> -			ss_final =3D ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_i=
nfo.signal_strength) * 4) / 5;
> -			sq_final =3D ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_in=
fo.signal_quality) * 4) / 5;
> +			ss_final =3D ((u32)(src->phy_info.signal_strength) +
> +				    (u32)(dst->phy_info.signal_strength) * 4) / 5;
> +			sq_final =3D ((u32)(src->phy_info.signal_quality) +
> +				    (u32)(dst->phy_info.signal_quality) * 4) / 5;
>  			rssi_final =3D (src->rssi + dst->rssi * 4) / 5;
>  		} else {
> -			/* bss info not receiving from the right channel, use the original RX=
 signal infos */
> +			/* bss info not receiving from the right channel, use
> +			 * the original RX signal infos
> +			 */
>  			ss_final =3D dst->phy_info.signal_strength;
>  			sq_final =3D dst->phy_info.signal_quality;
>  			rssi_final =3D dst->rssi;
> @@ -462,13 +472,18 @@ static void update_current_network(struct adapter *=
adapter, struct wlan_bssid_ex
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network);
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv=
->cur_network.network, pnetwork, 0))) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
> +	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
> +		u32 ie_len;
> +		u8 *ie;
> +
>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, tru=
e);
> -		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_=
11_fix_ie))
> +		ie_len =3D pmlmepriv->cur_network.network.ie_length;
> +		if (ie_len < sizeof(struct ndis_802_11_fix_ie))
>  			return;
> =20
> -		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + =
sizeof(struct ndis_802_11_fix_ie),
> -								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_80=
2_11_fix_ie));
> +		ie =3D pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_11_=
fix_ie);
> +		rtw_update_protection(adapter, ie, ie_len - sizeof(struct ndis_802_11_=
fix_ie));
>  	}
>  }
> =20
> @@ -604,7 +619,16 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  	privacy =3D pnetwork->network.privacy;
> =20
>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
> -		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork=
->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
> +		u8 *ie_ptr;
> +		u32 ie_len_val;
> +
> +		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
> +			return false;
> +
> +		ie_ptr =3D pnetwork->network.ies + _FIXED_IE_LENGTH_;
> +		ie_len_val =3D pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> +
> +		if (rtw_get_wps_ie(ie_ptr, ie_len_val, NULL, &wps_ielen))
>  			return true;
>  		else
>  			return false;
> @@ -617,11 +641,20 @@ static bool rtw_is_desired_network(struct adapter *=
adapter, struct wlan_network
>  			bselected =3D false;
> =20
>  		if (psecuritypriv->ndisauthtype =3D=3D Ndis802_11AuthModeWPA2PSK) {
> -			p =3D rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID=
_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
> -			if (p && ie_len > 0)
> -				bselected =3D true;
> -			else
> +			u8 *ie_ptr;
> +			u32 ie_len_val;
> +
> +			if (pnetwork->network.ie_length < _BEACON_IE_OFFSET_) {
>  				bselected =3D false;
> +			} else {
> +				ie_ptr =3D pnetwork->network.ies + _BEACON_IE_OFFSET_;
> +				ie_len_val =3D pnetwork->network.ie_length - _BEACON_IE_OFFSET_;
> +				p =3D rtw_get_ie(ie_ptr, WLAN_EID_RSN, &ie_len, ie_len_val);
> +				if (p && ie_len > 0)
> +					bselected =3D true;
> +				else
> +					bselected =3D false;
> +			}
>  		}
>  	}
> =20
> @@ -629,7 +662,13 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  		bselected =3D false;
> =20
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
> -		if (pnetwork->network.infrastructure_mode !=3D pmlmepriv->cur_network.=
network.infrastructure_mode)
> +		enum ndis_802_11_network_infrastructure inf_mode;
> +		enum ndis_802_11_network_infrastructure cur_inf;
> +
> +		inf_mode =3D pnetwork->network.infrastructure_mode;
> +		cur_inf =3D pmlmepriv->cur_network.network.infrastructure_mode;
> +
> +		if (inf_mode !=3D cur_inf)
>  			bselected =3D false;
>  	}
> =20
> @@ -657,12 +696,14 @@ void rtw_survey_event_callback(struct adapter	*adap=
ter, u8 *pbuf)
> =20
>  	/*  update IBSS_network 's timestamp */
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
> -		if (!memcmp(&pmlmepriv->cur_network.network.mac_address, pnetwork->mac=
_address, ETH_ALEN)) {
> +		if (!memcmp(&pmlmepriv->cur_network.network.mac_address,
> +			    pnetwork->mac_address, ETH_ALEN)) {
>  			struct wlan_network *ibss_wlan =3D NULL;
> =20
>  			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> -			ibss_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->=
mac_address);
> +			ibss_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +						     pnetwork->mac_address);
>  			if (ibss_wlan) {
>  				memcpy(ibss_wlan->network.ies, pnetwork->ies, 8);
>  				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
> @@ -713,13 +754,17 @@ void rtw_surveydone_event_callback(struct adapter	*=
adapter, u8 *pbuf)
>  					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
>  				} else {
>  					u8 ret =3D _SUCCESS;
> -					struct wlan_bssid_ex    *pdev_network =3D &adapter->registrypriv.de=
v_network;
> -					u8 *pibss =3D adapter->registrypriv.dev_network.mac_address;
> +					struct registry_priv *regs =3D &adapter->registrypriv;
> +					struct wlan_bssid_ex *pdev_network =3D &regs->dev_network;
> +					u8 *pibss =3D regs->dev_network.mac_address;
> =20
> -					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;because don't set asso=
c_timer */
> +					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;
> +					 * because don't set assoc_timer
> +					 */
>  					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
> =20
> -					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct n=
dis_802_11_ssid));
> +					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
> +					       sizeof(struct ndis_802_11_ssid));
> =20
>  					rtw_update_registrypriv_dev_network(adapter);
>  					rtw_generate_random_ibss(pibss);
> @@ -746,9 +791,13 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  				rtw_indicate_connect(adapter);
>  			} else {
>  				if (rtw_to_roam(adapter) !=3D 0) {
> -					if (rtw_dec_to_roam(adapter) =3D=3D 0
> -						|| _SUCCESS !=3D rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssi=
d, 1, NULL, 0)
> -					) {
> +					if (rtw_dec_to_roam(adapter) =3D=3D 0) {
> +						rtw_set_to_roam(adapter, 0);
> +						rtw_free_assoc_resources(adapter, 1);
> +						rtw_indicate_disconnect(adapter);
> +					} else if (rtw_sitesurvey_cmd(adapter,
> +								      &pmlmepriv->assoc_ssid,
> +								      1, NULL, 0) !=3D _SUCCESS) {
>  						rtw_set_to_roam(adapter, 0);
>  						rtw_free_assoc_resources(adapter, 1);
>  						rtw_indicate_disconnect(adapter);
> @@ -766,8 +815,10 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
>  				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
>  				if (rtw_select_roaming_candidate(pmlmepriv) =3D=3D _SUCCESS) {
> -					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_addr=
ess
> -						, WLAN_REASON_ACTIVE_ROAM);
> +					u8 *mac_addr =3D pmlmepriv->cur_network.network.mac_address;
> +
> +					receive_disconnect(adapter, mac_addr,
> +							   WLAN_REASON_ACTIVE_ROAM);
>  				}
>  			}
>  		}
> @@ -951,7 +1002,8 @@ void rtw_scan_abort(struct adapter *adapter)
>  	pmlmeext->scan_abort =3D false;
>  }
> =20
> -static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padap=
ter, struct wlan_network *pnetwork)
> +static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padap=
ter,
> +						   struct wlan_network *pnetwork)
						   ^^^^^
Again, wrong alignment.

>  {
>  	int i;
>  	struct sta_info *bmc_sta, *psta =3D NULL;
> @@ -1008,7 +1060,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(=
struct adapter *padapter, str
>  		}
> =20
>  		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
> -		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indic=
ate_seq) to default value =3D 0xffff */
> +		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indic=
ate_seq)
> +		 * to default value =3D 0xffff
> +		 */
>  		/* todo: check if AP can send A-MPDU packets */
>  		for (i =3D 0; i < 16 ; i++) {
>  			preorder_ctrl =3D &psta->recvreorder_ctrl[i];
> @@ -1025,7 +1079,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(=
struct adapter *padapter, str
>  				preorder_ctrl->enable =3D false;
>  				preorder_ctrl->indicate_seq =3D 0xffff;
>  				preorder_ctrl->wend_b =3D 0xffff;
> -				preorder_ctrl->wsize_b =3D 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsiz=
e_b =3D32 */
> +				/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =3D32 */
> +				preorder_ctrl->wsize_b =3D 64;
>  			}
>  		}
>  	}
> @@ -1035,10 +1090,12 @@ static struct sta_info *rtw_joinbss_update_stainf=
o(struct adapter *padapter, str
> =20
>  /* pnetwork : returns from rtw_joinbss_event_callback */
>  /* ptarget_wlan: found from scanned_queue */
> -static void rtw_joinbss_update_network(struct adapter *padapter, struct =
wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
> +static void rtw_joinbss_update_network(struct adapter *padapter, struct =
wlan_network *ptarget_wlan,
> +				       struct wlan_network  *pnetwork)

Same here, wrong alignment.

>  {
>  	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>  	struct wlan_network  *cur_network =3D &pmlmepriv->cur_network;
> +	u8 signal_strength =3D ptarget_wlan->network.phy_info.signal_strength;
> =20
>  	/*  why not use ptarget_wlan?? */
>  	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.len=
gth);
> @@ -1050,10 +1107,12 @@ static void rtw_joinbss_update_network(struct ada=
pter *padapter, struct wlan_net
> =20
>  	rtw_set_signal_stat_timer(&padapter->recvpriv);
> =20
> -	padapter->recvpriv.signal_strength =3D ptarget_wlan->network.phy_info.s=
ignal_strength;
> +	padapter->recvpriv.signal_strength =3D signal_strength;
>  	padapter->recvpriv.signal_qual =3D ptarget_wlan->network.phy_info.signa=
l_quality;
> -	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->net=
work.phy_info.signal_strength instead (has scaled) */
> -	padapter->recvpriv.rssi =3D translate_percentage_to_dbm(ptarget_wlan->n=
etwork.phy_info.signal_strength);
> +	/* the ptarget_wlan->network.rssi is raw data, we use
> +	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
> +	 */
> +	padapter->recvpriv.rssi =3D translate_percentage_to_dbm(signal_strength=
);
> =20
>  	rtw_set_signal_stat_timer(&padapter->recvpriv);
> =20
> @@ -1078,10 +1137,12 @@ static void rtw_joinbss_update_network(struct ada=
pter *padapter, struct wlan_net
>  	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
>  		return;
> =20
> -	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(str=
uct ndis_802_11_fix_ie),
> -									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix=
_ie)));
> +	rtw_update_protection(padapter,
> +			      (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
> +			      (cur_network->network.ie_length - sizeof(struct ndis_802_11_fix=
_ie)));
> =20
> -	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->netw=
ork.ie_length, (u8) cur_network->network.configuration.ds_config);
> +	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->netw=
ork.ie_length,
> +			  (u8)cur_network->network.configuration.ds_config);
>  }
> =20
>  static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
> @@ -1101,9 +1162,12 @@ void rtw_reset_securitypriv(struct adapter *adapte=
r)
>  		/*  We have to backup the PMK information for WiFi PMK Caching test it=
em. */
>  		/*  */
>  		/*  Backup the btkip_countermeasure information. */
> -		/*  When the countermeasure is trigger, the driver have to disconnect =
with AP for 60 seconds. */
> +		/*  When the countermeasure is trigger, the driver have to
> +		 *  disconnect with AP for 60 seconds.
> +		 */
> =20
> -		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeo=
f(struct rt_pmkid_list) * NUM_PMKID_CACHE);
> +		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0],
> +		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
>  		backupPMKIDIndex =3D adapter->securitypriv.PMKIDIndex;
>  		backupTKIPCountermeasure =3D adapter->securitypriv.btkip_countermeasur=
e;
>  		backupTKIPcountermeasure_time =3D adapter->securitypriv.btkip_counterm=
easure_time;
> @@ -1114,8 +1178,11 @@ void rtw_reset_securitypriv(struct adapter *adapte=
r)
>  		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct secur=
ity_priv));
> =20
>  		/*  Added by Albert 2009/02/18 */
> -		/*  Restore the PMK information to securitypriv structure for the foll=
owing connection. */
> -		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeo=
f(struct rt_pmkid_list) * NUM_PMKID_CACHE);
> +		/*  Restore the PMK information to securitypriv structure
> +		 * for the following connection.
> +		 */

This is not aligned correctly either. f from from should go under R from
Restore:
/*  Restore the PMK information to securitypriv structure
 *  for the following connection.
 */

> +		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
> +		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
>  		adapter->securitypriv.PMKIDIndex =3D backupPMKIDIndex;
>  		adapter->securitypriv.btkip_countermeasure =3D backupTKIPCountermeasur=
e;
>  		adapter->securitypriv.btkip_countermeasure_time =3D backupTKIPcounterm=
easure_time;
> @@ -1147,9 +1214,13 @@ void rtw_reset_securitypriv(struct adapter *adapte=
r)
>  /* Notes: the function could be > passive_level (the same context as Rx =
tasklet) */
>  /* pnetwork : returns from rtw_joinbss_event_callback */
>  /* ptarget_wlan: found from scanned_queue */
> -/* if join_res > 0, for (fw_state =3D=3DWIFI_STATION_STATE), we check if=
  "ptarget_sta" & "ptarget_wlan" exist. */
> +/* if join_res > 0, for (fw_state =3D=3DWIFI_STATION_STATE), we check
> + * if "ptarget_sta" & "ptarget_wlan" exist.
> + */
>  /* if join_res > 0, for (fw_state =3D=3DWIFI_ADHOC_STATE), we only check=
 if "ptarget_wlan" exist. */
> -/* if join_res > 0, update "cur_network->network" from "pnetwork->networ=
k" if (ptarget_wlan !=3D NULL). */
> +/* if join_res > 0, update "cur_network->network" from
> + * "pnetwork->network" if (ptarget_wlan !=3D NULL).
> + */
>  /*  */
>  void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  {
> @@ -1161,7 +1232,8 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
apter, u8 *pbuf)
>  	struct wlan_network	*pcur_wlan =3D NULL, *ptarget_wlan =3D NULL;
>  	unsigned int		the_same_macaddr =3D false;
> =20
> -	the_same_macaddr =3D !memcmp(pnetwork->network.mac_address, cur_network=
->network.mac_address, ETH_ALEN);
> +	the_same_macaddr =3D !memcmp(pnetwork->network.mac_address,
> +				   cur_network->network.mac_address, ETH_ALEN);
> =20
>  	pnetwork->network.length =3D get_wlan_bssid_ex_sz(&pnetwork->network);
>  	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
> @@ -1201,9 +1273,11 @@ void rtw_joinbss_event_prehandle(struct adapter *a=
dapter, u8 *pbuf)
>  	/* s1. find ptarget_wlan */
>  	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>  		if (the_same_macaddr) {
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +							cur_network->network.mac_address);
>  		} else {
> -			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_network=
->network.mac_address);
> +			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +						     cur_network->network.mac_address);
>  			if (pcur_wlan)
>  				pcur_wlan->fixed =3D false;
> =20
> @@ -1211,7 +1285,8 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
apter, u8 *pbuf)
>  			if (pcur_sta)
>  				rtw_free_stainfo(adapter, pcur_sta);
> =20
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, pnetwork=
->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +							pnetwork->network.mac_address);
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>  				if (ptarget_wlan)
>  					ptarget_wlan->fixed =3D true;
> @@ -1236,7 +1311,9 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
apter, u8 *pbuf)
> =20
>  	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
> =20
> -	/* s3. find ptarget_sta & update ptarget_sta after update cur_network o=
nly for station mode */
> +	/* s3. find ptarget_sta & update ptarget_sta after
> +	 * update cur_network only for station mode
> +	 */
>  	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>  		ptarget_sta =3D rtw_joinbss_update_stainfo(adapter, pnetwork);
>  		if (!ptarget_sta) {
> @@ -1304,7 +1381,8 @@ void rtw_stassoc_event_callback(struct adapter *ada=
pter, u8 *pbuf)
>  			/* report to upper layer */
>  			spin_lock_bh(&psta->lock);
>  			if (psta->passoc_req && psta->assoc_req_len > 0) {
> -				passoc_req =3D kmemdup(psta->passoc_req, psta->assoc_req_len, GFP_AT=
OMIC);
> +				passoc_req =3D kmemdup(psta->passoc_req,
> +						     psta->assoc_req_len, GFP_ATOMIC);
>  				if (passoc_req) {
>  					assoc_req_len =3D psta->assoc_req_len;
> =20
> @@ -1329,7 +1407,10 @@ void rtw_stassoc_event_callback(struct adapter *ad=
apter, u8 *pbuf)
>  	if (psta) {
>  		/* the sta have been in sta_info_queue =3D> do nothing */
> =20
> -		return; /* between drv has received this event before and  fw have not=
 yet to set key to CAM_ENTRY) */
> +		/* between drv has received this event before and
> +		 * fw have not yet to set key to CAM_ENTRY)
> +		 */
> +		return;
>  	}
> =20
>  	psta =3D rtw_alloc_stainfo(&adapter->stapriv, pstassoc->macaddr);
> @@ -1356,7 +1437,8 @@ void rtw_stassoc_event_callback(struct adapter *ada=
pter, u8 *pbuf)
>  	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		if (adapter->stapriv.asoc_sta_count =3D=3D 2) {
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +							cur_network->network.mac_address);
>  			pmlmepriv->cur_network_scanned =3D ptarget_wlan;
>  			if (ptarget_wlan)
>  				ptarget_wlan->fixed =3D true;
> @@ -1413,16 +1495,19 @@ void rtw_stadel_event_callback(struct adapter *ad=
apter, u8 *pbuf)
> =20
>  		if (adapter->registrypriv.wifi_spec =3D=3D 1) {
>  			roam =3D false;
> -		} else if (reason =3D=3D WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_fl=
ags(adapter, RTW_ROAM_ON_EXPIRED)) {
> +		} else if (reason =3D=3D WLAN_REASON_EXPIRATION_CHK &&
> +			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
>  			roam =3D true;
> -		} else if (reason =3D=3D WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags=
(adapter, RTW_ROAM_ACTIVE)) {
> +		} else if (reason =3D=3D WLAN_REASON_ACTIVE_ROAM &&
> +			   rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
>  			roam =3D true;
>  			roam_target =3D pmlmepriv->roam_network;
>  		}
> =20
>  		if (roam) {
>  			if (rtw_to_roam(adapter) > 0)
> -				rtw_dec_to_roam(adapter); /* this stadel_event is caused by roaming,=
 decrease to_roam */
> +				/* this stadel_event is caused by roaming, decrease to_roam */
> +				rtw_dec_to_roam(adapter);
>  			else if (rtw_to_roam(adapter) =3D=3D 0)
>  				rtw_set_to_roam(adapter, adapter->registrypriv.max_roaming_times);
>  		} else {
> @@ -1436,7 +1521,8 @@ void rtw_stadel_event_callback(struct adapter *adap=
ter, u8 *pbuf)
> =20
>  		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
>  		/*  remove the network entry in scanned_queue */
> -		pwlan =3D rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->net=
work.mac_address);
> +		pwlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +					 tgt_network->network.mac_address);
>  		if (pwlan) {
>  			pwlan->fixed =3D false;
>  			rtw_free_network_nolock(adapter, pwlan);
> @@ -1450,12 +1536,14 @@ void rtw_stadel_event_callback(struct adapter *ad=
apter, u8 *pbuf)
>  	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		rtw_free_stainfo(adapter,  psta);
> =20
> -		if (adapter->stapriv.asoc_sta_count =3D=3D 1) {/* a sta + bc/mc_stainf=
o (not Ibss_stainfo) */
> +		/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
> +		if (adapter->stapriv.asoc_sta_count =3D=3D 1) {
>  			u8 ret =3D _SUCCESS;
> =20
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
>  			/* free old ibss network */
> -			pwlan =3D rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->ne=
twork.mac_address);
> +			pwlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +						 tgt_network->network.mac_address);
>  			if (pwlan) {
>  				pwlan->fixed =3D false;
>  				rtw_free_network_nolock(adapter, pwlan);
> @@ -1465,9 +1553,11 @@ void rtw_stadel_event_callback(struct adapter *ada=
pter, u8 *pbuf)
>  			pdev_network =3D &adapter->registrypriv.dev_network;
>  			pibss =3D adapter->registrypriv.dev_network.mac_address;
> =20
> -			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt=
_network->network));
> +			memcpy(pdev_network, &tgt_network->network,
> +			       get_wlan_bssid_ex_sz(&tgt_network->network));
> =20
> -			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndi=
s_802_11_ssid));
> +			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
> +			       sizeof(struct ndis_802_11_ssid));
> =20
>  			rtw_update_registrypriv_dev_network(adapter);
> =20
> @@ -1538,7 +1628,9 @@ void _rtw_join_timeout_handler(struct timer_list *t=
)
>  		rtw_indicate_disconnect(adapter);
>  		free_scanqueue(pmlmepriv);/*  */
> =20
> -		/* indicate disconnect for the case that join_timeout and check_fwstat=
e !=3D FW_LINKED */
> +		/* indicate disconnect for the case that join_timeout
> +		 * and check_fwstate !=3D FW_LINKED
> +		 */
>  		rtw_cfg80211_indicate_disconnect(adapter);
>  	}
> =20
> @@ -1584,11 +1676,13 @@ void rtw_mlme_reset_auto_scan_int(struct adapter =
*adapter)
>  static void rtw_auto_scan_handler(struct adapter *padapter)
>  {
>  	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
> +	unsigned int elapsed_ms;
> =20
>  	rtw_mlme_reset_auto_scan_int(padapter);
> =20
> -	if (pmlmepriv->auto_scan_int_ms !=3D 0
> -		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv-=
>auto_scan_int_ms) {
> +	elapsed_ms =3D jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time);
> +
> +	if (pmlmepriv->auto_scan_int_ms !=3D 0 && elapsed_ms > pmlmepriv->auto_=
scan_int_ms) {
>  		if (!padapter->registrypriv.wifi_spec) {
>  			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
>  				goto exit;
> @@ -1630,7 +1724,9 @@ void rtw_dynamic_check_timer_handler(struct adapter=
 *adapter)
>  			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
>  			rtw_hal_dm_watchdog_in_lps(adapter);
>  		} else {
> -			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in traffic_s=
tatus_watchdog() */
> +			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
> +			 * in traffic_status_watchdog()
> +			 */
>  		}
> =20
>  	} else {
> @@ -1673,6 +1769,7 @@ static int rtw_check_roaming_candidate(struct mlme_=
priv *mlme
>  {
>  	int updated =3D false;
>  	struct adapter *adapter =3D container_of(mlme, struct adapter, mlmepriv=
);
> +	long rssi_diff;
> =20
>  	if (is_same_ess(&competitor->network, &mlme->cur_network.network) =3D=
=3D false)
>  		goto exit;
> @@ -1690,7 +1787,8 @@ static int rtw_check_roaming_candidate(struct mlme_=
priv *mlme
>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=3D mlme->roa=
m_scanr_exp_ms)
>  		goto exit;
> =20
> -	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi =
< mlme->roam_rssi_diff_th)
> +	rssi_diff =3D competitor->network.rssi - mlme->cur_network_scanned->net=
work.rssi;
> +	if (rssi_diff < mlme->roam_rssi_diff_th)
>  		goto exit;
> =20
>  	if (*candidate && (*candidate)->network.rssi >=3D competitor->network.r=
ssi)
> @@ -1763,9 +1861,12 @@ static int rtw_check_join_candidate(struct mlme_pr=
iv *mlme
> =20
>  	/* check ssid, if needed */
>  	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
> -		if (competitor->network.ssid.ssid_length !=3D mlme->assoc_ssid.ssid_le=
ngth
> -			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme-=
>assoc_ssid.ssid_length)
> -		)
> +		u8 *ssid_comp =3D competitor->network.ssid.ssid;
> +		u8 *ssid_mlme =3D mlme->assoc_ssid.ssid;
> +		u32 len_comp =3D competitor->network.ssid.ssid_length;
> +		u32 len_mlme =3D mlme->assoc_ssid.ssid_length;
> +
> +		if (len_comp !=3D len_mlme || memcmp(ssid_comp, ssid_mlme, len_mlme))
>  			goto exit;
>  	}
> =20
> @@ -1882,7 +1983,8 @@ signed int rtw_set_auth(struct adapter *adapter, st=
ruct security_priv *psecurity
>  	return res;
>  }
> =20
> -signed int rtw_set_key(struct adapter *adapter, struct security_priv *ps=
ecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
> +signed int rtw_set_key(struct adapter *adapter, struct security_priv *ps=
ecuritypriv,
> +		       signed int keyid, u8 set_tx, bool enqueue)
		       ^^^^^
Wrong alignment here too.

>  {
>  	u8 keylen;
>  	struct cmd_obj *pcmd;
> @@ -1957,7 +2059,8 @@ signed int rtw_set_key(struct adapter *adapter, str=
uct security_priv *psecurityp
>  }
> =20
>  /* adjust ies for rtw_joinbss_cmd in WMM */
> -int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, =
uint in_len, uint initial_out_len)
> +int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
> +			uint in_len, uint initial_out_len)
			^^^^^
Here as well.

>  {
>  	unsigned	int ielength =3D 0;
>  	unsigned int i, j;
> @@ -2061,7 +2164,8 @@ static void rtw_report_sec_ie(struct adapter *adapt=
er, u8 authmode, u8 *sec_ie)
> =20
>  		wrqu.data.length =3D p - buff;
> =20
> -		wrqu.data.length =3D (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.le=
ngth : IW_CUSTOM_MAX;
> +		wrqu.data.length =3D min_t(typeof(wrqu.data.length),
> +					 wrqu.data.length, IW_CUSTOM_MAX);
> =20
>  		kfree(buff);
>  	}
> @@ -2091,7 +2195,8 @@ signed int rtw_restruct_sec_ie(struct adapter *adap=
ter, u8 *in_ie, u8 *out_ie, u
>  		ielength +=3D psecuritypriv->wps_ie_len;
>  	} else if ((authmode =3D=3D WLAN_EID_VENDOR_SPECIFIC) || (authmode =3D=
=3D WLAN_EID_RSN)) {
>  		/* copy RSN or SSN */
> -		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecurityp=
riv->supplicant_ie[1] + 2);
> +		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0],
> +		       psecuritypriv->supplicant_ie[1] + 2);
>  		ielength +=3D psecuritypriv->supplicant_ie[1] + 2;
>  		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
>  	}
> @@ -2129,7 +2234,8 @@ void rtw_update_registrypriv_dev_network(struct ada=
pter *adapter)
>  	struct	security_priv *psecuritypriv =3D &adapter->securitypriv;
>  	struct	wlan_network	*cur_network =3D &adapter->mlmepriv.cur_network;
> =20
> -	pdev_network->privacy =3D (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 :=
 0) ; /*  adhoc no 802.1x */
> +	/*  adhoc no 802.1x */
> +	pdev_network->privacy =3D (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 :=
 0);
> =20
>  	pdev_network->rssi =3D 0;
> =20
> @@ -2159,14 +2265,18 @@ void rtw_update_registrypriv_dev_network(struct a=
dapter *adapter)
>  	/*  1. Supported rates */
>  	/*  2. IE */
> =20
> -	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv-=
>wireless_mode) ;  will be called in rtw_generate_ie */
> +	/* rtw_set_supported_rate(pdev_network->supported_rates,
> +	 * pregistrypriv->wireless_mode);  will be called in rtw_generate_ie
> +	 */
>  	sz =3D rtw_generate_ie(pregistrypriv);
> =20
>  	pdev_network->ie_length =3D sz;
> =20
>  	pdev_network->length =3D get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)=
pdev_network);
> =20
> -	/* notes: translate ie_length & length after assign the length to cmdsz=
 in createbss_cmd(); */
> +	/* notes: translate ie_length & length after assign the
> +	 * length to cmdsz in createbss_cmd();
> +	 */
>  	/* pdev_network->ie_length =3D cpu_to_le32(sz); */
>  }
> =20
> @@ -2178,7 +2288,9 @@ void rtw_joinbss_reset(struct adapter *padapter)
> =20
>  	struct ht_priv *phtpriv =3D &pmlmepriv->htpriv;
> =20
> -	/* todo: if you want to do something io/reg/hw setting before join_bss,=
 please add code here */
> +	/* todo: if you want to do something io/reg/hw setting before join_bss,
> +	 * please add code here
> +	 */
> =20
>  	pmlmepriv->num_FortyMHzIntolerant =3D 0;
> =20
> @@ -2268,7 +2380,8 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, =
u8 *out_ie, uint *pout_len)
>  }
> =20
>  /* the function is >=3D passive_level */
> -unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, =
u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
> +unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, =
u8 *out_ie,
> +				   uint in_len, uint *pout_len, u8 channel)
				   ^^^^^
Wrong alignment here as well.

>  {
>  	u32 ielen, out_len;
>  	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
> @@ -2349,7 +2462,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *=
padapter, u8 *in_ie, u8 *out_
> =20
>  	/* update default supported_mcs_set */
>  	if (stbc_rx_enable)
> -		ht_capie.cap_info |=3D cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);/* RX =
STBC One spatial stream */
> +		/* RX STBC One spatial stream */
> +		ht_capie.cap_info |=3D cpu_to_le16(IEEE80211_HT_CAP_RX_STBC_1R);
> =20
>  	set_mcs_rate_by_mask(ht_capie.mcs.rx_mask, MCS_RATE_1R);
> =20
> @@ -2415,7 +2529,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
> =20
>  	/* check Max Rx A-MPDU Size */
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_C=
APABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_C=
APABILITY,
> +		       &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
>  	if (p && len > 0) {
>  		pht_capie =3D (struct ieee80211_ht_cap *)(p + 2);
>  		max_ampdu_sz =3D (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPD=
U_FACTOR);
> @@ -2425,7 +2540,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
>  	}
> =20
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_O=
PERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_O=
PERATION,
> +		       &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
>  	if (p && len > 0) {
>  		/* todo: */
>  	}
> @@ -2438,13 +2554,14 @@ void rtw_update_ht_cap(struct adapter *padapter, =
u8 *pie, uint ie_len, u8 channe
>  	    (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
>  	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
>  		int i;
> +		u8 *mcs_rate =3D pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;
> =20
>  		/* update the MCS set */
>  		for (i =3D 0; i < 16; i++)
> -			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &=3D pmlmeext->defaul=
t_supported_mcs_set[i];
> +			mcs_rate[i] &=3D pmlmeext->default_supported_mcs_set[i];
> =20
>  		/* update the MCS rates */
> -		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS=
_RATE_1R);
> +		set_mcs_rate_by_mask(mcs_rate, MCS_RATE_1R);
> =20
>  		/* switch to the 40M Hz mode according to the AP */
>  		/* pmlmeext->cur_bwmode =3D CHANNEL_WIDTH_40; */
> @@ -2558,7 +2675,8 @@ void _rtw_roaming(struct adapter *padapter, struct =
wlan_network *tgt_network)
>  	struct wlan_network *cur_network =3D &pmlmepriv->cur_network;
> =20
>  	if (rtw_to_roam(padapter) > 0) {
> -		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(stru=
ct ndis_802_11_ssid));
> +		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid,
> +		       sizeof(struct ndis_802_11_ssid));
> =20
>  		pmlmepriv->assoc_by_bssid =3D false;
> =20

Best regards,
Luka Gejak
