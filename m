Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45E248F47
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340971; cv=none; b=f8sWgg/ewGVdLYAOyHDXRISGnXObTQrSUWjhHU5KJqH99/8TY3VXIehZQiMruK3aVKP83whrb049DwaL0DcCn3+39/dKSGr/LpQDb93ALjJalBno1w6qMgD0chKx9Pz/EXYcrf80pAFVyZPeLQctt3xkIUlzVoL2JbzdxdKvNZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340971; c=relaxed/simple;
	bh=vHMy8lfA0RvTgRqwgI8565ZKT2Th82SQ44ADnJE2z5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLgcowCkuJ9UFtLDFYd1cSPbERvyoXryBMNsxjoh5QiRsIzK7r61+53h156gNklRJIH1yNsyc4j/oSamaIvoeWq/bFVSmnkE6T1zUu9VeB3HLm9VAf6dALUivCI2PuQ7xayoT5icK9WlAg50WSwSkhggiTnz5d8kMBtOm0zZXe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdLHMShq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdLHMShq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748ece799bdso495080b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750340970; x=1750945770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWaDkoPD+uSM9zWkt35EXFyWvonB0R9vMQAYIH1I094=;
        b=JdLHMShqOj8S4QgOubqlxjHtlInMRVmXG1lBeQlYYHVHK1a+jLvlBQZ15c3H/NT7id
         hZtFU4hEYOOuHmPUH5fsguWYvqK568T3g+4cSySatzGnsHlL74v1410B4A1yBVSVxx+k
         ZhXojZiN+gZHFYLbW1Er7IfC32jr57jrkqIVPLaq61j9iwm0nuwxN5JSt5XAE4oC9TAi
         eEoS0Yz/f2n5oR14ZLjCPKMYJaE4zas4fVyM/v7ep17oPblluN68ksLkF1SNU8uaOtnD
         esdU3a7mqY0uTBdBXavvi9ETFflmORUAbptpl00JvnlAkimIlGjwlulUq11U3+nzRgA/
         L5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340970; x=1750945770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWaDkoPD+uSM9zWkt35EXFyWvonB0R9vMQAYIH1I094=;
        b=HtmyL7uBTK/eyb2WS1J1Urb6fJNjo2ovR2UbXlt5jwlKq4TrFs/GDrBIvKnru2EmuE
         mcf3oshLY827lPLWmEua1r7OmUgkUi/1btcE3WIHOgtkfbKpgAc8oJeNTctKxnolnTpf
         NtG3s1f9DNtN1xdiluPiCd6g2C8WswWcCkTtSzKk7oxCbsyuY7CmpJ94xhricMFOSlJ6
         PxLuaXWF65O2HJH4UcGA/IZ6Qxx52gDioREMUTMo6lnrgaXI66WIkQj+JM8q7UFIBDjv
         Abnkss7sNhTjpYvWl5W+rHgUPqqy4jthA5nOB4Kw5TqujBf169IdVKSZQDWwZMkQFkPx
         r/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2tO2HK0yIrAl9erDGQtq323oU+SDdMms7n4UCafv7516OTHq9r5/9ZQZVb1Ns5KX3C/xhQQPlT0Z1y+XU@lists.linux.dev
X-Gm-Message-State: AOJu0YwVoJ+vgEYrA7eC9KwPUoMckskWnjhQu/3a27uYlq7csunmUevL
	S/PLiHs81fdkrFrGnPPpM5CO3gkss2L5aego/mw3yRQ4BcxmsTRpmj8r
X-Gm-Gg: ASbGnct5Gw0PPHndHmBmiWN9e4SDc8Nf4XX4geyu4cPiDzQ2hYodDAjHHRS1gmLztKG
	LYhmAN2AER8eM4KKGl9AUI8UKmaqXiE0lE/uxj/QFG4c2a/nT2l2wQEV8jo40J/qChJwst/AsCt
	mUSVvpGtI5gbLDJ1HNDk3kD4fcncJAvNgDEEytzket4BNl9j2gRfYTbFm5vvDzVpNjK+Wbl5Y6o
	iHB0yEv0VN+/QM24xFNMu85AQMlMP6BRg+t+Wwclbyx9UcLekvhaqy4g3ImDdx4rZfMYEA4lvMQ
	Gop/frJXH6WQjK9/uZM/ZjR7nd3/M0QGMWaK70qs/0/2gEIGFr/6Ss4XXw==
