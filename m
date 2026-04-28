Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6CC449EAB
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382775; cv=none; b=TrrNOt7+tSXBt2KH8AC8AYam8tH+SNqT8qnONvWEa4dwoUXzIt3bRZdbnI3zDjGoh0zZDXR7Kss6aywMK4A8MdOVqnIFUW6B2BuK7QWiEYWQP6VaNKX9PtRrorMzKDYSWIs1GhFmiL7jzbCuzU/fcwWfm/FJGClwcwbp3zaTwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382775; c=relaxed/simple;
	bh=jj8OfkOR9W8grZdct+0Tfg2In3+QWoldzHpIBjw6DC4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=torU90yIPqiQTA00c7pw4JxulKb9Hro5ABHE9J8cUe08Eo1koGqceHsL1ZaWERITuT6zifg3VlxEEoDgAJKzbei436OSx+9wQS+IGvE3+OTAJhS6I/m579Eh68kuUBpq8aX+p2Z0ZTPw5HscZDFgl8UQwcBqJDrBmSHuQjTF/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DRvoOK9J; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DRvoOK9J"
Date: Tue, 28 Apr 2026 15:25:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777382772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIic9+nSV+sJrh7uLkvHP7ClekZIHocW+uisTMzSlmU=;
	b=DRvoOK9J933sV4bqbb2BDEZQd3vmP+hG+O9LN47HoWdtZD/254wSzHEGV3LWWo/QFZn9M0
	JPz9sSRQH8OfqQYeUz4M2W/ZCgGAx0TUFmrnXL223xsO5wmRWUMr1CTJ/4flkQZnsb2ahv
	R9MjaEGqWSBQjJwXhAFmuTCTXyGtqEk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>, gregkh@linuxfoundation.org
CC: straube.linux@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_5/8=5D_staging=3A_rtl8723bs=3A_rtw=5Fmlm?=
 =?US-ASCII?Q?e=3A_extract_local_variables_for_long_expressions?=
In-Reply-To: <20260428121737.435248-6-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com> <20260428121737.435248-6-me@cipherat.com>
Message-ID: <62E6BFE6-BACF-4791-A020-E7B98F5A27E0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 28, 2026 2:15:48 PM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>Extract local variables to shorten lines that cannot be wrapped
>cleanly=2E
>
>Signed-off-by: Salman Alghamdi <me@cipherat=2Ecom>
>---
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 49 +++++++++++++++--------
> 1 file changed, 33 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme=2Ec
>index caaad38dd790=2E=2Ec7609f1a90f6 100644
>--- a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec
>+++ b/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec

=2E=2E=2E

>@@ -650,7 +654,13 @@ static bool rtw_is_desired_network(struct adapter *a=
dapter, struct wlan_network
> 		bselected =3D false;
>=20
> 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
>-		if (pnetwork->network=2Einfrastructure_mode !=3D pmlmepriv->cur_networ=
k=2Enetwork=2Einfrastructure_mode)
>+		enum ndis_802_11_network_infrastructure inf_mode;
>+		enum ndis_802_11_network_infrastructure cur_inf;
>+
>+		inf_mode =3D pnetwork->network=2Einfrastructure_mode;
>+		cur_inf =3D pmlmepriv->cur_network=2Enetwork=2Einfrastructure_mode;
>+
>+		if (inf_mode !=3D cur_inf)
> 			bselected =3D false;
> 	}
>=20
>@@ -735,9 +745,10 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
> 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) =3D=3D _SUCCES=
S) {
> 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
> 				} else {
>+					struct wlan_bssid_ex *pdev_network =3D &regs->dev_network;
>+					struct registry_priv *regs =3D &adapter->registrypriv;

I understand that you want to follow reverse christmas tree order as=20
Dan requested, but you can't introduce compilation failures by doing=20
that=2E Here, you are attempting to use regs to initialize pdev_network=20
on the first line, but regs is not declared until the second line,
therefore this will fail to compile=2E

>+					u8 *pibss =3D regs->dev_network=2Emac_address;
> 					u8 ret =3D _SUCCESS;
>-					struct wlan_bssid_ex    *pdev_network =3D &adapter->registrypriv=2E=
dev_network;
>-					u8 *pibss =3D adapter->registrypriv=2Edev_network=2Emac_address;
>=20
> 					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;
> 					 * because don't set assoc_timer
>@@ -792,8 +803,10 @@ void rtw_surveydone_event_callback(struct adapter	*a=
dapter, u8 *pbuf)
> 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
> 				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
> 				if (rtw_select_roaming_candidate(pmlmepriv) =3D=3D _SUCCESS) {
>-					receive_disconnect(adapter, pmlmepriv->cur_network=2Enetwork=2Emac_=
address
>-						, WLAN_REASON_ACTIVE_ROAM);
>+					u8 *mac_addr =3D pmlmepriv->cur_network=2Enetwork=2Emac_address;
>+
>+					receive_disconnect(adapter, mac_addr,
>+							   WLAN_REASON_ACTIVE_ROAM);

Thanks for fixing this :)

> 				}
> 			}
> 		}
>@@ -1069,8 +1082,9 @@ static void rtw_joinbss_update_network(struct adapt=
er *padapter,
> 				       struct wlan_network *ptarget_wlan,
> 				       struct wlan_network  *pnetwork)
> {
>-	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
>+	u8 signal_strength =3D ptarget_wlan->network=2Ephy_info=2Esignal_streng=
th;
> 	struct wlan_network  *cur_network =3D &pmlmepriv->cur_network;
>+	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;

You have the exact same issue here, pmlmepriv is used to initialize=20
cur_network before it is actually declared=2E

>=20
> 	/*  why not use ptarget_wlan?? */
> 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network=2El=
ength);

=2E=2E=2E

Please fix these errors, and ensure the code successfully compiles=20
before sending v6=2E
Best regards,
Luka Gejak
