Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01C7E0E4
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 11:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600335; cv=none; b=R7MK6V//kROq/TZgVe3BryezVL63XMaGP4LIuKvcBKmbnLx6lzDhTwZGgZMOxuNn1sGQC2gjx2sGfjU8T3FIHr9bdKhYvY3MjhebltFzPHFCESUe+dUuqIu60JwL8nsoTi+0CRm3UvQZBCBnmP+SPp++KNHLywUWQLiCzJWRXTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600335; c=relaxed/simple;
	bh=lfuWLe4KS5rkXy40zLgUOIVrYwlwq+Chml2mAIOo8Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uazN2ibx9OqKFCsrHIzuuR9Z6+TMZ8joNPuVc+EsVMzMTT15Z3NSHOzFkXH3A1qj4HTvR7E322MqeVcDCR3ZvORH+nW3VkriZKCg2YZU6YZyMFRIihiYoMlw3yQN9utmeJWF49X/vMR8qleLQBu4Y4UDc6nqZyad5Z7wZ8Jfgbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RjJJ2Hw2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RjJJ2Hw2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so58560505e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 03:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769600332; x=1770205132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S43whySCBobAQSsg9LI7G5jPjE8Dcko+pumH3bfe68c=;
        b=RjJJ2Hw26lwsKZhPnzoEoW6HRfQ2IitEwW3HTMICWUZHEzqiveCT3pa2TPMrtC1MmF
         kFjyy0uNV0f17IrYxyikeQNw7xRXGVOj+fMndVhF5Y3veBlw9XiQnuv1hSwj2ti/ALQ7
         pPF1OoPJ/M0HvRkgTu4V9NYHNxLuAcyMEyJWCLJc31M/bGXWrdIb6D8swff+G+XttF4n
         7vAcnvtMVT0ioh5zvlE7OoM5NU9xIbY8qZ2PvYBm+58MEX4Eg7EHI+3juZzDfuudJEuA
         ePqoAbmYc83CZ0igC0uproKe1j9/eel6mIRIbcFEqS2h/KnglEYQLgX/yiLxKkGqeBGO
         ueHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600332; x=1770205132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S43whySCBobAQSsg9LI7G5jPjE8Dcko+pumH3bfe68c=;
        b=AYWOjJ3Z9KyZgRBMzg1S8pItrjc3T6aNnYlbpslx1AdcD3RdnTp+6GKzckkLoy6cnq
         lnG4TovzbsJwe0nJjejC/9uUg73WDenPn8RVBc5sPKZ2YiID2SIknBFVtnuc3gssJriZ
         jiEiFx+/eL2Oq48DzsgNNB+qzlxhPBhUjyQ0LY33lP9rU3mGBlXqGWYeOwuvlu3MDUe8
         eaNvawR/gQ/m+CiGCBRW841g4Q2avBW/Bc3tH84QX39ZQtbmBAqJGeh7Yf1QdtUBit6w
         6iWb/jNUSDAAnPsUTHIyhEkIf1e9dh6G95boDGhVCjwuDgzDZ0gXtxdncwN+GTIqWWmr
         n3lg==
X-Forwarded-Encrypted: i=1; AJvYcCVHIdVkQB8e+nSEdLOznQCEwzuGWLiXavRNJHNRHJ2blTskbbTrmNEgq9GwsKaNCSmzdYf6ypW9CI4bvYPR@lists.linux.dev
X-Gm-Message-State: AOJu0YyS58HXGbJhUe0BkyMQH0/eVlnCYd/HsmG9LBbP5rCuSuZmbWGM
	OMqdmWgXUMV/wemdFKugN7NEDZUi3Ddl2DAFPodd+IR8WQywNjvlFBFdwM5D9gyQZVo=
