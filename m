Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3FB70
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 08:16:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87FFF6120D;
	Wed, 21 Jul 2021 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1626855377;
	bh=6+TOhw2bw1BErXR+/AP1jMtlMViQ/etkLZyn7PR6csY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oROQtlPdkDslk10LEvycJsRH/pHLR6KF47YQ0tn+TCHcaZ1hX2VtSAQCv873QqLka
	 21od/8shiDxJum85nuKq2GxjjZ/IqUtz6LPECZ4+CSwYiWuhqED5++APwyxLufBOAK
	 k2HQyf5St3a0sEcdGHptTuAfm0xsaPkyrbC1v1Q4=
Date: Wed, 21 Jul 2021 10:16:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH resend] staging: rtl8188eu: move all source files from
 core subdirectory
Message-ID: <YPfXzlmYk4EPap+F@kroah.com>
References: <20210719224601.255364-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719224601.255364-1-phil@philpotter.co.uk>

On Mon, Jul 19, 2021 at 11:46:01PM +0100, Phillip Potter wrote:
> Move all C source files from the core subdirectory to the root
> folder of the driver, and adjust Makefile accordingly. The ultmate
> goal is to remove hal layer and fold its functionalty into the main
> sources. At this point, the distinction between hal and core will be
> meaningless, so this is the first step towards simplifying the file
> layout.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/rtl8188eu/Makefile            | 34 +++++++++----------
>  drivers/staging/rtl8188eu/{core => }/rtw_ap.c |  0

<snip>

As others have pointed out, let's move files when they need to be moved,
not yet.  Removing the HAL layer is great here, but when that happens,
the hal/ directory will be empty and we can go from there if things
still need to be moved.

thanks,

greg k-h
