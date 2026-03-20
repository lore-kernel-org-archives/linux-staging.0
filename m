Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDA386572
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999453; cv=none; b=KUChQeFtPLNlSUo44/wky9IAxzMlM5LfxqUB2kHK73EH7bZOAXGSM/8Byp9e9Jik7rnxu/Oq0hZOHlr0scJLXuVlRuxmcowwwzmcrjcfuJMAp1X5IVZn/BzT67BfYunx6xHPZjpumi8eNqcQ4o8I0Qgswy028bBJF2z5IDFaspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999453; c=relaxed/simple;
	bh=/RroFt/aDThaig1a7ciA5DMyFlmPG1G0vZnwb7/wNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DO0QcQfCxdUCZ6bwHrpE03zUCt24/cdXeFAJLCcKwLzHzlkAFEap+RGsgrpjqG53+NfMpiwnQ1Csm/0whxhlG+6SJs6iTuXxSkl72CMt6t5ROXgQ5oOBot7ACTsPdMg7/gMQ0m84sfbkGJjsQhtytO6eMYZXwuuK1Cs1vF1SpMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCqv2kdY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCqv2kdY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b4915161fso401305f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773999448; x=1774604248; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eD4dBMvjtmZ/uGxmRy1So/8YVPy0MK5aKa2M09OXdww=;
        b=GCqv2kdYLia/vZV05dDUxOY4RSrZNFq5pcV5yO4sPk6mB8dkQ27OynBwTAh8D7sqGP
         NSynzDLr4EjdTPLHvZVnl4SBmAz4Zggcq1f4ijFNiuZVRHL8jdrW/z14HlQtWUjCjmze
         qvulv5TaAlofEgaEutCkNu8b+JMuQIiPNcsmUhtn3KoAAsV2/+8jhGe2uef5jEaxhkOy
         E9TKoFb78jfX3fKc6gntpdy9xunTYQrdyJhnC0tZ1289SM+H43odLFhFE9V2r3M/jv03
         yd9SvuND32XUIDjTfDQpIs2v2K2flLup7i3KcXCmPBkP9WQmNQgHi80HaGqGGB0XLBOD
         oOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999448; x=1774604248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eD4dBMvjtmZ/uGxmRy1So/8YVPy0MK5aKa2M09OXdww=;
        b=jpbp41/BxDaz6Ib+wQ0sPj4p73kA4p4cH4snpFnSwZKKOxuexpA1o1SWb38HNCsKYP
         7dKlubH61UQSuAlEgvz68Rdgvg2Lv5T5BR6/TFCg8ckhjWSQdZJIE3H2iJO3PUVLV7vD
         Nm4TtqkCYg8rn/XR2SSIjh3lEPtJuBkHlzYmCnoEX95kilxKqJw4MMxjAuwgtbT4mJPY
         QgM3mgPHEaZ3vi1qeXf5X5nUfTT6xtbQi7TQD2auHxg5RYgBsesE4RuXmYfSGEN2sTYk
         2v+WqnCO5mTDJU2tsW2B71F4+72BXvU4Vu0JgCanIc0n8A1jK9cS/1yD+P6WVY2Nr24R
         St1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5mWiMn5eB7sr7bzYkSvIVE63xmq21u0x0G/cNeFxwC8iCFJuLLa5TstENy08CMhWpiNCV2vwtu4uizqm3@lists.linux.dev
X-Gm-Message-State: AOJu0YxyK1T/4XpSeE02L/oNaZjDYMBf1ib21pQNPvwE6IBx3OgpaWC6
	cLrFKNyWbGqI3mCVqtBgUBQ7plNLXfoInScBh3TJLrp3AvICDiVl4hrhutOJp/PPQtKI3rtqOvV
	gj+lL
