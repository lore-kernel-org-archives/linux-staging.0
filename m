Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688985674E;
	Sun, 22 Dec 2024 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847904; cv=none; b=TJRMIPX2IHVYs9n2k30xQKLB53r3UESbLxym9dbBvOO5ttHn48zHYW0E/o9IWyUP++lwRfW0TRtaiZ0lkIs/pEvDyzrvT/eTB698/p+H7JZcu0RYrKSuZuTOy0vor6HO/QpE7bTNZlakgY9B8ke4ehTjBpWcRfJX1JqjP3Piwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847904; c=relaxed/simple;
	bh=sJCx61Sj1r14aCQDI+kYvXislHS9102jskn2dLJnJIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn1Qvy/XcOYaXRaU2nEqe6RsEnNGxRDKoayI1+5B2HI5pkDHopFudHzGIz5OLZL4IdHyrr/gh92r3Kc2hv92s6MZZLKmYVjf24tTiZxL4Z4aRH810EzGpH78T1SNuyRg6D/OfH8J9GmQTkoyVuv+mD/GhvJ3aLNpVLtL+bynHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mUpjGTEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mUpjGTEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4947CC4CECD;
	Sun, 22 Dec 2024 06:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734847903;
	bh=sJCx61Sj1r14aCQDI+kYvXislHS9102jskn2dLJnJIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUpjGTEzSofazlHTBiR6exKQ9knMWEop6MvsLYDEfx69zVO+X6vFDqEmVz/sAoXRf
	 6e7QIsorWbjDerkIAKOk96mh6O2vYGF+0XRW3hKCyK18Ha5u1iWN4HeCr5K5BIQ8s0
	 VwjiJAlSALMjxfsxdA7XLG7niN3UxicVHTIu+niE=
Date: Sun, 22 Dec 2024 07:11:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Antonio Riccio <linux@ariccio.me>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Rename variable ValidAll
Message-ID: <2024122201-uncivil-footnote-f584@gregkh>
References: <Z2cekOavt5rTukZY@stream-circuit>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2cekOavt5rTukZY@stream-circuit>

On Sat, Dec 21, 2024 at 08:01:23PM +0000, Antonio Riccio wrote:
> --- a/drivers/staging/gpib/uapi/gpib_user.h
> +++ b/drivers/staging/gpib/uapi/gpib_user.h
> @@ -114,7 +114,7 @@ enum bus_control_line {
>  	ValidSRQ = 0x20,
>  	ValidATN = 0x40,
>  	ValidEOI = 0x80,
> -	ValidALL = 0xff,
> +	VALIDALL = 0xff,

Why are you only changing one of these?  And are you sure that these
values aren't coming from a specification with this type of naming?

thanks,

greg k-h
