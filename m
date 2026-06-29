Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626A3D7D9B
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719076; cv=none; b=ZjveGJmJKM8QfauETmoX6cPU/AslxTDUw4Nd6i4Ud3JUbXFY6W41etscPpgGuG1Vs497KbkYaCCWmBn8hUIPm687uZa/YlqApmubqnieYhW5oLvsrkggUTIBmhb2MOF54jVaymZPBrw1E6kRuEk7dchaJ7w9xUnXrllzSsXvAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719076; c=relaxed/simple;
	bh=C0Dq6IFd8TtJnFLg3Cm0KF4fPoBzrqvPSBWl0Ac4C8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF3ALc/vP0CMI8sWA9Rc+AK6yJoL67RWdgh9EwvGSSLqLwP0kNj2D8ZAcxM0IhkialrNQltb0SSz3vdF2DkpfTF6bpyidGnAk2vbtyXZ2ZFSR3SlmUU7YymEPcyen6ENhGFl5FgmoGAiW3jP0ocj8V5E+vLBqqiEhoiNk2q4TlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EksVMD1g; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EksVMD1g"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-472055b0efaso1135662f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782719066; x=1783323866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPt6S0MLw77Iv8h8HNg6XpOGDbgQ8DL3y3lGIp/XDC0=;
        b=EksVMD1g1Qc0FSO2+K2E+8aa5R4qgjG4KSMhHEK1/zP9GHlAPmYRv55JPv6VyVMZ47
         rClQt/cMpSbhYULUlVc1mlc/Cizw0OTbbgStPydPxry/oQuV7ai9Gf8lJXpVosw0O4YP
         G0Z0SkukB+0K63vfhbRk4UAW0t3C2ezwIzEofuTvSRW/YkyN7NI3qETiiorO2sVqbrt8
         QpaeWRM2WgmwGTyxgEw3peUL//v46EXgd8L34/+oe6wE15+6LfGr3jrhdab//Ubamy9D
         cDcwTUxZhlJSCx2gAkVrhGdGS+GC5k4XnUUkQU8RuVWKL6BGH9ylP02ti4SNTGQFAbqA
         l7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719066; x=1783323866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPt6S0MLw77Iv8h8HNg6XpOGDbgQ8DL3y3lGIp/XDC0=;
        b=sNYitp7AhYR5IYEIDDRR5F6pM/ccdzjIKhnqg21yEGBGGjVyywumVRR6rlHKKQjriQ
         OrbB+fytg45tZbBEO2AyEYZhmyIzjc18FE7Ip5fsaSUXpetJ+aDPyI9L61S7nw4D09t3
         Gz7FVP+ZZ/1BzEzHk0xXFt8ekRPouniYizNjObj5p9+I/PcSpKLPEwwA+ukQaiqf8a5q
         OpffUuMXC/R0Fwa/7Z1G3lWbD+uWKXufAbLt9SsJzmAni7P2/vxPl0WeKBqZTvL7gCOm
         2d+D4jbYW2yyOKHeOC4pB62LeAaHkhg8aVTbJ9xlmAW3Nbjfy65V+/cQ1t4EOeir2ngC
         49ow==
X-Forwarded-Encrypted: i=1; AHgh+RrYyNTyudJDlB8Iwr6cPxRHwgROzHFJNQnhO8ui2GjVOYysRnU1NJC1Mr1GO57Pg6ub3BksL0seAV/V7hfV@lists.linux.dev
X-Gm-Message-State: AOJu0YyYPtGlMocQwL5GSo5K7di1dTr0949gScFzfkJLygTgYN5ig23I
	3mX8LNve/szi7qhF6JGYXFWrwcIrmPDB0QskvFxnL4rw1sLOrL69Vr0S
