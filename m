Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575D21C9F4
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798974; cv=none; b=nZsGZQAWsyFfx6uLc698TskAWbCV01BbEZ6ctqGChppY2/IwsMiw4eN5oc7vTcaEDY/gr4a4EAcBlhLkmOBjKtDrFxDH6bg9G6x89TxQ7PhUzKMBEIK5uyE5sOY0DXITqwV4Kjh/rmkxrblgxu8bCoTz6+/cDrxRLTpI9Nd2OTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798974; c=relaxed/simple;
	bh=DV51ze5a8SGI4xEy+jPcuI22Gq6NgvotxhOVjBVdx54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQ6SufIKZ6nuU5HKbpNRxwztCf+GJ+yoo/lXeYKKO7NqZU4et15J+j9K2UksfXvcTI8wTJF9GqYoV30JRjoDgPJMVKN4/FZbizmqBqC75pPM7W1n3oCON0m54EbLbpyR8nMwqFKFjBUv9/YlXtZ19Wu3bO+HZWZcEQ5DSw9rE44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjBRTT3i; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjBRTT3i"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so6790958a12.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 05:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739798971; x=1740403771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1kpOeB8ZqWfh1QFPFu7oEB7ZlfZU+voyOTWdaINdTE=;
        b=QjBRTT3iHJW/m3hZLulAx37gAdMCsKO0go+umn7cEEgkbUSKvl2ZUDnf+1/ykIAP14
         khhhQhy2jZZNpPm+I/5y+X3jbwkv/lK0ZwuDXsVWTUf+TDRaDPJRZlIBneX8ImbN6ab6
         kRxEa66b2V2mYeHsLkPwjBjvkZqn1CCdVeaVlDLe5NNXze7ZDsxAO6Y+SnQZl9TsfjiH
         eK3DCA8tE/oanXjUS1JNHbxss2g/um0ZPyclaECUUwQUGBFN65JCs67l9MOwv4V/DIPV
         RY6waxTtQnbn8bMygy65EpUv9HjQyrlY26n+W0CTeZBN0e2HU8crkyysH3PscQP4zCo+
         RO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798971; x=1740403771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1kpOeB8ZqWfh1QFPFu7oEB7ZlfZU+voyOTWdaINdTE=;
        b=OUy3hwu/sMKC03jbAw97oltKCWyFrPno9sF+XBzqT3lz+Q5+13l04zlGFCFCUPKddz
         D+4vGKgumQwDQLgy6uw1DFvTldsYCg4DD2qF/XbQAEiyBjfv7J+6SIazx15rKO9JxJFQ
         OPXdrb9fnY/RZe/q6dhZG46hI/9GKILkFdOyL8UDkYoUiGpOnulCiWy2qsDDKEL91sVw
         Ye49ODVY/mJ1ii0vU03BIYoJlgnxgLGVe55YNhGinmLc5u8V6Glj+iCWo+aiA0malFrd
         MDZHxAHu2sUuOFMTsPtErL0XVNffI+stk1F4FNU3ZwE/uQKiRSV4ALvFXeGbnlRUma4q
         p0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYVHuZHfIJnRxGLErX5VLB6x97Ef/B6mGRGxRoeJvQXUkqYAYbjuhGkN3o8lvgOq4sL+CS6ZNfNSnJuUnv@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6ynzih5mtKogDWlq/gzlk9y7V0xRLU+8JrNxxfdEpDvnabEQO
	zI6KSb0OQRbyWa0cvRsknjmIo2n0uH9vup5sSkhZa2Xem58nS/gn/c2mTPgWIk8=
X-Gm-Gg: ASbGncsSbb/ulkUN2m7OqMErRGj0aj6CevpnWZgnNIO6N/OlbD4nEwmVEZKI6JLWwtC
	9ItzVXheexW57IMcP40g4h6zV8IXnVb8EZ7ePMjkYjb0GfN/IQygvPwgdY2GCztdqoE2EYRnWbb
	47sPceeCQhBZe55P9kZ9Bwd2sVrW0yejBP69lLm4la24NYvBL/j/e0dtLeCl80QkzIXIkltaVJC
	TA3DSCMa/vu6NwB4RDSuLJy3xdgEpmGxyPKQOLXizal5ltn4ddZBmu9mq+jBptdt34I7/n65B3l
	YrpltPhLUKG34+d8AGPC
