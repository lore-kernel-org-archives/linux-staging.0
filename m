Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B0F26A1B9
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775926122; cv=none; b=bmf/DM87nx71j9zEJ6qYr4N0tRVLTf6EHRgVJlsjfFvwZEw0kUDH4NSSQ1Kn8p+Y5rk/11ZYbGcuIn+5aGC8nLW6e7it2ZpazLtf1vaFj5aMW+hiV93i0MQzd9bnH/OntFvwYeSxBmVQYPIYRziZH946oqWMGhCai/K+YwrGuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775926122; c=relaxed/simple;
	bh=Ub0GDY7HoXIHNdaJV/EJS/3Q/eDsd4sV/WzSKSzGSB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IlZBEvdQVdeY/uYBq1xIiaZNrtT1G+NPQJuOHqzm5EHyW17clkuIQTh4mx+xjLiyfkb0WZDnsOKPPiUyD3pUw3Se+45zw6v9NlsbLrAZEoGIOfVV3of8z8OhEbuOun/Ee4ECCxfUehsR7aNUs1DVqWLZkkx40XDjSsuZwjCLN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wLnmGhKq; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wLnmGhKq"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775926114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+yASpXXVnkuAkZ9kMqy2soGIerLXhou/pNqbtzNqN5A=;
	b=wLnmGhKq2bFeUkh2RB56SD9yO9TuKAYyqJDZfSinbE6DTR9A/TWYuh0Lo/fHawrdfEf2Ob
	hTuN+8Su9eHJxsJBf+hIbThXmbBLoNxXdgl7bHNEOqTxxuxuPTdh7E55C9oznocYFzhEkn
	2AXO50jF4Ane2AXwqmd4P5MZxk8/6AE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 18:48:30 +0200
Message-Id: <DHQH9K892A8S.2RE0149G0HSKT@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: verify boolean and logics and
 rename dot11AuthAlgrthm
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Nguyen Duc Thinh" <ducthinh100812@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20260411035303.859-1-ducthinh100812@gmail.com>
 <20260411035303.859-2-ducthinh100812@gmail.com>
In-Reply-To: <20260411035303.859-2-ducthinh100812@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 11, 2026 at 5:53 AM CEST, Nguyen Duc Thinh wrote:
> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

First of all you must have commit message body. Skipping to Signed-off-
by tag is not allowed. Moreover you should follow 1 change per patch=20
rule that states that one patch should only do 1 type of change. You=20
should split this patch into 2, one for booleans and one for renaming
dot11AuthAlgrthm and send it as v2. Furthermore your subject should be=20
descriptive of the change that the patch does("verify boolean and=20
logics" means nothing, same for "rename dot11AuthAlgrthm" why? Saying=20
something like simplify boolean comparisons and renamed CamelCase of=20
dot11AuthAlgrthm would be more appropriate).

> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c       | 28 ++++----
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 40 +++++------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 ++---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 70 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  8 +--
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 36 +++++-----
>  drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 ++--
>  .../staging/rtl8723bs/include/rtw_security.h  | 14 ++--
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 ++++-----
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
>  16 files changed, 145 insertions(+), 145 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rt=
l8723bs/core/rtw_ap.c
> index 864cd8b6d..dd915c654 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -301,7 +301,7 @@ void expire_timeout_chk(struct adapter *padapter)
> =20
>  			psta->keep_alive_trycnt =3D 0;
>  			spin_lock_bh(&pstapriv->asoc_list_lock);
> -			if (list_empty(&psta->asoc_list) =3D=3D false) {
> +			if (!list_empty(&psta->asoc_list)) {
>  				list_del_init(&psta->asoc_list);
>  				pstapriv->asoc_list_cnt--;
>  				updated =3D ap_free_sta(padapter, psta, false,
> @@ -416,7 +416,7 @@ void update_bmc_sta(struct adapter *padapter)
>  		/* ap mode */
>  		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
> =20
> -		/* if (pHalData->fw_ractrl =3D=3D true) */
> +		/* if (pHalData->fw_ractrl) */
>  		{
>  			u8 arg[4] =3D {0};
> =20
> @@ -461,7 +461,7 @@ void update_sta_info_apmode(struct adapter *padapter,=
 struct sta_info *psta)
>  	/* ap mode */
>  	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
> =20
> -	if (psecuritypriv->dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_8021X)
> +	if (psecuritypriv->dot11_auth_algrthm =3D=3D dot11_auth_algrthm_8021X)
>  		psta->ieee8021x_blocked =3D true;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	else
>  		psta->ieee8021x_blocked =3D false;
> @@ -704,8 +704,8 @@ void start_bss_network(struct adapter *padapter)
>  	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
> =20
>  	/* Set Security */
> -	val8 =3D (psecuritypriv->dot11AuthAlgrthm =3D=3D
> -		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
> +	val8 =3D (psecuritypriv->dot11_auth_algrthm =3D=3D
> +		dot11_auth_algrthm_8021X) ? 0xcc : 0xcf;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
> =20
>  	/* Beacon Control related register */
> @@ -924,7 +924,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u=
8 *pbuf,  int len)
>  				      &group_cipher,
>  				      &pairwise_cipher,
>  				      NULL) =3D=3D _SUCCESS) {
> -			psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +			psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  			psecuritypriv->dot8021xalg =3D 1;/* psk,  todo:802.1x */
>  			psecuritypriv->wpa_psk |=3D BIT(1);
> @@ -950,7 +950,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u=
8 *pbuf,  int len)
>  					     &group_cipher,
>  					     &pairwise_cipher,
>  					     NULL) =3D=3D _SUCCESS) {
> -				psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +				psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  				psecuritypriv->dot8021xalg =3D 1;/* psk,  todo:802.1x */
> =20
> @@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapte=
r, u8 *pbuf,  int len)
> =20
>  		rtw_ht_use_default_setting(padapter);
> =20
> -		if (pmlmepriv->htpriv.sgi_20m =3D=3D false)
> +		if (!pmlmepriv->htpriv.sgi_20m)
>  			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
> =20
> -		if (pmlmepriv->htpriv.sgi_40m =3D=3D false)
> +		if (!pmlmepriv->htpriv.sgi_40m)
>  			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
> =20
>  		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
> @@ -1156,7 +1156,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *a=
ddr)
>  		paclnode =3D list_entry(plist, struct rtw_wlan_acl_node, list);
> =20
>  		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
> -			if (paclnode->valid =3D=3D true) {
> +			if (paclnode->valid) {
>  				added =3D true;
>  				break;
>  			}
> @@ -1573,8 +1573,8 @@ static int rtw_ht_operation_update(struct adapter *=
padapter)
>  	if (pmlmepriv->htpriv.ht_option)
>  		return 0;
> =20
> -	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
> -	    && pmlmepriv->num_sta_ht_no_gf) {
> +	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
> +	    pmlmepriv->num_sta_ht_no_gf) {

This is completely unrelated as it changes location of the &&. I=20
understand why you did it but it is still unrelated change.

>  		pmlmepriv->ht_op_mode |=3D
>  			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
>  		op_mode_changes++;
> @@ -1780,8 +1780,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *pada=
pter, struct sta_info *psta)
>  	if (psta->no_short_preamble_set) {
>  		psta->no_short_preamble_set =3D 0;
>  		pmlmepriv->num_sta_no_short_preamble--;
> -		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
> -		    && pmlmepriv->num_sta_no_short_preamble =3D=3D 0){
> +		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
> +		    pmlmepriv->num_sta_no_short_preamble =3D=3D 0){

Same as above.

>  			beacon_updated =3D true;
>  			update_beacon(padapter, 0xFF, NULL, true);
>  		}
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/stagin=
g/rtl8723bs/core/rtw_btcoex.c
> index f4b19ef7b..b6611f771 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -11,7 +11,7 @@
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_sta=
tus)
>  {
>  	if ((media_status =3D=3D RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) =3D=3D true)) {
> +		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}
> =20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ieee80211.c
> index 3e2b5e6b0..51030a10b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -347,7 +347,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypr=
iv)
> =20
>  	/* HT Cap. */
>  	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
> -	    (pregistrypriv->ht_enable =3D=3D true)) {
> +	    (pregistrypriv->ht_enable)) {
>  		/* todo: */
>  	}
> =20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ioctl_set.c
> index 587a87fbf..977169889 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
> @@ -84,7 +84,7 @@ u8 rtw_do_join(struct adapter *padapter)
>  			pmlmepriv->to_join =3D false;
>  			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
>  		} else {
> -			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) {
> +			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>  				/*  submit createbss_cmd to change to a ADHOC_MASTER */
> =20
>  				/* pmlmepriv->lock has been acquired by caller... */
> @@ -151,12 +151,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, st=
ruct ndis_802_11_ssid *ssid)
> =20
>  	spin_lock_bh(&pmlmepriv->lock);
> =20
> -	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) =3D=3D true)
> +	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
>  		goto handle_tkip_countermeasure;
> -	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
> +	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>  		goto release_mlme_lock;
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) =3D=3D=
 true) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
