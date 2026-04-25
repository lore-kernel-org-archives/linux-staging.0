Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C513F31D366
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121165; cv=none; b=Pui2VfSexSwORWqO01mOp7A/cuSQM6h218gVUKpmUYB1ua1GhiUoH/HkNQRDc50iNQXxSGT0SqXgtnAfQIFvYTyhtgu6PDsvuvqFWtnOtCT37P/XsPUwGUPBt8s4Vk8G6Crz9gTBpfjBPsdfRf3kfH62kH0Hd//Kmx5x1ryEhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121165; c=relaxed/simple;
	bh=cFkZkvYjaxIFb+BHhyhLEcSlip9mzDniFRDpXdl3vDo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PRuV9/pz+pgcZhsy4E/ofKhJFtaPJiTrhvtHWxF1b6uALwrMXp8BQ8TyjMuiIBt1jEcqtizc7FwJkKfDoRD6qrC/Wz5jLYZbpfxJcUVcvgFFRRd6NZZpMeeic3mVdclLlHGx7fXNsux8v/ye01byPzSLkU++/qMKyXEHzefWm3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VKtj1N1j; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VKtj1N1j"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777121159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDrJZWTg+0WvBdKmz1hnPld/CrdfpW8hv4+ruPl+dXA=;
	b=VKtj1N1jL3BRC6/u5gbxrFHJh0z7bbWKxUbiXd+NiAsNwJGCKGnPpwGfN2cHHpYjOfiBu8
	EkVfYXXQqpgGrvZc/gdT6j/PuKWmi9LyKcy/imDu0SoXuP3nTNo5myZomIn1mTMzI5cd7X
	slfZaRAODNAXAFLqL5vMs1Q6DruXehA=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 14:45:50 +0200
Message-Id: <DI28VE3I5LAU.9SJM5OX2JD6Q@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <gregkh@linuxfoundation.org>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rtw_mlme: fix line length warnings
References: <20260424212120.237059-1-me@cipherat.com>
In-Reply-To: <20260424212120.237059-1-me@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Fri Apr 24, 2026 at 11:16 PM CEST, Salman Alghamdi wrote:
> Fix lines exceeding 100 columns in rtw_mlme.c as flagged by
> checkpatch.pl. Wrap long function signatures, function calls,
> assignments, and block comments to bring all lines within the
> 100 column limit.
>
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 258 +++++++++++++++-------
>  1 file changed, 182 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index ddfc56f0253d..fe996484a6ed 100644
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
> +	/* 1: active, 0: passive. Maybe someday we should rename this
> +	 * variable to "active_mode" (Jeff)
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
					    ^^^^
This alignment is wrong please align struct with struct from line above.

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
> +			/* bss info not receiving from the right channel,
> +			 * use the original RX signal infos
> +			 */
>  			ss_final =3D dst->phy_info.signal_strength;
>  			sq_final =3D dst->phy_info.signal_quality;
>  			rssi_final =3D dst->rssi;
> @@ -462,10 +472,13 @@ static void update_current_network(struct adapter *=
adapter, struct wlan_bssid_ex
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network);
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv=
->cur_network.network, pnetwork, 0))) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
> +	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, tru=
e);
> -		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + =
sizeof(struct ndis_802_11_fix_ie),
> -								pmlmepriv->cur_network.network.ie_length);
> +		rtw_update_protection(adapter,
> +				      (pmlmepriv->cur_network.network.ies) +
> +					      sizeof(struct ndis_802_11_fix_ie),

You shouldn't break an arithmetic operation onto a new line. The=20
preferred way to do this is to create a local variable to simplify the=20
arguments and reduce the line length.

> +				      pmlmepriv->cur_network.network.ie_length);
>  	}
>  }
> =20
> @@ -601,7 +614,10 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  	privacy =3D pnetwork->network.privacy;
> =20
>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
> -		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork=
->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
> +		if (rtw_get_wps_ie(pnetwork->network.ies +
> +						   _FIXED_IE_LENGTH_,

Again, please avoid breaking arithmetic operations across lines (e.g.=20
the addition of _FIXED_IE_LENGTH_). Use local variables to store the=20
calculated ie pointer and length before calling the function.

> +						   pnetwork->network.ie_length - _FIXED_IE_LENGTH_,

Similarly, the subtraction pnetwork->network.ie_length - _FIXED_IE_LENGTH_=
=20
should also be moved to a local variable.

> +						   NULL, &wps_ielen))
						   ^^^^
