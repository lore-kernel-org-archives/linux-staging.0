Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7742080E6
	for <linux-staging@lists.linux.dev>; Mon,  3 Feb 2025 15:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596962; cv=none; b=ty0qKXF6e48iJX3FzkY1sI9mmu07uvEkagA5AK86x54jB1D8/hqnf5Gz1kr9ahX36h7UbJTW8ylZV30m33MAxlERaEvtLkteEtfpw94OxdJYh0qbab6oDZwGKKYoyjnOXUx99shYQmDLCAYUmuCgwmvTYpBFeAK/u2l7o0Qtik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596962; c=relaxed/simple;
	bh=NbT2jse7OVFtYE1b/6ZwaPDTwl+uyOn9KBHEP6I2QzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZYuV7HcPa1Kcib+6JMAxrBBKZCRjR87M4FOxP5Uj3YcgcT+cis0Hpf3qMAQHaFwwcz71v4JFjBENlkvP7Owp1cgJatMlEdlrBSD378N93VdDUfhPFRnputz77e2t1Vc2tNQGR7SpuDasfvfB7JyezgpA7BuHpTiQQU1CmHOjS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix7uPNj3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix7uPNj3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso31238105e9.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738596958; x=1739201758; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azH/4pudPJJXolsxfYoMtAK2j6+tp+fBiLsk0O5rQeQ=;
        b=Ix7uPNj3mPB8M3FDOPvQu4fn1DToDKhgxDkg1n0tmklkh5pt5pHiZyf04e2d+AOa61
         6i5BFWV1uclF312lXooJF/dgoYD8Jo3StrARzOZL6JtxqA9Id2pdavOrAxNmvMHUbswP
         kAuLhms0m4oxo5JSErtKsSmlPB2b7iOMc0Sef0z8uEo35z0anayfV0Vj4+Y02EYgX9Cv
         wahbDrrZaMcwmUcJUkYeXixqPuLiXZQMYZXpfsW+6aJ+pR+xAH9gVD/zNJz2UyLvr/os
         Aize0JCSCzVASyoQTGUjimEj42Knc9obgSmN9o8SKXlHslFP+MA21djQvKoVcpVAkpt2
         v7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596958; x=1739201758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azH/4pudPJJXolsxfYoMtAK2j6+tp+fBiLsk0O5rQeQ=;
        b=RDsKmwBndC2UXdO70Nvg2FeO7oBWHJpQ+3Y7UoAaUTehKk0d588KXCuLlaZSyxkBnl
         IoF29Wvf2NpeE4MLkijlLvFtYuwVYhRrJZJ5Dugaizx4apwecAhDoIp+necSx3hC37Eo
         qsBaFowCKjMI8jLyNa4XdiYH4QHo0G5IwT03n9UEoPcmYd4CnMn/wO9OIc7AroGBVPun
         hBI3OYzL8Z3WSjUJu02LY5AiGvMDokvz22jg6ltgbeblxB7QGhbNSrRBCA9XgYigFl9b
         rDQEuL3XSWwVdzT+AqgFkFvm/tc4ZLe+b24d64JHSPHUBUFHNmmZKQvq3gqiniayQ0ei
         59tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZt9sjsqQ/ugZaPRiLtXGKCbviHTReLGrmgY4LOfbFjL89ARVjUG9oWO3iNv3hHwr/Z+H23OAHmil1pFKb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/K+0m7+MYZJ0j0zKvFAyAG7lLLv6de+DU/ncIq2I+RRr/Ti7v
	UASwLGBQdRN3w+5zV4HmL4NizNnXpm9bdlLD+ms/jD9Pb+NDoPLM
X-Gm-Gg: ASbGncsmQFgSenHZPJvEq1SgR34nUxCKAFo/cjQgmtEKDvwuzzlqH6qW79rKH+btBLo
	/ZVgqODinxpVpxdwsuU4UHcN3hQ3G0tNUahNpokCD+KuseJ/AxVAbKV/bZBnM4WabkGWypg1ngo
	3j2tFcBNqHSH5UhDUZ7w70icQvkse9Ik6cwk8zGcm1QswTNFzBFGR2xFKwwIH1hdgPsecpUPo6+
	QE0Sm0p/Ius7GN3bBj/MDI66mZv9vdrNDJGI1GoIkytFkFrQLcgcy3TQMSX8WXDUpgcoToZcF4q
	TSmrVnpu
X-Google-Smtp-Source: AGHT+IHXIqNw+N1lB9ZZpb0dsMHwzYhno1UN8hXSkLNTI/vtKpv/45SICNEZcEigBsrTiarPNrxXGg==
X-Received: by 2002:a05:600c:1c29:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-438dc43625bmr201127175e9.31.1738596958366;
        Mon, 03 Feb 2025 07:35:58 -0800 (PST)
Received: from egonzo ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm196512015e9.34.2025.02.03.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:35:57 -0800 (PST)
Date: Mon, 3 Feb 2025 16:35:55 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ian To <onlyian4981@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: format no multiple blank lines
Message-ID: <Z6DiWyufORWca-4T@egonzo>
References: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>
 <2025020335-impromptu-renewable-83e8@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020335-impromptu-renewable-83e8@gregkh>

On Mon, Feb 03, 2025 at 04:09:45PM +0100, Greg KH wrote:
> On Fri, Jan 31, 2025 at 12:22:33AM -0800, Ian To wrote:
> > Avoid adding multiple blank lines. Reported by checkpatch.
> > 
> > Signed-off-by: Ian To <onlyian4981@gmail.com>
> > ---
> >  drivers/staging/gpib/hp_82341/hp_82341.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
> > index 0065ebd9747c..d3cf1f43a1ef 100644
> > --- a/drivers/staging/gpib/hp_82341/hp_82341.h
> > +++ b/drivers/staging/gpib/hp_82341/hp_82341.h
> > @@ -26,7 +26,6 @@ struct hp_82341_priv {
> >  	enum hp_82341_hardware_version hw_version;
> >  };
> >  
> > -
> >  // interface functions
> >  int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
> >  			size_t *bytes_read);
> > -- 
> > 2.45.3
> > 
> > 
> 
> Does not apply cleanly to 6.14-rc1 :(
An earlier patch, commit 8418753187ba ("staging: gpib: Make static, reduce fwd declarations") changed this file. It is at this point checkpatch clean.
cheers,
-dave
