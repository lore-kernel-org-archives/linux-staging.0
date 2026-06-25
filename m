Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BA276050
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 08:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374534; cv=none; b=B56e41Cczb9AbDnX1IgY9aro6h7rZIH8zU/+dvURzFHKz4qzBKEL3UN+oq22Dgc1a2bx8cQCF0+EDiqk/j0WWZptGMQb2jTbJGgYJtqjZaEn6uSa0ndCR911MddMJ888SluHXkRSqpylEpc+RHr55nuACTxffR1yvRT7x0wMaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374534; c=relaxed/simple;
	bh=NzGApPLn0XWASq7NMCYlstgaj/tn3z76cxJiKDD1tbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5M6oP9uo7qD/GD3/0qSEyN8KhpmBnRVldqpsYV6yx82qQ9E2UxJ/3M5i2RVqyRU67DZLR14umUKNRjVN6Xdwe50vCmJzTKL+IBMICHrRP/pE3oW9p/gdi1sbxxC36psnrwEXbjGyLNK6KFxSKvACkSzRzgv6ZYF6ubA4YM5sWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGOZWX54; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGOZWX54"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c08922c23ebso331674866b.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 01:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782374532; x=1782979332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=omLf3ggMDcQZK2Foazv5b4EuBOwA9+oLGdI8mG7aYPk=;
        b=SGOZWX54fpiBUI0Zo+R0bO1T9+XFNFrT0siuTKV1IEHAethCn+tSpE3czuyhaBCf06
         RqIklK8RB6/W4K3BXedtPIFmYeSrJJlWZ0AJ2DIUZ48+boM8/rGXF1tIx4UoCiLKGw9y
         mJdaKLK2yKyhdBjiVJg3eCbXueb1CyhZ+IMN1fQKfBvr6qVvmliNSAybmCR+Igj45W/w
         n/TIirIf6fV+A5pq0aVyzp0+Pr3o7cqgHOh7oFA6QLMw3Sgh0yCtjWpG1RBsnYDysbiL
         LZrblnJMrCc8DEQj0OfBtd2VGqHKXQWdCIkt0IPXPKpI+nanZNWEGuP6UxiHGRlDFWF/
         49hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374532; x=1782979332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omLf3ggMDcQZK2Foazv5b4EuBOwA9+oLGdI8mG7aYPk=;
        b=X5odaL0ReKPiYQm8PLrHKc/mV/YMyr7mcpKHcQ7l1u4tPjKbkcvfQ4VGchlrKCGJ3r
         UzP9RXy7LUa1+nYTVz8pax5LzVVino3pNpMk3ykPobU/d6lrHVCzwbbkywB17ItLfkyZ
         hpAbA4KAnBnO/2lTmPztND5uEZRVeERVRyrxSwC1DOhKzJTZzS801UAbYz4Cp1jR+8k3
         ZK05na4sf063EG8BYbXZf3w0kHTmBhj1Mji2xpAvIllKLYlPvxIY0qIn+1TqKvDzJURr
         oe36/eDZA08m9c1kms3kSvz592immfAQ+TfXrzdqjlwuBltSiBy27vIUsOt/YzYAHXed
         jQ5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq6iAen6Um4VU66od8C/zo8rExRCmcfZvCyEZTqQa8psSPPsKJ2hgr2KbnorATbaEAmSFZDf/ezbWKbVC1y@lists.linux.dev
X-Gm-Message-State: AOJu0YzsHNTzZDcWfVtHPQnDY/H0xmcbGiv2HWIfaPJVDB6O/mHom5Rz
	4HDHUTgv+cPeo9lTfRC3k4yz0kie3sHkB6bfbVfUjXoRchvuPcCZOFZu
X-Gm-Gg: AfdE7cmTNx5ewxgD0zKPbmSwf3CeYfLa5Kd5QH+ubdrvs6aYu2ePEfCvvvpQwtaDp+l
	MUzk0QO5iRKDwMUIBHT2GBy/eJIP9ZyZ1W6NOUSNzxlaO0A5DhyJ9+16fQ9SBkQgCzP+OT4HLfL
	nnb96lQeN9rNgwhLoIPeTHiyu6gTLE43MZk4+LHhhlAu0lGsYr/xKWzxG5ZPSHCpg7kj+FBOMaz
	qb4+CgOQo7hz51w5c1QA0wn1cqFRbj4VuCB471PVqRq3fMkontKrPCXAkIufDQGet3HOyd1BbDI
	X8up6GGWniG4mSEuWw38nsc0MI3W6S9XsTsuk+r+Q1M/GMdeOQao3EnSVkY6FG9yFnpvOFTqVZY
	dz78Q5JcbjfAGzaJLVN42gnKt6/BZ7VZvTfur7blTdgn43Fnfvg4bQ393/YLPJdhHLb3Bl7GyAS
	i5gHqx04dHINgtiwAQYto=
X-Received: by 2002:a17:907:bb49:b0:bee:959e:9ac8 with SMTP id a640c23a62f3a-c1205d642c7mr76966966b.4.1782374530660;
        Thu, 25 Jun 2026 01:02:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe5e53bsm118365966b.46.2026.06.25.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:02:09 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:02:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alonso Garrigues <agarrigues@riseup.net>
Cc: gregkh@linuxfoundation.org, guojy.bj@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up style issues in
 rtl8723b_cmd.c
Message-ID: <ajzgfS0SAFkV7MDR@stanley.mountain>
References: <20260624193110.1426826-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624193110.1426826-1-agarrigues@riseup.net>

On Wed, Jun 24, 2026 at 08:31:10PM +0100, Alonso Garrigues wrote:
> Split long do-while conditions across multiple lines and add spaces
> around binary operators. Fix indentation of misaligned comments.
> 

Fix one type of warning per patch and send it as a patchset.

> Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 39 +++++++++++++-------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index c35c7f1c38ef..d31d8e445dcc 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -74,7 +74,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
>  		else {
>  			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
>  			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
> -/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
> +			/* *(u8 *)(&h2c_cmd) |= BIT(7); */

Just delete this dead code.

>  		}
>  
>  		*(u8 *)(&h2c_cmd) |= ElementID;
> @@ -416,13 +416,14 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
>  
>  		}
>  
> -/* offload to FW if fw version > v15.10
> -		pmlmeext->DrvBcnEarly = 0;
> -		pmlmeext->DrvBcnTimeOut =7;
> +		/* offload to FW if fw version > v15.10 */
> +		/* pmlmeext->DrvBcnEarly = 0; */
> +		/* pmlmeext->DrvBcnTimeOut =7; */

Dead code.  Delete.  Some other places as well.

regards,
dan carpenter