X-Google-Smtp-Source: AGHT+IH1m1F/eLaa2C6Uii8lE5ZVkES2AbK7ROTYKx22NnRBmgZ53IBnJpCCMDut9Wm8kO5DB2b9Zw==
X-Received: by 2002:a05:6402:3488:b0:5dc:a44f:6ec4 with SMTP id 4fb4d7f45d1cf-5e036092b01mr10193533a12.13.1739798971007;
        Mon, 17 Feb 2025 05:29:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2880fasm7164512a12.78.2025.02.17.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:29:30 -0800 (PST)
Date: Mon, 17 Feb 2025 16:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kuba@kernel.org, rmk+kernel@armlinux.org.uk
Subject: Re: [PATCH 1/2] [PATCH V2 2/4] staging:gpib:agilent_82350b: Removed
 commented out code
Message-ID: <82854a6c-0d99-4e9e-90bb-d2136d1e8790@stanley.mountain>
References: <cover.1739783909.git.kumarkairiravi@gmail.com>
 <01a91fb16e4774be1d89f8e2819b453ea8936fcf.1739783909.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01a91fb16e4774be1d89f8e2819b453ea8936fcf.1739783909.git.kumarkairiravi@gmail.com>

On Mon, Feb 17, 2025 at 03:35:11PM +0530, Ravi Kumar kairi wrote:
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> 
> Removed commented out debugging code to make code look cleaner as
> spcified by TODO
> 
> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 5a74a22015..7936c7285d 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -176,7 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  
>  	event_status = read_and_clear_event_status(board);
>  
> -	//pr_info("ag_ac_wr: event status 0x%x tms state 0x%lx\n", event_status, tms_priv->state);
>  

The rules for splitting patches up are a bit subtle.  Here the rule is
that if you make a change, it can't introduce new style issues.  You've
introduced two blank lines in a row so you must delete one.



>  #ifdef EXPERIMENTAL
>  	pr_info("ag_ac_wr: wait for previous BO to complete if any\n");
> @@ -190,13 +189,11 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  		return retval;
>  #endif
>  
> -	//pr_info("ag_ac_wr: sending first byte\n");
>  	retval = agilent_82350b_write(board, buffer, 1, 0, &num_bytes);
>  	*bytes_written += num_bytes;
>  	if (retval < 0)
>  		return retval;
>  
> -	//pr_info("ag_ac_wr: %ld bytes eoi %d tms state 0x%lx\n",length, send_eoi, tms_priv->state);
>  

Same.

>  	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
>  	for (i = 1; i < fifotransferlength;) {
> @@ -210,8 +207,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  		}
>  		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
>  
> -		//pr_info("ag_ac_wr: send block: %d bytes tms 0x%lx\n", block_size,
> -		// tms_priv->state);
>  

Same.

>  		if (agilent_82350b_fifo_is_halted(a_priv)) {
>  			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
> @@ -226,7 +221,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  						  test_bit(TIMO_NUM, &board->status));
>  		writeb(0, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
>  		num_bytes = block_size - read_transfer_counter(a_priv);
> -		//pr_info("ag_ac_wr: sent  %ld bytes tms 0x%lx\n", num_bytes, tms_priv->state);
>  
>  		*bytes_written += num_bytes;
>  		retval = translate_wait_return_value(board, retval);
> @@ -238,8 +232,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>  		return retval;
>  
>  	if (send_eoi) {
> -		//pr_info("ag_ac_wr: sending last byte with eoi byte no:   %d\n",
> -		// fifotransferlength+1);
>  

Here you should delete the blanke as well.  I don't know if checkpatch
will complain but you can't have a blank line after a { or before a }.

regards,
dan carpenter

