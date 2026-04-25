Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419219ADA4
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777144345; cv=none; b=JfPZRStsh+OloiPAPth5FMiDj+OEjyaYC62jHR2lZEoHnBTR/IcaceAexmaVzH9o3sdl88ffHRKtQa1SzmP3rtoq9I0zOURr12iCmihj4LOAotVyIutuKJD8/Krpd9cPZWtnG9grnbB4+R5DhwSoGqgHh8mRumODDyl16dGOvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777144345; c=relaxed/simple;
	bh=GWV3aI9fGWDwFqfdZi4zfGnLn4UjjY5+7LJ/mug4QOk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BmW9K7kcpSD+VczPPSwyneuWHQANnsurC481jsmDRchBTmyrq25bubZ5oaR0IOVrvGNqqCGgV8yBTwbSuDpii3WOezCQbNxPLkUXKTP901WqmDe0iGMsweaaDYjxpqfwncptAk7zE19GmDJdhKj9Dz0KWnYwCk2Ee0OMDq7EGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=btF4iUcl; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="btF4iUcl"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777144339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmJd1gFvoa42K2aiRVaF+kwZcpjreIP7/0ucTINRxwI=;
	b=btF4iUcl33xljDxkgT/BPtQ8ImZpBi5akWumBn66uIC+TJyg9FYyIx51LVSIewPtPEQ/H7
	DF3MNknNcQvrk0KBFK4/cw1T0agCUBGfHtGgb/8ZjrDrKROctkYbsk2BYXBQmjbxl5Cnqh
	FhYitx45TK29+wxmAaUsvY5jqG0bbeU=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Apr 2026 21:12:16 +0200
Message-Id: <DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: rtw_mlme: fix line length
 warnings
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <gregkh@linuxfoundation.org>
References: <20260425165733.289919-1-me@cipherat.com>
In-Reply-To: <20260425165733.289919-1-me@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 25, 2026 at 6:56 PM CEST, Salman Alghamdi wrote:
> Fix lines exceeding 100 columns in rtw_mlme.c as flagged by
> checkpatch.pl. Extract local variables to avoid breaking arithmetic
> operations, structure member accesses, and comparison operators
> across lines. Fix function signature alignment to match the column
> of the first parameter. Use min_t() for value capping. Fix block
> comment formatting on continuation lines. Remove dead commented-out
> code found while fixing line lengths.

Hi Salman,
glad to see v2, just one thing before inline reviews of the code. You=20
don't have to state what did you do to make lines shorter than 100=20
characters, because we can read the diff and this commit message is too=20
long for cleanup patch.

>
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
> v2:
>   - Extract local variables instead of breaking arithmetic across lines
>   - Extract local variables for long struct member access paths
>   - Fix function signature alignment to match first parameter column
>   - Use min_t() instead of ternary for wrqu.data.length cap
>   - Fix block comment alignment on continuation lines
>   - Add blank lines after variable declarations
>   - Remove dead commented-out code
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 277 +++++++++++++++-------
>  1 file changed, 189 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index ddfc56f0253d..045c636142f9 100644
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
> @@ -363,13 +367,12 @@ int is_same_network(struct wlan_bssid_ex *src, stru=
ct wlan_bssid_ex *dst, u8 fea
>  	return (src->ssid.ssid_length =3D=3D dst->ssid.ssid_length) &&
>  			((!memcmp(src->mac_address, dst->mac_address, ETH_ALEN))) &&
>  			((!memcmp(src->ssid.ssid, dst->ssid.ssid, src->ssid.ssid_length))) &&
> -			((s_cap & WLAN_CAPABILITY_IBSS) =3D=3D
> -			(d_cap & WLAN_CAPABILITY_IBSS)) &&
> -			((s_cap & WLAN_CAPABILITY_ESS) =3D=3D
> -			(d_cap & WLAN_CAPABILITY_ESS));
> +			((s_cap & WLAN_CAPABILITY_IBSS) =3D=3D (d_cap & WLAN_CAPABILITY_IBSS)=
) &&
> +			((s_cap & WLAN_CAPABILITY_ESS) =3D=3D (d_cap & WLAN_CAPABILITY_ESS));

This is not long line fix, please don't introduce changes other than=20
long line changes(stick to atomic patch rules, more in=20
Documentation/process).

>  }
> =20
> -struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queu=
e, struct wlan_network *network)
> +struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queu=
e,
> +					    struct wlan_network *network)
					    ^^^^^