X-Gm-Gg: ATEYQzzaI/zmFSMXGHlM/aRybtI2eVHI7m0eHYyu8MJXDHMao/s1a55GgDoW/TxT4/2
	sCf0pIib5q4L5P26Cs/rtxG4/k1+J2E217tSd4KN0pKl6RQ8Tvbe41cuRRmRJz0Ak/t7o/Kk7A8
	XvyWRo9ImkKew75+RCCn/Xt1bJNDQzJzARbVvEYzOgFAsimbe0IqPGpcthkUf4ZdL09EI68lG0t
	PwuU3jLqontwQVwDogNo/nbgvOwFOZ6eXNM+X3tS8upbcGgdzxTnVItORbnXoPv0H8HhDOYgptC
	jANQHA+I7aeUhBDqB5dItOsPJw7pkdjTps30SuqD5J1p1acIylIl7ibGSaNshM7sNjFRS4mEGJE
	1+XrffHppFt/0APWwcmj9a29SrNjKyxP0BapICSPB9gWNjsgTd2AzYyfw2v5G05JLJVSSPALVp/
	l90o+8XCwP7/dwC7wOV9w0VIZ+JdCo
X-Received: by 2002:a05:600c:17d8:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-486ff0291d7mr19670865e9.19.1773999447715;
        Fri, 20 Mar 2026 02:37:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm5267437f8f.1.2026.03.20.02.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:37:27 -0700 (PDT)
Date: Fri, 20 Mar 2026 12:37:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: remove print_time() dead code
Message-ID: <ab0VVFimveEhibR6@stanley.mountain>
References: <20260320-av7110-remove-print-time-v1-1-05402287078a.ref@yahoo.pl>
 <20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-av7110-remove-print-time-v1-1-05402287078a@yahoo.pl>

On Fri, Mar 20, 2026 at 09:46:15AM +0100, Tomasz Unger wrote:
> The DEBUG_TIMING macro is commented out and can never be defined,
> making the print_time() function body always empty. Remove the
> commented-out macro, the unused function definition and all its
> call sites as they serve no purpose.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Checked with scripts/checkpatch.pl - no errors, no warnings.
> Compiled and verified by loading the module in QEMU.
> ---
>  drivers/staging/media/av7110/av7110.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index 607992100baf..9f4ed1e24b17 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -314,17 +314,6 @@ static int DvbDmxFilterCallback(u8 *buffer1, size_t buffer1_len,
>  	}
>  }
>  
> -//#define DEBUG_TIMING
> -static inline void print_time(char *s)
> -{
> -#ifdef DEBUG_TIMING
> -	struct timespec64 ts;
> -
> -	ktime_get_real_ts64(&ts);
> -	pr_info("%s(): %ptSp\n", s, &ts);
> -#endif
> -}
> -
>  #define DEBI_READ 0
>  #define DEBI_WRITE 1
>  static inline void start_debi_dma(struct av7110 *av7110, int dir,
> @@ -353,7 +342,6 @@ static void debiirq(struct tasklet_struct *t)
>  	int handle = (type >> 8) & 0x1f;
>  	unsigned int xfer = 0;
>  
> -	print_time("debi");
>  	dprintk(4, "type 0x%04x\n", type);
>  
>  	if (type == -1) {
> @@ -473,7 +461,6 @@ static void gpioirq(struct tasklet_struct *t)
>  	txbuf = irdebi(av7110, DEBINOSWAP, TX_BUFF, 0, 2);
>  	len = (av7110->debilen + 3) & ~3;
>  
> -	print_time("gpio");
>  	dprintk(8, "GPIO0 irq 0x%04x %d\n", av7110->debitype, av7110->debilen);
>  
>  	switch (av7110->debitype & 0xff) {
> @@ -2785,7 +2772,6 @@ static void av7110_irq(struct saa7146_dev *dev, u32 *isr)
>  {
>  	struct av7110 *av7110 = dev->ext_priv;
>  
> -	//print_time("av7110_irq");
>  
>  	/* Note: Don't try to handle the DEBI error irq (MASK_18), in

Delete the extra blank line as well.

regards,
dan carpenter

