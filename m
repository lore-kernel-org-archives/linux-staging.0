Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB21C13
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFA0C433EF;
	Tue, 17 Jan 2023 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673980391;
	bh=e6+ixn4nIUcp6w67VrVoVNFZYoA95xaJpxTzA72soMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXPgEMC7ZBnGliZkB1kiy2d5x5I/eaWQC41xWgGKT8tPcgAhcMCrky9lpjtbkHIvO
	 K5fGHIf+nHYs0EfSJ2VlMWafeuM6pXCKeu6mND31oV5VnjEWUpcQ9UO3XMkxmHklu1
	 uM1ed+HUGlPm+buGsiwJSK3dKCcfVBQIb01nWOX8=
Date: Tue, 17 Jan 2023 19:33:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/20] staging: r8188eu: we use a constant number of
 hw_xmit entries
Message-ID: <Y8bp5BJIJBOwau0I@kroah.com>
References: <20221230180646.91008-1-martin@kaiser.cx>
 <20221230180646.91008-21-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230180646.91008-21-martin@kaiser.cx>

On Fri, Dec 30, 2022 at 07:06:46PM +0100, Martin Kaiser wrote:
> struct xmit_priv contains a pointer to an array of struct hw_xmit entries.
> xmit_priv's (ill-named) hwxmit_entry component stores the size of this
> array, i.e. the number of hw_xmit entries that are used.
> 
> The array size is constant, it's initialised to HWXMIT_ENTRY and never
> updated. Simplify the code accordingly. Remove hwxmit_entry, do not pass
> the array size as a function parameter and use HWXMIT_ENTRY in the code
> that handles the array.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_xmit.c      | 8 +++-----
>  drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 2 +-
>  drivers/staging/r8188eu/include/rtw_xmit.h   | 3 +--
>  3 files changed, 5 insertions(+), 8 deletions(-)

This commit did not apply to my tree :(

thanks,

greg k-h