The alignment here is also wrong. Arguments on wrapped lines should be=20
vertically aligned with the first argument of the function call. In this
case, the N in NULL should align with the p of the first pnetwork=20
argument.

>  			return true;
>  		else
>  			return false;
> @@ -614,7 +630,10 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  			bselected =3D false;
> =20
>  		if (psecuritypriv->ndisauthtype =3D=3D Ndis802_11AuthModeWPA2PSK) {
> -			p =3D rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID=
_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
> +			p =3D rtw_get_ie(pnetwork->network.ies +
> +					       _BEACON_IE_OFFSET_,

Same here, the addition should also be moved to a local variable.

> +				       WLAN_EID_RSN, &ie_len,
> +				       (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
					^^^^^
This subtraction should be moved to a local variable as well.

>  			if (p && ie_len > 0)
>  				bselected =3D true;
>  			else
> @@ -626,7 +645,8 @@ static bool rtw_is_desired_network(struct adapter *ad=
apter, struct wlan_network
>  		bselected =3D false;
> =20
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
> -		if (pnetwork->network.infrastructure_mode !=3D pmlmepriv->cur_network.=
network.infrastructure_mode)
> +		if (pnetwork->network.infrastructure_mode !=3D
> +		    pmlmepriv->cur_network.network.infrastructure_mode)
>  			bselected =3D false;
>  	}
> =20
> @@ -654,12 +674,14 @@ void rtw_survey_event_callback(struct adapter	*adap=
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
> @@ -710,13 +732,18 @@ void rtw_surveydone_event_callback(struct adapter	*=
adapter, u8 *pbuf)
>  					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
>  				} else {
>  					u8 ret =3D _SUCCESS;
> -					struct wlan_bssid_ex    *pdev_network =3D &adapter->registrypriv.de=
v_network;
> +					struct wlan_bssid_ex *pdev_network =3D
> +						&adapter->registrypriv.dev_network;

At this indentation level (5 tabs), the line reaches 112 characters,=20
which exceeds the 100-character limit. However, breaking the assignment=20
across two lines makes it hard to read. Please use a local variable to=20
shorten the path to dev_network instead.

>  					u8 *pibss =3D adapter->registrypriv.dev_network.mac_address;
> =20
> -					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;because don't set asso=
c_timer */
> +					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;
> +					 * because don't set assoc_timer
> +					 */

It would be preferable to remove the dead code in a separate patch=20
instead of continuing to maintain it.

>  					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
> =20
> -					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct n=
dis_802_11_ssid));
> +					memcpy(&pdev_network->ssid,
> +					       &pmlmepriv->assoc_ssid,
> +					       sizeof(struct ndis_802_11_ssid));
> =20
>  					rtw_update_registrypriv_dev_network(adapter);
>  					rtw_generate_random_ibss(pibss);
> @@ -743,8 +770,11 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  				rtw_indicate_connect(adapter);
>  			} else {
>  				if (rtw_to_roam(adapter) !=3D 0) {
> -					if (rtw_dec_to_roam(adapter) =3D=3D 0
> -						|| _SUCCESS !=3D rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssi=
d, 1, NULL, 0)
> +					if (rtw_dec_to_roam(adapter) =3D=3D 0 ||
> +					    _SUCCESS !=3D
> +						    rtw_sitesurvey_cmd(adapter,
> +								       &pmlmepriv->assoc_ssid,
> +									   1, NULL, 0)

This alignment is very poor and significantly hurts readability. You=20
shouldn't break comparison operators (like !=3D) across lines, nor should=
=20
you spread a single function call across so many lines at this=20
indentation depth. Please use a local variable to capture the return=20
value of rtw_sitesurvey_cmd() first. This will allow the if statement to
stay on one or two clear lines.

>  					) {
>  						rtw_set_to_roam(adapter, 0);
>  						rtw_free_assoc_resources(adapter, 1);
> @@ -763,8 +793,10 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
>  				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
>  				if (rtw_select_roaming_candidate(pmlmepriv) =3D=3D _SUCCESS) {
> -					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_addr=
ess
> -						, WLAN_REASON_ACTIVE_ROAM);
> +					receive_disconnect(adapter,
> +							   pmlmepriv->cur_network.network
> +								   .mac_address,
> +							   WLAN_REASON_ACTIVE_ROAM);

You should never break a structure member access across lines. Please=20
use a local variable to shorten the path to the mac address. This will=20
allow the function call to fit on a single line or be wrapped cleanly=20
without breaking the structure access.

>  				}
>  			}
>  		}
> @@ -948,7 +980,8 @@ void rtw_scan_abort(struct adapter *adapter)
>  	pmlmeext->scan_abort =3D false;
>  }
> =20
> -static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padap=
ter, struct wlan_network *pnetwork)
> +static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padap=
ter,
> +						   struct wlan_network *pnetwork)
						   ^^^^
