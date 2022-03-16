Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88D38C2
	for <linux-staging@lists.linux.dev>; Wed, 16 Mar 2022 14:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EA8C340EC;
	Wed, 16 Mar 2022 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647439831;
	bh=4z2I55pzyavFTDWLYTHKcSuy83CB3G7cE/uAVyRTL3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kxcj68qKuLCMtT5jZYNdUY3CNI+L1u5I5JrvYc43CEEXJRy20ysZ9tpxO+1cYXeOY
	 i2SbPSxGveYl4eUg29j4He8UUCMAgrllZgGnTzCy6SNHfBiw6zRPDd1QM+ekp0fsE/
	 vi8Jxafqqrcfjz1KzCqBGl9Px8Dn5Rn1wEEzUQ3A=
Date: Wed, 16 Mar 2022 15:10:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] staging: r8188eu: some rx cleanups
Message-ID: <YjHvxICqn4J5D2fc@kroah.com>
References: <20220315205041.2714168-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315205041.2714168-1-martin@kaiser.cx>

On Tue, Mar 15, 2022 at 09:50:35PM +0100, Martin Kaiser wrote:
> Here's another set with simple cleanups in the code for receiving frames.
> 
> v2 fixes a build error on 64-bit systems in the last patch.
> 
> Martin Kaiser (6):
>   staging: r8188eu: remove unnecessary initializations
>   staging: r8188eu: remove three unused receive defines
>   staging: r8188eu: remove unused function prototype
>   staging: r8188eu: make rtl8188e_process_phy_info static
>   staging: r8188eu: remove some unused local ieee80211 macros
>   staging: r8188eu: remove local BIT macro
> 
>  drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  6 +---
>  .../staging/r8188eu/include/rtl8188e_recv.h   |  6 ----
>  .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
>  drivers/staging/r8188eu/include/wifi.h        | 34 +------------------
>  4 files changed, 3 insertions(+), 45 deletions(-)
> 
> -- 
> 2.30.2
> 
> 

I took the first 5 patches here, thanks.

greg k-h
