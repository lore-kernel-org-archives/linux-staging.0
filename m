Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584743C37A3
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595577; cv=none; b=pEWEdwGkxSnom9RyTnl4bQAH9yWRKRCOTHuvG3OG6UOWrI/edG/ndiCI9zaHTWa8ygJF5an5fBZc/c8TrEQUx2gU2G2WLASj2qFpohTb+C+CchCpcw6glT4f1izBEbWkopukqsOSPD677lajf7w9UE5d6RD5DWVj3buZ/FT4Evc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595577; c=relaxed/simple;
	bh=xNzSemnBahJWD94QB0z68FgMpp2BwRAfno5hpdwXRFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luRUYWk0rWRX093+EZqaEEU1LluQpTfxcFjT5RJmco4Il0+Eb//UKDa9tAIKo/5lpTMZBcaQg9MdSewCeSLugiPJae0zaop1TEyt3x3Plp+1nt6HQzpF5bDMYw9YFJIVB6YqQGx0+yzUFBnJZ/QxAxNOegIhIwUXI0/rE2vjAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdTQFsXy; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdTQFsXy"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51764768c36so60063301cf.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 00:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595575; x=1782200375; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ffa+pVC78fSqPH+T4AECIECVGRfQOX+aRddcU5XZCpo=;
        b=fdTQFsXyYPUcKmvqurThW5KsTJQGDV3LtAJRnTNmsFZD5dTsPMC1+Fp9Aed6wwI8V9
         Uzxzy+fmPSpEDYGdrlgOS6S2SN4Ir1L2oJVdmniJcni3fwTu5YupLT1LlXQVVjDTlcDn
         uy6GRT5avzUhYcSsdbBw57zporUqgRB9AoO7wwXKvIUv1sUfh/5kE2h9rbr4jW3ytk9E
         7SuISkw0ihqyFf/w8bVBx5PHUJiFl6IN6j4T3dF8sSUUa/sY8FzwtSC50ZM12PT4Eczv
         /RxITjq6KN8XjKJCZ6l6jj+eLGBESqT8tAXfe7AVadXRRbuD2rFiqZE6R8XIbbQZ0ayk
         /b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595575; x=1782200375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ffa+pVC78fSqPH+T4AECIECVGRfQOX+aRddcU5XZCpo=;
        b=PmNJ13svMPYi320cVhyHhIOdhTlSXAfSXOOGZeVPyLzvttDDNCUfR6As2YtNnVxwl+
         B+VKyQGJRYfUEHkyf6kHN0hcefbuSmbJ37RdqI1xWza3J7eBGma52L19MAMofKxixg0+
         KPaWoSosz5bI6kOsO9DXj9kT6YSGOEJekt60uUxtscA5DSoI0c+D2Nuo9gw3jWj11uco
         moTxE7fVCDyv7tPU2MwwaZxa4xU4EEXPB+2BnIGYaEjth7PJNtLM+kmC+fw90BgQEPVa
         MtRUIFbCaKIkzSpRk0mvzZt1Z/68+mZvoGDoV6BFthC1JMZBdKZD8J8HFOW1CzbE1N8Y
         Lv4w==
X-Forwarded-Encrypted: i=1; AFNElJ+5x8tbKyOBK6mURuc04z6Qw3shTCS4DMkNH1BGDXzeY0vCizqAgmvsABR5/W7jYRVo+J933ip95Re8Ulir@lists.linux.dev
X-Gm-Message-State: AOJu0YxtwQCw7J11e86ywZn1XETizgYMM6sUvOo/8YEUymrGqqhTsvLI
	GRRQsQpeT2IZ7HaS+1V6FnVlEQxtIUCKT9N+PsPamulGL5fRb/0nTweH
X-Gm-Gg: Acq92OH1FaIcloorUNkOUI51zMrPp2yI5XcuxEN6y/ObgxZ5o12igoEIHsJEKAlCm+t
	qwE/0KlwEak5soLS+9f9Os/iXFFRkOSYBfYCgiEfN+Y2g4Ids+3eD4hRJiv+Ax8+hNo8/XhQWC6
	BttYnz7y8prV1FTxH195RRLF08tNoMP+7nZtADfASF4SRoFmiMOQausvIUWgkUAFbe7NHzI6PY9
	HmiPYguqSygTDIXWVOeITvAkCJIK3PDsQQwGIQq4Llv23tnH1636kpDXQOcYWbH3iMLkqvHdimf
	sjGADn9lptYKTm4sKiocVIaURWEdsdLs8edbl0UJts20073wciiA/R8PUvVVNSKU6iU7HcHiidp
	F5tJ4hPLzIDLIevFCUNe/0H6X/VkJc27YTq0DAcz4j7Tr7FAGRE2Ewr6xcwVQmppa5qfshgOIhB
	KErhxtx3AlgIOgTn6K
X-Received: by 2002:a05:622a:1b17:b0:517:6350:ed4f with SMTP id d75a77b69052e-5195359e099mr221753791cf.34.1781595575299;
        Tue, 16 Jun 2026 00:39:35 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb854290sm133511721cf.31.2026.06.16.00.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:39:33 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:39:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] staging: rtl8723bs: convert
 update_attrib_sec_info to return errno
Message-ID: <ajD9r2y0NIz9yj95@stanley.mountain>
References: <20260615234340.97299-1-dennylin0707@gmail.com>
 <20260615234340.97299-4-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615234340.97299-4-dennylin0707@gmail.com>

On Mon, Jun 15, 2026 at 11:43:39PM +0000, Hungyu Lin wrote:
> Convert update_attrib_sec_info() to return 0 on success and
> a negative errno on failure.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 69b6d3a2554a..0fd2415e7bb7 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -505,7 +505,7 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
>  	pattrib->retry_ctrl = false;
>  }
>  
> -static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
> +static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
>  {

Sorry, I was unclear.  You tried to follow my directions and then v2
introduced a bug as a result when actually v1 worked...  What I want
here is to update the check in the caller but not what it returns.

1 Bad:

	if (update_attrib_sec_info() == _FAIL)
		return _FAIL;

2 Not yet:
	ret = update_attrib_sec_info();
	if (ret)
		return ret;

3 Good:
	ret = update_attrib_sec_info();
	if (ret)
		return _FAIL;

And then in the next patch change all the return _FAIL sites in the
caller.  So we'll eventually move to option 2, but in a two step
process.

regards,
dan carpenter


