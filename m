Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D4840DFA5
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777267963; cv=none; b=uWY7WRZcd0VQCOodPAa7929ATr0CK+ptiKKQqVnuonhxgb5q/fRT3TWaxfEOOvE8Obm2TQthcW63ZDrYOWjLMwsfYdcqcmkOLZExFcG/TpvOMHUE0hravWLzlel501IIV6o4ErbKzC4W4k0gDkt/DvQ4EEHprvkF66TaUY9BKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777267963; c=relaxed/simple;
	bh=l/D6Srbph4WaFMd/nlFuph+wiRelvGj3s5Rnbyl8ApI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=J9Cf00ICbIMX2Gs/6L7H0z+SvwL/Emx1ZKlPdsg4pPksH2WZY5KHxZFq4I1IwgjuXCEAptc0SkxrN1QXLJ6VM3TT0aeEGa+zrQbyV0aCPHaTrEEaD+iVRxlQFcpNxsAdNzqgXu7xJNcKcZRydX7CGLSyE4QTo56kfpYKeA4bnGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TfIGIBG8; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TfIGIBG8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777267958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9Bwcv2NkTBlACnJo3WBcLyRmdmBOvvnLQoVPGVhjI4=;
	b=TfIGIBG8OmeBNRT0EqfFtHLwnBKSNQ99VVUY/s4h/1WCn+qumUQsV544T/U7RTmdvOh5J+
	y+if3ULlEegRrXqL5QDWrK24ba4CZgHg3aOlyJj5Hk37xt//N84UibbZ6jGvwY5bmwt+9d
	EhuHcCbuKtGyEEcAFSahLdPh3JEm+lc=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 07:32:24 +0200
Message-Id: <DI3OWMGDI1IJ.17IMQ692X34FU@linux.dev>
Subject: Re: [PATCH v3 3/5] staging: rtl8723bs: rtw_mlme: remove dead
 commented-out code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Salman Alghamdi" <me@cipherat.com>, <gregkh@linuxfoundation.org>
Cc: <luka.gejak@linux.dev>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260426225552.87114-1-me@cipherat.com>
 <20260426225552.87114-4-me@cipherat.com>
In-Reply-To: <20260426225552.87114-4-me@cipherat.com>
X-Migadu-Flow: FLOW_OUT

On Mon Apr 27, 2026 at 12:55 AM CEST, Salman Alghamdi wrote:
> Remove commented-out code and its related comments/notes.
>
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/=
rtl8723bs/core/rtw_mlme.c
> index cdc631464565..c8971c03704c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -758,9 +758,6 @@ void rtw_surveydone_event_callback(struct adapter	*ad=
apter, u8 *pbuf)
>  					struct wlan_bssid_ex *pdev_network =3D &regs->dev_network;
>  					u8 *pibss =3D regs->dev_network.mac_address;
> =20
> -					/* pmlmepriv->fw_state ^=3D _FW_UNDER_SURVEY;
> -					 * because don't set assoc_timer
> -					 */
>  					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
> =20
>  					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
> @@ -1721,12 +1718,8 @@ void rtw_dynamic_check_timer_handler(struct adapte=
r *adapter)
> =20
>  		should_enter_ps =3D traffic_status_watchdog(adapter, true);
>  		if (should_enter_ps) {
> -			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
>  			rtw_hal_dm_watchdog_in_lps(adapter);
>  		} else {
> -			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
> -			 * in traffic_status_watchdog()
> -			 */
>  		}

By removing these comments above you are leaving empty else block that=20
should be removed.

> =20
>  	} else {
> @@ -2265,19 +2258,11 @@ void rtw_update_registrypriv_dev_network(struct a=
dapter *adapter)
>  	/*  1. Supported rates */
>  	/*  2. IE */
> =20
> -	/* rtw_set_supported_rate(pdev_network->supported_rates,
> -	 * pregistrypriv->wireless_mode);  will be called in rtw_generate_ie
> -	 */
>  	sz =3D rtw_generate_ie(pregistrypriv);
> =20
>  	pdev_network->ie_length =3D sz;
> =20
>  	pdev_network->length =3D get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)=
pdev_network);
> -
> -	/* notes: translate ie_length & length after assign the
> -	 * length to cmdsz in createbss_cmd();
> -	 */
> -	/* pdev_network->ie_length =3D cpu_to_le32(sz); */
>  }
> =20
>  /* the function is at passive_level */

Best regards,
Luka Gejak