This is still not aligned correctly. Please do it like:
struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
					    struct wlan_network *network)

>  {
>  	struct list_head *phead, *plist;
>  	struct wlan_network *found =3D NULL;
> @@ -420,7 +423,8 @@ void update_network(struct wlan_bssid_ex *dst, struct=
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
> @@ -431,11 +435,15 @@ void update_network(struct wlan_bssid_ex *dst, stru=
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
> @@ -462,10 +470,12 @@ static void update_current_network(struct adapter *=
adapter, struct wlan_bssid_ex
>  		&pmlmepriv->cur_network.network,
>  		&pmlmepriv->cur_network.network);
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv=
->cur_network.network, pnetwork, 0))) {
> +	u8 *ie =3D pmlmepriv->cur_network.network.ies + sizeof(struct ndis_802_=
11_fix_ie);

You should declare u8 *ie inside the if statement to reduce its scope as
much as possible and if left this way it will declare it even if=20
condition is false.

> +
> +	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
> +	    is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0)) {
>  		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, tru=
e);

Put u8 *ie ... here, under update_network.

> -		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + =
sizeof(struct ndis_802_11_fix_ie),
> -								pmlmepriv->cur_network.network.ie_length);
> +		rtw_update_protection(adapter, ie, pmlmepriv->cur_network.network.ie_l=
ength);
>  	}
>  }
> =20
> @@ -600,12 +610,16 @@ static bool rtw_is_desired_network(struct adapter *=
adapter, struct wlan_network
>  	desired_encmode =3D psecuritypriv->ndisencryptstatus;
>  	privacy =3D pnetwork->network.privacy;
> =20
> +	u8 *ie_ptr =3D pnetwork->network.ies + _FIXED_IE_LENGTH_;
> +	u32 ie_len_val =3D pnetwork->network.ie_length - _FIXED_IE_LENGTH_;
> +
>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {

Again you should move two variables declared above here, inside if=20
statement. Additionally, calculating ie_len_val outside the check is=20
risky. You should ensure ie_length is actually greater than=20
_FIXED_IE_LENGTH_ before performing the subtraction to prevent an=20
unsigned underflow/wrap-around.

> -		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork=
->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
> +		if (rtw_get_wps_ie(ie_ptr, ie_len_val, NULL, &wps_ielen))
>  			return true;
>  		else
>  			return false;
>  	}
> +

This is an unrelated change. If you want to add an empty line here to=20
improve readability, please do so in a separate patch.

>  	if (adapter->registrypriv.wifi_spec =3D=3D 1) { /* for  correct flow of=
 8021X  to do.... */
>  		u8 *p =3D NULL;
>  		uint ie_len =3D 0;
> @@ -614,7 +628,10 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  			bselected =3D false;
> =20
>  		if (psecuritypriv->ndisauthtype =3D=3D Ndis802_11AuthModeWPA2PSK) {
> -			p =3D rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID=
_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
> +			u8 *ie_ptr =3D pnetwork->network.ies + _BEACON_IE_OFFSET_;
> +			u32 ie_len_val =3D pnetwork->network.ie_length - _BEACON_IE_OFFSET_;

While scoping these variables inside the if block is good, the same=20
underflow risk applies here. Please add a check to ensure=20
pnetwork->network.ie_length >=3D _BEACON_IE_OFFSET_ before performing the=
=20
subtraction.

> +
> +			p =3D rtw_get_ie(ie_ptr, WLAN_EID_RSN, &ie_len, ie_len_val);
>  			if (p && ie_len > 0)
>  				bselected =3D true;
>  			else
> @@ -625,8 +642,14 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
>  	if ((desired_encmode !=3D Ndis802_11EncryptionDisabled) && (privacy =3D=
=3D 0))
>  		bselected =3D false;
> =20
> +	enum ndis_802_11_network_infrastructure inf_mode;
> +	enum ndis_802_11_network_infrastructure cur_inf;
> +
> +	inf_mode =3D pnetwork->network.infrastructure_mode;
> +	cur_inf =3D pmlmepriv->cur_network.network.infrastructure_mode;

Please move the declaration and assignment of inf_mode and cur_inf=20
inside the if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) block. This=20
avoids mid-block variable declarations and ensures we don't perform=20
unnecessary memory accesses when the device is not in an ad-hoc state.

> +
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
> -		if (pnetwork->network.infrastructure_mode !=3D pmlmepriv->cur_network.=
network.infrastructure_mode)
> +		if (inf_mode !=3D cur_inf)
>  			bselected =3D false;
>  	}
> =20
> @@ -654,12 +677,14 @@ void rtw_survey_event_callback(struct adapter	*adap=
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
> @@ -710,13 +735,15 @@ void rtw_surveydone_event_callback(struct adapter	*=
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
>  					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);

Again, this is unrelated change, which should be moved to separate patch
that removes dead code.

> =20
> -					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct n=
dis_802_11_ssid));
> +					memcpy(&pdev_network->ssid,
> +					       &pmlmepriv->assoc_ssid,
> +					       sizeof(struct ndis_802_11_ssid));
> =20
>  					rtw_update_registrypriv_dev_network(adapter);
>  					rtw_generate_random_ibss(pibss);
> @@ -743,9 +770,12 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
>  				rtw_indicate_connect(adapter);
>  			} else {
>  				if (rtw_to_roam(adapter) !=3D 0) {
> -					if (rtw_dec_to_roam(adapter) =3D=3D 0
> -						|| _SUCCESS !=3D rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssi=
d, 1, NULL, 0)
> -					) {
> +					u8 survey_ret =3D rtw_sitesurvey_cmd(adapter,
> +									   &pmlmepriv->assoc_ssid,
> +									   1, NULL, 0);
> +
> +					if (rtw_dec_to_roam(adapter) =3D=3D 0 ||
> +					    survey_ret !=3D _SUCCESS) {

This change breaks the short-circuit logic of the original code.=20
rtw_sitesurvey_cmd should only be executed if rtw_dec_to_roam allows it.
Moving this call outside the if block triggers an site survey=20
unnecessarily. If you want to improve readability, please use a nested=20
if structure instead.

>  						rtw_set_to_roam(adapter, 0);
>  						rtw_free_assoc_resources(adapter, 1);
>  						rtw_indicate_disconnect(adapter);
> @@ -759,12 +789,14 @@ void rtw_surveydone_event_callback(struct adapter	*=
adapter, u8 *pbuf)
>  			}
>  		}
>  	} else {
> +		u8 *mac_addr =3D pmlmepriv->cur_network.network.mac_address;

Please move the declaration and assignment of mac_addr inside the=20
innermost if block where it is actually used. This prevents unnecessary=20
memory access and ensures the pointer is fetched only when the roaming=20
candidate selection is successful.

> +
>  		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
> -			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
> -				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
> +			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
> +			    check_fwstate(pmlmepriv, _FW_LINKED)) {
>  				if (rtw_select_roaming_candidate(pmlmepriv) =3D=3D _SUCCESS) {
> -					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_addr=
ess
> -						, WLAN_REASON_ACTIVE_ROAM);
> +					receive_disconnect(adapter, mac_addr,
> +							   WLAN_REASON_ACTIVE_ROAM);
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
						   ^^^^^
This is not aligned properly. Please aling struct with struct from first
argument(line above).

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
> @@ -1032,10 +1068,13 @@ static struct sta_info *rtw_joinbss_update_stainf=
o(struct adapter *padapter, str
> =20
>  /* pnetwork : returns from rtw_joinbss_event_callback */
>  /* ptarget_wlan: found from scanned_queue */
> -static void rtw_joinbss_update_network(struct adapter *padapter, struct =
wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
> +static void rtw_joinbss_update_network(struct adapter *padapter,
> +				       struct wlan_network *ptarget_wlan,
> +				       struct wlan_network *pnetwork)
				       ^^^^^
Alignment is not good here either. Same as above.

>  {
>  	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>  	struct wlan_network  *cur_network =3D &pmlmepriv->cur_network;
> +	u8 signal_strength =3D ptarget_wlan->network.phy_info.signal_strength;
> =20
>  	/*  why not use ptarget_wlan?? */
>  	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.len=
gth);
> @@ -1049,8 +1088,10 @@ static void rtw_joinbss_update_network(struct adap=
ter *padapter, struct wlan_net
> =20
>  	padapter->recvpriv.signal_strength =3D ptarget_wlan->network.phy_info.s=
ignal_strength;
					     ^^^^^
Also can't we use signal_strength here?

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
> @@ -1072,10 +1113,13 @@ static void rtw_joinbss_update_network(struct ada=
pter *padapter, struct wlan_net
>  			break;
>  	}
> =20
> -	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(str=
uct ndis_802_11_fix_ie),
> -									(cur_network->network.ie_length));
> +	u8 *ie =3D cur_network->network.ies + sizeof(struct ndis_802_11_fix_ie)=
;
> =20
> -	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->netw=
ork.ie_length, (u8) cur_network->network.configuration.ds_config);
> +	rtw_update_protection(padapter, ie, (cur_network->network.ie_length));

The original code had a potential buffer over-read here by passing the=20
full ie_length with an offset pointer. Since you are refactoring this=20
line, please fix this bug, in a separate patch, by subtracting the=20
offset from the length and ensuring the length is actually large enough=20
first. 1/X of the patch series should be bug fix, 2/X should be this=20
cleanup. Don't forget to add Fixes and Reported-by tags. Check if this=20
bug is present in stable tree and if so add Cc: stable@vger.kernel.org=20
as well.

> +
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
> +		 *  with AP for 60 seconds.
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
> +		 *  structure for the following connection.
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
> @@ -1154,8 +1208,10 @@ void rtw_joinbss_event_prehandle(struct adapter *a=
dapter, u8 *pbuf)
>  	struct wlan_network	*cur_network =3D &pmlmepriv->cur_network;
>  	struct wlan_network	*pcur_wlan =3D NULL, *ptarget_wlan =3D NULL;
>  	unsigned int		the_same_macaddr =3D false;
> +	struct __queue *scanned_queue =3D &pmlmepriv->scanned_queue;
> =20
> -	the_same_macaddr =3D !memcmp(pnetwork->network.mac_address, cur_network=
->network.mac_address, ETH_ALEN);
> +	the_same_macaddr =3D !memcmp(pnetwork->network.mac_address,
> +				   cur_network->network.mac_address, ETH_ALEN);
> =20
>  	pnetwork->network.length =3D get_wlan_bssid_ex_sz(&pnetwork->network);
>  	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
> @@ -1195,9 +1251,11 @@ void rtw_joinbss_event_prehandle(struct adapter *a=
dapter, u8 *pbuf)
>  	/* s1. find ptarget_wlan */
>  	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>  		if (the_same_macaddr) {
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(scanned_queue,
> +							cur_network->network.mac_address);
>  		} else {
> -			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_network=
->network.mac_address);
> +			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue,
> +						     cur_network->network.mac_address);

Please use scanned_queue from above in this else block as well as this=20
keeps the usage consistent with the if block above.

>  			if (pcur_wlan)
>  				pcur_wlan->fixed =3D false;
> =20
> @@ -1205,7 +1263,8 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
apter, u8 *pbuf)
>  			if (pcur_sta)
>  				rtw_free_stainfo(adapter, pcur_sta);
> =20
> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, pnetwork=
->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(scanned_queue,
> +							pnetwork->network.mac_address);
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>  				if (ptarget_wlan)
>  					ptarget_wlan->fixed =3D true;
> @@ -1230,7 +1289,9 @@ void rtw_joinbss_event_prehandle(struct adapter *ad=
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
> @@ -1298,7 +1359,8 @@ void rtw_stassoc_event_callback(struct adapter *ada=
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
> @@ -1310,7 +1372,8 @@ void rtw_stassoc_event_callback(struct adapter *ada=
pter, u8 *pbuf)
>  			spin_unlock_bh(&psta->lock);
> =20
>  			if (passoc_req && assoc_req_len > 0) {
> -				rtw_cfg80211_indicate_sta_assoc(adapter, passoc_req, assoc_req_len);
> +				rtw_cfg80211_indicate_sta_assoc(adapter,
> +								passoc_req, assoc_req_len);
> =20
>  				kfree(passoc_req);
>  			}
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
> @@ -1346,11 +1412,13 @@ void rtw_stassoc_event_callback(struct adapter *a=
dapter, u8 *pbuf)
> =20
>  	spin_lock_bh(&pmlmepriv->lock);
> =20
> +	struct __queue *queue =3D &pmlmepriv->scanned_queue;

You cannot declare a variable after an executable statement=20
(the spin_lock_bh call). Please move the struct __queue *queue=20
declaration to the top of the function with the other variable=20
declarations.

> +
>  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
>  	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  		if (adapter->stapriv.asoc_sta_count =3D=3D 2) {
>  			spin_lock_bh(&pmlmepriv->scanned_queue.lock);

Also why not use queue variable here as well?

> -			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network.mac_address);
> +			ptarget_wlan =3D rtw_find_network(queue, cur_network->network.mac_add=
ress);
>  			pmlmepriv->cur_network_scanned =3D ptarget_wlan;
>  			if (ptarget_wlan)
>  				ptarget_wlan->fixed =3D true;
				^^^^^
Also there is a line right under this if statement in which you could=20
use queue varable as well: spin_unlock_bh(&pmlmepriv->scanned_queue.lock);

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
> +	unsigned int elapsed_ms =3D jiffies_to_msecs(jiffies - pmlmepriv->scan_=
start_time);

Again, you are mixing declarations and code. The variable elapsed_ms is=20
declared after the call to rtw_mlme_reset_auto_scan_int(). Please move=20
the declaration of unsigned int elapsed_ms; to the top of the function.=20
You can then perform the assignment where the variable is currently=20
located.

> +
> +	if (pmlmepriv->auto_scan_int_ms !=3D 0 && elapsed_ms > pmlmepriv->auto_=
scan_int_ms) {
>  		if (!padapter->registrypriv.wifi_spec) {
>  			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING))
>  				goto exit;
> @@ -1621,10 +1700,11 @@ void rtw_dynamic_check_timer_handler(struct adapt=
er *adapter)
> =20
>  		should_enter_ps =3D traffic_status_watchdog(adapter, true);
>  		if (should_enter_ps) {
> -			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */

Here you are removing dead code and that is unrelated change. Please=20
move this to separate patch.

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
> @@ -1684,7 +1764,9 @@ static int rtw_check_roaming_candidate(struct mlme_=
priv *mlme
>  	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=3D mlme->roa=
m_scanr_exp_ms)
>  		goto exit;
> =20
> -	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi =
< mlme->roam_rssi_diff_th)
> +	long rssi_diff =3D competitor->network.rssi - mlme->cur_network_scanned=
->network.rssi;

You are declaring a variable (rssi_diff) after executable code again.=20
All declarations must be at the top of the function. Additionally, why=20
use long here?

> +
> +	if (rssi_diff < mlme->roam_rssi_diff_th)
>  		goto exit;
> =20
>  	if (*candidate && (*candidate)->network.rssi >=3D competitor->network.r=
ssi)
> @@ -1757,9 +1839,12 @@ static int rtw_check_join_candidate(struct mlme_pr=
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
> @@ -1876,7 +1961,9 @@ signed int rtw_set_auth(struct adapter *adapter, st=
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
Wrong alignment here too. Please align struct and signed under struct=20
from the first argument.

>  {
>  	u8 keylen;
>  	struct cmd_obj *pcmd;
> @@ -1951,7 +2038,8 @@ signed int rtw_set_key(struct adapter *adapter, str=
uct security_priv *psecurityp
>  }
> =20
>  /* adjust ies for rtw_joinbss_cmd in WMM */
> -int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, =
uint in_len, uint initial_out_len)
> +int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
> +			uint in_len, uint initial_out_len)
			^^^^
Again, wrong alignment. Align u from uint with s from struct.

>  {
>  	unsigned	int ielength =3D 0;
>  	unsigned int i, j;
> @@ -2055,7 +2143,8 @@ static void rtw_report_sec_ie(struct adapter *adapt=
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
> @@ -2085,7 +2174,8 @@ signed int rtw_restruct_sec_ie(struct adapter *adap=
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
> @@ -2123,7 +2213,8 @@ void rtw_update_registrypriv_dev_network(struct ada=
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
> @@ -2153,15 +2244,15 @@ void rtw_update_registrypriv_dev_network(struct a=
dapter *adapter)
>  	/*  1. Supported rates */
>  	/*  2. IE */
> =20
> -	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv-=
>wireless_mode) ;  will be called in rtw_generate_ie */

Again, dead code. Move it to separate patch that only deletes dead code.

>  	sz =3D rtw_generate_ie(pregistrypriv);
> =20
>  	pdev_network->ie_length =3D sz;
> =20
>  	pdev_network->length =3D get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)=
pdev_network);
> =20
> -	/* notes: translate ie_length & length after assign the length to cmdsz=
 in createbss_cmd(); */
> -	/* pdev_network->ie_length =3D cpu_to_le32(sz); */
> +	/* notes: translate ie_length & length after assign the
> +	 * length to cmdsz in createbss_cmd();
> +	 */

Same as above, regarding the dead code and if you remove the dead code=20
that comment becomes a ghost comment, which should be removed as well.

>  }
> =20
>  /* the function is at passive_level */
> @@ -2172,7 +2263,9 @@ void rtw_joinbss_reset(struct adapter *padapter)
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
> @@ -2262,7 +2355,9 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, =
u8 *out_ie, uint *pout_len)
>  }
> =20
>  /* the function is >=3D passive_level */
> -unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, =
u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
> +unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
> +				   u8 *out_ie, uint in_len,
> +				   uint *pout_len, u8 channel)
				   ^^^^
