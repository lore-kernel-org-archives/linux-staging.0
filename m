Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04E829429
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 06:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712040600; cv=none; b=ZOY4DBeFm6BUmmj+UNgyV8EzjeI40aRqHvWPjSvFR0SkVoCsREstEAlrKy8Ca8SPp6DtlXcLrtMzDYOna+hOeiO9bWOM0nGiz6gZlJfV5DyxL7Y2WOFey++vhvzvj2u4E9SrZia5xEelKXS0y0gzKNgVnWU1kkcbQnX8Z3vuJhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712040600; c=relaxed/simple;
	bh=eiNouxOE5/rBXeDv+m/p4E72cospl88ziAJcUPNip/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJESbCzRD0iYQADmzmTbE8bFqt6gPjIG+5mQuec3xiLCTH5hnLUQGyqskp54J8oKCEV+iELPA8jPIn50M/FJuiOW2rwPOt+KgLZyQN1tBtVRNmyE5qMQVqAZPAz2oLpH7THjMQdp9GA96X8XZoZ2Y9ggFcuEmjr67ZZuPYmAx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgAW3pDi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgAW3pDi"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c5d05128dso3243958a12.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Apr 2024 23:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712040596; x=1712645396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPqjVRbAXgeGN1lA/Onn5A9KAG7ZFxViPCHqpcaB3vk=;
        b=lgAW3pDiWIJgaOQtS8sxCEeJMmSpRXvjtG8pG6wXbGT3Cd8r2j4b6K0pGSh3HW/Bnq
         XB4wWncaVVjcIegT+gB1jXABAR4oD7+xTd6A2CwNhP+yPBbj9n/8Bw/pXz1SLPQlfNRX
         GQPXw0oFhGNsWXhy7+0j9hTTiOQXVTICXszZS6GTPSwY6iCmaLZhIQQPuQy3A5T5cnVl
         mikKHCyzNf6pBjUmB23ry1QfExM+9Y4vsnH1siT29VrsgKV7kMDJK7Ct+yYY99cHhyL1
         hJ+3w5172QZPXQQqWLFKLuCN65khz5rOv0E20hay2awKnHhCxPuym3+YQKRjq0BELmiM
         pwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712040596; x=1712645396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPqjVRbAXgeGN1lA/Onn5A9KAG7ZFxViPCHqpcaB3vk=;
        b=p84HRXzxAtWVHI7N981h6hy8mjN0W6bRomvEvuPjbytScfGRaYxdi8gFGwmyQ4N4LY
         gllawzb1ifKB8O6TPIE2wmXxrpGT+QYWS93qlD1ERlZ5Hb665If1H2oy01/xBONeU7BZ
         N5Omvsw0TE7KBoyP8yVsju+aYOwAbPqrC53sUJLJoiJlqczBQMvPL1WMkKCdNa4h+QH1
         2EopkJj3eZtVbdHx4wGjs8kZBUNffoJUbLT+GkyxVRGiDIVnHFKV1aQqxUOIxTTRVocS
         EWgBPcI+AG8MIaAP++JlruXW4cdCWLnVBI7cVwpYIVjGQ3hwXyFGI24eASc8wbvZA8AI
         Z2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4RvduaiIo5pOzfD9HBjUZjmUYSCgBUpfbQBqAyRe7/uWFMgP1DVBnpe5k5jrzZ4qgsKUn1knm19kOCgooekm4HMKMc+NIyipNvwXWSw==
X-Gm-Message-State: AOJu0Yx8OzhzEF2xsLC9MS1VCYbOCKL7hPkaFTXlW/ZLUuz0+ZXn+tKn
	zlmzw5DXino4U+m8RxJqD02nBaiXLZ7bZV9OAQPr/DpcBTOM5sgGybfqD7wwIZQ=
X-Google-Smtp-Source: AGHT+IGu1POPDiPVv+vHKQ69u63fSHZ3ugYq99osz195dbi2X3kVADg2wwCDwA62w7Y7hOSFs5PWpg==
X-Received: by 2002:a50:9e87:0:b0:56c:189f:cf2f with SMTP id a7-20020a509e87000000b0056c189fcf2fmr6578870edf.32.1712040595959;
        Mon, 01 Apr 2024 23:49:55 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q14-20020a056402248e00b0056c5515c183sm6052986eda.13.2024.04.01.23.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 23:49:55 -0700 (PDT)
Date: Tue, 2 Apr 2024 09:49:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: TaheraFahimi <fahimitahera@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: gdm724x: Align descendant argument to the open
 parenthesis
Message-ID: <56072f1a-6cca-4c11-9fbd-4081387afdfc@moroto.mountain>
References: <ZgXupx0nXwIOjy7F@tahera-OptiPlex-5000>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgXupx0nXwIOjy7F@tahera-OptiPlex-5000>

On Thu, Mar 28, 2024 at 04:26:47PM -0600, TaheraFahimi wrote:
> Mute the following checkpatch error:
> 	CHECK: Alignment should match open parenthesis

It's not aligned either before or after.  It should have been:

[tab][tab][tab][tab][tab][space][space][space][space][space][space]TTY_DRIVER_...

> 
> Signed-off-by: Tahera Fahimi <fahimitahera@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 15c246d3b1a3..bd80cd48fb44 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -272,8 +272,8 @@ int register_lte_tty_driver(void)
>  	int ret;
>  
>  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> +						TTY_DRIVER_DYNAMIC_DEV);

"TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV" goes together.  Don't
split that up over two lines.  Checkpatch is a tool which is supposed to
help readability.  It's not a ruler which must be obeyed.  If checkpatch
tells you to do something which makes the code less readable then just
ignore it.

regards,
dan carpenter