X-Google-Smtp-Source: AGHT+IFwhI6f+rDnPbqksOiWdj6ftTdebu5QnmBHRMDK0BCTl0IMR+BYGJa9ss9I1NOdNDhtVR9WIQ==
X-Received: by 2002:a05:6a00:21c3:b0:748:68dd:ecc8 with SMTP id d2e1a72fcca58-7489cfea237mr26170827b3a.22.1750340969731;
        Thu, 19 Jun 2025 06:49:29 -0700 (PDT)
Received: from zinc ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748ef5890easm3377949b3a.92.2025.06.19.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:49:29 -0700 (PDT)
Date: Thu, 19 Jun 2025 22:49:24 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kisub Choe <kisub.choe.0x1@gmail.com>, sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: rename 'proc_setBLANK'
Message-ID: <aFQVZIXoS43iu0o5@zinc>
References: <20250618141555.5434-1-kisub.choe.0x1@gmail.com>
 <2025061817-jacket-nacho-50d6@gregkh>
 <aFQMrXRzui58krqA@zinc>
 <2025061927-pushpin-scholar-a898@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025061927-pushpin-scholar-a898@gregkh>

On Thu, Jun 19, 2025 at 03:24:26PM +0200, Greg KH wrote:
> On Thu, Jun 19, 2025 at 10:12:13PM +0900, Kisub Choe wrote:
> > On Wed, Jun 18, 2025 at 04:26:10PM +0200, Greg KH wrote:
> > > On Wed, Jun 18, 2025 at 11:15:55PM +0900, Kisub Choe wrote:
> > > > Rename 'proc_setBLANK' to 'proc_setBLANK' to
> > > 
> > > That doesn't rename anything :(
> > Rename 'proc_setBLANK' to 'proc_set_blank' to
> > > 
> > > 
> > > 
> > > > conform with kernel style guidelines as reported by checkpatch.pl
> > > > 
> > > > CHECK: Avoid CamelCase: <proc_setBLANK>
> > > > 
> > > > Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
> > > > ---
> > > >  drivers/staging/sm750fb/sm750.c | 4 ++--
> > > >  drivers/staging/sm750fb/sm750.h | 2 +-
> > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > > > index 1d929aca399c..bb2ade6030c2 100644
> > > > --- a/drivers/staging/sm750fb/sm750.c
> > > > +++ b/drivers/staging/sm750fb/sm750.c
> > > > @@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
> > > >  	pr_debug("blank = %d.\n", blank);
> > > >  	par = info->par;
> > > >  	output = &par->output;
> > > > -	return output->proc_setBLANK(output, blank);
> > > > +	return output->proc_set_blank(output, blank);
> > > >  }
> > > >  
> > > >  static int sm750fb_set_drv(struct lynxfb_par *par)
> > > > @@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
> > > >  	crtc->ypanstep = 1;
> > > >  	crtc->ywrapstep = 0;
> > > >  
> > > > -	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> > > > +	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
> > > >  				 hw_sm750le_set_blank : hw_sm750_set_blank;
> > > 
> > > Why do we even need this function pointer?  Why not just do the check
> > > above when it is called instead of this indirection?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Dear Greg,
> > 
> > Here is the updated patch with revised commit message. No code changes.
> 
> Please read the documentation for how to send an updated patch (hint, it
> needs to be a new version).
> 
> Also, see my comments above about what you should do here instead of
> just renaming the variable.  Please make that change which will remove
> the variable entirely.
> 
> thanks,
> 
> greg k-h

Thank you for feedback.

I was wondering if you could share additional feedback regarding
pros and cons calling a function directly based on the condition instead of the
current implementation?

Regards,
Kisub Choe.