Wrong alignment here too. Align u from u8 and u from uint to s from=20
struct of first argument.

>  {
>  	u32 ielen, out_len;
>  	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
> @@ -2343,7 +2438,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *=
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
> @@ -2409,7 +2505,10 @@ void rtw_update_ht_cap(struct adapter *padapter, u=
8 *pie, uint ie_len, u8 channe
> =20
>  	/* check Max Rx A-MPDU Size */
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_C=
APABILITY, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	u8 *ie_ptr =3D pie + sizeof(struct ndis_802_11_fix_ie);
> +	int ie_remaining =3D ie_len - sizeof(struct ndis_802_11_fix_ie);

Again please move these declarations to the top of the function.

> +
> +	p =3D rtw_get_ie(ie_ptr, WLAN_EID_HT_CAPABILITY, &len, ie_remaining);
>  	if (p && len > 0) {
>  		pht_capie =3D (struct ieee80211_ht_cap *)(p + 2);
>  		max_ampdu_sz =3D (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPD=
U_FACTOR);
> @@ -2419,7 +2518,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8=
 *pie, uint ie_len, u8 channe
>  	}
> =20
>  	len =3D 0;
> -	p =3D rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_O=
PERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
> +	p =3D rtw_get_ie(ie_ptr, WLAN_EID_HT_OPERATION, &len, ie_remaining);
>  	if (p && len > 0) {
>  		/* todo: */
>  	}
> @@ -2433,9 +2532,10 @@ void rtw_update_ht_cap(struct adapter *padapter, u=
8 *pie, uint ie_len, u8 channe
>  	      BIT(1)) && (pmlmeinfo->HT_info.infos[0] & BIT(2))) {
>  		int i;
> =20
> +		u8 *mcs_rate =3D pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate;

Please move u8 *mcs_rate... under int i; and add a blank like between=20
u8 *mcs_rate... and /* update the MCS set */.

>  		/* update the MCS set */
>  		for (i =3D 0; i < 16; i++)
> -			pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate[i] &=3D pmlmeext->defaul=
t_supported_mcs_set[i];
> +			mcs_rate[i] &=3D pmlmeext->default_supported_mcs_set[i];
> =20
>  		/* update the MCS rates */
>  		set_mcs_rate_by_mask(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS=
_RATE_1R);
> @@ -2552,7 +2652,8 @@ void _rtw_roaming(struct adapter *padapter, struct =
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

So for the v3 make this into a patch series:
0/5-Cover letter
1/5-Bug fix
2/5-Long lines
3/5-Dead code removal
4/5-Line consolidation
5/5-Blank line addition
If there are any other present unrelated changes I forgot, add them as=20
6/6, 7/7 etc(note that if there are lets say 7 patches, patch series=20
should go 0/7, 1/7...). Looking forward to v3.
Best regards,
Luka Gejak
