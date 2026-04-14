Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58E3101C0
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147597; cv=none; b=p87cTzYc+1OIRN8/ec0k9kQoRByIKiX/uLwLSP124UCb518h2h3tM/DCHdWmrlA54z5+1KwxbNhDJHZaPJ+r3lue45GuP75RVbjZkG8VNek7GTAi1aESX0YLDFoeFP8gqYlKm+afmmLeppRIY0bRRB3sHG0glM21q8cGdbsYGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147597; c=relaxed/simple;
	bh=4Au1vWYJQM/cCNLFocF4rxkQ5SdzGdbWeMDXgvcfb0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uec9Kf3TXzNuCWg6dgOJrYrysWW474P6g2h0zhZCQP+MsMGAVa6a5HUvAZz2czVhfL6chSDSNkk7WTAPdbLCnoIHLv9VSqYf78EJbY/SQG7RJhzRZSP96aNM0OsoaJ5YEk9iNr+YXyx9q1lyO/Rk51uBwBGtqnLw8/s1sn9nDfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQmiFVul; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQmiFVul"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so3508168f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776147594; x=1776752394; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrvVMoJ7yb4IwANqTPw15SzHZNBEW/67dLCXkZ79KHk=;
        b=lQmiFVulw9R/9Zupk2QEPAKD25PDl4WYLjh2tR7WuCPUsJXqXYp+c8E1dENZJPyZTG
         svqRLPz2b60XPqmBuVuH3ozw+ONMSRYk5rxyRKo70PaKj4aWBcQMpusJXZcZr6oLXFBT
         06QNBg82c6ECMHVr16VVVgPdjs+x0RvaCkTLFgkSpf4GqyAnS0uDJRZMIWE+dxgymX+C
         H8MR9aQGTjCNJi4hh/VKECAg9gRACoSMbWv/mHqIGw44e20Rwa1sXUK0z41gTmIkygnD
         1Qn5shid7L8EMvFqAYzK0WDjLxTBne53BchEDCUg5bjpwEsaQXDlLkf2wKEmSrlDTqzg
         jyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147594; x=1776752394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrvVMoJ7yb4IwANqTPw15SzHZNBEW/67dLCXkZ79KHk=;
        b=lH6kHBDP5pkGu3Yw0CRosf2nV71dKjhg1GADe/rm8warXFNxOiu+AYeMrzpusugQp/
         uYuk9uDUcEOZSNJtOGUDLyQqQ6Rkw/7tirCwA+EeW3eWqdAsqFRg6Sx9F7eeZFf58b9f
         vgNFSbh35C6c/GcfN5AruG9ovQJjMBugo1ATb09PSv1HNILYhpa4M1wXGMvotmIBSO/z
         sJi8baqz7eUr6DUossILKVNe99S7YnrOOQEn0fBJimAO5LbP8Yx6gqXbbIuG0U1GKItl
         +4PltUsf3c/SKa6Yu7w8eR/gPZbKRGlCzNGYDuvwHXqhXTpqDuN0u/vZR0qr0dqOEgH7
         w/5g==
X-Forwarded-Encrypted: i=1; AFNElJ+7s/oiCiYKAMLtuvJh5rNLc2oKK+g8SK22GV5bW00ku8S5grNEU/m5tZnTs0UFnl8YmwXx5EHOibf9jXvJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzaLXjYLHOwVABygcA9eC5XQK2YEaqR85ZEoTMs+/6x/LLxHnS/
	YBPrkUv5nqpERpHXpvn4hCRI/ROlukKny4PUjn8vFm4nnZJItpihgHFRk+RU2V9bDIA=
X-Gm-Gg: AeBDietwfHwU/Ui/dFka/S6o4IooVYBqn08cKekX2S6lvQrhg1FZqWDD7cuZLr62eG4
	nS5wY34Cn63N5dWl9/ZJ47/34nw9ko0tsVrcHD/7pCHh4LaC/ng3jKy15u5ipr8xtkRpKkojDOk
	/9UW2IaRU8OOCtZ6AqhgPKkAaSsOKCc1c0r/eEOlSonWmulCfTy0VoI6ZUdsbQmDU4QRaV6L0e/
	PyJKPzWhfgxUC4Ovf5+kEUbhwDa0PDYAeO/0dD0mZUmtRfXrH/N1lljMUAyp7UGc0UiqXFfWp+z
	m0/MNE+AI7yp/5F2PJp5wXSd3uVnFvicdKaCIIf5C/UecX8Dew7zEMwbO+A36OPNCRO4ZeDNwhE
	BZQdi4PWw9Ao2UDFefNVuoYKsDW8UOpfh6JixPRaXRBeHkQUndLLgcHu9S7emR7VOvsn5HjiQaP
	pmrInP7dKDkdpN/sY2
X-Received: by 2002:a05:6000:40dd:b0:43d:7e5b:928c with SMTP id ffacd0b85a97d-43d7e5b9a32mr4274358f8f.47.1776147594334;
        Mon, 13 Apr 2026 23:19:54 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7794cce5sm16097713f8f.9.2026.04.13.23.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:19:53 -0700 (PDT)
Date: Tue, 14 Apr 2026 09:19:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
	hansg@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix heap overflow in OnAuthClient
 shared key path
Message-ID: <ad3cgzGxPVYLiJbe@stanley.mountain>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413202824.740653-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 10:28:24PM +0200, Alexandru Hossu wrote:
> rtw_get_ie() returns the raw IE length from the received frame, which
> can be up to 255. This length is used directly in memcpy() into
> chg_txt[128] with no bounds check, allowing a heap overflow of up to
> 127 bytes when a rogue AP sends an Auth seq=2 frame with a Challenge
> Text IE longer than 128 bytes.
> 
> IEEE 802.11 mandates the Challenge Text element carries exactly 128
> bytes of challenge data. Reject any element whose length field does not
> match sizeof(pmlmeinfo->chg_txt) (128).
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282d1b..90f27665667a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
>  			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
                                       ^^^^^^
Do we know that pframe has enough data?

KTODO: check if pframe is large enough in OnAuthClient()

regards,
dan carpenter

>  				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
>  
> -			if (!p)
> +			if (!p || len != sizeof(pmlmeinfo->chg_txt))
>  				goto authclnt_fail;

