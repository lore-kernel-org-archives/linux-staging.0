Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795B36EA91
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993941; cv=none; b=Urf/2nUgTgFSkGUTfTGyJmpR+LYj3Mwii2krWRvd+7gZDwRtw/Gj6f3ew5nS4lrnoVH2K208YLhWnW9kxdvwgU5bHKumRwcCVQfEOolOixBKWV9U0ACByjvzHF1elrsikpZFeUodwE5kIYb76WKxSbbc4hlmPlyjupgpUdlBSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993941; c=relaxed/simple;
	bh=YIjGL5Y/Zm+QbltHP6bZRF7joilYyfFFFsSFAB8gf/k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JshYU8xUN21N/Nl1xIqWkwlMWIe4riFc/u9QTNSxaWJCWFa5PUeDIMbhi9z5hvyyPuhuMWH8ml7KvTjKExVfP6LGfo61gw8V+zxpPXjwCnca7G5N3bI3fwMXhZUuVwCF83XeKbETA5EmAuWImFlp8QKbkUqCAYtS+rg2SY1zAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AMAEQIXA; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AMAEQIXA"
Date: Fri, 20 Mar 2026 09:05:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773993926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEIiBmVYxix9kj16+DmIe8K5dz0NKBIXqXr0ZMoykZc=;
	b=AMAEQIXARbbXSDGsqjm8uZ5W+N5F7sUs1BLPA6JaufmFF0++UPTdXdg7NhIyXEtG3lAiJu
	4/TncbFBZue4lnoXvUFfcqEV1wKAj+NkWp6IxiCxpfJCdIqaUERl1IiRsRBqbpQQOPkWbo
	bY0/Hc5CBoVCrrYf/F7Ysg9sB79jIEo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 linux-staging@lists.linux.dev
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Khushal Chitturi <khushalchitturi@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ethan Tidmore <ethantidmore06@gmail.com>,
 Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
 Artur Stupa <arthur.stupa@gmail.com>, Zhuoheng Li <lizhuoheng@kylinos.cn>,
 Nino Zhang <ninozhang001@gmail.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/2=5D_staging=3A_rtl8723bs=3A_refactor_?=
 =?US-ASCII?Q?rtw=5Fjoinbss=5Fevent=5Fprehandle_to_reduce_indentation?=
In-Reply-To: <20260319231344.569418-3-azpijr@gmail.com>
References: <20260319231344.569418-1-azpijr@gmail.com> <20260319231344.569418-3-azpijr@gmail.com>
Message-ID: <EF78B3DD-16FB-42FA-A618-8E991093B1E3@linux.dev>
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

