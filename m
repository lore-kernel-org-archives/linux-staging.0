Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43B384CFE;
	Thu, 18 Jun 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778383; cv=none; b=W7eMCfdFi9eWts9boMXAIMGAHIVIoGHUEJ6lK6m8lkDMNAzVTZW4g6j9+D/INyJLtDECeup5Oj/T2WaJnTv0rRqMPbWTuEMyGRpYiOvjDA+wA5q5uofgDqcQLPJbFHLi28mAfl7D27GdRArIJ8SjZbP3q7kA1BUOozDz5hJNo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778383; c=relaxed/simple;
	bh=F4SGdhTOnkanpeIEiC4rSznFULbB5fJ00n0NL164AbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKYj3TVX7VvswNNoFWFo2NzAHoHeHJXiKTuxYDroOzsA5P/ZujgWWmfn62q4raqv/whO3Oo8Ub8daY0SLI87k52AhtuOHMT4jq4jkMUHCCX0P+Wlb9ws1VswrB82bRDQb41JijmN69AgnQ9yysWEnzMlFb+Go6AzZ6VKzUwabKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F3LpHY9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F3LpHY9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEA51F00A3A;
	Thu, 18 Jun 2026 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781778382;
	bh=OEbEhpEUBhbX89vOhj47mejscFAt4n5NfNoTHAwYlWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3LpHY9Rge+XN1uI3z8YbQgxrx1y2cOn1gsAy/M71aJl+e/VN0nFQKowIATZhuY/u
	 F8sJrHLnOVXM6XzvmSJGmahefqUp79o79l/O3gbFmH0CzQPQ5EoQcyEFoOoCZSWwBp
	 sFHXtwim5FGlQyWMiiwNcJobhZGp2zthUmPTewIA=
Date: Thu, 18 Jun 2026 12:26:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Pablo D. Bergamasco" <danpablo@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [QUESTION] staging: octeon: is the FIXME in cvm_oct_sgmii_init
 stale?
Message-ID: <2026061820-unshaved-pajamas-4b64@gregkh>
References: <20260617210743.1825733-1-danpablo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617210743.1825733-1-danpablo@gmail.com>

On Wed, Jun 17, 2026 at 06:07:43PM -0300, Pablo D. Bergamasco wrote:
> Hi Greg,
> 
> While looking at drivers/staging/octeon/ethernet-sgmii.c I noticed
> a FIXME comment in cvm_oct_sgmii_init():
> 
>     cvm_oct_common_init(dev);
>     /* FIXME: Need autoneg logic */
>     return 0;
> 
> After tracing the code, I believe autoneg is already handled when
> the interface is opened:
> 
>   cvm_oct_sgmii_open()
>       -> cvm_oct_common_open()
>           -> cvm_oct_phy_setup_device()
>               -> phy_start()
>                   -> phy_state_machine()
>                       -> _phy_start_aneg()
>                           -> genphy_config_aneg()
> 
> Is my analysis correct? If so, should I send a patch to remove
> the stale FIXME comment?

I have no idea, sorry, test it out on the hardware and see!

thanks,

greg k-h
