Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36325136E3F
	for <linux-staging@lists.linux.dev>; Thu, 13 Mar 2025 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883572; cv=none; b=TczRy0SeDDBQ3Ov8fmsg/ER2hCuZOvDo7mgdXaQxqi66Y49ohcVFZJIVjYtFJHfNU8uc0+2UW1abx6B4CiAQNJQUi6W349Wsu5BTAwiqd0Uip9r02Vu/M3JomHo+GggTBPYt1cqiBSDeeHIckF0E/uuKCQJxMFCpF/aFgLP+a4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883572; c=relaxed/simple;
	bh=3veIpjO8FY9cGq7h4dDd4e1jM0+O2U93qbLKOByNvLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJEk2te4EfKCM8cyjwG+0hHTpQxJwDQVEhts9+D9ApMfWpjnLymwBsieC6R3XLUrCgvoWiyBdpbJh+kebRgrc9KBgc1LML9oub9o19UKi0NCdr3vg/eMY9Ysv6Jg89C6hTJLB59WPEPwZtCeUCpiXfH3nymxkZlfeW7JJGgwhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmkIO8Yn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmkIO8Yn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0618746bso8305595e9.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Mar 2025 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883567; x=1742488367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pk/Fm7AsuFr4JJo8BZ86u/lcrGPbAwJL5zM3d+jgaXU=;
        b=lmkIO8Yn4FqZWOWhWvXdO/DfTSy98fZi91wAg82APLLI7SbibiGNOvbo+DfFADzspN
         TCSKlFHU8TmxgMm7n7SkbayWixfvOzyaXZ2bh+7qxnTfWHxWcf8x5HppvCgU8pJQ91ra
         N8pUWBtC8fTrlOgEQ2MFu0b3NDLtH3pqtu5owNjTckNsK5cOfbL+3MHmIXn3uBvkK4li
         +sGxC44xeRu9s2XOcpFI3i601g3l1LNNXxnI0sXtbZmHAELsY0+kRuBpd5k05vCMu78w
         44z1DDgCDya+PLDkuPsFoHO9TzIuJ+6JRzHib4Ow1xz7uUW145VFovvczVysYMAF5Hgn
         3Hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883567; x=1742488367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk/Fm7AsuFr4JJo8BZ86u/lcrGPbAwJL5zM3d+jgaXU=;
        b=algQt+HPMJ+0vKtFB2DG5DC7Yb7yIweNaGSOWFl4+MDBrXVgLbVvovN3pKDAT+0KQT
         eZ6rOkNYMJ8XMhqOWW969AQM2d1SUt6H6MO2uWjyIK5jw6TfhJaRAFLt8r4FTu9Qh1Ou
         J2qovGb8SaJDaBickSHoED3zsNLs0zUWi/rsMD3dyGP3j8B3fNSaf2f6vCcLgGt3wpsS
         WUH/Rq6hLUNPCkjSEqmPOiT1s07yclXxWSv+FiRGMeEoOcN5P0VksGmySRrBZSd5dWV3
         HLubFNtJ9xNWQSzE/kyyy3JNrTGmrKi2F4gTwz1qNGnMGDluM5DBA8mXMFA6hvClugtZ
         xfNw==
X-Forwarded-Encrypted: i=1; AJvYcCXsgCPDcADt+3Du1z9eUV+2AnpwTOkICBc46vhCwSQYz25gWJxQFEyH0AJSXIC8JpMQiY8brymX/hScJEwx@lists.linux.dev
X-Gm-Message-State: AOJu0YzWF5TnnrLLBibMFPGAn1eU7G7VEgsq+IQ4hMpNlHwZcYrBIKFE
	6q1BfZGqyFO17GK8xrny45nV+/BeYr4NtLF1N6SppnI5+77dsKRo
X-Gm-Gg: ASbGncsBTP5LbHieiXs9wVv/UQcGUjvXv+tR936caYlHMVuE1iPDbGJXZJOjUarv1Oc
	disqeAp4POqntzcHNwCiE3Z5uoeoW4tvp7HWjiQIYYjTzwZGc8D4KNMY0sLNBa1iN/f8ugmaWz1
	OGluRPD/za4LlTvWR9bh7cKfYVG0Rhwwl8gELbIgiGM4sYCDzfRTF/bHDkHSIIY1Fg0prl9N/4O
	FdcK2hH77T6835za29mcZwvzQQ8g9JS1I7SnxHMrcidePIxCGwOEsU4eMYAEIMbKYbDLjSEGnpH
	spanXu6ba4/PSf+iesjf1ElGoKRt+k2rs7Rbfc2UuGf/QudJxCSHi3Yi3U6I
