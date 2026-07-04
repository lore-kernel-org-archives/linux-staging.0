Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369038E8DA;
	Sat,  4 Jul 2026 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150574; cv=none; b=dA1lwJtzK4jdr9kJujbB67sdpmJtYFg2bfVnjjZfq/FLpXxeYiDh268FHKbMOFplXeGEwQtfoLBAQtshK9m8oSmNihWEouv70uKdgcVph3qR1rFM6sQYE+gjQssbLP7RkB0+wCtrzNYnCBrlN2WsgIXG8R3yqcUmac6HP/ZXBCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150574; c=relaxed/simple;
	bh=O4cmAhZaMFsbVU08z8t4JWkuN7Itk7d8FufcFUL9iLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNaKugvUQDb2uL+q19qQmZ9nK3ief591wO1RuN69oVvPwaT6KvhNf9NV6m/V/LEXkv4+z755IrIDHrqJamx2H2l97iU1gxXS+9f4dfNrypME6cHMcIJxbdhnIGk7S9rv+KhfhUmXAjFKOBihFCXGld53wd6xoVmvp8WmIBYyhT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ASysBSNB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ASysBSNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871BC1F000E9;
	Sat,  4 Jul 2026 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783150564;
	bh=2jVfsUYzFjSV3nE6hbOu4X8mbvMXwhjiogCh2exy6oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ASysBSNBRr83vpo4GRLjn55R/ODIjioIN5GeMcRva2w5dcgBX9axCP6RqTROPivFz
	 qHCBcRcFlhnXVklQueAFv8OEDVGSxMrOELxa0XpGeYcm6ILb+rwF36V6v6ocG/+DRe
	 f98IB5x/YDO8+pM0HHtLTIS18z4E+FV5bVIiTo9M=
Date: Sat, 4 Jul 2026 09:34:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: adi25charis@gmail.com
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: power off module on timeout
Message-ID: <2026070430-exclude-improve-f318@gregkh>
References: <20260704071926.6606-1-adi25charis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704071926.6606-1-adi25charis@gmail.com>

On Sat, Jul 04, 2026 at 12:49:26PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> Previously, when a firmware size request, get firmware request, or
> ready-to-boot request from a module timed out, the driver would log
> an error and free any firmware buffer, but left the module powered
> on in a potentially inconsistent state.
> 
> Fix this by ejecting the module's interface via the SVC when a
> timeout occurs, forcing it to be power-cycled and re-detected rather
> than left in limbo.
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Cool, but how was this tested?  What hardware needs this?

thanks,

greg k-h
