Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183993BED5A
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 05:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550985; cv=none; b=bv9Gp97GpnUQfJoPS+El2sDt9QOoSAh1tZChNyhvojr390doPHBS5KUXDIkUbLy7EVrUCW1enhOqJNNc/ZpdJ8Z2oifZDbnrUk5NCjSLXMdS1OUtLkbuhhLujoXNr7csRsdI3kcY1aoV2TorWtgp7NLLbEZzMVEywzE+exRxtbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550985; c=relaxed/simple;
	bh=ZVnJ5NCX/p+cRPW4D0M9BPRbTE4rckvjLK2biRRIeMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uqwy3jurce32KLxtoXXDuvPocrX4U5r1gGZBmZFRtieOf4RHccFkpMdbO9KUEnPt7BxkCcXav6vQDiEopG6L1l4Q9jjtyZ+64AjT3Zd/Qaf69ArZhSluceEdbH4xTLVRjoDK9t+mPchJJfN1Yu4zQ5G5x9XmfC1v+w7ICk8/bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEt9zvi3; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEt9zvi3"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177b9a02bdso5369891cf.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780550983; x=1781155783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBAn1dyOd78qsH0ClP79pBbz2f8l06Jgjt1qYTGR5f4=;
        b=aEt9zvi3clJ5i8R8spBRODQkIQo9il9Y9zXFtRMkC7r9f5iKjCnbbdMED/4nnDV43x
         zMMtF2IS3NZBQePRXvWGNdr09XbnoNVT+7pQolZ//dxrSLEcy6PbsfXOt6177NmPdFsc
         iCefdzI2SJYg2Y4vEIvZhTAq86NI481Tf5ZmhfqdcIhc4GCsOFCjnl545+CUvCUS46M9
         1j9xQv0UrR7lejtwjIAn9esh2YJhiT5RJJ4QZ9FGpL5QKlPPkYeg91em5SQ3EgzFVlJt
         8rHhcsDuGHvGfSI0ZYEQBFCiObzMoVplNs7AR9zEPjUnr1vmhIzvuJOXVIdfhP9xBX0s
         QF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550983; x=1781155783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBAn1dyOd78qsH0ClP79pBbz2f8l06Jgjt1qYTGR5f4=;
        b=DHXI+ve7WJv7ZFlbzlwF59ZfiVZv0RNQEAYsvSMYBPKI6wtMnwFh984mJt4cFpEFEQ
         GeqXhsuxephtMNYUw6pftCj7NlqSsHJwotIboUI5ldtBdX5wb36ikMUGkUSlaQ2SCkXv
         /Dl3ZSKvc4TrkpdFIsx2oXHR9Zku9/IPOzMN5xjeHgFJSP2rsug0siIbfdAKek4Ev/sX
         Bz38KPUy60/cui6FjQfEyFzZxBzNy74PIxHR7W/ZugxJnhjHaT/TnfjzmFCOrkhYHuGc
         a7he4PcZYFkXjtyowimeJw8ZNatXu18zYxHnr0csVva7DAcZAjNCBYnry1f3UUKkkqNj
         4xJg==
X-Forwarded-Encrypted: i=1; AFNElJ8PA/P8rWXOcQchf1PVTUB5GBTLeYps1c7szlJNwat99i7EJf+A0F82QqvAXjmGthjQA2MTb7aSjx6BHDkc@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4TP9SfDOpA42Aa/wjgKUCr4eyS1p9Cx8tTM4oENZyHTNZV/bg
	yRsVXPo8YBFYUKwrYaYyB3q61LAZE8tRUlREIa6Mt5ToxortZYGvsziA52GT9GJM
X-Gm-Gg: Acq92OEH0B21r7fIv7FPvllLaFcv1Mruu11L+QJwViZLDAnx0Y/DoG9H8k4bUwjs5r8
	+hDhsh+RDlp6X2L5ecamtsNASRmaVFI3aMG2WXlvJjwgTo1jv2VMh6rUwa0JvMafqqjcImKS8YU
	/MvlLnLm/aT73xRADbNBtoK1zDFtQMcMawfctYlcobbuvsUZwOG/FIILS2fQfpp5Pw1kBUTF6Fk
	pk2fPSafc1Ha+vWJkaZ6JRRRz5j4Y/AYk75W+C1csLBbGbzTvRl5qHOQpst6DPYMTqrMELimQD4
	FT3W5M83Um9RJY8fe9fQjl/cgBU6tMNnxEgMrn+1raEklQNeeKe5/ZhBUwumlUhqGyaUR7VcovA
	ZQUdkrY3heMuJtPDpM8jgVZR7vRAwAJDsi92k/puPu0+UzFq25SlzbYOLjNqkFqw3Sq5y9ehBgK
	6FE1yYF3hdlG4W30hjmY7qEzT9ODSsr8NXAW5ABA==