X-Google-Smtp-Source: AGHT+IG/hk48lJj+8hPeuQY7ZauK3kX+fOhVWAQsxMsK5NG87kEnNFiSO3KeVKBv0+Muv22DdhY3yg==
X-Received: by 2002:a05:600c:1c83:b0:43c:fb36:d296 with SMTP id 5b1f17b1804b1-43d1d8e7dc9mr2479425e9.25.1741883567071;
        Thu, 13 Mar 2025 09:32:47 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b12f3sm26084425e9.4.2025.03.13.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:32:46 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:32:44 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Add return value to request_control
Message-ID: <Z9MIrOJ-8NQjtwLA@egonzo>
References: <20250222202301.3729-1-dpenkler@gmail.com>
 <f7521c95-e69c-4618-b078-283c156ca594@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7521c95-e69c-4618-b078-283c156ca594@stanley.mountain>

On Tue, Feb 25, 2025 at 11:59:56AM +0300, Dan Carpenter wrote:
> On Sat, Feb 22, 2025 at 09:23:01PM +0100, Dave Penkler wrote:
> > A number of drivers are unable to release control due to
> > hardware or software limitations. As request_control was defined
> > as void - no error could be signalled. Some drivers also did
> > not implement request_control correctly by setting
> > controller_in_charge instead of system_controller.
> > 
> > This patch changes the prototype of request_control to int
> > and adds the appropriate checking and returns. In the case
> > that a board cannot release control EPERM is returned. The
> > faulty implementations have been corrected.
> > 
> 
> This patch is hard to read because it does several things:
> 1) It changes the functions from returning void to int.
>    This is the overwhelming noisiest part of the patch so
>    it's hard to even see the other changes in amongst the
>    noise.
> 2) Returns -EPERM if request_control is false.
> 3) Changes some stuff like SET_DIR_WRITE(priv); and
>    ENABLE_IRQ(priv->irq_SRQ, IRQ_TYPE_EDGE_FALLING);  I can't tell if
>    that's related or not.
> 
> You'll need to do it in two or three patches.  The first thing is to
> just change the void to int.  That's a simple mechanical change.  The
> only worry is if some functions are returning an error code on failure
> and I don't know the answer to that.  (That would break git bisect so it
> would be against the rules, even if it's fixed in patch 2 and 3).
> 
> The actual logic changes will hopefully be easier to understand when the
> diff is smaller.
> 
> > -static void agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
> > +static int agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
> >  
> >  {
> >  	struct agilent_82350b_priv *a_priv = board->private_data;
> > +	int retval;
> >  
> >  	if (request_control) {
> >  		a_priv->card_mode_bits |= CM_SYSTEM_CONTROLLER_BIT;
> > @@ -354,7 +355,9 @@ static void agilent_82350b_request_system_control(gpib_board_t *board, int reque
> >  			writeb(0, a_priv->gpib_base + INTERNAL_CONFIG_REG);
> >  	}
> >  	writeb(a_priv->card_mode_bits, a_priv->gpib_base + CARD_MODE_REG);
> > -	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
> > +	retval = tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
> > +
> > +	return retval;
> 
> Get rid of the retval variable.  This should be:
> 
> 	return tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
> 
> > diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
> > index fd2874c2fff4..3d51a093fc8b 100644
> > --- a/drivers/staging/gpib/common/iblib.c
> > +++ b/drivers/staging/gpib/common/iblib.c
> > @@ -418,12 +418,19 @@ int ibsic(gpib_board_t *board, unsigned int usec_duration)
> >  	return 0;
> >  }
> >  
> > -	/* FIXME make int */
> > -void ibrsc(gpib_board_t *board, int request_control)
> > +int ibrsc(gpib_board_t *board, int request_control)
> >  {
> > -	board->master = request_control != 0;
> > +	int retval;
> > +
> >  	if (board->interface->request_system_control)
> > -		board->interface->request_system_control(board, request_control);
> > +		retval = board->interface->request_system_control(board, request_control);
> > +	else
> > +		retval = -EPERM;
> > +
> > +	if (!retval)
> > +		board->master = request_control != 0;
> > +
> > +	return retval;
> >  }
> >  
> 
> It would be better to reverse some of these conditions are return earlier
> where it's possible.  (Always do failure handling, not success handling).
> 
> int ibrsc(gpib_board_t *board, int request_control)
> {
>         int ret;
> 
>         if (!board->interface->request_system_control)
>                 return -EPERM;
>         ret = board->interface->request_system_control(board, request_control);
>         if (ret)
>                 return ret;
> 
>         board->master = !request_control;
> 
>         return 0;
> }
> 
> regards,
> dan carpenter
Thanks Dan.
I will submit separate patches once Greg has merged a new baseline.
-dave
