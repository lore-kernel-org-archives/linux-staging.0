Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBB51BDEF
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcXm12Hd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40572aeb673so23840465e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697212572; x=1697817372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeV8mwVr2qqt0AVCLeJMQI/U6jyncSF2xLGT0JjXz0w=;
        b=IcXm12HdIk7hx/yupzwd4Xk2xL2FKtANM8ouOC8datqlIo5Q4Cjiu5mCgHQq7H6Zyi
         QLOoSEj362hKenl2lvTRxJQMQrb/bOHP2aG/EYfcl2oABQ/0bKF8oSis1SaoO7SrkMdd
         pU56h8gYzs4TP2qhUo2eWsksG8BQICifqWGcJAg6tgEoqc15w3QNsFQLbkez47SjEJe3
         qh+Je642iNbuNDJsvGXyOr1O5eSQ7PwYt+jYlp2BSz3Sn7N4/WvPpfH+gNlCNDnT64Kt
         3VL5zm7HvwNtL2ZWdvszyDGiX5n9u7IBhZKIM+Cn1HN7fl+ChDtvh60tMK1Z8SpyvcSn
         /kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697212572; x=1697817372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeV8mwVr2qqt0AVCLeJMQI/U6jyncSF2xLGT0JjXz0w=;
        b=AUBXGgjn9lPIctaWie3t/YVQ8D+JipJvxKvwBZaj4h2fIKJ+egSuH3KUDmubfg0Xvq
         CSyydk4cXNpRpsb5HQGzsUZXosnE+uvmZvTvezXXMpzxLJD0l9sHpCFQeG+kV6ETBNGg
         pl6JDXWOVu//chXDJzTMg6Fz3tzR92ii5VNTZgKfA29ziopuBby/yWzoXOB3MvzmEkgU
         XOJJ5MauscblaWsVy6rq7duetRgwcBH8IdgONh41uHn0v5N6o7kHJ5ue2oSE41iD+E/v
         H1euBXgqSpentzFNqNGoTBd/oRrJhVDT2GKbdh0Bix6izVNqSzuGyjJGQOuodeBfiOwE
         YFwg==
X-Gm-Message-State: AOJu0YwN+FgNRcErKsxBWJLOIHaKUR2q1UFhsWBgFzyIQMbWavA2+z47
	VTQUJRABQq3DAVXNH0J9FO/bGQ==
X-Google-Smtp-Source: AGHT+IGxYfzD8CnnGBJcwffwT+sLmo1TXKCJR1s8yImxg5JTv+J2FYJjyguZrzqOBGPE6zRTrmNnoA==
X-Received: by 2002:a1c:6a0c:0:b0:404:757e:c5ba with SMTP id f12-20020a1c6a0c000000b00404757ec5bamr22625270wmc.26.1697212572018;
        Fri, 13 Oct 2023 08:56:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c5-20020a05600c0a4500b003fe1fe56202sm518136wmq.33.2023.10.13.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:56:11 -0700 (PDT)
Date: Fri, 13 Oct 2023 18:56:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorcas Litunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH]Staging: sm750fb:Add snakecase naming style
Message-ID: <780713a6-5f93-4393-a46d-36904e7fbd11@kadam.mountain>
References: <20231013104220.7527-1-anonolitunya@gmail.com>
 <efcb4734-0349-493e-be93-b95381eb6c78@kadam.mountain>
 <ZSkq7E+Tp1X/qiER@dorcaslitunya-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkq7E+Tp1X/qiER@dorcaslitunya-virtual-machine>

On Fri, Oct 13, 2023 at 02:33:00PM +0300, Dorcas Litunya wrote:
> On Fri, Oct 13, 2023 at 01:48:08PM +0300, Dan Carpenter wrote:
> > On Fri, Oct 13, 2023 at 01:42:15PM +0300, Dorcas AnonoLitunya wrote:
> > > From: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > > 
> > > Change camelCase variables in file to snake_case for consistent naming
> > > practices. Issue found by checkpatch.
> > > 
> > > Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
> > > ---
> > >  drivers/staging/sm750fb/ddk750_mode.c | 86 +++++++++++++--------------
> > >  drivers/staging/sm750fb/ddk750_mode.h |  2 +-
> > >  drivers/staging/sm750fb/sm750_hw.c    |  2 +-
> > >  3 files changed, 45 insertions(+), 45 deletions(-)
> > > 
> > > diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> > > index e00a6cb31947..f08dcab29172 100644
> > > --- a/drivers/staging/sm750fb/ddk750_mode.c
> > > +++ b/drivers/staging/sm750fb/ddk750_mode.c
> > > @@ -14,13 +14,13 @@
> > >   * in bit 29:27 of Display Control register.
> > >   */
> > >  static unsigned long
> > > -displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
> > > -			     unsigned long dispControl)
> > > +display_control_adjust_SM750LE(struct mode_parameter *p_mode_param,
> > 
> > The p stands for pointer.  We don't like that naming style.  Just call
> > it mode_param.
> > 
> > Thes are the renamed things.
> > 
> > displayControlAdjust_SM750LE => display_control_adjust_SM750LE
> > pModeParam => p_mode_param
> > dispControl => disp_control
> > programModeRegisters => program_mode_registers
> > ddk750_setModeTiming => ddk750_set_mode_timing
> > 
> > I feel like this would be better broken up probably into one variable
> > per patch.  It's jumping around between files.  These variables are not
> > closely related.
> Thanks for the feedback Dan. I will revise to do one variable per patch.
> 
> However,I have an inquiry the main reason its jumping between files is because one of the
> functions I am modifying(the ddk_set_mode_timing) is imported and used
> in other files. In this case, should I do one patch per variable per
> file?

No that would break the build...

It's just that I felt that in this case it's especially useful to
break it apart because some of them affect multiple files and some of
the variables are local to a given function.  (You should still adjust
the header file to match even though the compiler doesn't care).

regards,
dan carpenter

