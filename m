Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023B369987
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481622; cv=none; b=lPmA+DwpR3WpF318/no8aAMn+kjfKRZg9BxC7oBqeFP9w8O6Y3K2cQ1wt+1u0Dpoy6+4yDCrNimrvduTssXhT5x1uddamjDotRv9QG4torRWr3N4v7viUle8tB2c+644rvtC0rNVQg5QParBjV1KbybeZYUxeVSbt/mak4To1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481622; c=relaxed/simple;
	bh=HYFduRKlUVxpF9liS457vIulzhRckMd7kUkI8sUps6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fw/dfo6/hcgdXZ8XHqYax723G72JrsTW2yBG30ocJ9Gr4aAjz/BTFKc9toNg9eBbCKuw8zQPcBh/MSFdpFVySzl1N1UaaaktmvZEjhfKAKjCLmpCBvDGXi+Ay/x/AqxKoajr4Khxl+RuxeJA/BixYAcQgx3P2zRG0uU6jM4dj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgo4pJXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgo4pJXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1F4C2BCB0;
	Tue, 18 Nov 2025 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481621;
	bh=HYFduRKlUVxpF9liS457vIulzhRckMd7kUkI8sUps6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fgo4pJXREWFmaCnTqCiQe2F89hK9gqpFu0DzvrtZHSQseT7xTwEMkbTnExuf5RyB9
	 olIWorNkhyEnp2mJTVyHIYPWnJPR6CT4VujCZOMMI1k6GlnDkRRJjmbGcGUAuWd1/L
	 PdikaWtUbu92AsVIViEgkTkNevgnmRIgoo8QrLcDyoJ65Ni6DV920nUOQYO8epRfCs
	 cCZJn9w4YG4P99NMme+peNa0eGE0YG4I4YHe3qAMlkO4SSeNeBvPLV0rqrIArNC7U4
	 OfU6O/83Rv8dxLtBxU+RNEDzaVjJ521rL+8T5Pi6czd+vnso+NccIBbxpnd/UCx5kv
	 WIxFe9+2esaWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO7v-0000000038H-1olV;
	Tue, 18 Nov 2025 17:00:19 +0100
Date: Tue, 18 Nov 2025 17:00:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 06/13] staging: greybus: bootrom: remove obsolete FIXME
 about SVC parallel event handling
Message-ID: <aRyYE_4hXmatrhhq@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>

On Mon, Nov 17, 2025 at 11:48:11PM +0530, Ayaan Mirza Baig wrote:
> The MODE_SWITCH_TIMEOUT_MS constant included a FIXME suggesting the timeout
> could be reduced once the SVC core supported parallel event processing.
> Greybus SVC logic is stable today and no such change is planned, and the
> existing timeout has been used reliably for years. Remove the 
> obsolete FIXME and replace it with a descriptive comment.

No, just leave the FIXME in place.
 
> -/*
> - * FIXME: Reduce this timeout once svc core handles parallel processing of
> - * events from the SVC, which are handled sequentially today.
> - */
> +/* Timeout for mode switching operations, based on current SVC behaviour */
>  #define MODE_SWITCH_TIMEOUT_MS	10000

Johan
