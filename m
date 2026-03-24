Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02941332628;
	Tue, 24 Mar 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338345; cv=none; b=degw4BYFU0woaVfb9lyq01E+Cz1s3xOXECmkCCDVXiRRwIKFHRHC8bAUeuKZeIk6IEdJ3MRT3nFp79u0WAmeIpPGk1YD8BOJ3B+TwT6qfCz+bWQ9fnKqLc39qKtBBb0q0mOvrAmZZSAkGszRDrgLFEGs0Y3Y3i+y03OinswFv64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338345; c=relaxed/simple;
	bh=by9GVycVJdtLPs5Z1KLxxcZMnxEN8r3zSjfsmGlPqJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIeGVa0mLlCbFgrYhEtCrzQ2cXStHl7PSvBrtTMRGYCi9rhvD8qz5JCl2CyazxWWT3OR76lsA1Qa8tIRah2Cuoqyfu5P5PCVG09NJIhb5rEw+2kw94iCxPaSqRzCvME56rIGZ3UBakRmMsMl1MErgTtpNMNWYMmMp41MbPqSl7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0szbZVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0szbZVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA4DC19424;
	Tue, 24 Mar 2026 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338344;
	bh=by9GVycVJdtLPs5Z1KLxxcZMnxEN8r3zSjfsmGlPqJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0szbZVaZ480Q96hc7eHrQiEvFcO5eGMqVnNPax6/+8UENpT2clQrK+wgIf/saDmn
	 NmUQBJDDDhHBxeT8GVwpl/hfwzOSUsbAhqfwb8EqT4GaupmIGfSCX2dg7IOGHsiJUg
	 AL/EZ22FjxvcBZ9osQmBrZiL2OcCv/vJshHmMxAoIaS8roKnNI/eWi5b2hklM7miQP
	 N1RX/jVHXGfPYTzore7Y5WrI5K1SdAGF5UNIQ/4WFQ1osY0QtP/9vPVeDCagFGLMnc
	 9t0f8XzwfvTM9zCSh7JVVu8CIUjAW/2yaIoNg3T9aOD2dTlUk4dkFPiRZEzeQ4epdu
	 rUh9CUbg4yiGA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4wSL-00000003iBN-3mgd;
	Tue, 24 Mar 2026 08:45:41 +0100
Date: Tue, 24 Mar 2026 08:45:41 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Cc: Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] greybus: raw: fix use-after-free on cdev close
Message-ID: <acJBJVB9ZfGrmPrg@hovoldconsulting.com>
References: <20260324022510.28596-1-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324022510.28596-1-damien.riegel@silabs.com>

On Mon, Mar 23, 2026 at 10:25:09PM -0400, Damien Riégel wrote:
> This addresses a use-after-free bug when a raw bundle is disconnected
> but its chardev is still opened by an application. When the application
> releases the cdev, it causes the following panic when init on free is
> enabled (CONFIG_INIT_ON_FREE_DEFAULT_ON=y):

> Fixes: e806c7fb8e9b ("greybus: raw: add raw greybus kernel driver")
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
> ---
> Changes in v3:
>   - move assignment of raw->dev.parent
>   - add Reviewed-By: Johan Hovold
> 
> Changes in v2:
>   - trim down trace in commit message to keep only the essential part
>   - rework error paths in probe function to ensure device is always freed
>     (set device release callback before any call to put_device)
>   - move ida_free to release callback

Thanks for the update all looks good now, except one thing.

I noticed now that you did not base this on 7.0-rc so it will need
another respin due to a treewide allocation change in 7.0-rc1.

> @@ -164,15 +172,30 @@ static int gb_raw_probe(struct gb_bundle *bundle,
>  	if (cport_desc->protocol_id != GREYBUS_PROTOCOL_RAW)
>  		return -ENODEV;
>  
> +	minor = ida_alloc(&minors, GFP_KERNEL);
> +	if (minor < 0)
> +		return minor;
> +
>  	raw = kzalloc(sizeof(*raw), GFP_KERNEL);

This line is now 

	 raw = kzalloc_obj(*raw);

in mainline so the patch would not apply cleanly.

Could you rebase these on rc4 (which is the current staging base)?

Johan