>  		if ((pmlmepriv->assoc_ssid.ssid_length =3D=3D ssid->ssid_length) &&
>  		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_lengt=
h))) {
>  			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D false) {
> @@ -164,12 +164,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, st=
ruct ndis_802_11_ssid *ssid)
>  					/* if in WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE, create bss or =
rejoin again */
>  					rtw_disassoc_cmd(padapter, 0, true);
> =20
> -					if (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true)
> +					if (check_fwstate(pmlmepriv, _FW_LINKED))
>  						rtw_indicate_disconnect(padapter);
> =20
>  					rtw_free_assoc_resources(padapter, 1);
> =20
> -					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true) =
{
> +					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
>  						_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
>  						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
>  					}
> @@ -182,12 +182,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, st=
ruct ndis_802_11_ssid *ssid)
>  		} else {
>  			rtw_disassoc_cmd(padapter, 0, true);
> =20
> -			if (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true)
> +			if (check_fwstate(pmlmepriv, _FW_LINKED))
>  				rtw_indicate_disconnect(padapter);
> =20
>  			rtw_free_assoc_resources(padapter, 1);
> =20
> -			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true) {
> +			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
>  				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
>  				set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
>  			}
> @@ -208,7 +208,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, stru=
ct ndis_802_11_ssid *ssid)
>  	memcpy(&pmlmepriv->assoc_ssid, ssid, sizeof(struct ndis_802_11_ssid));
>  	pmlmepriv->assoc_by_bssid =3D false;
> =20
> -	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) =3D=3D true)
> +	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
>  		pmlmepriv->to_join =3D true;
>  	else
>  		status =3D rtw_do_join(padapter);
> @@ -249,9 +249,9 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u=
8 *bssid, struct ndis_802_1
>  	netdev_dbg(padapter->pnetdev, FUNC_ADPT_FMT "  fw_state =3D 0x%08x\n",
>  		   FUNC_ADPT_ARG(padapter), get_fwstate(pmlmepriv));
> =20
> -	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) =3D=3D true)
> +	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
>  		goto handle_tkip_countermeasure;
> -	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
> +	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>  		goto release_mlme_lock;
> =20
>  handle_tkip_countermeasure:
> @@ -272,7 +272,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u=
8 *bssid, struct ndis_802_1
>  		pmlmepriv->assoc_by_bssid =3D false;
>  	}
> =20
> -	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) =3D=3D true)
> +	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
>  		pmlmepriv->to_join =3D true;
>  	else
>  		status =3D rtw_do_join(padapter);
> @@ -301,15 +301,15 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapte=
r *padapter,
> =20
>  		spin_lock_bh(&pmlmepriv->lock);
> =20
> -		if ((check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true) || (*pold_state=
 =3D=3D Ndis802_11IBSS))
