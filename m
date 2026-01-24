Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6282C08B1
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769252373; cv=none; b=oUZh3BDJyjccmJZslK4F3RwKV9p5MC7mOmitEeHFlT3ZUaPMOQ0WVvM/z53oExrTCDzxuG2CnWOFvNwKgElrmbzVOjYk1i5x+2RjfqnAZ45HTNDBiF5VAn7d+Cuy9Bd+mreJzlZNvvEHyvtxZFAHJcXzB3yxiLkdA9Rd78XlchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769252373; c=relaxed/simple;
	bh=HAjlA3sVwH6RJivhrDnrkgScIV06eagiHw7wFOgGjjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlScYwZiw59VVrTE9yoI+bJrpSROfO2nlLXmaPhKpzrFgTsnXRhgUfdRjsu5BM7oxx9sFb+fip2DeQdmPmFrSmHVfB7x5TPapi7/hJyD00cPesKloSulEOVjt7i7W2UmNmjjScfKar19d9Sb+/W1N+0xe8UMQY77DDc8Zh+vrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhYXKJNB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhYXKJNB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so33659275e9.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 02:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769252370; x=1769857170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6j/ehzxX1qT5ApFk2lWpVx3Wy/WtH9IgjQk1wTA1os=;
        b=YhYXKJNBaGJAvcdz74eQQFkW75hT0NNGo/HwESkJqQrCedTkt9LUH4upx7CGVwLJUH
         iIEhItyPf8bttREBY6QX1tvmImqTM8djE1XxnSpkKPazn0NSVrr3PSLAS9TQXY/nunGF
         Ay1GZNaAYnUpGGyV50VTiTuPy9tra/ZtrLzSVza0cR5UpkmdLZ7kIYF2egRzcoQJUEWg
         TKE235E4FScyW0LGEr162NUU0f4gV93P6DGOk5tAh0Mx0vyNfv04jdCqh61MErhSixgM
         eY9fqMGbu3YlOCQPBRH5OG5ig0+Zl0/ez50P86qi2OKvwWCemH/sbujQKVYHG/b1/IXm
         a2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769252370; x=1769857170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6j/ehzxX1qT5ApFk2lWpVx3Wy/WtH9IgjQk1wTA1os=;
        b=VXhN8PbEAS0AXCZsQtUCwa5dca7ZRvtNtMnfGTz8yMMTBLLMqqiYySd/ptoksbtgjF
         BOzszMNpOlLhCc89m+1uicNk73cqRqI6UlZYoWyH4tFjyPgGR4FjS6VF7lZsHaRsERO6
         2+q4p364PxA8kk5+VrnbVCRRHmozfgVeG3lpIZnrJ/edMjdSIj4YIfka4qu6EMuXziww
         DSlfedqvqvYsfKwr0nzbS97EuqK8BXE/wEVMM9u2ppFXEjpcf5QYXu0wtUaO+1aZRNXP
         03Hjyw4yq8g9cjXRIC+6Hxbx4h+ku3ylGEgOo8uI+9BPoqRh5CAbzMiLy7txqG6U+yzy
         vKvA==
X-Forwarded-Encrypted: i=1; AJvYcCV50U514pgGEABUrlAFRvNYgey7uEJTwV7SzsApXTYwKLOo9gvwHnx6pqoKnB03IaBZtGDuymuVWUSs2PVA@lists.linux.dev
X-Gm-Message-State: AOJu0Yy448h26Z4HIxmUKOTy7XLzw3hY0crHcWK37Gy15vj7SbM4N4VD
	OVA+LgFbZfOAUmatsXMH10JedLeZGWjFpJxVrmKjRl12pRvSPAJvYcz2kwQdjXcifHHZbd94uCN
	9Ffve/dVQpg==
X-Gm-Gg: AZuq6aL0NEHLQ3TT1LUfluJp4jUU8fZc3rRYAHiPM/JZU0VFlIVIgDf33EHxt2nQ4De
	0Z7SdzNY92MsZxl3dt6ctVC0ihouefItZfn0/WjtOvBmzdDZYFRiQcBBgjSfaLGKuW0lxr/ziPB
	sfL40YUpAWzEFXLls/weTbxcO2U9JLxOwm7CsC6uDQQEWfMte7uN6fFt04/m7w0NbTMA72YaYZ8
	PMobW846OFxstnTR0yRm5fUG2dVhRgdgFD+v7QoXRQU1uRcYcN6lK8u/bIV+LvOO9nDdvzmcK1A
	ViyePGrKq2Bj+45gRs1Ui2ba5nIXM9lPbaaqfjXYei1t5LGME0pXc0NuOHrW6umbva0wu2qPfPa
	K05FrIW6xMWZhfNd2gWtZq8UWvWSbvpb3u1Mjw64Hl9uBt43zWRCjnNZX0zrCrzE1e3/4UcA+Yr
	ce1ZoZoirVE4uRWmY3
