Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D15EBB
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 17:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B3EC340EC;
	Mon, 21 Feb 2022 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463613;
	bh=qQzHDEyYctUP4L9Y5vUspH2NxDdzaTCVZsV/0H8xRV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOXMrPPoVZ7pogZkcXfzHUUpgctpbb9kL/UkU8n7SmR3Www3GGemeqIuytD8LONlL
	 YHyh8LSfVOHorKxcJWPQfVOYGZJIrn+wxrsNS5ScqLV56zqnS6TOF1zkYBOjWZZhY/
	 +rVHGF0oC4YlCsaJ36bAqeZRCeAuyHOxzRRwHkb0=
Date: Mon, 21 Feb 2022 18:13:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] staging: r8188eu: odm cleanups
Message-ID: <YhPIOp/k/u9GUv73@kroah.com>
References: <20220221073306.16636-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221073306.16636-1-straube.linux@gmail.com>

On Mon, Feb 21, 2022 at 08:33:01AM +0100, Michael Straube wrote:
> This set removes two more functions from the unwanted hal/odm layer.
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> v2:
> Fixed a typo in the commit message of patch 2/5.
> unsed -> used
> 
> Michael Straube (5):
>   staging: r8188eu: remove ODM_CmnInfoHook()
>   staging: r8188eu: convert two u8 variables to bool
>   staging: r8188eu: remove enum odm_bw
>   staging: r8188eu: convert type of pBandWidth in odm_dm_struct
>   staging: r8188eu: remove ODM_CmnInfoUpdate()
> 
>  drivers/staging/r8188eu/hal/odm.c             | 56 +------------------
>  drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 19 ++++---
>  drivers/staging/r8188eu/include/odm.h         | 29 +---------
>  drivers/staging/r8188eu/include/rtw_mlme.h    |  2 +-
>  drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
>  5 files changed, 16 insertions(+), 92 deletions(-)
> 
> -- 
> 2.35.1
> 
> 

This patch series does not apply to my tree.  Please rebase and resend.

thanks,

greg k-h