X-Gm-Gg: AfdE7cmFYyom683nKlkKpDmHRGQONkorInlr5TfJ2q+cn2pTV9ePCN47Upz2c2dy8Kd
	IBY4QNiJhSdVlqxRDzTsxuZF8OfZhxdXlz/VVmlB1d87agL2+zui6UpKxXHmmy46iopswB+fpLh
	0u2vxRY76qcQbQaO6euMBvf2Edx9bkTVfYL3ffQ83L4q9OcgpK57v3gSeFIHQ+9O+/4vhD0kw0E
	KvCdLNiRF+TRHC/dwhsnlmnunkZDwfIGQW7FuxXWh0mGi/8nUZq/KxvT1jH1Op59veANSg1Y7T3
	DLblDuWRVlNVWBmy68kXKLtOZKFk+Ij1MGYGPNjjif800reHyOh5mCnYYj/1N9Vx1GjoPdFHrQ4
	eiKEW290wUfPtuz9EQgO/9o4gSrYHz0gMHVx2rZ9HrYLn7IykfwqoxoWP0b3ke54DSHNxsqTas1
	+5y/Ie4T20bw==
X-Received: by 2002:a5d:64e4:0:b0:474:9002:c708 with SMTP id ffacd0b85a97d-4749002c9d8mr877884f8f.47.1782719066430;
        Mon, 29 Jun 2026 00:44:26 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4730937e18dsm12014724f8f.21.2026.06.29.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:44:25 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:44:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: octeon: handle rx/tx initialization
 failures in probe
Message-ID: <akIiVWOOfjbdM_G-@stanley.mountain>
References: <20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com>
 <20260628-staging-driver-octeon-panic-v1-4-fe8c34989254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-staging-driver-octeon-panic-v1-4-fe8c34989254@gmail.com>

On Sun, Jun 28, 2026 at 12:31:27PM +0530, Prashant Rahul wrote:
> Check return value of rx/tx initialization functions and abort probing
> if either one fails.
> 
> Add error handling labels to deallocate resources before returning the
> error.
> 
> Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
> ---
>  drivers/staging/octeon/ethernet.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
> index 1d3bf3c79598d..41be73b2ded91 100644
> --- a/drivers/staging/octeon/ethernet.c
> +++ b/drivers/staging/octeon/ethernet.c
> @@ -688,6 +688,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  {
>  	int num_interfaces;
>  	int interface;
> +	int ret = 0;
>  	int fau = FAU_NUM_PACKET_BUFFERS_TO_FREE;
>  	int qos;
>  	struct device_node *pip;
> @@ -934,17 +935,50 @@ static int cvm_oct_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	cvm_oct_tx_initialize(pdev);
> -	cvm_oct_rx_initialize(pdev);
> +	ret = cvm_oct_tx_initialize(pdev);
> +	if (ret)
> +		goto err_tx;
> +
> +	ret = cvm_oct_rx_initialize(pdev);
> +	if (ret)
> +		goto err_rx;
>  
>  	/*
>  	 * 150 uS: about 10 1500-byte packets at 1GE.
>  	 */
>  	cvm_oct_tx_poll_interval = 150 * (octeon_get_clock_rate() / 1000000);
>  
>  	schedule_delayed_work(&plat->rx_refill_work, HZ);
>  
>  	return 0;
> +
> +err_rx:
> +	cvm_oct_tx_shutdown();
> +err_tx:
> +	cvmx_ipd_disable();
> +
> +	atomic_inc_return(&cvm_oct_poll_queue_stopping);
> +
> +	cvmx_pko_disable();
> +
> +	/* Free the ethernet devices */
> +	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
> +		cvm_oct_remove_device(port);
> +
> +	cvmx_pko_shutdown();

This is all copied from the shutdown and it looks basically
reasonable to me.  This is staging code so of course it's a
bit wonky.  cvmx_pko_shutdown() has a built in call to
cvmx_pko_disable() so why are we calling that separately?

Also I feel like probe() should fail if alloc_netdev() fails
or register_netdev(), but that's not introduced by this patch
either.  And I have no way to test this.  Even reviewing MIPS
code is a pain in the behind because I don't have the cross
compiler set up.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