X-Gm-Gg: AZuq6aIP0wfnwPidHaKN3OPj9fGkAX74X2OAE7DdsMF0T7B0NkNnB8F/ta3mYLyIEMt
	Nt7yKTiI2Bj6gQfTgj0MbWOeuzPVRIjCiMaysJy4K5LYLCjVqYEMBfAXeDDylt5EbfWE3IFpY7L
	qIzS5Q96FxhwOJaewqio12VIEPDYxk45dELOPE4d4DkYLLNTryTG0zfPOoSOJxTxXUU0GvUAj8n
	+erPQgh+Yej7/U8cBtGQJ7UiyhpKkdmfk7ycRBqf+gtSc8fTYumjiUu4oCgApa8u60wofJZJ95c
	QfvAPYf3j1rRXk3EKYYdt+5gUbMQvGEN8yVxtGXjjCeZW+VUWaCuIsvKSjxq1zkskAxsqpNtwJu
	jbQDJCPIcYkmBu/f+tKxPEhKtf3KKcclLiyfzZcbyKDcirm6RJKZfLfrluzbvcufsTwBncq1X3I
	zVLO9vnatAMuCDOuPf
X-Received: by 2002:a05:600c:4fd4:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-48069c8c23emr56137025e9.23.1769600332276;
        Wed, 28 Jan 2026 03:38:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce5ec6bsm65536245e9.15.2026.01.28.03.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:38:51 -0800 (PST)
Date: Wed, 28 Jan 2026 14:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, bqn9090@gmail.com,
	abrahamadekunle50@gmail.com, straube.linux@gmail.com,
	bryant.boatright@proton.me, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] staging: rtl8723bs: fix potential race in
 expire_timeout_chk
Message-ID: <aXn1SHbJAwiaqEOZ@stanley.mountain>
References: <20260127131035.731607-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127131035.731607-1-s9430939@naver.com>

On Tue, Jan 27, 2026 at 10:10:35PM +0900, Minu Jin wrote:
> The expire_timeout_chk function currently do lock and unlock inside the
> loop before calling rtw_free_stainfo().
> 
> This can be risky as the list might be changed
> when the lock is briefly released.
> 
> To fix this, move expired sta_info entries into a local free_list while
> holding the lock, and then perform the actual freeing after the lock is
> released.
> 
> Signed-off-by: Minu Jin <s9430939@naver.com>
> ---
> Hi,
> 
> I noticed this lock-unlock pattern in expire_timeout_chk() while
> studying the code and it looked like a potential race condition.
> 
> I've refactored the code to use a local list so we can handle the
> cleanup after releasing the lock. What do you think about this approach?
> 
> Any feedback is appreciated.
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 67197c7d4a4d..5947f6363ab0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -179,6 +179,9 @@ void expire_timeout_chk(struct adapter *padapter)
>  	u8 chk_alive_num = 0;
>  	char chk_alive_list[NUM_STA];
>  	int i;
> +	struct list_head free_list;
> +
> +	INIT_LIST_HEAD(&free_list);

A couple minor style nits.  Use LIST_HEAD(free_list) to do this in the
initializer.

>  
>  	spin_lock_bh(&pstapriv->auth_list_lock);
>  
> @@ -190,19 +193,21 @@ void expire_timeout_chk(struct adapter *padapter)
>  		if (psta->expire_to > 0) {
>  			psta->expire_to--;
>  			if (psta->expire_to == 0) {
> -				list_del_init(&psta->auth_list);
> +				list_move(&psta->auth_list, &free_list);
>  				pstapriv->auth_list_cnt--;
> -
> -				spin_unlock_bh(&pstapriv->auth_list_lock);
> -
> -				rtw_free_stainfo(padapter, psta);
> -
> -				spin_lock_bh(&pstapriv->auth_list_lock);
>  			}
>  		}
>  	}
>  
>  	spin_unlock_bh(&pstapriv->auth_list_lock);
> +
> +	/* free free_list */

Delete this comment.  It's obvious.

> +	list_for_each_safe(plist, tmp, &free_list) {

Use list_for_each_entry_safe().

regards,
dan carpenter

> +		psta = list_entry(plist, struct sta_info, auth_list);
> +		list_del_init(&psta->auth_list);
> +		rtw_free_stainfo(padapter, psta);
> +	}
> +
>  	psta = NULL;

