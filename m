Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514A29C35B
	for <linux-staging@lists.linux.dev>; Mon, 16 Jun 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071133; cv=none; b=jXZ8kTEqoyM6hmrDhl7pjgfPiVj7qWXU0N/hgeiuHrm+3qJyZBCrFUI1hMnvyUMFBrqjPLkJhx1Hl3EQXTAE5xzaapJjuQ1cAPpXdyO2OY7kxUAdPHzN2XrTkGk4RvzEbMJvroie4y568PM0JbJCULgWRouMRLVB3sIdEsl2XwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071133; c=relaxed/simple;
	bh=cjkJxuPMui4jkjC09WVtKlLhCNFsX/rnpNIYDU9Q5fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDgvt08rYmP2SOoEti/qJVG1urh8p3quYMmgoICSoy4QDsntt8qrun5kVVzgjufqAM99ew6GNSdWm9XkiflMLWTqx+wVshcoS5XxmNiOXJuTHZtZiFCbtSyMjNKYXNmfw+oP/UrYNnH4tehvIP0GqjO06/LQN9luY+djC6iRBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYHhPVEO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYHhPVEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750071129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+o5eMEqZMwZxbrg8YFtxTBAmIjbLtJHeOSiM43t1dn8=;
	b=dYHhPVEOBIWKVaQD2GfrFDCMEnKgNObFyBQi69grRYppRPcoDEAcW85QdbH7YVTRWLW4YP
	Oddkn40rbZqq5FOVTEVlNr1lvuJtQx+d27zr93UKBaqdQ7eed+Ai/z0ToN8Jz3cQv7mzd3
	daCAGniJ+lktbYHsIjn4KHn6GjpVr8M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-aibIcoU7PUGnqmkML1p7TA-1; Mon, 16 Jun 2025 06:52:05 -0400
X-MC-Unique: aibIcoU7PUGnqmkML1p7TA-1
X-Mimecast-MFC-AGG-ID: aibIcoU7PUGnqmkML1p7TA_1750071124
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade6db50b98so456623466b.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Jun 2025 03:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071124; x=1750675924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+o5eMEqZMwZxbrg8YFtxTBAmIjbLtJHeOSiM43t1dn8=;
        b=kRrxVLm2j9ewpfe6cNjTfzNKoENlggwzXqxRLgsFkPGxn28As0syddD8F4eFyBKb2O
         kAZFFCwzxBrj8MxkqOxCyp1XDMDMMyLZuD/Q5CKw7ixYmgxDjE18WnNUk4z4ZiZoe2hr
         PzFxFiZd5sqIqbzPn4CvdkNF6asv4OIb2qPPiHVJSpgrticc4MXkxJa2eS8OpWveYYNe
         cmqhlIsWUFzZHWtoS2zRA8U/6VtWK4EN4rGb1/BOICeUOSEn0kX8oLAmqFoh/eTISyA8
         ZToL3/3BjFZvd9c1/Q8Be9O6wt3OvD7gKuxe/1JKHelnhXcPIhl6s51xhjgYukQMsf9O
         tZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXXTWjXMkkJWk3jXxgRTedANMuN+ULARuzp81Dqr4md4R2N8Vw4A7QBRU5zI5COTFpujhgEYXUw2dhqwFzU@lists.linux.dev
X-Gm-Message-State: AOJu0YzpsR+gdZ7jtbwJqtW3k+oqmEsUgQv8rGKSIZ81zF9CdLf+1OFM
	dq/wgDGiWlmnfYHfO4o6nZzcRouGiJxDek+S/eZTNxR0fKPEEeVBObxGnPUwwjh7NaiTgDZu/gE
	8kYqopaaFj/eRYPMLEwowe4RZRQsHQlacwHmdkJyrfGGD6h8KviKLC5U0ZaMMJhJRLcc=
X-Gm-Gg: ASbGncv4FXSdSxmprvEJ5sQMvqm9Oxc7cx/wHj8zpURzI7clfA+DO9J1msFttbQIN0e
	/oawkrkaFj2U8HOnDKazTrtsUCNYwFK6ayEuT4WGau6EnAJYJ9UQkhq+iX3ATg8jG5VJRD+q1pA
	gcV+3ZuII2jqUTXRDPOxZDWT8yx9W9H73fxFNeGl+F4Tu+jqb9HaY2dsLIrXFMLufiM76kGPiPW
	ehmRc3x4qTbaWvGZnEOkSCphCChpo1mPDPHv2bghB+rL451l+qtFfzIR2tz48YzCarIOL5oer/e
	2KQf/oln8CmBejsY7qRsrEXawA==
X-Received: by 2002:a17:907:3d45:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-adfad6d19a6mr836614266b.57.1750071124105;
        Mon, 16 Jun 2025 03:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7HLYhQJ7eTatysdcSoH1vfusGYgDB/y93y32VdP9A9H9s80XOZ7HRoWyTA2AVQRVNepQlbg==
X-Received: by 2002:a17:907:3d45:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-adfad6d19a6mr836612366b.57.1750071123714;
        Mon, 16 Jun 2025 03:52:03 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm633506566b.34.2025.06.16.03.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:52:02 -0700 (PDT)
Message-ID: <33493c2a-c499-4191-a1a5-3194ce2d76e6@redhat.com>
Date: Mon, 16 Jun 2025 12:52:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove return from void function
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250615123758.41869-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250615123758.41869-1-straube.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: etP70hItkQjXgTY12hlMjuBXkntildG5Rjraix2PUhc_1750071124
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jun-25 14:37, Michael Straube wrote:
> Remove exit label and return statement from a void function.
> After the exit label no cleanup is done, so it is safe to remove it
> and return early in the only place where the label is used.
> This simplifies the code and clears a checkpatch warning.
> 
> WARNING: void function return statements are not generally useful
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 0248dff8f2aa..3cbfc305ede3 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -1112,7 +1112,7 @@ void rtw_suspend_common(struct adapter *padapter)
>  
>  	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved)) {
>  		pdbgpriv->dbg_suspend_error_cnt++;
> -		goto exit;
> +		return;
>  	}
>  	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
>  
> @@ -1134,10 +1134,6 @@ void rtw_suspend_common(struct adapter *padapter)
>  
>  	netdev_dbg(padapter->pnetdev, "rtw suspend success in %d ms\n",
>  		   jiffies_to_msecs(jiffies - start_time));
> -
> -exit:
> -
> -	return;
>  }
>  
>  static int rtw_resume_process_normal(struct adapter *padapter)

