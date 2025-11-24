Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21212F7ABA
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763977556; cv=none; b=VYvUcN3xAZzqnD8PluyXDe7S/7XXs0cPOgKDjLA0DxPUz6EFiSunrcwUFntIESh+d75QBZvFc0ELLGy87BCwmKkLx809jGcpWFzNZcV2ByI/bJElLsLsI54xCNObGy6eWfYI2LAubVZoEtNsGsbfwctxyLllkDePfkXp86SR0es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763977556; c=relaxed/simple;
	bh=NvYF04v4eCx3yl/s7snQRfvX6PPL89nRAytI2UwqFPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfRlpk3B29qESpIqPqOJlMc8kaaEoD0NCYpSHxsS4ogFnUBJHZvMoAGqT0sxsxfTo79rOuGrlYQQhG5T0CIgqYRpRLRof8pXUS4COh6UCGesXRSjQJksOMI2jNODjtjNeofeCBgDcrQV6IizI/S+xWGLWp16sJm1vL36nLwVAXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFK0jdFb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFK0jdFb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b91680f8so32382825e9.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763977551; x=1764582351; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMaT/17n5xtGeyxsqkTx7z8vnnLBLj+qyVWsvskIkIM=;
        b=vFK0jdFbpX1L+0If9FR8eTa6xnQXPOe4HM06E2mbywsz0ymNUGDRY2rTYN72OjR6rm
         EvVBhSmfYoT7hheUuhuX4FSGz4j89kYO1Y8YTer+J6DmRNgh0YNseM6HRPOLwSZyT8jp
         Io6QJn5qtEdCK4ByJoToL91RilCNlQ/tbVAfD3Ck/Z3BKaKaSzVC/5MNCrfVYr0Q7e5Z
         CNIY2xpxjwW1TNvDHaUUgLC9PNB8XG35nmn9ykNpSYQK5SGdo8yElF1SgvAMEzd5cuvg
         UZSLyMRdzZ1cLf+qZ+ysDKF+7PXaR1h+UQy/5PvTRnuAHbJc3P4QmrGNYvNPB+165bEJ
         aE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763977551; x=1764582351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMaT/17n5xtGeyxsqkTx7z8vnnLBLj+qyVWsvskIkIM=;
        b=T8QTn/ZYNSZHkp4hprkzbuutbXNPusjdCpsfDZQqu9C3WmyELeeXE9Qap3IIif2Hti
         8mP+v/C+vKlUg9s/PUsJi5/Gk6mbZ/18JR1X+PgcHZ1R+22kWk0cS/B6htdHPC03DlVn
         WeVQJftPqA3WYxI1Fyyvl8hgkOpgl63mEEr8nJ8OQC7m8tW0/gCLZ93yxS+7DhsSmjCX
         X2NyPufbY6/ipU1/XLMX37tzKPv8xjuG/4h5/68XOeeVsNydIlz6XC1eTz7S7QLI0YUU
         q4v+Xj6XyzoWI73PMGl+nihTw5KKAamqEuZbZDxos+Af/z7NDd2dNOPKhIcKEYTAmTYL
         pT4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFAK6J270osiWybH4OmkuhwGNT5b4qs27E687MWpPHZeCcl4K0Rj4v1c+SyCUZ/7Rnu6HVOUesPdRsVgHC@lists.linux.dev
X-Gm-Message-State: AOJu0YziGuRkTL2ngrks/VFmTy2Fpnd7taSNFSuj+qBBr3dfsCjOP3AN
	P9Vgj/3B+1iCTEg+uWvAYQqKclLNNBw2i3xk5ABCrW8YOrbG8E8IpxknCP7UqbOLSC6JVNYh1SU
	DSxB2
X-Gm-Gg: ASbGncvCQzpbCrExLj8Tc75wc5RvTSQOCH9dmPTW2ZIGeTw0OyJdsrZqVZ3R/s4eR2n
	b17rCoqM0XIQW4wHvRAcEElsR80xkQS+k17VC2KXojJaoyY2vQy3F0LUNMG5tP3H+7T4aeqVlG9
	xm6brEA6TjZsHTVt/LQby6fyrXorkbx4cKovotxT23G3Rkx38P4y3iLDZz00dpK8t3Vy7Sa42W+
	vDeWErngQtlEYhEzUmUaCjLaMWpVbIiDx5uUsmAbP9K8YD/as3deDJ+A94zIIbiIr+WWGQYq9uY
	CWLCF85rA7fGzPs0UN8Vu1ytN4fIopQ0s3YbiWq8dmLevjfq+cOg7jDQhojtneA/2vGeun3PCIa
	P/YwJmwh0iV8RWgd5LpPd+sSGuHb6EFce90MPOv2Nu7vTTHhPEWYfeMlVdSgIIrGK5AjybEfQCM
	i4Ldcvj0COHVyVlEFy
X-Google-Smtp-Source: AGHT+IFpEPtNwiiXK5rR4a3dHCY5Nvt0T4NQXTuZ2M5JULq2xSYX/7OqQfJCd3eyFUG71XzaQg+56A==
X-Received: by 2002:a05:600c:3ba4:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-477c1123ae7mr155874075e9.24.1763977551146;
        Mon, 24 Nov 2025 01:45:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fb9190sm27321151f8f.33.2025.11.24.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:45:50 -0800 (PST)
Date: Mon, 24 Nov 2025 12:45:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: david laight <david.laight@runbox.com>
Cc: Navaneeth K <knavaneeth786@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with
 offsetof
Message-ID: <aSQpSiazYpEquYS6@stanley.mountain>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
 <20251122174555.215109-3-knavaneeth786@gmail.com>
 <aSQSg91zk2zCQ8xE@stanley.mountain>
 <20251124091754.7147dc66@pumpkin>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124091754.7147dc66@pumpkin>

On Mon, Nov 24, 2025 at 09:17:54AM +0000, david laight wrote:
> On Mon, 24 Nov 2025 11:08:35 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Sat, Nov 22, 2025 at 05:45:52PM +0000, Navaneeth K wrote:
> > > Replace usage of the custom FIELD_OFFSET macro with the standard
> > > offsetof() macro in drv_types.h. This improves code readability and
> > > standardization.
> > > 
> > > Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> > > ---
> > >  drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> > > index dd9018aa4ee5..47cabf8707f6 100644
> > > --- a/drivers/staging/rtl8723bs/include/drv_types.h
> > > +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> > > @@ -173,9 +173,9 @@ struct registry_priv {
> > >  
> > >  
> > >  /* For registry parameters */
> > > -#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
> > > +#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))  
> > 
> > These casts to u32 are bogus garbage.  Delete them.
> 
> Dunno - they might be needed (or have been needed) to stop min()
> complaining about type mismatch.
> They can also stop expressions being evaluated as 64bit (on 64bit)
> which may reduce code size.
> But that is a bit subtle...

Actually the macros are unused.  Just delete them entirely.

regards,
dan carpenter

