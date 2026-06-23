Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D253CF20E
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205110; cv=none; b=bCsapRhQuEYHWZqDr8CMvakNPZg4eH1WvX4qli9bqUfQYv95wgJ64ZqRfcmsVzVVTk4Yxc6JugPtKnrPBMecmlf8O59cqsKKgRMHQjerkTk5L5kZEVks5nq8YGdWPkbrNKOrWZrtahKh/fRixofeJI/TJcUCRHVKx2y5+mid+eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205110; c=relaxed/simple;
	bh=3YsDPKu+XZDNyWY/ZP2WF+FnCDXrXanHsbULdeIbMGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibShY8alZkjUY7FBEfrCn6KfLBOOtlM9CxqNWoD4drf7fGiG9Ib+dUW42/dnlRl8IdIviv94VYA5XqHTi7BChdA/Jxvcn9jDhBEgDdleYhIzlUrvjKuJBoP8IDfJIWFveNuWnbnxHdQeKgIm30Fb0KS15LPM8asoxLZfrlpGoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYotojSC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYotojSC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6976b0b2c79so3558581a12.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782205106; x=1782809906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FkA3hclgYIc87NYcXuz2G0H2QcH8Gc07wQOaw+kXDzE=;
        b=iYotojSCeFzA8dOwpfUmHZdGkC+VEBYfHtgpRvRLUldmwR0kHr02rmBjOIiCyk3CCZ
         +o5d6uPQCxV1ynCtLqjKAsWm5MPW0w+o9Xq7mLBrJSla/8MUIVdp1VPIkfIBP1UptXN3
         SsK1rbdjfvzgXhg2dF6tRLMj8kCdusX2/DGCxvGgVZz+H8nu478RwGM4NM+6oxhgwAOX
         HfyjkGFwf5jcfEzRsFncyUCvFfipPBcsasYzmabE0ifwCF9UEuc6L04G0rUMuiAjMnEl
         bH9JwRP4dDKrNUv8Z1BLsyufTembEATTxu+6QACoE2ozw/WLgJL8LsG8N76z+6oYivop
         DQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205106; x=1782809906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkA3hclgYIc87NYcXuz2G0H2QcH8Gc07wQOaw+kXDzE=;
        b=dBdtRu7oRlG8sRGPWUNJoJynNixV9r6LQprxzkpH/BoMzc8hdGMGE7Ef1OP0TNRFNW
         M2ONC80B8nwLUvLbmzv6J39JJot1PxW0Zcq/74IP+ZwM6lwCSrZ4v8IugrOAx8ht6sIC
         yIYCQnzfHYzlpvD4RV6JjzEnXLOjyaRpZSP24+FhMWzJq95j+lLJUfMeG2YXliRcJf+Q
         ylRCaYv3I2Q5viCFxRfbYocqXUl+aQQBJH1yEd0i19qj7gXvixSGY4u3aWUNYtEMCEpB
         t/Z2ShvFzShQqsALn4BuYwfH662z2pxiZFWjdydqa5xH9yTLkSNjd9FBQ1273PP56Zwf
         8hNA==
X-Forwarded-Encrypted: i=1; AFNElJ/1EbC1cBygMZ64jluS7CFuIzXjs/02ahwxUYN2VJXprKyMC5LhyfpxnNyzLyjN4IFaIKRrJCJTEjmgwUje@lists.linux.dev
X-Gm-Message-State: AOJu0YztnluLKX4mrJuACWVFlk3yZirysGanDtRbRfQwq/lo1l/NF/LS
	o2o8V9M5RG2CTYks1TC+2CuliwmZ3V1SS0Ngm9kHIpRnvpo+FNG+VKOe
X-Gm-Gg: AfdE7cmo061HAsOEKtoqcmo4fgmdm0UC7+fYIABMhy5aBKGTaY5gT0j9oLFiQ+OA6hi
	53e+o/kWXN2TQmoqz6WjzJz7yt+MwPNqL0OOyurPsUMOS6ryeeVx1FHEVHFfszQzp8jJkCbmjxt
	XcbVHwTwrJLhI/eeNXvh94evzi79XvPFPBZNLrLRWblc4qZxdsBo8/bt1u1QU+tN96Udned8SKs
	ApBMef6ZqhRx6VYPASCMcnhZkuJlfRC+IQFCghqCzXgZQC9gatM6zZIdNWMXMO9Ye7DiiVGVz+m
	myEz8aBgvp7iRTu/bVXYvLNmgONaLJobJW9lwTg6ViJfdCKr3elSRsWlEM3WgH+P7eGKwPPyJuu
	Ef8nIDGzem5S7VGwe4c4D7LZlcaF9lLz18cgvkfWjLzLi0EWzVJGArb5SAEjxdsvjG50oIXfH9C
	vvFCGXnrUzdkFcmWoOj0g=
X-Received: by 2002:a17:906:bf49:b0:c08:484e:d943 with SMTP id a640c23a62f3a-c107c72a56bmr88141566b.3.1782205105661;
        Tue, 23 Jun 2026 01:58:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac9406sm479425366b.38.2026.06.23.01.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:58:25 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:58:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ganesh Harshan <ganeshredcobra@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, khushalchitturi@gmail.com,
	dennylin0707@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix timer rescheduling in rtw_cmd
 callbacks
Message-ID: <ajpKrWRzWdNoayhT@stanley.mountain>
References: <20260622230448.4138-1-ganeshredcobra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622230448.4138-1-ganeshredcobra@gmail.com>

On Mon, Jun 22, 2026 at 07:04:48PM -0400, Ganesh Harshan wrote:
> Ensure scan and association timers are deleted before being
> rescheduled when command execution fails.
> 
> Without deleting the existing timer, multiple timer instances
> may be active simultaneously, potentially leading to duplicate
> timeout handling or unexpected behavior.
> 
> Use timer_delete_sync() to safely stop active timers before
> rescheduling.
> 
> Signed-off-by: Ganesh Harshan <ganeshredcobra@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b932670f5d63..967c3258e0b8 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1801,7 +1801,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
>  	if (pcmd->res != H2C_SUCCESS) {
> -		/* TODO: cancel timer and do timeout handler directly... */
> +		/* Ensure timer is safely rescheduled */
> +		if (timer_pending(&pmlmepriv->scan_to_timer))
> +			timer_delete_sync(&pmlmepriv->scan_to_timer);
>  		_set_timer(&pmlmepriv->scan_to_timer, 1);

Sorry, but this seems like a pointless change.

The _set_timer(&pmlmepriv->scan_to_timer, 1) means we want the timer to
trigger in 1 ms.  In the current code if it's already running, it will
run again in 1ms.

In your code, we test if it's running and if it is then we wait for it
to stop and then delete the timer so nothing else can run, and then we
run it again in 1ms.

The result is 100% the same either way.  Either way we call the
rtw_scan_timeout_handler() function twice.  And that's fine so far as
I can see.

You have misunderstood the comment.  They wanted to disable the timer
and call rtw_scan_timeout_handler() right away instead of with a 1ms
delay.  I don't know how much weight I would put in this comment.  We
won't be able accept a change like that unless you are able to test it.

regards,
dan carpenter