X-Received: by 2002:a05:620a:28c9:b0:915:9bc2:8019 with SMTP id af79cd13be357-9159bc280ecmr315220185a.53.1780550983119;
        Wed, 03 Jun 2026 22:29:43 -0700 (PDT)
Received: from localhost ([149.40.50.195])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37bae6sm479934585a.31.2026.06.03.22.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:29:42 -0700 (PDT)
Date: Thu, 4 Jun 2026 08:29:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Eugene Mavick <m@mavick.dev>
Cc: gregkh@linuxfoundation.org, khomenkov@mailbox.org,
	ethantidmore06@gmail.com, m.steinmoetzger@gmail.com,
	tomasz.unger@yahoo.pl, arthur.stupa@gmail.com, jannik@jrehkemper.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <aiENQEyF-N4CRVzt@stanley.mountain>
References: <DIZB2839PXFV.3A5L73XAO2X67@mavick.dev>
 <20260604045112.830216-1-m@mavick.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604045112.830216-1-m@mavick.dev>

On Thu, Jun 04, 2026 at 12:51:12PM +0800, Eugene Mavick wrote:
> Remove unnecessary parentheses to clear checkpatch.pl warnings
> 
> Example of fixed warnings:
> CHECK: Unnecessary parentheses around dvobj->cam_cache[id]
> 
> Signed-off-by: Eugene Mavick <m@mavick.dev>
> ---

When I'm reviewing patches one thing that I'm checking is that if
people deliberately tries to slip something unexpected into the patch.
I created a script to help me strip away many of the common staging
changes so I can focus on the interesting stuff.

https://github.com/error27/rename_rev

This is v4 of this patch and so at this point what I really want is for
my script to say there is nothing unexpected at all.  Almost everything
here is related to the checkpatch warning about &(foo->bar).  Some of
the other changes are good, but at this point, I just want to get
something we can apply.  Do the other changes in a different patch.

Here is the output from my script that I want removed.

`cat email.txt | rename_rev.pl -r amp`

>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
>  
> -	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable)) {
> +	if (pmlmeinfo->HT_info_enable && pmlmeinfo->HT_caps_enable) {

Good but do it in another patch.

>  		pmlmeinfo->HT_enable = 1;
>  	} else {
>  		pmlmeinfo->HT_enable = 0;
> @@ -152,7 +152,7 @@
>  
>  	case 2: /* auto */
>  	default:
> -		if ((pmlmeinfo->ERP_enable) && (pmlmeinfo->ERP_IE & BIT(1))) {
> +		if (pmlmeinfo->ERP_enable && (pmlmeinfo->ERP_IE & BIT(1))) {

Same.

>  			if (pregpriv->vcs_type == 1) {
>  				psta->rtsen = 1;
>  				psta->cts2self = 0;
> @@ -168,13 +168,13 @@
>  
>  	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
>  		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
> -		if (pbuf && (wpa_ielen > 0)) {
> +		if (pbuf && wpa_ielen > 0) {

No.  Don't do this.

>  			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
>  					 &pairwise_cipher, &is_8021x);
>  		} else {
>  			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
>  
> -			if (pbuf && (wpa_ielen > 0))
> +			if (pbuf && wpa_ielen > 0)

No.  Don't do this.

>  				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
>  						  &pairwise_cipher, &is_8021x);
>  		}
> @@ -182,8 +182,11 @@
>  
>  	pmlmepriv->NumOfBcnInfoChkFail++;
>  
> -	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
> -		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
> +	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
> +	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <=
> +			DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) &&
> +				pmlmepriv->NumOfBcnInfoChkFail >=
> +					DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD) {

This seems unrelated to parentheses.  Do it another patch.

>  		pmlmepriv->timeBcnInfoChkStart = 0;
>  		pmlmepriv->NumOfBcnInfoChkFail = 0;
>  		return _FAIL;
> @@ -228,7 +231,7 @@
>  	struct wlan_bssid_ex *cur_network = &pmlmeinfo->network;
>  	unsigned char *rate = cur_network->supported_rates;
>  
> -	if ((pmlmeinfo->HT_info_enable) && (pmlmeinfo->HT_caps_enable))
> +	if (pmlmeinfo->HT_info_enable && pmlmeinfo->HT_caps_enable)

Good but do it in another patch.

>  		pmlmeinfo->HT_enable = 1;
>  
>  	if (pmlmeinfo->HT_enable)
> 
> done.

regards,
dan carpenter
