Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508878BF9
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 04:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xWIRk/cQ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-325e9cd483eso5027770f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 21:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697516090; x=1698120890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2dZBUmwthCKe42eGQqfFVlklrGhflMnlew3Rp0hoTg=;
        b=xWIRk/cQ+uK8uULeQSEq0tPW7WiErL7onorSYVjrsRG1nG/KoS79CTSFuatF2DLRED
         DKoAKp4tOZFJCBwbzAf/F7IYRl/GgFdRfAc+NcpCBdJIPYlBuMC448+mXxisSvpZ/BPs
         S7HBJl64h69G0xmmQsaMqhheCeYb5qBi5ioYFPdFxVMB9J/2z7wp1Ess0AVwzh6tqMq1
         3tRJXBn+iLgoNptXWK1iYjfYivSbxwKAZfEHLOZIfWpYOwWWM2+SoW3oeXK6dTf5Nz92
         kf9AB/Xoj+BIMZeelVrMXmwCLFVCyi5GbUscUcz0OmNSTHtZzGmAjtszRcDcmveWzo/L
         4exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697516090; x=1698120890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2dZBUmwthCKe42eGQqfFVlklrGhflMnlew3Rp0hoTg=;
        b=e2u4e/vaUrSBqHeya4YBaSEqsGziwEoCRgB9gLQ0hIcA3oRuRC6lVzi/gqMm3+06G9
         MCMLrWxOr7NjA7Gz/bFGxrh1SDMLHy+RLraIotRxg9HWlF5YEO8CTCTgUtHy+FtPCtfS
         QxcOaLyXZNJzm11byNmqQrGinHxtBKQvbgqu9SiBaRk4TLkBKN2PEGLn1WC9is6jLeXC
         Kz8v50Jo1YUJc0Ys4q2KPPc9K/DAKTNc5o2wgjGyN3hBFcnyaqhih9oRVHqqA+pTpQQ+
         WDKEe0X791mzKkhIQuh5V+ZYi3GzVvGRtO4/Jks5Mu6A8iYFydcU2A1erZ6eq6+s//C7
         qKFg==
X-Gm-Message-State: AOJu0YzWe3fp00wVjKNUUrKHVMTFQR+t8waC21kC6ktrcz9Dzbm+AQSi
	BXtMSUiXBO+mdV1AM5WCWJXcIyTFs04jHWw7nDI=
X-Google-Smtp-Source: AGHT+IHL9edRjCBjUElxLPuvZjX09mIVD7SQA1z7VlWAEUiuE41FNpxgzfuMp4mLH2kzKjjH4uH/0Q==
X-Received: by 2002:a5d:6186:0:b0:32d:9d3d:8b98 with SMTP id j6-20020a5d6186000000b0032d9d3d8b98mr1034563wru.71.1697516090540;
        Mon, 16 Oct 2023 21:14:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e13-20020adfef0d000000b0032d9caeab0fsm686370wro.77.2023.10.16.21.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 21:14:50 -0700 (PDT)
Date: Tue, 17 Oct 2023 07:14:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: emxx_udc: Remove unnecessary parentheses around
 condition tests
Message-ID: <8de0c0ea-d81c-402a-a5c4-7779a190c306@kadam.mountain>
References: <ZS0f+xaaLmLpKv2a@gilbert-PC>
 <2023101658-unmoral-survival-25cf@gregkh>
 <ZS2qpwnfCxsbvOld@ashyti-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS2qpwnfCxsbvOld@ashyti-mobl2.lan>

On Mon, Oct 16, 2023 at 11:27:03PM +0200, Andi Shyti wrote:
> > > Fix 47 warnings detected by checkpatch.pl about unnecessary parenthesis
> > > around condition tests.
> > 
> > And as I have stated numerous times in the past, they are not
> > "unnecessary" at all, and provide a valuable hint to the developer as to
> > what is the ordering involved.
> > 
> > So you can ignore this checkpatch warning please, it's not valid as far
> > as I'm concerned for the subsystems that I maintain in the kernel.
> 
> I find this very confusing, though:
> 
>    if (((ep->epnum == 0) || (data & (1 << ep->epnum)) == 0))

Yeah.  Too many parens.  It could hide an == vs = bug.  (That happened
once 10 years ago but I still remember it as if it were a useful and
dangerous anti-pattern to remember instead of a getting hit by a meteor
type thing that will never happen again).

Also == 0 should only be used for the number zero (used as a number and
not as a logical no or absence) and for strcmp() functions.

	if ((ep->epnum == 0) || !(data & (1 << ep->epnum)))

regards,
dan carpenter
