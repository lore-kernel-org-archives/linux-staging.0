Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A056321E
	for <linux-staging@lists.linux.dev>; Thu,  9 Mar 2023 09:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B929AC4339C;
	Thu,  9 Mar 2023 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678352960;
	bh=6JkwDwIBOjJvV3pHXczF/8PiWm/zS9WFKQmM05KEwBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPu0mRbG0n6e1rc+v9Eu6URKofWRoQ6nVw9QE+vsRrcV4bEj3MXLmJPYyAuVRwHrO
	 vuEeApv/ApScbMK1UgRQmxcE9K//0r0+D/fceEEKP2o0mipvFwWtEzg3tZDKaAvPdD
	 gubUSIW6A39Kxs/3WnTtHEcnAUhS6rVKfwI8I6KE=
Date: Thu, 9 Mar 2023 10:09:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: r8188eu: two simple cleanups
Message-ID: <ZAmiPce50Srp47Na@kroah.com>
References: <20230307085003.5025-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307085003.5025-1-straube.linux@gmail.com>

On Tue, Mar 07, 2023 at 09:50:01AM +0100, Michael Straube wrote:
> This series contains two simple cleanups.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (2):
>   staging: r8188eu: busetkipkey is boolean
>   staging: r8188eu: bgrpkey_handshake is set but never used
> 
>  drivers/staging/r8188eu/core/rtw_mlme.c        | 1 -
>  drivers/staging/r8188eu/core/rtw_recv.c        | 2 +-
>  drivers/staging/r8188eu/core/rtw_xmit.c        | 2 +-
>  drivers/staging/r8188eu/include/rtw_security.h | 1 -
>  4 files changed, 2 insertions(+), 4 deletions(-)
> 
> -- 
> 2.39.2
> 
> 

Sorry, but I've now deleted this driver, so these patches do not apply.

greg k-h
