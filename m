Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF231D14FF
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728985334; cv=none; b=fymr8nae8KC3y+HTg2xcdzQaBVdMU2foV9xSO0xkL5jWFMUtlFgyY1bo0dn4uYyGKbl3d/5leqo2sQsj2YsMxTQnaUm87h8QBHJfxiOkksYHbaLgHKNAbVdPM/vIwGwAVMhhd8Fo71Ls75O1UVjaUO8qT3Kc9fDKHGztvS3rb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728985334; c=relaxed/simple;
	bh=AbjIZkV3DT6x8on/kaS4iPZ3QMQjL8NVI7YnkYT+rE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPCk1mdyYTPvE4yLL4SNYzwtgsLxp++q0cdKs3nU63KRcmM2ey8MRQCXFvePeLfrIy9APTKCUtRFJfW741CwqQ4+eZPPlSoLAqXmKmhPBtwxZHeBzvR1A9RZq+W4QEKxk7nT980vA0NLSTQbgpOu1nFDRnhq75qsVGgkUYNasvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukVjITlB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukVjITlB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c94dd7e1c0so5263211a12.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 02:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728985331; x=1729590131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHp49d9/BhialKMrGvk56DMJ4Tuc0RIYZ8PmphUFmMs=;
        b=ukVjITlBuNhwk3bhkgjGCXTnsy5oAFQRQgampGOwhyW18Od6JhIo3+xf1Xwa+Kzwlh
         iIKusxzanXjKAAUQ0BDXpRzVAvOwidAKvTyrFIgSjyVOQG0s1qVkoT9YFfdnFBD05MY1
         +psfzL7iDrvfVmsG4ZrU9Usc72qHks01QHiV0CcjYMB5z3UcRYCUatQG4NN0l1H/EF0V
         ZOW8yQn1sJ/wgFU73v67DiPEHhfiXnRaSy1EafO+Gne9Y/V0T3kF4dteVdwz1PKjqrGy
         C9ZSKsjGGUdM5LUVU/5OAHoPtN/dFr9M2wIkPcZZG47P32nwwoAdA+5fZ3Mg146hQjUn
         pO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985331; x=1729590131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHp49d9/BhialKMrGvk56DMJ4Tuc0RIYZ8PmphUFmMs=;
        b=lmZNPqG5F6xAxPZOuimvIKHofJOXrQrbUZxJh5d6oaWh8RlCTe+RxdA++PwPRs3Ug6
         J0M6WEx5OKf3Z9thYL8gChBBzgHViA8+UrPRnZsxuAFzdYRyIjQas1pykgZ/9AFD/IN2
         TI/Yqiw6VuoLibbJUFxHQ7VSmFzWoP20roGAAvA+n+MfeirVmRK1z3+VUPYK/5K8GLA3
         kfhZpOFn9nlsAQjq0l/YUrexo+kmH71nptQ4+sRtqXYe1RIC+q7nnL4K2ENjskK7Ulsx
         uJmq/YQNj7eXdmHGRMKdxesEnsZ3fH8zaXF/LnG44m66ZdAiPsPvQHqHsF8IR0CwO79b
         v1xg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Un+p+eJpyoHvcOxg9b0U5lHEUcZVjY0cikhRN+gSuj43w23GFWCynWltOw59QSrgmrFKgL29Kd1Z1Drv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+7/bM1lFKuYopPynlgL1TMLVKvYATsnHuRZqGH9PYA0eqvPOX
	y/fkM9I6spMnl4x/+QN2+PJbmLykRSXgxNdefsgTnfYF+fRnlSMD0RBMsGVEwJw=
X-Google-Smtp-Source: AGHT+IEKNdUVyaZ0iX1mqaNC6+kTh2EIsu3a1wAZd1DrGPAVSOBFkqhXIa23pfvozbzQifTTRIthSw==
X-Received: by 2002:a17:907:7d92:b0:a8d:3338:a48c with SMTP id a640c23a62f3a-a99e3b20e9bmr1117974566b.7.1728985330705;
        Tue, 15 Oct 2024 02:42:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844739sm49887966b.171.2024.10.15.02.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:42:10 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:42:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	~lkcamp/patches@lists.sr.ht, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: change remaining printk to
 proper api
Message-ID: <d20087fc-586e-4a52-99e6-6a09b33ed00e@stanley.mountain>
References: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
 <20241015014738.41685-2-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015014738.41685-2-rodrigo.gobbi.7@gmail.com>

On Mon, Oct 14, 2024 at 10:47:37PM -0300, Rodrigo Gobbi wrote:
> As part of TODO file for future work, use dyn debug api for
> remaining printk statements.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  6 +++---
>  drivers/staging/rtl8723bs/hal/hal_com.c           |  7 ++++---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 ++++++----
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  2 +-
>  4 files changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index bbdd5fce28a1..58da34f125db 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1870,10 +1870,10 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
>  	if (0) {
>  		int pp;
>  
> -		printk("pattrib->pktlen = %d =>", pattrib->pkt_len);
> +		pr_debug("pattrib->pktlen = %d =>", pattrib->pkt_len);
>  		for (pp = 0; pp < pattrib->pkt_len; pp++)
> -			printk(" %02x ", pframe[pp]);
> -		printk("\n");
> +			pr_debug(" %02x ", pframe[pp]);
> +		pr_debug("\n");

No, this isn't right.  You'd need to use a mix of dev_dbg() and pr_cont().
Basically in drivers it should always be dev_ printks except for pr_cont().

regards,
dan carpenter