This alignment is bad. Please aling struct with struct from line above.

>  {
>  	int i;
>  	struct sta_info *bmc_sta, *psta =3D NULL;
> @@ -1005,7 +1038,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(=
struct adapter *padapter, str
>  		}
> =20
>  		/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
> -		/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indic=
ate_seq) to default value =3D 0xffff */
> +		/* if A-MPDU Rx is enabled, resetting rx_ordering_ctrl
> +		 * wstart_b(indicate_seq) to default value =3D 0xffff
> +		 */
>  		/* todo: check if AP can send A-MPDU packets */
>  		for (i =3D 0; i < 16 ; i++) {
>  			preorder_ctrl =3D &psta->recvreorder_ctrl[i];
> @@ -1022,7 +1057,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(=
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
> @@ -1032,7 +1068,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(=
struct adapter *padapter, str
> =20
>  /* pnetwork : returns from rtw_joinbss_event_callback */
>  /* ptarget_wlan: found from scanned_queue */
> -static void rtw_joinbss_update_network(struct adapter *padapter, struct =
wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
> +static void rtw_joinbss_update_network(struct adapter *padapter,
> +				       struct wlan_network *ptarget_wlan,
> +				       struct wlan_network  *pnetwork)
				       ^^^^^
This alignment isn't good either. Please aling structs with word struct
from first argument.

>  {
>  	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>  	struct wlan_network  *cur_network =3D &pmlmepriv->cur_network;
> @@ -1049,8 +1087,11 @@ static void rtw_joinbss_update_network(struct adap=
ter *padapter, struct wlan_net
> =20
>  	padapter->recvpriv.signal_strength =3D ptarget_wlan->network.phy_info.s=
ignal_strength;
>  	padapter->recvpriv.signal_qual =3D ptarget_wlan->network.phy_info.signa=
l_quality;
> -	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->net=
work.phy_info.signal_strength instead (has scaled) */
> -	padapter->recvpriv.rssi =3D translate_percentage_to_dbm(ptarget_wlan->n=
etwork.phy_info.signal_strength);
> +	/* the ptarget_wlan->network.rssi is raw data, we use
> +	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
> +	 */
> +	padapter->recvpriv.rssi =3D
> +		translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_stre=
ngth);

Please avoid breaking the assignment across two lines. Instead, consider
using a local variable to shorten the function argument path, or a=20
shorthand for the padapter->recvpriv pointer. This would allow the=20
assignment to fit on a single line, improving readability.

> =20
>  	rtw_set_signal_stat_timer(&padapter->recvpriv);
> =20
> @@ -1072,10 +1113,13 @@ static void rtw_joinbss_update_network(struct ada=
pter *padapter, struct wlan_net
>  			break;
>  	}
> =20
> -	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(str=
uct ndis_802_11_fix_ie),
> -									(cur_network->network.ie_length));
> +	rtw_update_protection(padapter, (cur_network->network.ies) +
> +						sizeof(struct ndis_802_11_fix_ie),
> +						  (cur_network->network.ie_length));
						  ^^^^ - Misaligned
As mentioned previously, please don't break arithmetic operations=20
across lines. Additionally, the indentation here is inconsistent and=20
doesn't follow the standard vertical alignment. Please use a local=20
variable to store the ie pointer and fix alignment. This will allow the=20
function call to fit on a single line.

> =20
> -	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->netw=
ork.ie_length, (u8) cur_network->network.configuration.ds_config);
> +	rtw_update_ht_cap(padapter, cur_network->network.ies,
> +			  cur_network->network.ie_length,
> +			  (u8)cur_network->network.configuration.ds_config);
>  }
> =20
>  static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
> @@ -1095,9 +1139,12 @@ void rtw_reset_securitypriv(struct adapter *adapte=
r)
>  		/*  We have to backup the PMK information for WiFi PMK Caching test it=
em. */
>  		/*  */
>  		/*  Backup the btkip_countermeasure information. */
> -		/*  When the countermeasure is trigger, the driver have to disconnect =
with AP for 60 seconds. */
> +		/*  When the countermeasure is trigger, the driver have to disconnect
> +		 * with AP for 60 seconds.
		   ^^^^
w should be alinged with W from line above.

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
> @@ -1108,8 +1155,11 @@ void rtw_reset_securitypriv(struct adapter *adapte=
r)
>  		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct secur=
ity_priv));
> =20
>  		/*  Added by Albert 2009/02/18 */
> -		/*  Restore the PMK information to securitypriv structure for the foll=
owing connection. */
> -		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeo=
f(struct rt_pmkid_list) * NUM_PMKID_CACHE);
> +		/*  Restore the PMK information to securitypriv
> +		 * structure for the following connection.
		   ^^^^
s should be aligned with R from Restore on line above.

> +		 */
> +		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0],
> +		       sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
>  		adapter->securitypriv.PMKIDIndex =3D backupPMKIDIndex;
>  		adapter->securitypriv.btkip_countermeasure =3D backupTKIPCountermeasur=
e;
>  		adapter->securitypriv.btkip_countermeasure_time =3D backupTKIPcounterm=
easure_time;
> @@ -1141,10 +1191,14 @@ void rtw_reset_securitypriv(struct adapter *adapt=
er)
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
> -/*  */
> +/* if join_res > 0, update "cur_network->network" from "pnetwork->networ=
k"
> + * if (ptarget_wlan !=3D NULL).
> + */
> +
>  void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>  {
>  	struct sta_info *ptarget_sta =3D NULL, *pcur_sta =3D NULL;
> @@ -1155,7 +1209,8 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
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
> @@ -1195,9 +1250,12 @@ void rtw_joinbss_event_prehandle(struct adapter *a=
dapter, u8 *pbuf)
>  	/* s1. find ptarget_wlan */
>  	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>  		if (the_same_macaddr) {
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D
> +				rtw_find_network(&pmlmepriv->scanned_queue,
> +						 cur_network->network.mac_address);

Again, use a local variable to shorten the function arguments rather=20
than splitting the assignment.

>  		} else {
> -			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_network=
->network.mac_address);
> +			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +						     cur_network->network.mac_address);
>  			if (pcur_wlan)
>  				pcur_wlan->fixed =3D false;
> =20
> @@ -1205,7 +1263,9 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
apter, u8 *pbuf)
>  			if (pcur_sta)
>  				rtw_free_stainfo(adapter, pcur_sta);
> =20
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, pnetwork=
->network.mac_address);
> +			ptarget_wlan =3D
> +				rtw_find_network(&pmlmepriv->scanned_queue,
> +						 pnetwork->network.mac_address);