On March 20, 2026 12:13:35 AM GMT+01:00, "Jose A=2E Perez de Azpillaga" <az=
pijr@gmail=2Ecom> wrote:
>The rtw_joinbss_event_prehandle function has excessive indentation due
>to deeply nested if-statements=2E
>
>Refactor the function using early returns and guard clauses for the
>failure paths=2E This flattens the code and significantly improves
>readability=2E
>
>Signed-off-by: Jose A=2E Perez de Azpillaga <azpijr@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/core/rtw_mlme=2Ec | 134 +++++++++++-----------
> 1 file changed, 69 insertions(+), 65 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec b/drivers/stagin=
g/rtl8723bs/core/rtw_mlme=2Ec
>index 805427353aa6=2E=2E2a192c1dd038 100644
>--- a/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec
>+++ b/drivers/staging/rtl8723bs/core/rtw_mlme=2Ec
>@@ -1175,84 +1175,88 @@ void rtw_joinbss_event_prehandle(struct adapter *=
adapter, u8 *pbuf)
> 	pmlmepriv->link_detect_info=2Etraffic_transition_count =3D 0;
> 	pmlmepriv->link_detect_info=2Elow_power_transition_count =3D 0;
>=20
>-	if (pnetwork->join_res > 0) {
>-		spin_lock_bh(&pmlmepriv->scanned_queue=2Elock);
>-		retry =3D 0;
>-		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
>-			/* s1=2E find ptarget_wlan */
>-			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>-				if (the_same_macaddr) {
>-					ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_ne=
twork->network=2Emac_address);
>-				} else {
>-					pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netwo=
rk->network=2Emac_address);
>-					if (pcur_wlan)
>-						pcur_wlan->fixed =3D false;
>-
>-					pcur_sta =3D rtw_get_stainfo(pstapriv, cur_network->network=2Emac_a=
ddress);
>-					if (pcur_sta)
>-						rtw_free_stainfo(adapter,  pcur_sta);
>-
>-					ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, pnetwo=
rk->network=2Emac_address);
>-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>-						if (ptarget_wlan)
>-							ptarget_wlan->fixed =3D true;
>-					}
>-				}
>+	if (pnetwork->join_res =3D=3D -4) {
>+		rtw_reset_securitypriv(adapter);
>+		_set_timer(&pmlmepriv->assoc_timer, 1);
>=20
>-			} else {
>-				ptarget_wlan =3D _rtw_find_same_network(&pmlmepriv->scanned_queue, p=
network);
>-				if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>-					if (ptarget_wlan)
>-						ptarget_wlan->fixed =3D true;
>-				}
>-			}
>+		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>+			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>=20
>-			/* s2=2E update cur_network */
>-			if (ptarget_wlan) {
>-				rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
>-			} else {
>-				netdev_dbg(adapter->pnetdev,
>-					   "Can't find ptarget_wlan when joinbss_event callback\n");
>-				spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>-				goto ignore_joinbss_callback;
>-			}
>+		goto ignore_joinbss_callback;
>+	}
>=20
>-			/* s3=2E find ptarget_sta & update ptarget_sta after update cur_netwo=
rk only for station mode */
>-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>-				ptarget_sta =3D rtw_joinbss_update_stainfo(adapter, pnetwork);
>-				if (!ptarget_sta) {
>-					spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>-					goto ignore_joinbss_callback;
>-				}
>-			}
>+	if (pnetwork->join_res <=3D 0) {
>+		_set_timer(&pmlmepriv->assoc_timer, 1);
>+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>+		goto ignore_joinbss_callback;
>+	}
>+
>+	spin_lock_bh(&pmlmepriv->scanned_queue=2Elock);
>+	retry =3D 0;
>+
>+	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
>+		spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>+		goto ignore_joinbss_callback;
>+	}
>+
>+	/* s1=2E find ptarget_wlan */
>+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
>+		if (the_same_macaddr) {
>+			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_netw=
ork->network=2Emac_address);
>+		} else {
>+			pcur_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, cur_network=
->network=2Emac_address);
>+			if (pcur_wlan)
>+				pcur_wlan->fixed =3D false;
>+
>+			pcur_sta =3D rtw_get_stainfo(pstapriv, cur_network->network=2Emac_add=
ress);
>+			if (pcur_sta)
>+				rtw_free_stainfo(adapter, pcur_sta);
>=20
>-			/* s4=2E indicate connect */
>+			ptarget_wlan =3D rtw_find_network(&pmlmepriv->scanned_queue, pnetwork=
->network=2Emac_address);
> 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>-				pmlmepriv->cur_network_scanned =3D ptarget_wlan;
>-				rtw_indicate_connect(adapter);
>+				if (ptarget_wlan)
>+					ptarget_wlan->fixed =3D true;
> 			}
>+		}
>+	} else {
>+		ptarget_wlan =3D _rtw_find_same_network(&pmlmepriv->scanned_queue, pne=
twork);
>+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>+			if (ptarget_wlan)
>+				ptarget_wlan->fixed =3D true;
>+		}
>+	}
>=20
>-			spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>+	/* s2=2E update cur_network */
>+	if (!ptarget_wlan) {
>+		netdev_dbg(adapter->pnetdev, "Can't find ptarget_wlan when joinbss_eve=
nt callback\n");
>+		spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>+		goto ignore_joinbss_callback;
>+	}
>=20
>-			spin_unlock_bh(&pmlmepriv->lock);
>-			/* s5=2E Cancel assoc_timer */
>-			timer_delete_sync(&pmlmepriv->assoc_timer);
>-			spin_lock_bh(&pmlmepriv->lock);
>-		} else {
>+	rtw_joinbss_update_network(adapter, ptarget_wlan, pnetwork);
>+
>+	/* s3=2E find ptarget_sta & update ptarget_sta after update cur_network=
 only for station mode */
>+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>+		ptarget_sta =3D rtw_joinbss_update_stainfo(adapter, pnetwork);
>+		if (!ptarget_sta) {
> 			spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>+			goto ignore_joinbss_callback;
> 		}
>-	} else if (pnetwork->join_res =3D=3D -4) {
>-		rtw_reset_securitypriv(adapter);
>-		_set_timer(&pmlmepriv->assoc_timer, 1);
>-
>-		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
>-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>+	}
>=20
>-	} else {/* if join_res < 0 (join fails), then try again */
>-		_set_timer(&pmlmepriv->assoc_timer, 1);
>-		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
>+	/* s4=2E indicate connect */
>+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
>+		pmlmepriv->cur_network_scanned =3D ptarget_wlan;
>+		rtw_indicate_connect(adapter);
> 	}
>=20
>+	spin_unlock_bh(&pmlmepriv->scanned_queue=2Elock);
>+
>+	/* s5=2E Cancel assoc_timer */
>+	spin_unlock_bh(&pmlmepriv->lock);
>+	timer_delete_sync(&pmlmepriv->assoc_timer);
>+	return;
>+
> ignore_joinbss_callback:
>=20
> 	spin_unlock_bh(&pmlmepriv->lock);

One minor note: Since the REJOIN logic is now gone, the static u8 retry
 variable at line 1150 is now only assigned to 0 and never used=2E It=20
doesn't break the build thanks to __maybe_unused, but it should be=20
removed in a v3 of the series=2E Also include everyone from To and Cc for
 cover letter email as well=2E
