Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41ED175BF
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710318974; cv=none; b=EMUuLoAhd/b9NiiZ4+4Utr029SvFcfexX1+PXn42WZbgJ0Lv15giM6sKZZkYUjtHI+b9KwZi8Ka3uSl/wAzhvMfKR0ol8X2zKb63Jc/eHiody237SflxRS7QVJR8KLmyGfqwygozqirt/51WYKD5JRaZCKQcoXeLOUvWxPjE0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710318974; c=relaxed/simple;
	bh=ZKFTwo1Q9pWn1usBlfixETaA1dMjEZjsNIV8Y37bvfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6vVR4KMLhbrWkmeeQoSk+gVf5nRUu8ulnsPcQ7I8nmKPboP0F3ahnUtPL7QUI7MiriPc3qgm0LolDdvB7ZbDedSaoC3FJsJJb42pKTbmRZ/P2Fm1CcMHiE+Ks8mWRvjU9hwzXuV+WUYxCI2e22VmkR0AWsPQsoEU6iyrm6xXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec8aS/jZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec8aS/jZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso6731528a12.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710318971; x=1710923771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q56Iw2eMUPFwWk7xMQEduN6A9eWGEu2bI8Z2BeWf0vw=;
        b=ec8aS/jZAI/urk/Rr10WDcTKRueVu8VCRtpkPMBfLlBOfIIfX+EOUz+EtRP/ZxcVDC
         Ntm2GXIeMTk7cc0i4fQNn+Z8E7KaquQoMnrQwHpDsw9V/pkDTYqLVe/A5Z8vnvfY9Ffc
         GzI/y79lkfyqhs8EXUiN2lnv79bKWgwUt/QR/MT0XiMui0xe4EjU6S3fOG0gbF+XZD6Z
         lDK7yL4TkerhaQy0pjGHyWUYgHyIkZKC28itbDZzIQRA4JlA36FjduAXjjYJ3lVR7gsV
         wwWs1gvDVHMLs/9zyH3n/ZC8NmerCx0L/oO1nmQHaBbDVapyui285bbWqu1UG5BvyFWl
         IUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710318971; x=1710923771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q56Iw2eMUPFwWk7xMQEduN6A9eWGEu2bI8Z2BeWf0vw=;
        b=sphHHfNx+DGFAJrDTUY0HepDPTg/YEbTBJOF++YX8Sbp4Ej2lzQMmbWnDEpG3G3Dou
         41QLdzALuKcbb2wLIApdRk7Vi2saisuFf5wrEPXWsDHlRolIIe2SrqbaWPsklj4ufp3E
         5EV3H6fJTluKuwEHBgWQxJ/q44Lm8j8Ml+Ru/cIVvPsZOIDPQhni4Ko3nu1K8fc0Z/cv
         +gyXsOPO393MF3ac2wEHZJJLmDEDgKVs0UVrvFM6xPAVb0q+UpBG2MxlkGBeBlJsDSvE
         xZhiHNfxh/5nzQnKxoRTe4miaIcBk4LbTO489Imqbmh5la551e+uS0DYwb+E3ipFiW44
         GWsg==
X-Forwarded-Encrypted: i=1; AJvYcCUUvawLLrLkm9lQb6Tc1+QrLnULdxX1mJOxYJfujhvOYlWE5066+iGxIsU1cG96+27Vz+zXHC/eFrVBRJYkfUTrSGH8dGkFrRlS/XzWFQ==
X-Gm-Message-State: AOJu0YzQK008l8ohwZKIjRELi29fsr1D9Zz16fMPA/OP/vMIMbE06vBD
	12iRVyAk+03+1M5WvAJX5xXnxWGSFa8ALhMyoAyI++ETiD2YHo46hIGdb0MZj+yXYAvhIU8kA2L
	X
X-Google-Smtp-Source: AGHT+IEWn6PnNJ4T6kFZ+BtXapbyNPTHkaA6jOJ7GecTTFtWOnLDtr8Pz7YoarT+gwdewJTDsNurCw==
X-Received: by 2002:a50:d498:0:b0:568:797a:f2d with SMTP id s24-20020a50d498000000b00568797a0f2dmr1701644edi.27.1710318970930;
        Wed, 13 Mar 2024 01:36:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cq15-20020a056402220f00b0056761c83bdesm4774222edb.93.2024.03.13.01.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:36:10 -0700 (PDT)
Date: Wed, 13 Mar 2024 11:36:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Ayush Tiwari <ayushtiw0110@gmail.com>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: rtl8712: rename tmpVal to pct_val
Message-ID: <f4b889c8-9816-47e9-88e1-2acc9c169b8a@moroto.mountain>
References: <ZfFfW/Flrlzb0+UI@ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx>
 <2c63a094-6966-7679-2b23-58c057b451d8@inria.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c63a094-6966-7679-2b23-58c057b451d8@inria.fr>

On Wed, Mar 13, 2024 at 09:18:08AM +0100, Julia Lawall wrote:
> 
> 
> On Wed, 13 Mar 2024, Ayush Tiwari wrote:
> 
> > Rename local variable tmpVal to pct_val in function process_link_qual
> > to give intuitive meaning to variable and match the common kernel
> > coding style.
> 
> I don't think that the patch with the name avg_val was accepted, so this
> patch has to replace tmpVal by pct_val, as you say in the subject line.
> 
> Also, the comment says:
> 
> /* <1> Showed on UI for user, in percentage. */
> 
> I still have the impression that the value calculated here is an average.
> Total num is just incremented:
> 
> if (sqd->total_num++ >= PHY_LINKQUALITY_SLID_WIN_MAX)
> 
> while total_val is updated with a new value.

Oh, yeah.  My bad.  I misunderstood the comment.  The original value is
in percent.  prframe->u.hdr.attrib.signal_qual.  It's set in
query_rx_phy_status().

Sorry about that.

regards,
dan carpenter

