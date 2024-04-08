Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3722091
	for <linux-staging@lists.linux.dev>; Mon,  8 Apr 2024 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712591995; cv=none; b=XnF2GhBUe2b+y6G+bYOOkO1l5pNQg3YGU0hfAt8bQWB5tJZByVDxCtOu2AlIF10Uif0jKjqUiL2ByjLRwJuy3qwTV8oWaNMeWPWmAL5mc14Mc6coS1JoR1ur+GeX+CBNU/DjvdvT20WmVfva/Xj0WQT9JU1o+a0kv6qJAEBeVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712591995; c=relaxed/simple;
	bh=1ALZeQ6emF91G37m/wlyKAyFfBFwnq0TBNN/pk9ANcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHC6sj19sm6PoMuo73UoG/eLfGvD60/SeXM9fHNTexcAPWubtjYWz1InJylIPPHTgI+RqkTpsc34X5UQwWUgKFjutL2VGc+19s7tYI7WRB4/6PkgrdZIglqeZuYp4GzkQ302qOWdPRKL1Gt6obWj4FTrGRpX/dPKq/pAhRI3ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rh8VLiZG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rh8VLiZG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51c8274403so218418266b.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Apr 2024 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712591992; x=1713196792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=raUyqIRYyeiBVQ6DR8xzWRLnj/pHWt3aufTBBhCkwQM=;
        b=Rh8VLiZGno8KYbk0vO07tU9g4Fh49hnuJ5vuEAD26wcfZ2Fz6w2m5CNH2wnz02hPaX
         sIbWTwgyxTKK8BE+uk3RVPONh6Ex/2lpyqMxdyOveEkhtzeassf2tQJbkwlYZbZL8oS2
         DXjRpKekQKWA4oQtyH1cv11b9k51QLTO6rshLRWmdkfV4C/Hy8CA5WDM1iWhwPtY4cVM
         lBjw1+kjSOqXX5jxK6OerNUQ+YV3eM91ZozFBXyCjuFUm7z+KQHnzi97IioC482yFb0p
         sfq/vnkykVwbFvHyBQKqzu0kDCvSCJ3J5X4jw/jJtzVHdHzDsDg2Bpiyyf4tHIT9k632
         25QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591992; x=1713196792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raUyqIRYyeiBVQ6DR8xzWRLnj/pHWt3aufTBBhCkwQM=;
        b=iTGYRZ7Ya6M9vWpU+Zq08/I+CWvZnEiMj8Xlenpy88zR9eL6UNh+mCU0jGoOTxSmuO
         U2KQ8nNUN1zCDi5ns+drZN5+1cOM+hHLNEVzvvcNOUkQV6kHPuMuPJKiZ3H3kS+bQ1XJ
         /PikI5mzfI+3aYVi/8xYb0Xg5usabqSK1Z+A5ewRHRMzynGKylryZhmLJa0LYv/uRNTd
         pSPcY1HydSGh8lk56wre/0Hux8seIzqluydNn7uEKGcmGhkgE7GZgCjijymv3iTUxCwi
         fzy2qleBtKJgHyW2odFe6nrCjw4RXqncgRYe4QucWDQZPidoJY20pZn9vfEActKYsnyG
         H2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVCHBAK468uOH7lvMb/FCXoiYiCJmwG2jGqwc/Dx/LCLEo0U0XITqJe7gNwbbcBnSrL0n2j8fH67FN/w4BAT6cO+zMk3e/vVqSfc46Ckg==
X-Gm-Message-State: AOJu0YwOxI6Jc8muWfauvydfNbGnxvv1/xUvUSuMG2RICX/a0inJJWUy
	e81utPWIzbPsOylT2kTMSt3hdx+Z453jCxDfKLh13DkW0tn6h98fFdxbr2hshsE=
X-Google-Smtp-Source: AGHT+IE2w3mrHIQlivIgobOhQSg9hPNKdfAYMLDOg837QQvNJbsLP/SJ2CQSYGAnPSJH/6GBnsNr+g==
X-Received: by 2002:a17:906:6b97:b0:a51:e2a0:98ef with SMTP id l23-20020a1709066b9700b00a51e2a098efmr658666ejr.52.1712591991922;
        Mon, 08 Apr 2024 08:59:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kn6-20020a170906aa4600b00a4e238e46edsm4611628ejb.223.2024.04.08.08.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 08:59:51 -0700 (PDT)
Date: Mon, 8 Apr 2024 18:59:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Micay <danielmicay@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/11] staging: replace weird strncpy() with memcpy()
Message-ID: <948ab982-cb4d-46d4-a3c4-cc1c6369eb92@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-4-arnd@kernel.org>
 <695be581-548f-4e5e-a211-5f3b95568e77@moroto.mountain>
 <d8ee72ec-c16f-443a-b9c1-555dcbc69182@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ee72ec-c16f-443a-b9c1-555dcbc69182@app.fastmail.com>

On Mon, Apr 08, 2024 at 04:45:55PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 28, 2024, at 17:35, Dan Carpenter wrote:
> > On Thu, Mar 28, 2024 at 03:04:47PM +0100, Arnd Bergmann wrote:
> >> This partially reverts an earlier bugfix that replaced the original
> >> incorrect memcpy() with a less bad strncpy(), but it now also avoids
> >> the original overflow.
> >> 
> >> Fixes: 88a5b39b69ab ("staging/rts5208: Fix read overflow in memcpy")
> >
> > I don't see a problem with this commit.  The "sendbytes - 8" prevents
> > a write overflow to buf, and the strncpy() prevents read overflow from
> > inquiry_string.
> 
> I agree the commit did not introduce a runtime bug, but it did
> introduce a warning about the string being truncated.
> 
> >> diff --git a/drivers/staging/rts5208/rtsx_scsi.c b/drivers/staging/rts5208/rtsx_scsi.c
> >> index 08bd768ad34d..a73b0959f5a9 100644
> >> --- a/drivers/staging/rts5208/rtsx_scsi.c
> >> +++ b/drivers/staging/rts5208/rtsx_scsi.c
> >> @@ -523,7 +523,7 @@ static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
> >>  
> >>  	if (sendbytes > 8) {
> >>  		memcpy(buf, inquiry_buf, 8);
> >> -		strncpy(buf + 8, inquiry_string, sendbytes - 8);
> >> +		memcpy(buf + 8, inquiry_string, min(sendbytes, 36) - 8);
> >
> > I think your math is off.  The string is 29 characters + NUL.  So it
> > should be "min(sendbytes, 38) - 8".  You're chopping off the space and
> > the NUL terminator.
> >
> > This only affects pro_formatter_flag code...
> 
> The extra two bytes were clearly a mistake in the original version
> at the time it got added to drivers/staging. Note how the code
> immediately below it would overwrite the space and NUL byte again:
> 
>         if (pro_formatter_flag) {
>                 if (sendbytes > 36)
>                         memcpy(buf + 36, formatter_inquiry_str, sendbytes - 36);
>         }
> 

Ah.  Okay.  Fair enough.

I do think this code is really suspect...  What is the point of allowing
sendbytes < 36?  But that's not related to your patch.

regards,
dan carpenter