X-Received: by 2002:a05:600c:8283:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4804c9b4cb3mr100540105e9.23.1769252369750;
        Sat, 24 Jan 2026 02:59:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8b4fc3sm118211055e9.13.2026.01.24.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 02:59:29 -0800 (PST)
Date: Sat, 24 Jan 2026 13:59:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: refactor nested loops to
 reduce indentation
Message-ID: <aXSmDkzs4P79BZRW@stanley.mountain>
References: <20260123211904.64589-1-tehsiu.huang@gmail.com>
 <20260123211904.64589-2-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123211904.64589-2-tehsiu.huang@gmail.com>

On Fri, Jan 23, 2026 at 01:19:03PM -0800, Michael Huang wrote:
> Use guard clauses (continue statements) to flatten the logic in

Just say continue statements.  I saw "Use guard" and thought you
were going to use "guard statements" which is a different thing in
the kernel.

> rtw_mlme_ext.c. This improves code readability by reducing deep
> nesting levels.
> 
> Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 61 +++++++++++--------
>  1 file changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index fa1e3ad59254..0ab3629608ce 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -3682,32 +3682,31 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
>  
>  		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
>  
> -
>  		for (i = 0; i < 8; i++) {
> -			if (ICS[i][0] == 1) {
> -				int j, k = 0;
> +			int j, k = 0;
>  
> -				InfoContent[k] = i;
> -				/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
> -				k++;
> +			if (ICS[i][0] != 1)
> +				continue;
>  
> -				for (j = 1; j <= 14; j++) {
> -					if (ICS[i][j] == 1) {
> -						if (k < 16) {
> -							InfoContent[k] = j; /* channel number */
> -							/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
> -							k++;
> -						}
> -					}
> -				}
> +			InfoContent[k] = i;
> +			/* SET_BSS_INTOLERANT_ELE_REG_CLASS(InfoContent, i); */
> +			k++;
>  
> -				pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
> +			for (j = 1; j <= 14; j++) {
> +				if (ICS[i][j] != 1)
> +					continue;
>  
> +				if (k < 16) {
> +					InfoContent[k] = j; /* channel number */
> +					/* SET_BSS_INTOLERANT_ELE_CHANNEL(InfoContent+k, j); */
> +					k++;
> +				}
>  			}
>  
> +			pframe = rtw_set_ie(pframe,
> +					    WLAN_EID_BSS_INTOLERANT_CHL_REPORT,
> +					    k, InfoContent, &pattrib->pktlen);

This is unrelated.  Do it in a separate patch.

>  		}
> -
> -
>  	}
>  
>  
> @@ -3831,14 +3830,24 @@ void site_survey(struct adapter *padapter)
>  				int i;
>  
>  				for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
> -					if (pmlmeext->sitesurvey_res.ssid[i].ssid_length) {
> -						/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
> -						if (padapter->registrypriv.wifi_spec)
> -							issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
> -						else
> -							issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
> -						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
> -					}
> +					if (!pmlmeext->sitesurvey_res.ssid[i].ssid_length)
> +						continue;
> +
> +					/* IOT issue, When wifi_spec is not set. */
> +					/* Send one probe req without WPS IE. */

You can flip the conditions around without rephrasing the comments.
Do that in a separate patch.

> +					if (padapter->registrypriv.wifi_spec)
> +						issue_probereq(padapter,
> +							       &pmlmeext->sitesurvey_res.ssid[i],
> +							       NULL);

All these reformating and removing extra parens makes the patch harder
to review.  I understand that checkpatch complains if you don't do it,
but it's unrelated to the change you are making so it needs to be done
in a separate step.  (I'm not your boss and I can't tell you what to
do.  If you don't want to do the second step you can also skip it.  The
point is don't do unrelated things in the same patch).

regards,
dan carpenter