Same here as above.

>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>  				if (ptarget_wlan)
>  					ptarget_wlan->fixed =3D true;
> @@ -1230,7 +1290,9 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
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
> @@ -1298,7 +1360,8 @@ void rtw_stassoc_event_callback(struct adapter *ada=
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
> @@ -1323,7 +1386,10 @@ void rtw_stassoc_event_callback(struct adapter *ad=
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
> @@ -1350,7 +1416,9 @@ void rtw_stassoc_event_callback(struct adapter *ada=
pter, u8 *pbuf)
>  	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		if (adapter->stapriv.asoc_sta_count =3D=3D 2) {
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D
> +				rtw_find_network(&pmlmepriv->scanned_queue,
> +						 cur_network->network.mac_address);

Again, same as above.

>  			pmlmepriv->cur_network_scanned =3D ptarget_wlan;
>  			if (ptarget_wlan)
>  				ptarget_wlan->fixed =3D true;
> @@ -1407,16 +1475,19 @@ void rtw_stadel_event_callback(struct adapter *ad=
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
> @@ -1430,7 +1501,8 @@ void rtw_stadel_event_callback(struct adapter *adap=
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
> @@ -1444,12 +1516,14 @@ void rtw_stadel_event_callback(struct adapter *ad=
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
> @@ -1459,9 +1533,11 @@ void rtw_stadel_event_callback(struct adapter *ada=
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
> @@ -1530,9 +1606,11 @@ void _rtw_join_timeout_handler(struct timer_list *=
t)
> =20
>  	} else {
>  		rtw_indicate_disconnect(adapter);
> -		free_scanqueue(pmlmepriv);/*  */
> +		free_scanqueue(pmlmepriv);
> =20
> -		/* indicate disconnect for the case that join_timeout and check_fwstat=
e !=3D FW_LINKED */
> +		/* indicate disconnect for the case that join_timeout and
> +		 * check_fwstate !=3D FW_LINKED
> +		 */
>  		rtw_cfg80211_indicate_disconnect(adapter);
>  	}
> =20
> @@ -1581,8 +1659,9 @@ static void rtw_auto_scan_handler(struct adapter *p=
adapter)
> =20
>  	rtw_mlme_reset_auto_scan_int(padapter);
> =20
> -	if (pmlmepriv->auto_scan_int_ms !=3D 0
> -		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv-=
>auto_scan_int_ms) {
> +	if (pmlmepriv->auto_scan_int_ms !=3D 0 &&
> +	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) >
> +		    pmlmepriv->auto_scan_int_ms) {
								^^^^
Please don't break the line at the comparison operator. It is better to
use a local variable to calculate the elapsed time before the if=20
statement. This would simplify the condition and keep the logic on a=20
single line.

>  		if (!padapter->registrypriv.wifi_spec) {
>  			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
>  				goto exit;
> @@ -1624,7 +1703,9 @@ void rtw_dynamic_check_timer_handler(struct adapter=
 *adapter)
>  			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
>  			rtw_hal_dm_watchdog_in_lps(adapter);
>  		} else {
> -			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in traffic_s=
tatus_watchdog() */
> +			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1) in
> +			 * traffic_status_watchdog()
> +			 */
>  		}
> =20
>  	} else {
> @@ -1684,7 +1765,8 @@ static int rtw_check_roaming_candidate(struct mlme_=
priv *mlme
>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=3D mlme->roa=
m_scanr_exp_ms)
>  		goto exit;
> =20
> -	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi =
< mlme->roam_rssi_diff_th)
> +	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi =
<
> +	    mlme->roam_rssi_diff_th)

If you introduce local variable for subtraction comparison will fit on=20
same line without exceeding the limit.

>  		goto exit;
> =20
>  	if (*candidate && (*candidate)->network.rssi >=3D competitor->network.r=
ssi)
> @@ -1757,8 +1839,10 @@ static int rtw_check_join_candidate(struct mlme_pr=
iv *mlme
> =20
>  	/* check ssid, if needed */
>  	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
> -		if (competitor->network.ssid.ssid_length !=3D mlme->assoc_ssid.ssid_le=
ngth
> -			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme-=
>assoc_ssid.ssid_length)
> +		if (competitor->network.ssid.ssid_length !=3D
> +			    mlme->assoc_ssid.ssid_length ||
> +		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
> +			   mlme->assoc_ssid.ssid_length)

Again, please don't break the comparison operator across lines.=20
Furthermore, this nested logic is becoming difficult to read due to the=20
long variable paths. It would be much better to use local variables for=20
the ssid lengths and the ssid pointers. This would allow the if=20
condition to be much cleaner and fit on fewer lines.

>  		)
>  			goto exit;
>  	}
> @@ -1876,7 +1960,9 @@ signed int rtw_set_auth(struct adapter *adapter, st=
ruct security_priv *psecurity
>  	return res;
>  }
> =20
> -signed int rtw_set_key(struct adapter *adapter, struct security_priv *ps=
ecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
> +signed int rtw_set_key(struct adapter *adapter,
> +		       struct security_priv *psecuritypriv,
> +		       signed int keyid, u8 set_tx, bool enqueue)
		       ^^^^^
This is misaligned. Words struct should align with word struct from=20
first argument.

>  {
>  	u8 keylen;
>  	struct cmd_obj *pcmd;
> @@ -1951,7 +2037,8 @@ signed int rtw_set_key(struct adapter *adapter, str=
uct security_priv *psecurityp
>  }
> =20
>  /* adjust ies for rtw_joinbss_cmd in WMM */
> -int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, =
uint in_len, uint initial_out_len)
> +int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
> +			uint in_len, uint initial_out_len)
			^^^^^
This is misaligned too u from uint should align with struct from first=20
argument.

>  {
>  	unsigned	int ielength =3D 0;
>  	unsigned int i, j;
> @@ -2055,7 +2142,8 @@ static void rtw_report_sec_ie(struct adapter *adapt=
er, u8 authmode, u8 *sec_ie)
> =20
>  		wrqu.data.length =3D p - buff;
> =20
> -		wrqu.data.length =3D (wrqu.data.length < IW_CUSTOM_MAX) ? wrqu.data.le=
ngth : IW_CUSTOM_MAX;
> +		wrqu.data.length =3D (wrqu.data.length < IW_CUSTOM_MAX) ?
> +			wrqu.data.length : IW_CUSTOM_MAX;

Please avoid breaking the ternary operator across lines like this. If=20
the line is too long, it is usually cleaner to use the min() or clamp()=20
macro, which is the standard way to handle cap logic in the linux=20
kernel. This would keep the assignment on a single line and make the=20
intent much clearer.

> =20
>  		kfree(buff);
>  	}
> @@ -2085,7 +2173,8 @@ signed int rtw_restruct_sec_ie(struct adapter *adap=
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
> @@ -2123,7 +2212,8 @@ void rtw_update_registrypriv_dev_network(struct ada=
pter *adapter)
>  	struct	security_priv *psecuritypriv =3D &adapter->securitypriv;
>  	struct	wlan_network	*cur_network =3D &adapter->mlmepriv.cur_network;
> =20
> -	pdev_network->privacy =3D (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 :=
 0) ; /*  adhoc no 802.1x */
> +	/* adhoc no 802.1x */
> +	pdev_network->privacy =3D (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 :=
 0);
> =20
>  	pdev_network->rssi =3D 0;
> =20
> @@ -2153,14 +2243,19 @@ void rtw_update_registrypriv_dev_network(struct a=
dapter *adapter)
>  	/*  1. Supported rates */
>  	/*  2. IE */
> =20
> -	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv-=
>wireless_mode) ;  will be called in rtw_generate_ie */
> +	/* rtw_set_supported_rate(pdev_network->supported_rates,
> +	 *						  pregistrypriv->wireless_mode);
> +	 * will be called in rtw_generate_ie
> +	 */

Again, dead code.

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
> @@ -2172,7 +2267,9 @@ void rtw_joinbss_reset(struct adapter *padapter)
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
> @@ -2262,7 +2359,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, =
u8 *out_ie, uint *pout_len)
>  }
> =20
>  /* the function is >=3D passive_level */
> -unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, =
u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
> +unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
> +				   u8 *out_ie, uint in_len,
> +				   uint *pout_len, u8 channel)
				   ^^^^^
