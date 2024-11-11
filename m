Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675916EBED
	for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322783; cv=none; b=UkEYX1Mrb9Km2j81Nlo1q9/rq3z1rNYClacgvLimBra3iEUyEMB2kDH86cf7CxPKOQMJMLJbGmkD6oKfdDwJa+Dlg08lLIxeflUJaZrtwJkvKmDOEQ9Mtj9Vt1sz+RQ9IXMZXsLbs0TXJDbNIM2CHPBXPUj6Y0tjd57OrmO89X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322783; c=relaxed/simple;
	bh=D5Via+DKzC/dGUSq4YF8JyyvYuHz9bVXnl8eoBkzSCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FcC6EI3dPMHlbaXHYqDd54li950gQKkZfxvW6/s+YhZiENr9lfnEyqxd5Q18CepID4/3x4iXyn2g8ZfD/7RU1BsHyI6jwZr1cGaqgKWAE8LvKvQfMZv9bohL2oIaQ8IJ0bvithjBa+o+EGY1XwQbRnueJhLRokM9PcpEeOmPedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aVC0dggh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aVC0dggh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e59dadebso5122582e87.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Nov 2024 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731322779; x=1731927579; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bHWiG5ziBy20DemcdimU+ugLg73S19wOZfJw3vRn+4=;
        b=aVC0dgghDqkAYMbD4MKRzabq5A+W+vSYua9n/3aaPE+fIoCGtXD5a8pfnVNPBkIIof
         Q0WGoCG2x3RsSj+xha6XxbwqrSK4P2xTBWiGEpodlMpIpNMqjIBLFy31+K/twCenRxx4
         gum93NOb/zZ29dAoi0vJzW+imMLdW/NX4KtPnz3dBC9IYkv37J6CB1fyrytUxOHkTAYz
         gVfnWIDL24gQLSUQ2uQpbXCB6lEr2rArjr0/IGaz1jOlthC6CWMDRu3iYdXGrhv/u3Oy
         ubE2RCm514BWHtuww4a8vjScn/Rtt8xdOzqX+U8zmaLKkqVW44L4gMbtqcfdoPKEiJ7q
         eZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322779; x=1731927579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bHWiG5ziBy20DemcdimU+ugLg73S19wOZfJw3vRn+4=;
        b=JNa7oIUg/R+0YmwBXDr19pNKiDMISitSXUy+G62fzwLvl47lxgRQh8bU1OvKaDKibh
         wMCKIgv8dU1KmpQFEt2jg1VYv2TGotYQYfqhYsDTbljAfSYXpjsmvyQvRNr4YeieVBE5
         EKhnkpq8I7nKbGD4mx2/rJqMEPpyjJ0Rg0TzScaqFzdK1i4sd3mXd0V4rFCaEOBOvhyh
         cU6wTXtjZCD0z/s0VwASe06BF5sZtOYup7DDJ2Q0Pf/rmL15GS5NVM9AmZae/zbxZ7MT
         Ya34PkdYbzRZSzVJUMpJ7frzW38D8Lur7snbh0ZIOdOmvAPE17ROxlLMfByHIZspZDXU
         Q+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd33OWLz7O3wbd2eRznxoRUjBMxWgwQRRKJch+M816IX+t9UWgM84NxdA1lbL4DLMmHF+XAuiJ4Q0rx1ec@lists.linux.dev
X-Gm-Message-State: AOJu0YzfVhSMX0tNC/pGPPxBXCTAZyjNcHuqDSCgLZ6aUj2fYxh4WF/G
	wCHYWFY6Q/XTFN1mzZZ0i78q98xSPZxeXcyyE//L4qbjzqzU5+eHuQAth3bVs8Y=
X-Google-Smtp-Source: AGHT+IGjYpE9tNPs9kTWAEk4o52wWOwKUe3EsC8hDwjEeAZzllEiCKQ+tpuY4no1+MgmfATmIi8Zvw==
X-Received: by 2002:a05:6512:4009:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53d862cb444mr5921715e87.31.1731322779045;
        Mon, 11 Nov 2024 02:59:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03bb72a7sm4770524a12.45.2024.11.11.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 02:59:38 -0800 (PST)
Date: Mon, 11 Nov 2024 13:59:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Greg KH <gregkh@linuxfoundation.org>, Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v3] staging: gpib: Change return type of
 fluke_get_dma_residue
Message-ID: <d04125eb-8a1d-42c4-9276-eb3a5da908b6@stanley.mountain>
References: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>
 <2024110714-scanner-apple-0792@gregkh>
 <6a97acbc-b4b3-472e-a999-fb4acae0e633@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a97acbc-b4b3-472e-a999-fb4acae0e633@ijzerbout.nl>

On Fri, Nov 08, 2024 at 08:37:59PM +0100, Kees Bakker wrote:
> Op 07-11-2024 om 09:25 schreef Greg KH:
> > On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
> > > The function fluke_get_dma_residue returns an error as a negative value.
> > > So the return type must not be unsigned.
> > > 
> > > This was detected by Coverity, CID 1600782
> > > 
> > > Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> > > ---
> > >   v1 -> v2: change type of `residue` var; add note about Coverity CID in commit message
> > >   v2 -> v3: add version in the subject (sorry Greg)
> > > 
> > >   drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > index f9f149db222d..3843e986f104 100644
> > > --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
> > > @@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
> > >   	return 0;
> > >   }
> > > -static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
> > > +static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
> > >   {
> > >   	struct dma_tx_state state;
> > >   	int result;
> > > @@ -549,7 +549,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
> > >   	dmaengine_tx_status(chan, cookie, &state);
> > >   	// hardware doesn't support resume, so dont call this
> > >   	// method unless the dma transfer is done.
> > > -	return state.residue;
> > > +	return (int)state.residue;
> > Shouldn't you be checking the result of dmaengine_tx_status instead?
> > residue is a u32 and is NOT an error here so I think the unsigned value
> > here is correct as that's not going to give you what you expect it to
> > give you.
> I'm not the author, so I leave that up to David.
> 
> However, in the mean time you have already signed off on a similar
> change in commit 14bcf831f0d [1], so my patch won't apply anymore.
> 
> Note that there is a function fmh_gpib_get_dma_residue which is
> identical to fluke_get_dma_residue.
> That one was changed in the same way, commit 039beaa5ace1 [2]
> 
> [1]
> https://lore.kernel.org/r/20241017092511.17621-1-everestkc@everestkc.com.np
> [2]
> https://lore.kernel.org/r/20241017220740.30370-1-everestkc@everestkc.com.np
> > 

state.residue is going to be a very small positive number, so adding the cast
is unnecessary.  The rule is that we should pointless casts.

Checking the result from dmaengine_tx_status() is probably a good idea just
based on the fact that it's Greg suggesting it.  :P

regards,
dan carpenter

