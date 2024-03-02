Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20E13AC3
	for <linux-staging@lists.linux.dev>; Sat,  2 Mar 2024 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709371848; cv=none; b=kXIIW8BdCC6F2AWutvTvVpCUsoTp0btb//iARhCJOMMQ4WSqDQ/HrFBOiVd65Y1m8fVCMoVSbX3+X1thf/Dtsqu1woq2IEQfIj8FprZqcUSQeZDM2XyNoCRenNb585pt9sdRs3lO5h8qmFjn4FnC2rZCwvbYDugHJPLSys46vkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709371848; c=relaxed/simple;
	bh=eCgnW8M/j8u34ZboqlKqp7zGcLxGZiu6FsXWMaJggYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJlGSnAvtnMGmvDgBpEVzZpu/Zjb/SJT5Ljbp00DGMOdj1rPfPipmVPIibaORk0QQit5urP27duXRJvlByXkdZ/JV3pMsHiKVFUL1nhGC+VUmVCxpW+fKiP0Ja3hV0iDOO62qhVoTsulg+eCyzCjNfTWRg4isgH7rEhhI/pf+Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uiTt1gop; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uiTt1gop"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d2b354c72so2063363f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 02 Mar 2024 01:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709371845; x=1709976645; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiIgfGNGkcSh1CwXpg72grT/j2Z4zd63NwGcxMrVBgY=;
        b=uiTt1goppv+aEBZ/qgj4+b8QzseFE/T18J7ezaO/ZCNlUQSbd/FgWljzPgzeeVFxIf
         WLtddx9P0AYrgCt6603KCKifJStp1LI168+Ahj4zAF7rP1ezbbKeI9c36g9EUNt/suOR
         CvOYDk2cvvz4pxWs3HHtEgAniYixXGKgrzq3IhhorYSb243HH6ICAktcqLCmo6FmLYfj
         iZ9vbYs48VeQkAwkQIGiQykTZqZ55WJtZk/uMHJh8JOpbqST+Gln5VDw3wWtf1kMIaE/
         cLRCbcnEwsZLpR5L++EnkW9w+VxzUbuhkl8HQbkhVw0O09o1APPEzg3qkOZVeLuUzNVG
         N6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709371845; x=1709976645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiIgfGNGkcSh1CwXpg72grT/j2Z4zd63NwGcxMrVBgY=;
        b=iqxxROsVSE2HmNwdB0qpir2K6bHwZdReY41UJAlluIdKO/vJBfA5Rb9IIJ8bxIj4jh
         kMk4/je8beSdskFfa3xC0ENzF7OwP/YxaO/jheu/IExRfLO7c82K1LgJAQiR/jQOsn/M
         DQ87jjhtPzv0lRp3fYD0+KDlToixxMvqUnAzNeYQuIK5BO4d9pobt9UhgdjTz4Ox8jJg
         2R7eEoHn3YcavvT5r/vMC12uXYT9VlgQIALZeHvrzFQhWMKplwDtWxEcl3KfVgvYN7B6
         24T6ec27wM/rRa4QJpaCOM53k2XfeI10ArJFk/BgSYySsm/66I3WmhHmlAmj0Rsxa9cp
         uRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKTJ/32eVqVEHANwh6MRZbblyLmOUND8u+boqUTi1laCMcHuoAUuYCxPwDXaSEBSyxlSTUNPDx78yVpWygxB54y6hFSUYu5Tx/hyVcyw==
X-Gm-Message-State: AOJu0YwE3VgbMO0ZWbCyw/6RORdfkPrYcD274mFqCXfjDE5lVUtEICK6
	UnhUgd8DDdUzBhP98jYYH7NhCZj26QoacPsnrAu5BXOioMVEUcznASG2CWxEGrI=
X-Google-Smtp-Source: AGHT+IFXnqTy0LUAEYOwQYMJaDu0a5N2FH3MFiuF8hU4HaaEjIayxdAj9Dv0vCC/pvvTbMPTpzxg5A==
X-Received: by 2002:a5d:4d45:0:b0:33a:ff66:fecc with SMTP id a5-20020a5d4d45000000b0033aff66feccmr3044907wru.26.1709371844864;
        Sat, 02 Mar 2024 01:30:44 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm6832874wrt.107.2024.03.02.01.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 01:30:44 -0800 (PST)
Date: Sat, 2 Mar 2024 12:30:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: media: tegra-video: Use common error handling
 code in tegra_vi_graph_parse_one()
Message-ID: <9f1b617f-06cb-4b22-a050-325424720c57@moroto.mountain>
References: <dbebaea7-289c-47d9-ba06-cd58a10ea662@web.de>
 <20240301183936.505fcc72@booty>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301183936.505fcc72@booty>

On Fri, Mar 01, 2024 at 06:39:36PM +0100, Luca Ceresoli wrote:
> Hello Markus,
> 
> On Thu, 29 Feb 2024 19:55:46 +0100
> Markus Elfring <Markus.Elfring@web.de> wrote:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Thu, 29 Feb 2024 19:44:36 +0100
> > 
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function implementation.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

These patches make the code worse.  If we're in the middle of a loop,
then we should clean up the partial loop before doing the goto.
Otherwise it creates a mess when we add a new allocation function after
the end of the loop.

Someone is going to add a _scoped() loop which uses cleanup.h magic to
call _put automatically.  This is a good option.

regards,
dan carpenter