Wrong alignment here too. u in u8 and u in uint should be aligned with=20
struct in first argument.

>  {
>  	u32 ielen, out_len;
>  	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
> @@ -2343,7 +2442,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *=
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
> @@ -2409,7 +2509,9 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
> =20
>  	/* check Max Rx A-MPDU Size */
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_C=
APABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie),
> +		       WLAN_EID_HT_CAPABILITY, &len,
> +		       ie_len - sizeof(struct ndis_802_11_fix_ie));
>  	if (p && len > 0) {
>  		pht_capie =3D (struct ieee80211_ht_cap *)(p + 2);
>  		max_ampdu_sz =3D (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPD=
U_FACTOR);
> @@ -2419,7 +2521,9 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
>  	}
> =20
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_O=
PERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie),
> +		       WLAN_EID_HT_OPERATION, &len,
> +		       ie_len - sizeof(struct ndis_802_11_fix_ie));
>  	if (p && len > 0) {
>  		/* todo: */
>  	}
> @@ -2435,7 +2539,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
> =20
>  		/* update the MCS set */
>  		for (i =3D 0; i < 16; i++)
> -			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &=3D pmlmeext->defaul=
t_supported_mcs_set[i];
> +			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &=3D
> +				pmlmeext->default_supported_mcs_set[i];

Please don't break the line at the compound assignment operator either.
This makes the logic harder to follow. Instead, use a local variable to=20
shorten the long structure path on the left-hand side. This will allow=20
the entire operation to fit on one line.

> =20
>  		/* update the MCS rates */
>  		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS=
_RATE_1R);
> @@ -2552,7 +2657,8 @@ void _rtw_roaming(struct adapter *padapter, struct =
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

Please send v2 with mentioned changes.
Best regards,
Luka Gejak
