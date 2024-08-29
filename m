Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C8518C904
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924193; cv=none; b=li0dg91d487VqYN8PK5e1m/itMKWVn87nFG3RYp8qsGAreK0JGcF8Scj0/OkWbuBebdIQ+gwCczfqq7nUQOY8Bf3BGeIAscUuPN2O+ydMTpTnDrtx+KLBO+X4PBbfNLr/FXLqfp+J9MEHvrjJ0ym30l5drgyLrjr/mKHANjv3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924193; c=relaxed/simple;
	bh=OdebDuPQOqyUSdwo9L6QAINi3eIPyAO8PkAC9Mve2c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4dYeO8WOGkU8wbtHASoh0BZwrn7PK5A5H2TjTep9pwz5LzAi7/Upz8s74dsH5xx3v+sUJlJNHSTypMsRCFyLg46YddICJfTxdT9tSpMdgKRdIlO+5DkwJ7zAd0SmL6YDzuAMSxW5+s319rHr8YCN3324CPH75FKTQ+fHOjbgeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/16ym1L; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/16ym1L"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so637715e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724924190; x=1725528990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJlINwL4Wf3pK+iotBJLCyDenaMFyH3DfD8vme55AUY=;
        b=d/16ym1Lveg1hb+FPdt1cr+fg/si2wNHR78Tckaoc0w8WfsWJXGpJfLFcDSpXVnzce
         c4cdaizWDugzB7y/Fby5HXF1A+mb3xqpSYGqjyJkEqkfg2duf3nO6qDVMMFvgvh7kaHE
         UUlHUrf32R/J5Ab9m3O35NuLv+tOfEorR0rTP9gvifE1bj2JgIDi18PNeJqPhgxnsJ53
         50WsrMteup/o7UIYJvjuQGHi9OFpOGt+dTISBvJ3bDjF2V/Jhsts2aZAomfq4gnoOP/8
         BAw1P2kopFsfFY+/iVOnpnSf7nnFqmdxcKpsPp3SWOBssDzL2s2ySsl+wBp5rn8e7OOl
         Ftlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724924190; x=1725528990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJlINwL4Wf3pK+iotBJLCyDenaMFyH3DfD8vme55AUY=;
        b=pWG0b0zjgagMeDlHhWy3idpsvH9OyaJWrmgw4T9tz1wNRcvExsAheAWreib4TK/Dsn
         2muAWymgGzxA+zwOR8nGfC9gMPB7RIHKzfxi81cueG8Z71FFZfojKvz+nkt5d5h9Nzzn
         TkWk8qcKQrkriSHaRgm6mtGfLbqamqZbS5i6+xnHrWN4MLLReOPRULG3ks3ImI2tBU4A
         LzXZbdfHeLJK3wy1ZQ5KX7XVvOTynBkS3fl9XsvVC5w5ZVFvTWTBX14S6ieyGIuhoMr8
         i4vuvicruTIWLujwBDrTdukAG8W0/tyRTKESNgR3/ok+Ijeku8yEM2AyNoZnJHL54FEJ
         X6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWYVmHCz96cSODhlNtSUJYCeLM4I6seeVFdNuBS7afUe3cMYF2IiPjincfWvdseTjPaZQ/Y63hMJZjOXnTa@lists.linux.dev
X-Gm-Message-State: AOJu0YwpqXjarivT2sPqCqPyxyzdcXv+/xewM+MbrBn5xKg8sh9L6ZVK
	oPhB0KhcFpveTy3t0yA1sjDFG+pUnk17MmEw3FIDUJJ3u5/T7DaZqrFN4gboQRI=
X-Google-Smtp-Source: AGHT+IE7qHvZQxiSgfO84hLqZwHWJv06PT+glwCYHz0VtH1NqDTym+WIBEgpem7s5zZ6uZ6KJAhe2Q==
X-Received: by 2002:a05:600c:5110:b0:428:e866:3933 with SMTP id 5b1f17b1804b1-42bb0263389mr16217335e9.22.1724924190011;
        Thu, 29 Aug 2024 02:36:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb01d300csm20901905e9.15.2024.08.29.02.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:36:29 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:36:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Manisha Singh <masingh.linux@gmail.com>,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
Message-ID: <daecc634-4faf-4dcb-b03b-f57f24673a88@stanley.mountain>
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607b86cd-d89a-4072-af36-ce2ce5c1f7fe@gmail.com>

On Wed, Aug 28, 2024 at 11:08:31PM +0200, Philipp Hortmann wrote:
> > diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> > index 6789a4c98564..6311ac15c581 100644
> > --- a/drivers/staging/rtl8712/rtl871x_io.c
> > +++ b/drivers/staging/rtl8712/rtl871x_io.c
> > @@ -48,10 +48,10 @@ static uint _init_intf_hdl(struct _adapter *padapter,
> >   	set_intf_funs = &(r8712_usb_set_intf_funs);
> >   	set_intf_ops = &r8712_usb_set_intf_ops;
> >   	init_intf_priv = &r8712_usb_init_intf_priv;
> > -	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
> > -						    GFP_ATOMIC);
> > +	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
> >   	if (!pintf_priv)
> >   		goto _init_intf_hdl_fail;
> 
> By pushing the below statement after the "if (!pintf_priv)" you change the
> logic. Is this really wanted? Why do you think it is better? I would avoid
> this and it would be a separate patch anyhow.
> 
> > +	pintf_hdl->pintfpriv = pintf_priv;

I liked moving it.  And I feel like it should be done in this patch, not as a
separate patch.  But it should have some justification as you say.  The commit
message could say something like:

    Checkpatch complains that we should avoid multiple assignments on the same
    line for readability purposes.  Generally, we would allocate, check and then
    assign.  It doesn't matter what is assigned to "pintf_hdl->pintfpriv" on the
    error path.  For example, on subsequent error paths "pintf_hdl->pintfpriv"
    is a freed pointer.  So this code is okay as-is and it's also okay to move
    the pintf_hdl->pintfpriv = pintf_priv assignment after the NULL check.

(Notice how I sold this as one thing, moving the "pintf_hdl->pintfpriv"
assignment, not silencing checkpatch and then moving it.  Notice how I avoided
using the word "also".)

regards,
dan carpenter

