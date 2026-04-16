Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DA265623
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776357990; cv=none; b=JfH1GpqLCIwr42GW7YivySokoDl8+GJz/nageUOYlGAN63JyTHsbgOs9WpDtAVSSg0RtbYfh8qz3ItYI7GeQxPxQ3tC8fF6I3BzEd0eLFsJRUHR4HR1x6Jpk3U0LnshFflcZhvYG+5SkkdmGohRuBCHQt81/lEF7T3sS90FVTng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776357990; c=relaxed/simple;
	bh=rem8kgb3AqU5fIvtvZXdN3Z05fPs8+9yW+ACN+9nAGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/4CwYzAJbmN5cadfdCoRrDPV0Ye44vClQcOq1m9e26V5eqBbnmplL7xx9cMlMeRXeeOH7/486jw/boloYpO72eA9aehYlsku2LhsByrSKvpBo+v35nXxMzKdMYzom6u18RAEUYrbCNiYg7a5cieDfkouNjtGfCunpQTF5V1vCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S56Z6Krg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S56Z6Krg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b150559bso65191975e9.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776357987; x=1776962787; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yx+tk5XR/nKhfzFOweyHScYa0wnstAD5I5LHNHccNpo=;
        b=S56Z6KrgtVmot77zw7pKsPhv9/KkE4+wQBS7uRvetkFAmabE9MC+u8IIfB597g0F06
         icTdY/jy8Fx8DM1koApM0FWRkuVgtCbTPBCDmvEzfBOj6Uce9SCJyiOJAPK7o+/NRS4M
         jbtigsYneDV2kdbJvVhfF5QNG1+xz8p9kOhqdPxYqoZPYgyz9ARuJqr8//pPla7LhWNI
         YGzL2f3lWGS5oloLkrz4ISOlV0Xt+80T4tT+SVBLkKYYflzBikI8o9DglyqRTCJPh+ez
         JEhWpctU7REktfv2CbGXI16ywNgf/cdxyT9tM9zhhaXtwzalsAtB9Iej4QBZKM1+mHaw
         J48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776357987; x=1776962787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yx+tk5XR/nKhfzFOweyHScYa0wnstAD5I5LHNHccNpo=;
        b=iBbTxX9WFybRqaTU+6WgaFY+DMqSrZjWxWkoroLIPQxizG7qDXxShXwyoQe4r8LWhF
         l2+vtWl2qAOsg5BiJe8spessmL0tEIVnTOGiAD1fv+b6080nnaq/MkBwtfzMdDtxTEcI
         3hS1mw1R754CknjxZ9ysyK/JzkXDZTd7DeNU2sgikPRFdRsu6hmQoMux9Bbqs0zeB1FU
         tFV7N8esQWLXeJEJaqzFioaC33W7xGoFJKomMTclhEldwlLNps/wECP0Qc6nS2L1lguo
         0i+jY7NYDodfIBAgCGW+Ee3chwQh6KJHbQPNaydtr6/CitZ0/eQQvfvX48SQA8MYVYwJ
         oB+A==
X-Forwarded-Encrypted: i=1; AFNElJ8eZZEdftheugRwG5VBOiM4Y+sa5gQvOeSQysLto74Mrpc5wXm8Swy5jzxP5VvtcZAz6m8qrg3QWh5qDfi0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy69rh/g1P5KzHuDn8qprWUDlpMemFarSQ59splt3dhlgv/8Gs2
	s3b6fDFu1dwivapwSYPkZcYkOIF2GIQUbmOc+Hb0kZV6dYJTniOHNAg8Oh7acg==
X-Gm-Gg: AeBDievATvJckBkuhijH+2KnUxx5ZsdcBDaBHJmecM5mqV9UPDq3QPTwpCeUz7ro9Ny
	yRIhgkFc+RdYPOHBDaUUS7G1cvCeCMDWB7gbSTWQ1H4bbtkJbyzHdayvqHsVlAdceAcMDWZcC5J
	LmbWAVR65TCv9N0e6CNKGajB//uwN6ttwekWwcR2uR6KL5mgJc7jEOPesGLn2jkfzIMDfCJIBa6
	KlLBlwJCWMCvDvGA28fVTFI1QiM+8eCJhF9r6VDt1ddDcSqBQDsnJp1xiwVmBanz6Cp8YmThA9v
	Zkd9oclpFNtj0QdHrOB8pUHPNKafDWZoVz+Za43q+bTApLFuvKzrUhI1rMThmp8Odoy0Ulag7k9
	hk22ZS1Ck15R3ZuReqzqZIvdOKF+Rvn99zeeNATTQmp+kxoUk/8tJZyJBsoBjFq0FXjq5kgeh4j
	OjCJ6L4st43R0Lw5s7xyo=
X-Received: by 2002:a05:600c:4504:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-488d68684fdmr378438015e9.19.1776357987380;
        Thu, 16 Apr 2026 09:46:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f581b9fbsm63217285e9.5.2026.04.16.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:46:26 -0700 (PDT)
Date: Thu, 16 Apr 2026 19:46:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 5/5] staging: rtl8723bs: fix negative length in WEP
 decryption
Message-ID: <aeESXxJwPm95vcWk@stanley.mountain>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
 <20260415185501.440492-6-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415185501.440492-6-delenetchior1@gmail.com>

On Wed, Apr 15, 2026 at 07:55:01PM +0100, Delene Tchio Romuald wrote:
> In rtw_wep_decrypt(), the payload length is computed as:
> 
>     length = frame->len - prxattrib->hdrlen - prxattrib->iv_len;
> 
> All operands are unsigned. If the frame is shorter than the sum of
> the header length and the IV length, this subtraction wraps around
> and length becomes a huge unsigned value. That value is then used
> to drive an arc4_crypt() call that reads and writes past the end
> of the receive buffer.
> 
> An attacker within WiFi radio range can exploit this by sending a
> crafted short WEP-encrypted frame. No authentication is required.
> 
> Validate that the frame is large enough to contain a WEP payload
> before computing length.
> 
> Found by reviewing length arithmetic in the WEP decrypt path.
> Not tested on hardware.
> 
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
>     Reviewed-by.
> v3: rebased on staging-next; sent as numbered series with proper
>     Cc from get_maintainer.pl.
> v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
>     apply).
> 
>  drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index a00504ff29109..f3bc2240749a4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
>  		memcpy(&wepkey[0], iv, 3);
>  		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
>  		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
> +
> +		/* Ensure the frame is long enough for WEP decryption */
> +		if (((union recv_frame *)precvframe)->u.hdr.len <=
> +		    prxattrib->hdrlen + prxattrib->iv_len)
> +			return;

LGTM.  Thanks!

regards,
dan carpenter

