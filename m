Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C081BDEA;
	Fri, 13 Oct 2023 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/YYM6mW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40651a72807so23049495e9.1;
        Fri, 13 Oct 2023 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697212045; x=1697816845; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2myRePQeeuTuk2eA5QtfCramI6KhbCaOjS+i8SpwN1M=;
        b=L/YYM6mWgLHlGMgf80p9Ft1Z3ja0E+F/hcpFa2+RtNw1wwTEzveeZuZ3MyudAGlcEP
         NBN8Nl/kaPA+5/LmGWPk/x0799DmjbmELbV/GYI5D7IF2BH+4f4mTzJZr2PXw4Z4PlC+
         ZvcB5sne/1qmsOyh0VUpv76qGn9eYp4y386MRiLMfYNQbAvoQrVNKLYydXu+NlLIptbm
         tdPjzSiAqIJuwJHs4BxsDifvwrlEtHjee6P4bDAni1gYyFngVNRqxLJPF2DHlYSEPqjo
         XbKgkMf+Sg3BbjMaBSFVAoS6Bi4thV9D0SYzdQj6RI6poCPng81yMUTH4q3gpHLcN85N
         eUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697212045; x=1697816845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2myRePQeeuTuk2eA5QtfCramI6KhbCaOjS+i8SpwN1M=;
        b=gSaROPBHODXI3VQl3jaJodeIHmOtdPe7pEd+qYu64qzF2r9JUtuaGEVJwvjWG6bGO2
         606NePYYPk+te221ic7lzgVigipQuAjDAqyopgawBgi3/nvV3sS2qxPlCnBSs/cFYm4t
         EWzqfswgfayN8dPcEG8a20ghx+Lvxj96WY505z0N143wRvw+zysbcU+7YOcpo9yNBOwF
         l22giaBZ0ziW87pDWuJvrXa2fasBMvnSrgex9n/ODM0jkU5YtWr14GFMdT5bjEes4P+6
         frNivQQjorM6yLVByawrNrN5xk3IWO943PfadkwLlOIVNnGIIaVWddIe0PZgUjel8vMr
         Cmrw==
X-Gm-Message-State: AOJu0YxT5NkJXuuMgstvGtFpF4CjYXs3tgfc1CgkrTh3SQaJiGPX41P4
	66oTvfznrTJqGfW7DHbbGA==
X-Google-Smtp-Source: AGHT+IHVPlrWh5nASz+RRHnYgLg3aaWH5K6BC+qkxPvceyjzWEkFtppG7oj2xgn8qnh4ZqjuEZcrHQ==
X-Received: by 2002:a05:600c:230d:b0:401:dc7c:2494 with SMTP id 13-20020a05600c230d00b00401dc7c2494mr25645224wmo.27.1697212044179;
        Fri, 13 Oct 2023 08:47:24 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine ([105.163.2.146])
        by smtp.gmail.com with ESMTPSA id t16-20020a05600c199000b00403b63e87f2sm469748wmq.32.2023.10.13.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:47:23 -0700 (PDT)
Date: Fri, 13 Oct 2023 14:33:00 +0300
From: Dorcas Litunya <anonolitunya@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH]Staging: sm750fb:Add snakecase naming style
Message-ID: <ZSkq7E+Tp1X/qiER@dorcaslitunya-virtual-machine>
References: <20231013104220.7527-1-anonolitunya@gmail.com>
 <efcb4734-0349-493e-be93-b95381eb6c78@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efcb4734-0349-493e-be93-b95381eb6c78@kadam.mountain>

On Fri, Oct 13, 2023 at 01:48:08PM +0300, Dan Carpenter wrote:
> On Fri, Oct 13, 2023 at 01:42:15PM +0300, Dorcas AnonoLitunya wrote:
> > From: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > 
> > Change camelCase variables in file to snake_case for consistent naming
> > practices. Issue found by checkpatch.
> > 
> > Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > ---
> >  drivers/staging/sm750fb/ddk750_mode.c | 86 +++++++++++++--------------
> >  drivers/staging/sm750fb/ddk750_mode.h |  2 +-
> >  drivers/staging/sm750fb/sm750_hw.c    |  2 +-
> >  3 files changed, 45 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > index e00a6cb31947..f08dcab29172 100644
> > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > @@ -14,13 +14,13 @@
> >   * in bit 29:27 of Display Control register.
> >   */
> >  static unsigned long
> > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > -			     unsigned long dispControl)
> > +display_control_adjust_SM750LE(struct mode_parameter *p_mode_param,
> 
> The p stands for pointer.  We don't like that naming style.  Just call
> it mode_param.
> 
> Thes are the renamed things.
> 
> displayControlAdjust_SM750LE => display_control_adjust_SM750LE
> pModeParam => p_mode_param
> dispControl => disp_control
> programModeRegisters => program_mode_registers
> ddk750_setModeTiming => ddk750_set_mode_timing
> 
> I feel like this would be better broken up probably into one variable
> per patch.  It's jumping around between files.  These variables are not
> closely related.
Thanks for the feedback Dan. I will revise to do one variable per patch.

However,I have an inquiry the main reason its jumping between files is because one of the
functions I am modifying(the ddk_set_mode_timing) is imported and used
in other files. In this case, should I do one patch per variable per
file?

Dorcas

> 
> regards,
> dan carpenter
> 