> +		if ((check_fwstate(pmlmepriv, _FW_LINKED)) || (*pold_state =3D=3D Ndis=
802_11IBSS))
>  			rtw_disassoc_cmd(padapter, 0, true);
> =20
> -		if ((check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true) ||
> -			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true))
> +		if ((check_fwstate(pmlmepriv, _FW_LINKED)) ||
> +			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)))
>  			rtw_free_assoc_resources(padapter, 1);
> =20
>  		if ((*pold_state =3D=3D Ndis802_11Infrastructure) || (*pold_state =3D=
=3D Ndis802_11IBSS)) {
> -			if (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true)
> +			if (check_fwstate(pmlmepriv, _FW_LINKED))
>  				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before =
this function, we must have checked whether issue dis-assoc_cmd or not */
>  		}
> =20
> @@ -352,7 +352,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapt=
er)
> =20
>  	spin_lock_bh(&pmlmepriv->lock);
> =20
> -	if (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true) {
> +	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>  		rtw_disassoc_cmd(padapter, 0, true);
>  		rtw_indicate_disconnect(padapter);
>  		/* modify for CONFIG_IEEE80211W, none 11w can use it */
> @@ -379,8 +379,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *pad=
apter, struct ndis_802_11_s
>  		goto exit;
>  	}
> =20
> -	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) =3D=
=3D true) ||
> -		(pmlmepriv->LinkDetectInfo.bBusyTraffic =3D=3D true)) {
> +	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING)) ||
> +		(pmlmepriv->LinkDetectInfo.bBusyTraffic)) {
>  		/*  Scan or linking is in progress, do nothing. */
>  		res =3D true;
> =20
> @@ -408,7 +408,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter =
*padapter, enum ndis_802_11
>  	psecuritypriv->ndisauthtype =3D authmode;
> =20
>  	if (psecuritypriv->ndisauthtype > 3)
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;
> =20
>  	res =3D rtw_set_auth(padapter, psecuritypriv);
> =20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index 1ef48bf65..e4fe6cd92 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -987,7 +987,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(st=
ruct adapter *padapter, str
>  		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
> =20
>  		/* security related */
> -		if (padapter->securitypriv.dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_80=
21X) {
> +		if (padapter->securitypriv.dot11_auth_algrthm =3D=3D dot11_auth_algrth=
m_8021X) {

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			padapter->securitypriv.binstallGrpkey =3D false;
>  			padapter->securitypriv.busetkipkey =3D false;
>  			padapter->securitypriv.bgrpkey_handshake =3D false;
> @@ -1098,7 +1098,7 @@ void rtw_reset_securitypriv(struct adapter *adapter=
)
> =20
>  	spin_lock_bh(&adapter->security_key_mutex);
> =20
> -	if (adapter->securitypriv.dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_8021=
X) {
> +	if (adapter->securitypriv.dot11_auth_algrthm =3D=3D dot11_auth_algrthm_=
8021X) {

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		/* 802.1x */
>  		/*  Added by Albert 2009/02/18 */
>  		/*  We have to backup the PMK information for WiFi PMK Caching test it=
em. */
> @@ -1132,7 +1132,7 @@ void rtw_reset_securitypriv(struct adapter *adapter=
)
>  		/*  */
>  		struct security_priv *psec_priv =3D &adapter->securitypriv;
> =20
> -		psec_priv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open;  /* open system=
 */
> +		psec_priv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open;  /* open sy=
stem */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		psec_priv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
>  		psec_priv->dot11PrivacyKeyIndex =3D 0;
> =20
> @@ -1367,7 +1367,7 @@ void rtw_stassoc_event_callback(struct adapter *ada=
pter, u8 *pbuf)
> =20
>  	rtw_sta_media_status_rpt(adapter, psta, 1);
> =20
> -	if (adapter->securitypriv.dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_8021=
X)
> +	if (adapter->securitypriv.dot11_auth_algrthm =3D=3D dot11_auth_algrthm_=
8021X)

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		psta->dot118021XPrivacy =3D adapter->securitypriv.dot11PrivacyAlgrthm;
> =20
>  	psta->ieee8021x_blocked =3D false;
> @@ -1594,7 +1594,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *a=
dapter)
> =20
>  	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP=
 */
>  		mlme->auto_scan_int_ms =3D 0;
> -	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(=
adapter) =3D=3D true)
> +	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(=
adapter))
>  		mlme->auto_scan_int_ms =3D 60 * 1000;
>  	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
>  		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW=
_LINKED))
> @@ -1888,7 +1888,7 @@ signed int rtw_set_auth(struct adapter *adapter, st=
ruct security_priv *psecurity
>  		goto exit;
>  	}
> =20
> -	psetauthparm->mode =3D (unsigned char)psecuritypriv->dot11AuthAlgrthm;
> +	psetauthparm->mode =3D (unsigned char)psecuritypriv->dot11_auth_algrthm=
;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  	pcmd->cmdcode =3D _SetAuth_CMD_;
>  	pcmd->parmbuf =3D (unsigned char *)psetauthparm;
> @@ -1918,7 +1918,7 @@ signed int rtw_set_key(struct adapter *adapter, str=
uct security_priv *psecurityp
>  		goto exit;
>  	}
> =20
> -	if (psecuritypriv->dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_8021X)
> +	if (psecuritypriv->dot11_auth_algrthm =3D=3D dot11_auth_algrthm_8021X)

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		psetkeyparm->algorithm =3D (unsigned char)psecuritypriv->dot118021XGrp=
Privacy;
>  	else
>  		psetkeyparm->algorithm =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;
> @@ -2531,7 +2531,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapte=
r, struct xmit_frame *pxmitfr
> =20
>  		if (issued =3D=3D 0) {
>  			psta->htpriv.candidate_tid_bitmap |=3D BIT((u8)priority);
> -			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
> +			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);

This is completely unrelated change. If you want to introduce it please=20
make another patch in the series.

>  		}
>  	}
>  }
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
> index b1f20aa81..1388a7418 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -236,7 +236,7 @@ static void init_mlme_ext_priv_value(struct adapter *=
padapter)
>  	pmlmeinfo->reassoc_count =3D 0;
>  	pmlmeinfo->link_count =3D 0;
>  	pmlmeinfo->auth_seq =3D 0;
> -	pmlmeinfo->auth_algo =3D dot11AuthAlgrthm_Open;
> +	pmlmeinfo->auth_algo =3D dot11_auth_algrthm_Open;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	pmlmeinfo->key_index =3D 0;
>  	pmlmeinfo->iv =3D 0;
> =20
> @@ -485,7 +485,7 @@ void mgt_dispatcher(struct adapter *padapter, union r=
ecv_frame *precv_frame)
>  		_mgt_dispatcher(padapter, ptable, precv_frame);
>  		break;
>  	case WIFI_ACTION:
> -		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) */
> +		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
>  		_mgt_dispatcher(padapter, ptable, precv_frame);
>  		break;
>  	default:
> @@ -688,7 +688,7 @@ unsigned int OnAuth(struct adapter *padapter, union r=
ecv_frame *precv_frame)
> =20
>  	sa =3D GetAddr2Ptr(pframe);
> =20
> -	auth_mode =3D psecuritypriv->dot11AuthAlgrthm;
> +	auth_mode =3D psecuritypriv->dot11_auth_algrthm;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  	if (GetPrivacy(pframe)) {
>  		u8 *iv;
> @@ -872,11 +872,11 @@ unsigned int OnAuthClient(struct adapter *padapter,=
 union recv_frame *precv_fram
>  	status	=3D le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN +=
 offset + 4));
