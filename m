Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC647359FB8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207175; cv=none; b=U2qy9SXSHul4Vab4i/8c2tSxsvZiHTd6+aced93rC9niOWMmOgUkNHdEioR3/5Utgti+NaazBWISGKB8r1RNBnL/hptRWn3t3Gn939KGftxYFjfx2XQDLXzYoS7kRubEME9fjv96V3pejCCZnZZmnuq2UN78kbRMx8QuFrREVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207175; c=relaxed/simple;
	bh=KfhZpqOUcAn1A+ANuyN8iMBX1P76bgvRMePpMW7vdBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T475lEMFQlUDrfMEBCR6gHclEzoWPnNY128R8NHxZw3bMa9msHihIkIPwIRFLdXeAtfXstsqVr5Dd2LYvn1biVBapB0coS1UckuWcTpps+dGuxAZvP0NGFnI1IH1CL0VpK6aaxnIXQvnxNpTkR7vUVr6tOdpuwtWBTK9ntY/Dd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O7ituYAU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O7ituYAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA49C4CEF7;
	Wed,  4 Feb 2026 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770207175;
	bh=KfhZpqOUcAn1A+ANuyN8iMBX1P76bgvRMePpMW7vdBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7ituYAUkLXE/04AtfjUZrcMvArgLPd9XLtP9rqhgM67rdq0Wgb9aH9eWEdAmonk7
	 djiJ2X4t1Ye16zwV4mluZrQybokVDvPOGXCpJXMJmOss6stXaPjPeqFx9DMlk/1VHS
	 bZRHy3ecTUhAh4z82wGlBuAPYcxFWkvfnj/cSAYY=
Date: Wed, 4 Feb 2026 13:12:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christine Ramacha <christine.rv4573@gmail.com>
Cc: linux-staging@lists.linux.dev, sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: Re: [PATCH] staging: sm750fb: Clean up variable names
Message-ID: <2026020411-dinner-anteater-80d5@gregkh>
References: <20260204104744.4387-1-christine.rv4573@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204104744.4387-1-christine.rv4573@gmail.com>

On Wed, Feb 04, 2026 at 10:46:02AM +0000, Christine Ramacha wrote:
> Variables in sm750_accel.c follow a mix of camelCase convention
> and hungarian shorthands. Rename it to adhere to kernel's snake_case
> naming convention and improve readability.
> 
> Signed-off-by: Christine Ramacha <christine.rv4573@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_accel.c | 116 +++++++++++++-------------
>  1 file changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
> index 046b9282b24a..1ce358c494e8 100644
> --- a/drivers/staging/sm750fb/sm750_accel.c
> +++ b/drivers/staging/sm750fb/sm750_accel.c
> @@ -27,7 +27,7 @@ static inline u32 read_dpr(struct lynx_accel *accel, int offset)
>  	return readl(accel->dpr_base + offset);
>  }
>  
> -static inline void write_dpPort(struct lynx_accel *accel, u32 data)
> +static inline void write_dp_port(struct lynx_accel *accel, u32 data)
>  {
>  	writel(data, accel->dp_port_base);
>  }
> @@ -132,12 +132,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
>  /**
>   * sm750_hw_copyarea
>   * @accel: Acceleration device data
> - * @sBase: Address of source: offset in frame buffer
> - * @sPitch: Pitch value of source surface in BYTE
> + * @s_base: Address of source: offset in frame buffer
> + * @s_pitch: Pitch value of source surface in BYTE

Shouldn't these be source_base and source_pitch?

>   * @sx: Starting x coordinate of source surface
>   * @sy: Starting y coordinate of source surface
> - * @dBase: Address of destination: offset in frame buffer
> - * @dPitch: Pitch value of destination surface in BYTE
> + * @d_base: Address of destination: offset in frame buffer
> + * @d_pitch: Pitch value of destination surface in BYTE

Same here, dest_base and dest_pitch?

thanks,

greg k-h
