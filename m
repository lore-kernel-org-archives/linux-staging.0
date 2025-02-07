Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F51A5B9E
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 21:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963010; cv=none; b=oEKksda1zbr6+0VNFRyvjivgfa1DKEJu773oFs0TyxR8wA6JJ/uESwjEqEolmsnor2FQib3dGccHjJKxVdGy/yTly+IQFJLqTHk5/Y6yfSWa0a8BnJr6QxBw/Gl2lOgtfJFcea953qtkI0ke8RcU7h7DTqore2BWwEtIM8/R6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963010; c=relaxed/simple;
	bh=tSBYpWuHOc+ZSGX7JVf17JwArISvxdwYn5upuBAulJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFSriVVQw4rsXn0L2RqM2aIrt3DGhMoLetKfSdlyO2WSV+5b3CwIOEuGfvDchJKgvRzviV7O87kwajy6E9arWAmRZNY1HMn1SJlg75WtHCZS0DbrCofVCXqgIbZ4RA1okE1u7THuUL9P0gfj1syEWmpemb/T1kDHxdNcmRBC5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0n/rG28; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0n/rG28"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216406238f9so5965925ad.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738963008; x=1739567808; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNwfis5+EODCvIV+QcxMV5yTHpwRgr+/7It6WEYAhfY=;
        b=Z0n/rG28AdxHkGVYQG8Knue8hdUf+YCcLG2FJN4oaVJ89OE3oZsdA0lHMczZ0gO3cc
         E5g8jJ5p9hWdv65JKp+xSo9myyIgLvVhyi2R/njn+m8cky2TxHrVTGm0W4FUyaY4BN5C
         KYzSzwP3NC/FjL2QBDe2Ep+4JM5T+AxFFg5YFPvXgoUeVxje9j3UQGDjQNUTuyL0d60E
         19A5tpbgAauLazkOYXHgCgVpHqrUE7bFQ63w2zQxOLAf+Jg1EEKHSkDFz300t4Y2H7hZ
         +M8h3nO5ZWxKfyPtjM9ij7DZUuIAqDJODNwuiJ+h3kwafuE6sB11oIeTfi5u63YKF6Ae
         YVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963008; x=1739567808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNwfis5+EODCvIV+QcxMV5yTHpwRgr+/7It6WEYAhfY=;
        b=F9YMO79n/hxRKRjfFy2KNw9Pj7QDro8IPPJlPNFwOrwBQHcfAvj/cEliO/nkgSdURo
         S12T3Ojk0Wt3UQCUCzf5h9LDcSbvIBhvizuyeEuEDJ2OWdfpqm+Mom2HRI6a/a9hhV07
         wpC9Re2BGRbWohLZbXg2xwnVCmx4XbCK+0r6RRZyGCYKVVicLfxUQU02P2RdGh3SCtY6
         w4O6r8+2zJ6rklwsrOLRxAfwjsJ9En2lOJHbuF5OJB5UZtcrXJ6SUBOYmbjGdGua43SO
         UGx85C2zsp4HRWRloatl6OfGwFN8evsk5dhYJoVA7tFNUzuPcIOo5UC93JmvprO2OZZw
         u9yw==
X-Gm-Message-State: AOJu0YzZx6e+MsY8KeKxxMLU4t8ViZST/z0mKq+cRSBblg1fScgaqBTC
	2s3OV0J2U/0z6ykJGqPZf/sxLAke8p2q1qhv3vZNaSySEqUFQQ9d
X-Gm-Gg: ASbGncudbXMjj2/NSLZtUIL2dHXmEXE4CgV1uxE22Y+KNLpfoLqrnSKr3oWehPaBOzA
	IvbJWDMO40tbIGOCabYXr2hthysh8Jhb3MujL1t5x5C4onshsd1CRKUl/AaZuzLpj65c/eIJcxR
	1nJYqmEsLhpL4CvuulG6hh656xcxFTk/SVQ1g7LMyY19+A+Wqhvg06Ia5sPXSkvK5IKgf/i0qBA
	CybmZrU5ogA27AMD9YxfwSkJtqm3QUIOgjifRnx2TkspdeTGEjjs5oSr4XChd6RY5TLaHYwLBCR
	dQgRWY95fYskvMTxVVZlluu5BdzMNvvenLgdh6k4lw+BJA==
X-Google-Smtp-Source: AGHT+IG7vESP8azt9GczTBfxOLdpqjvfcrPZObAFWKe0qqiWdhbID8gN78EyRVnqqitLdetTcTT9Sg==
X-Received: by 2002:a17:903:2987:b0:215:94ef:6071 with SMTP id d9443c01a7336-21f4e7cbb57mr27027495ad.14.1738963008175;
        Fri, 07 Feb 2025 13:16:48 -0800 (PST)
Received: from debian-BULLSEYE-live-builder-AMD64 ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm35410395ad.54.2025.02.07.13.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:16:47 -0800 (PST)
Date: Fri, 7 Feb 2025 18:16:25 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: linux-staging@lists.linux.dev, dpenkler@gmail.com, 
	gregkh@linuxfoundation.org, arnd@arndb.de, dan.carpenter@oracle.com, ajithpv.linux@gmail.com, 
	roheetchavan@gmail.com, niharchaithanya@gmail.com, eleanor15x@gmail.com, 
	everestkc@everestkc.com.np, skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: gpib: tnt4882: remove unused variable
Message-ID: <ftwx3ukfpkybcbkjqrracieyr4pjh5kytw4yqabitqofmszz3c@264bh5sig2el>
References: <20250207150427.153982-1-gascoar@gmail.com>
 <20250207150427.153982-9-gascoar@gmail.com>
 <3753eb61-e198-4f4c-97d8-4634c1b8165d@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3753eb61-e198-4f4c-97d8-4634c1b8165d@ijzerbout.nl>

On Fri, Feb 07, 2025 at 09:18:45PM +0100, Kees Bakker wrote:
> Op 07-02-2025 om 16:04 schreef Gaston Gonzalez:
> > Remove unused variable 'retval' in function 'tnt4882_update_status'
> > 
> > This change removes the following warning:
> > 
> > warning: variable ‘retval’ set but not used [-Wunused-but-set-variable]
> > 
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >   drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > index 2e1c3cbebaca..a681bf559b46 100644
> > --- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > +++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
> > @@ -704,12 +704,10 @@ static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clea
> >   {
> >   	unsigned long flags;
> >   	u8 line_status;
> > -	unsigned int retval;
> >   	struct tnt4882_priv *priv = board->private_data;
> >   	spin_lock_irqsave(&board->spinlock, flags);
> >   	board->status &= ~clear_mask;
> > -	retval = nec7210_update_status_nolock(board, &priv->nec7210_priv);
> You cannot remove a function call just like that. At least, not without
> describing that
> it is OK to do so.
> >   	/* set / clear SRQ state since it is not cleared by interrupt */
> >   	line_status = tnt_readb(priv, BSR);
> >   	if (line_status & BCSR_SRQ_BIT)
>

You are obviously right on this one too. I'll look into this one more
carefully and I'll send a v2. 

Regards,

Gaston