> =20
>  	if (status !=3D 0) {
> -		if (status =3D=3D 13) { /*  pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrt=
hm_Auto) */
> -			if (pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrthm_Shared)
> -				pmlmeinfo->auth_algo =3D dot11AuthAlgrthm_Open;
> +		if (status =3D=3D 13) { /*  pmlmeinfo->auth_algo =3D=3D dot11_auth_alg=
rthm_Auto) */
> +			if (pmlmeinfo->auth_algo =3D=3D dot11_auth_algrthm_Shared)
> +				pmlmeinfo->auth_algo =3D dot11_auth_algrthm_Open;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			else
> -				pmlmeinfo->auth_algo =3D dot11AuthAlgrthm_Shared;
> +				pmlmeinfo->auth_algo =3D dot11_auth_algrthm_Shared;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			/* pmlmeinfo->reauth_count =3D 0; */
>  		}
> =20
> @@ -885,7 +885,7 @@ unsigned int OnAuthClient(struct adapter *padapter, u=
nion recv_frame *precv_fram
>  	}
> =20
>  	if (seq =3D=3D 2) {
> -		if (pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrthm_Shared) {
> +		if (pmlmeinfo->auth_algo =3D=3D dot11_auth_algrthm_Shared) {

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			 /*  legendary shared system */
>  			p =3D rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EI=
D_CHALLENGE, (int *)&len,
>  				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
> @@ -903,7 +903,7 @@ unsigned int OnAuthClient(struct adapter *padapter, u=
nion recv_frame *precv_fram
>  		/* open system */
>  		go2asoc =3D 1;
>  	} else if (seq =3D=3D 4) {
> -		if (pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrthm_Shared)
> +		if (pmlmeinfo->auth_algo =3D=3D dot11_auth_algrthm_Shared)

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			go2asoc =3D 1;
>  		else
>  			goto authclnt_fail;
> @@ -2630,7 +2630,7 @@ void issue_auth(struct adapter *padapter, struct st=
a_info *psta, unsigned short
>  		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
> =20
>  		/*  setting auth algo number */
> -		val16 =3D (pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrthm_Shared) ? 1 : =
0;/*  0:OPEN System, 1:Shared key */
> +		val16 =3D (pmlmeinfo->auth_algo =3D=3D dot11_auth_algrthm_Shared) ? 1 =
: 0;/*  0:OPEN System, 1:Shared key */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		if (val16)
>  			use_shared_key =3D 1;
>  		le_tmp =3D cpu_to_le16(val16);
> @@ -4111,7 +4111,7 @@ void start_clnt_join(struct adapter *padapter)
>  	if (caps&WLAN_CAPABILITY_ESS) {
>  		set_msr(padapter, WIFI_FW_STATION_STATE);
> =20
> -		val8 =3D (pmlmeinfo->auth_algo =3D=3D dot11AuthAlgrthm_8021X) ? 0xcc :=
 0xcf;
> +		val8 =3D (pmlmeinfo->auth_algo =3D=3D dot11_auth_algrthm_8021X) ? 0xcc=
 : 0xcf;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
> =20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_pwrctrl.c
> index 1c9e02732..6934d27eb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -321,7 +321,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
>  	)
>  		return false;
> =20
> -	if (padapter->securitypriv.dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_802=
1X &&
> +	if (padapter->securitypriv.dot11_auth_algrthm =3D=3D dot11_auth_algrthm=
_8021X &&

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	    !padapter->securitypriv.binstallGrpkey)
>  		return false;
> =20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/=
rtl8723bs/core/rtw_recv.c
> index 337671b12..84cb0e474 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -382,7 +382,7 @@ static signed int recvframe_chkmic(struct adapter *ad=
apter,  union recv_frame *p
> =20
>  				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_k=
ey_idx); */
> =20
> -				if (psecuritypriv->binstallGrpkey =3D=3D false) {
> +				if (!psecuritypriv->binstallGrpkey) {
>  					res =3D _FAIL;
>  					goto exit;
>  				}
> @@ -406,10 +406,10 @@ static signed int recvframe_chkmic(struct adapter *=
adapter,  union recv_frame *p
>  			}
> =20
> =20
> -			if (bmic_err =3D=3D true) {
> +			if (bmic_err) {
>  				/*  double check key_index for some timing issue , */
>  				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause=
 timing issue */
> -				if ((is_multicast_ether_addr(prxattrib->ra) =3D=3D true)  && (prxatt=
rib->key_index !=3D pmlmeinfo->key_index))
> +				if ((is_multicast_ether_addr(prxattrib->ra))  && (prxattrib->key_ind=
ex !=3D pmlmeinfo->key_index))
>  					brpt_micerror =3D false;
> =20
>  				if (prxattrib->bdecrypted && brpt_micerror)
> @@ -463,7 +463,7 @@ static union recv_frame *decryptor(struct adapter *pa=
dapter, union recv_frame *p
>  		}
>  	}
> =20
> -	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted =3D=3D 0) || (p=
securitypriv->sw_decrypt =3D=3D true))) {
> +	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted =3D=3D 0) || (p=
securitypriv->sw_decrypt))) {
>  		psecuritypriv->hw_decrypted =3D false;
> =20
>  		switch (prxattrib->encrypt) {
> @@ -512,7 +512,7 @@ static union recv_frame *portctrl(struct adapter *ada=
pter, union recv_frame *pre
> =20
>  	pstapriv =3D &adapter->stapriv;
> =20
> -	auth_alg =3D adapter->securitypriv.dot11AuthAlgrthm;
> +	auth_alg =3D adapter->securitypriv.dot11_auth_algrthm;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  	ptr =3D precv_frame->u.hdr.rx_data;
>  	pfhdr =3D &precv_frame->u.hdr;
> @@ -713,8 +713,8 @@ static signed int sta2sta_data_frame(struct adapter *=
adapter, union recv_frame *
>  	u8 *sta_addr =3D NULL;
>  	signed int bmcast =3D is_multicast_ether_addr(pattrib->dst);
> =20
> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true)) {
> +	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
> +		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
> =20
>  		/*  filter packets that SA is myself or multicast or broadcast */
>  		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
> @@ -736,7 +736,7 @@ static signed int sta2sta_data_frame(struct adapter *=
adapter, union recv_frame *
> =20
>  		sta_addr =3D pattrib->src;
> =20
> -	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D true) {
> +	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>  		/*  For Station mode, sa and bssid should always be BSSID, and DA is m=
y mac-address */
>  		if (memcmp(pattrib->bssid, pattrib->src, ETH_ALEN)) {
>  			ret =3D _FAIL;
> @@ -744,7 +744,7 @@ static signed int sta2sta_data_frame(struct adapter *=
adapter, union recv_frame *
>  		}
> =20
>  		sta_addr =3D pattrib->bssid;
> -	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) {
> +	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
>  		if (bmcast) {
>  			/*  For AP mode, if DA =3D=3D MCAST, then BSSID should be also MCAST =
*/
>  			if (!is_multicast_ether_addr(pattrib->bssid)) {
> @@ -761,7 +761,7 @@ static signed int sta2sta_data_frame(struct adapter *=
adapter, union recv_frame *
>  			sta_addr =3D pattrib->src;
>  		}
> =20
> -	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) =3D=3D true) {
> +	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
>  		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
>  		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
>  		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
> @@ -800,9 +800,9 @@ static signed int ap2sta_data_frame(struct adapter *a=
dapter, union recv_frame *p
>  	u8 *myhwaddr =3D myid(&adapter->eeprompriv);
>  	signed int bmcast =3D is_multicast_ether_addr(pattrib->dst);
> =20
> -	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) =3D=3D true) &&
> -	    (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true ||
> -	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING) =3D=3D true)
> +	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
> +	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
> +	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>  		) {
> =20
>  		/*  filter packets that SA is myself or multicast or broadcast */
> @@ -847,8 +847,8 @@ static signed int ap2sta_data_frame(struct adapter *a=
dapter, union recv_frame *p
>  			goto exit;
>  		}
> =20
> -	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) =3D=3D true) &&
> -		     (check_fwstate(pmlmepriv, _FW_LINKED) =3D=3D true)) {
> +	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
> +		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
>  		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
>  		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
>  		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
> @@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *a=
dapter, union recv_frame *p
>  		}
> =20
> =20
> -	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) {
> +	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
>  		/* Special case */
>  		ret =3D RTW_RX_HANDLED;
>  		goto exit;
> @@ -903,7 +903,7 @@ static signed int sta2ap_data_frame(struct adapter *a=
dapter, union recv_frame *p
>  	unsigned char *mybssid  =3D get_bssid(pmlmepriv);
>  	signed int ret =3D _SUCCESS;
> =20
> -	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) {
> +	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
>  		/* For AP mode, RA =3DBSSID, TX =3DSTA(SRC_ADDR), A3 =3DDST_ADDR */
>  		if (memcmp(pattrib->bssid, mybssid, ETH_ALEN)) {
>  			ret =3D _FAIL;
> @@ -1409,7 +1409,7 @@ static signed int validate_80211w_mgmt(struct adapt=
er *adapter, union recv_frame
> =20
>  	/* only support station mode */
>  	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlme=
priv, _FW_LINKED) &&
> -	    adapter->securitypriv.binstallBIPkey =3D=3D true) {
> +	    adapter->securitypriv.binstallBIPkey) {
>  		/* unicast management frame decrypt */
>  		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &=
&
>  			(subtype =3D=3D WIFI_DEAUTH || subtype =3D=3D WIFI_DISASSOC || subtyp=
e =3D=3D WIFI_ACTION)) {
> @@ -1593,7 +1593,7 @@ static signed int wlanhdr_to_ethhdr(union recv_fram=
e *precvframe)
>  	eth_type =3D ntohs(be_tmp); /* pattrib->ether_type */
>  	pattrib->eth_type =3D eth_type;
> =20
> -	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) =3D=3D true)) {
> +	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
>  		ptr +=3D rmv_len;
>  		*ptr =3D 0x87;
>  		*(ptr+1) =3D 0x12;
> @@ -1668,7 +1668,7 @@ static void rtw_recv_indicate_pkt(struct adapter *p=
adapter, struct sk_buff *pkt,
> =20
>  	/* Indicate the packets to upper layer */
>  	if (pkt) {
> -		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) {
> +		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
>  			struct sk_buff *pskb2 =3D NULL;
>  			struct sta_info *psta =3D NULL;
>  			struct sta_priv *pstapriv =3D &padapter->stapriv;
> @@ -1911,7 +1911,7 @@ static int recv_indicatepkts_in_order(struct adapte=
r *padapter, struct recv_reor
>  	plist =3D get_next(phead);
> =20
>  	/*  Handling some condition for forced indicate case. */
> -	if (bforced =3D=3D true) {
> +	if (bforced) {
>  		if (list_empty(phead)) {
>  			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			/* spin_unlock(&ppending_recvframe_queue->lock); */
> @@ -1946,8 +1946,8 @@ static int recv_indicatepkts_in_order(struct adapte=
r *padapter, struct recv_reor
> =20
>  			/* indicate this recv_frame */
>  			if (!pattrib->amsdu) {
> -				if ((padapter->bDriverStopped =3D=3D false) &&
> -				    (padapter->bSurpriseRemoved =3D=3D false))
> +				if ((!padapter->bDriverStopped) &&
> +				    (!padapter->bSurpriseRemoved))
>  					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame=
 */
> =20
>  			} else if (pattrib->amsdu =3D=3D 1) {
> @@ -1987,8 +1987,8 @@ static int recv_indicatepkt_reorder(struct adapter =
*padapter, union recv_frame *
>  		wlanhdr_to_ethhdr(prframe);
> =20
>  		if (pattrib->qos !=3D 1) {
> -			if ((padapter->bDriverStopped =3D=3D false) &&
> -			    (padapter->bSurpriseRemoved =3D=3D false)) {
> +			if ((!padapter->bDriverStopped) &&
> +			    (!padapter->bSurpriseRemoved)) {
>  				rtw_recv_indicatepkt(padapter, prframe);
>  				return _SUCCESS;
> =20
> @@ -1998,7 +1998,7 @@ static int recv_indicatepkt_reorder(struct adapter =
*padapter, union recv_frame *
> =20
>  		}
> =20
> -		if (preorder_ctrl->enable =3D=3D false) {
> +		if (!preorder_ctrl->enable) {
>  			/* indicate this recv_frame */
>  			preorder_ctrl->indicate_seq =3D pattrib->seq_num;
> =20
> @@ -2009,7 +2009,7 @@ static int recv_indicatepkt_reorder(struct adapter =
*padapter, union recv_frame *
>  			return _SUCCESS;
>  		}
>  	} else if (pattrib->amsdu =3D=3D 1) { /* temp filter -> means didn't su=
pport A-MSDUs in a A-MPDU */
> -		if (preorder_ctrl->enable =3D=3D false) {
> +		if (!preorder_ctrl->enable) {
>  			preorder_ctrl->indicate_seq =3D pattrib->seq_num;
> =20
>  			retval =3D amsdu_to_msdu(padapter, prframe);
> @@ -2045,7 +2045,7 @@ static int recv_indicatepkt_reorder(struct adapter =
*padapter, union recv_frame *
>  	/*  */
> =20
>  	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
> -	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false) =3D=3D t=
rue) {
> +	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
>  		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
>  		spin_unlock_bh(&ppending_recvframe_queue->lock);
>  	} else {
> @@ -2075,7 +2075,7 @@ void rtw_reordering_ctrl_timeout_handler(struct tim=
er_list *t)
> =20
>  	spin_lock_bh(&ppending_recvframe_queue->lock);
> =20
> -	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true) =3D=3D tr=
ue)
> +	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true))
>  		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
> =20
>  	spin_unlock_bh(&ppending_recvframe_queue->lock);
> @@ -2090,13 +2090,13 @@ static int process_recv_indicatepkts(struct adapt=
er *padapter, union recv_frame
>  	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>  	struct ht_priv *phtpriv =3D &pmlmepriv->htpriv;
> =20
> -	if (phtpriv->ht_option =3D=3D true) { /* B/G/N Mode */
> +	if (phtpriv->ht_option) { /* B/G/N Mode */
>  		/* prframe->u.hdr.preorder_ctrl =3D &precvpriv->recvreorder_ctrl[pattr=
ib->priority]; */
> =20
>  		if (recv_indicatepkt_reorder(padapter, prframe) !=3D _SUCCESS) { /*  i=
ncluding perform A-MPDU Rx Ordering Buffer Control */
> =20
> -			if ((padapter->bDriverStopped =3D=3D false) &&
> -			    (padapter->bSurpriseRemoved =3D=3D false)) {
> +			if ((!padapter->bDriverStopped) &&
> +			    (!padapter->bSurpriseRemoved)) {
>  				retval =3D _FAIL;
>  				return retval;
>  			}
> @@ -2106,7 +2106,7 @@ static int process_recv_indicatepkts(struct adapter=
 *padapter, union recv_frame
>  		if (retval !=3D _SUCCESS)
>  			return retval;
> =20
> -		if ((padapter->bDriverStopped =3D=3D false) && (padapter->bSurpriseRem=
oved =3D=3D false)) {
> +		if ((!padapter->bDriverStopped) && (!padapter->bSurpriseRemoved)) {
>  			/* indicate this recv_frame */
>  			rtw_recv_indicatepkt(padapter, prframe);
>  		} else {
> @@ -2195,7 +2195,7 @@ static int recv_func(struct adapter *padapter, unio=
n recv_frame *rframe)
>  		/* check if need to enqueue into uc_swdec_pending_queue*/
>  		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
>  			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
> -			(prxattrib->bdecrypted =3D=3D 0 || psecuritypriv->sw_decrypt =3D=3D t=
rue) &&
> +			(prxattrib->bdecrypted =3D=3D 0 || psecuritypriv->sw_decrypt) &&
>  			psecuritypriv->ndisauthtype =3D=3D Ndis802_11AuthModeWPAPSK &&
>  			!psecuritypriv->busetkipkey) {
>  			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_qu=
eue);
> @@ -2282,7 +2282,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_=
list *t)
>  			}
>  		}
> =20
> -		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) =3D=3D true ||
> +		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
>  		    check_fwstate(&adapter->mlmepriv, _FW_LINKED) =3D=3D false
>  		) {
>  			goto set_timer;
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/stagi=
ng/rtl8723bs/core/rtw_sta_mgt.c
> index bdd4b6d8f..3b6c4c652 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_=
addr)
>  		paclnode =3D list_entry(plist, struct rtw_wlan_acl_node, list);
> =20
>  		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
> -			if (paclnode->valid =3D=3D true) {
> +			if (paclnode->valid) {
>  				match =3D true;
>  				break;
>  			}
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/sta=
ging/rtl8723bs/core/rtw_wlan_util.c
> index 3242978da..b014585d5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -147,7 +147,7 @@ unsigned int ratetbl2rateset(struct adapter *padapter=
, unsigned char *rateset)
>  		default:
>  			rate =3D ratetbl_val_2wifirate(rate);
> =20
> -			if (is_basicrate(padapter, rate) =3D=3D true)
> +			if (is_basicrate(padapter, rate))
>  				rate |=3D IEEE80211_BASIC_RATE_MASK;
> =20
>  			rateset[len] =3D rate;
> @@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
> =20
>  void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
>  {
> -	if (enable =3D=3D true)
> +	if (enable)
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
>  	else
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
> @@ -1687,7 +1687,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlme=
ext, u8 *pframe, uint len)
>  		pmlmeext->bcn_delay_cnt[delay_ms]++;
>  		/* pmlmeext->bcn_delay_ratio[delay_ms] =3D (pmlmeext->bcn_delay_cnt[de=
lay_ms] * 100) /pmlmeext->bcn_cnt; */
>  	/* dump for  adaptive_early_32k */
> -	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done =3D=3D true=
)) {
> +	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
>  		u8 ratio_20_delay, ratio_80_delay;
>  		u8 DrvBcnEarly, DrvBcnTimeOut;
> =20
> @@ -1760,7 +1760,7 @@ void rtw_release_macid(struct adapter *padapter, st=
ruct sta_info *psta)
> =20
>  	spin_lock_bh(&pdvobj->lock);
>  	if (psta->mac_id < NUM_STA && psta->mac_id !=3D 1) {
> -		if (pdvobj->macid[psta->mac_id] =3D=3D true) {
> +		if (pdvobj->macid[psta->mac_id]) {
>  			pdvobj->macid[psta->mac_id] =3D false;
>  			psta->mac_id =3D NUM_STA;
>  		}
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/=
rtl8723bs/core/rtw_xmit.c
> index 7b18be891..998f742c9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -384,7 +384,7 @@ static void update_attrib_vcs_info(struct adapter *pa=
dapter, struct xmit_frame *
>  	} else {
>  		while (true) {
>  			/* IOT action */
> -			if ((pmlmeinfo->assoc_AP_vendor =3D=3D HT_IOT_PEER_ATHEROS) && (pattr=
ib->ampdu_en =3D=3D true) &&
> +			if ((pmlmeinfo->assoc_AP_vendor =3D=3D HT_IOT_PEER_ATHEROS) && (pattr=
ib->ampdu_en) &&
>  			    (padapter->securitypriv.dot11PrivacyAlgrthm =3D=3D _AES_)) {
>  				pattrib->vcs_mode =3D CTS_TO_SELF;
>  				break;
> @@ -420,7 +420,7 @@ static void update_attrib_vcs_info(struct adapter *pa=
dapter, struct xmit_frame *
>  			/* to do list: check MIMO power save condition. */
> =20
>  			/* check AMPDU aggregation for TXOP */
> -			if (pattrib->ampdu_en =3D=3D true) {
> +			if (pattrib->ampdu_en) {
>  				pattrib->vcs_mode =3D RTS_CTS;
>  				break;
>  			}
> @@ -482,7 +482,7 @@ static s32 update_attrib_sec_info(struct adapter *pad=
apter, struct pkt_attrib *p
>  	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
>  	pattrib->mac_id =3D psta->mac_id;
> =20
> -	if (psta->ieee8021x_blocked =3D=3D true) {
> +	if (psta->ieee8021x_blocked) {
>  		pattrib->encrypt =3D 0;
> =20
>  		if ((pattrib->ether_type !=3D 0x888e) && (check_fwstate(pmlmepriv, WIF=
I_MP_STATE) =3D=3D false)) {
> @@ -492,13 +492,13 @@ static s32 update_attrib_sec_info(struct adapter *p=
adapter, struct pkt_attrib *p
>  	} else {
>  		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
> =20
> -		switch (psecuritypriv->dot11AuthAlgrthm) {
> -		case dot11AuthAlgrthm_Open:
> -		case dot11AuthAlgrthm_Shared:
> -		case dot11AuthAlgrthm_Auto:
> +		switch (psecuritypriv->dot11_auth_algrthm) {
> +		case dot11_auth_algrthm_Open:
> +		case dot11_auth_algrthm_Shared:
> +		case dot11_auth_algrthm_Auto:

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			pattrib->key_idx =3D (u8)psecuritypriv->dot11PrivacyKeyIndex;
>  			break;
> -		case dot11AuthAlgrthm_8021X:
> +		case dot11_auth_algrthm_8021X:

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			if (bmcast)
>  				pattrib->key_idx =3D (u8)psecuritypriv->dot118021XGrpKeyid;
>  			else
> @@ -650,8 +650,8 @@ static s32 update_attrib(struct adapter *padapter, st=
ruct sk_buff *pkt, struct p
>  	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
>  	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
> =20
> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true)) {
> +	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
> +		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
>  		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
>  		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
>  	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
> @@ -717,7 +717,7 @@ static s32 update_attrib(struct adapter *padapter, st=
ruct sk_buff *pkt, struct p
>  		if (!psta)	{ /*  if we cannot get psta =3D> drop the pkt */
>  			res =3D _FAIL;
>  			goto exit;
> -		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true) && (!=
(psta->state & _FW_LINKED))) {
> +		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && (!(psta->state=
 & _FW_LINKED))) {
>  			res =3D _FAIL;
>  			goto exit;
>  		}
> @@ -899,7 +899,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hd=
r, struct pkt_attrib *pattr
>  	SetFrameSubType(fctrl, pattrib->subtype);
> =20
>  	if (pattrib->subtype & WIFI_DATA_TYPE) {
> -		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) =3D=3D true) {
> +		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
>  			/* to_ds =3D 1, fr_ds =3D 0; */
> =20
>  			{
> @@ -913,7 +913,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hd=
r, struct pkt_attrib *pattr
> =20
>  			if (pqospriv->qos_option)
>  				qos_option =3D true;
> -		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) =3D=3D true) {
> +		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
>  			/* to_ds =3D 0, fr_ds =3D 1; */
>  			SetFrDs(fctrl);
>  			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
> @@ -922,8 +922,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hd=
r, struct pkt_attrib *pattr
> =20
>  			if (pattrib->qos_en)
>  				qos_option =3D true;
> -		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) =3D=3D true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) =3D=3D true)) {
> +		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
> +		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
>  			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
>  			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
>  			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
> @@ -981,7 +981,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hd=
r, struct pkt_attrib *pattr
>  						pattrib->ampdu_en =3D true;
> =20
>  				/* re-check if enable ampdu by BA_starting_seqctrl */
> -				if (pattrib->ampdu_en =3D=3D true) {
> +				if (pattrib->ampdu_en) {
>  					u16 tx_seq;
> =20
>  					tx_seq =3D psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> @@ -1138,7 +1138,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter=
, struct sk_buff *pkt, struct
> =20
>  		frg_inx++;
> =20
> -		if (bmcst || (rtw_endofpktfile(&pktfile) =3D=3D true)) {
> +		if (bmcst || (rtw_endofpktfile(&pktfile))) {
>  			pattrib->nr_frags =3D frg_inx;
> =20
>  			pattrib->last_txcmdsz =3D pattrib->hdrlen + pattrib->iv_len +
> @@ -2000,7 +2000,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_bu=
ff **ppkt)
>  	do_queue_select(padapter, &pxmitframe->attrib);
> =20
>  	spin_lock_bh(&pxmitpriv->lock);
> -	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) =3D=3D tru=
e) {
> +	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
>  		spin_unlock_bh(&pxmitpriv->lock);
>  		return 1;
>  	}
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rt=
l8723bs/hal/hal_com.c
> index 31b3e880a..6e0df3545 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -593,7 +593,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u=
8 *val)
> =20
>  		if (val) { /* Enable default key related setting */
>  			reg_scr |=3D SCR_TXBCUSEDK;
> -			if (sec->dot11AuthAlgrthm !=3D dot11AuthAlgrthm_8021X)
> +			if (sec->dot11_auth_algrthm !=3D dot11_auth_algrthm_8021X)

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  				reg_scr |=3D (SCR_RxUseDK|SCR_TxUseDK);
>  		} else /* Disable default key related setting */
>  			reg_scr &=3D ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/stagi=
ng/rtl8723bs/include/rtw_mlme.h
> index 2a128568c..cde8967bf 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> @@ -44,12 +44,12 @@
> =20
> =20
>  enum {
> - dot11AuthAlgrthm_Open =3D 0,
> - dot11AuthAlgrthm_Shared,
> - dot11AuthAlgrthm_8021X,
> - dot11AuthAlgrthm_Auto,
> - dot11AuthAlgrthm_WAPI,
> - dot11AuthAlgrthm_MaxNum
> + dot11_auth_algrthm_Open =3D 0,
> + dot11_auth_algrthm_Shared,
> + dot11_auth_algrthm_8021X,
> + dot11_auth_algrthm_Auto,
> + dot11_auth_algrthm_WAPI,
> + dot11_auth_algrthm_MaxNum

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  };
> =20
>  /*  Scan type including active and passive scan. */
> diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/s=
taging/rtl8723bs/include/rtw_security.h
> index 32f6d3a5e..e97c751e5 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -91,7 +91,7 @@ struct rt_pmkid_list {
> =20
> =20
>  struct security_priv {
> -	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x =
and authswitch */
> +	u32   dot11_auth_algrthm;		/*  802.11 auth, could be open, shared, 8021=
x and authswitch */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth=
. algorithm. */
> =20
>  	/* WEP */
> @@ -170,19 +170,19 @@ struct security_priv {
> =20
>  #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
>  do {\
> -	switch (psecuritypriv->dot11AuthAlgrthm) {\
> -	case dot11AuthAlgrthm_Open:\
> -	case dot11AuthAlgrthm_Shared:\
> -	case dot11AuthAlgrthm_Auto:\
> +	switch (psecuritypriv->dot11_auth_algrthm) {\
> +	case dot11_auth_algrthm_Open:\
> +	case dot11_auth_algrthm_Shared:\
> +	case dot11_auth_algrthm_Auto:\

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
>  		break;\
> -	case dot11AuthAlgrthm_8021X:\
> +	case dot11_auth_algrthm_8021X:\

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		if (bmcst)\
>  			encry_algo =3D (u8)psecuritypriv->dot118021XGrpPrivacy;\
>  		else\
>  			encry_algo =3D (u8)psta->dot118021XPrivacy;\
>  		break;\
> -	case dot11AuthAlgrthm_WAPI:\
> +	case dot11_auth_algrthm_WAPI:\

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		encry_algo =3D (u8)psecuritypriv->dot11PrivacyAlgrthm;\
>  		break;\
>  	} \
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/=
staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 7cb0c6f22..e19cae302 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -546,7 +546,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_=
device *dev, struct ieee_pa
>  		if (psecuritypriv->bWepDefaultKeyIdxSet =3D=3D 0) {
>  			/* wep default key has not been set, so use this key index as default=
 key. */
> =20
> -			psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Auto;
> +			psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Auto;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			psecuritypriv->ndisencryptstatus =3D Ndis802_11Encryption1Enabled;
>  			psecuritypriv->dot11PrivacyAlgrthm =3D _WEP40_;
>  			psecuritypriv->dot118021XGrpPrivacy =3D _WEP40_;
> @@ -616,7 +616,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_=
device *dev, struct ieee_pa
>  		goto exit;
>  	}
> =20
> -	if (psecuritypriv->dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_8021X && ps=
ta) { /*  psk/802_1x */
> +	if (psecuritypriv->dot11_auth_algrthm =3D=3D dot11_auth_algrthm_8021X &=
& psta) { /*  psk/802_1x */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
>  			if (param->u.crypt.set_tx =3D=3D 1) { /* pairwise key */
>  				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u=
.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
> @@ -764,7 +764,7 @@ static int rtw_cfg80211_set_encryption(struct net_dev=
ice *dev, struct ieee_param
>  		goto exit;
>  	}
> =20
> -	if (padapter->securitypriv.dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_802=
1X) { /*  802_1x */
> +	if (padapter->securitypriv.dot11_auth_algrthm =3D=3D dot11_auth_algrthm=
_8021X) { /*  802_1x */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		struct sta_info *psta, *pbcmc_sta;
>  		struct sta_priv *pstapriv =3D &padapter->stapriv;
> =20
> @@ -1323,26 +1323,26 @@ static int rtw_cfg80211_set_auth_type(struct secu=
rity_priv *psecuritypriv,
>  	switch (sme_auth_type) {
>  	case NL80211_AUTHTYPE_AUTOMATIC:
> =20
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Auto;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Auto;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  		break;
>  	case NL80211_AUTHTYPE_OPEN_SYSTEM:
> =20
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
> -			psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +			psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  		break;
>  	case NL80211_AUTHTYPE_SHARED_KEY:
> =20
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Shared;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Shared;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

> =20
>  		psecuritypriv->ndisencryptstatus =3D Ndis802_11Encryption1Enabled;
> =20
>  		break;
>  	default:
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		/* return -ENOTSUPP; */
>  	}
> =20
> @@ -1401,9 +1401,9 @@ static int rtw_cfg80211_set_key_mgt(struct security=
_priv *psecuritypriv, u32 key
>  {
>  	if (key_mgt =3D=3D WLAN_AKM_SUITE_8021X)
>  		/* auth_type =3D UMAC_AUTH_TYPE_8021X; */
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	else if (key_mgt =3D=3D WLAN_AKM_SUITE_PSK) {
> -		psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +		psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_8021X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	}
> =20
>  	return 0;
> @@ -1446,7 +1446,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *=
padapter, u8 *pie, size_t iel
>  	pwpa =3D rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
>  	if (pwpa && wpa_ielen > 0) {
>  		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cip=
her, NULL) =3D=3D _SUCCESS) {
> -			padapter->securitypriv.dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +			padapter->securitypriv.dot11_auth_algrthm =3D dot11_auth_algrthm_8021=
X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			padapter->securitypriv.ndisauthtype =3D Ndis802_11AuthModeWPAPSK;
>  			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2)=
;
>  		}
> @@ -1455,7 +1455,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *=
padapter, u8 *pie, size_t iel
>  	pwpa2 =3D rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
>  	if (pwpa2 && wpa2_ielen > 0) {
>  		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_=
cipher, NULL) =3D=3D _SUCCESS) {
> -			padapter->securitypriv.dot11AuthAlgrthm =3D dot11AuthAlgrthm_8021X;
> +			padapter->securitypriv.dot11_auth_algrthm =3D dot11_auth_algrthm_8021=
X;

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  			padapter->securitypriv.ndisauthtype =3D Ndis802_11AuthModeWPA2PSK;
>  			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + =
2);
>  		}
> @@ -1578,7 +1578,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wip=
hy, struct net_device *ndev,
>  	psecuritypriv->ndisencryptstatus =3D Ndis802_11EncryptionDisabled;
>  	psecuritypriv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
>  	psecuritypriv->dot118021XGrpPrivacy =3D _NO_PRIVACY_;
> -	psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open; /* open syst=
em */
> +	psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open; /* open =
system */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	psecuritypriv->ndisauthtype =3D Ndis802_11AuthModeOpen;
> =20
>  	ret =3D rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN=
_SYSTEM);
> @@ -1674,7 +1674,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy=
, struct net_device *ndev,
>  	psecuritypriv->ndisencryptstatus =3D Ndis802_11EncryptionDisabled;
>  	psecuritypriv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
>  	psecuritypriv->dot118021XGrpPrivacy =3D _NO_PRIVACY_;
> -	psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open; /* open syst=
em */
> +	psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open; /* open =
system */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	psecuritypriv->ndisauthtype =3D Ndis802_11AuthModeOpen;
> =20
>  	ret =3D rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_ver=
sions);
> @@ -1697,8 +1697,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy=
, struct net_device *ndev,
>  	}
> =20
>  	/* For WEP Shared auth */
> -	if ((psecuritypriv->dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_Shared ||
> -	     psecuritypriv->dot11AuthAlgrthm =3D=3D dot11AuthAlgrthm_Auto) && s=
me->key) {
> +	if ((psecuritypriv->dot11_auth_algrthm =3D=3D dot11_auth_algrthm_Shared=
 ||
> +	     psecuritypriv->dot11_auth_algrthm =3D=3D dot11_auth_algrthm_Auto) =
&& sme->key) {

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  		u32 wep_key_idx, wep_key_len, wep_total_len;
>  		struct ndis_802_11_wep	 *pwep =3D NULL;
> =20
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/stagin=
g/rtl8723bs/os_dep/os_intfs.c
> index 29939bf5a..18abd1f25 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -534,7 +534,7 @@ static void rtw_init_default_value(struct adapter *pa=
dapter)
>  	psecuritypriv->sw_encrypt =3D pregistrypriv->software_encrypt;
>  	psecuritypriv->sw_decrypt =3D pregistrypriv->software_decrypt;
> =20
> -	psecuritypriv->dot11AuthAlgrthm =3D dot11AuthAlgrthm_Open; /* open syst=
em */
> +	psecuritypriv->dot11_auth_algrthm =3D dot11_auth_algrthm_Open; /* open =
system */

This should be moved to the second patch that only targets CamelCases of
dot11AuthAlgrthm.

>  	psecuritypriv->dot11PrivacyAlgrthm =3D _NO_PRIVACY_;
> =20
>  	psecuritypriv->dot11PrivacyKeyIndex =3D 0;

Two more things:
Firstly I have noticed extra set of parentheses, which are not=20
necessary, all over the patch. These were not removed upon removing =3D=3D=
=20
true and =3D=3D false but rather left as is and as such should be removed.
Secondly, this patch can't be applied on top of staging-next branch and=20
should be rebased on top of it.

Best regards,
Luka Gejak
