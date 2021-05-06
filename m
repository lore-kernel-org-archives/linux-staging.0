Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0970
	for <linux-staging@lists.linux.dev>; Thu,  6 May 2021 10:14:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7F8611AC;
	Thu,  6 May 2021 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1620296060;
	bh=plZ63zK9R9UDZd34lXcnuKV+/8tuQT/kyARVDigr8TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYr2V6hWwtaS9Nouj84ehMMpJ9Zd7GNfd7oSuyTd27hENVNoBYd9m2JRSAX/ErXTU
	 wea37xTXyliAkU9shM0xQ8DFWJYe7Q+7G9rUPlY/HQ1P2rsw1ExMTNPeS1Wt9czbgR
	 CIm4ZIeYE+/QGu4BJm5WIHMVY2jNe6J5Y44KhloY=
Date: Thu, 6 May 2021 12:14:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] staging: rtl8188eu: remove nic_hdl from struct
 mlme_priv
Message-ID: <YJPBekheQ/7eiCDN@kroah.com>
References: <20210505202622.11087-1-martin@kaiser.cx>
 <20210505202622.11087-5-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505202622.11087-5-martin@kaiser.cx>

On Wed, May 05, 2021 at 10:26:21PM +0200, Martin Kaiser wrote:
> struct mlme_priv is an element of struct adapter. Use container_of
> to get a pointer to the enclosing struct.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/rtl8188eu/core/rtw_mlme.c    | 5 +----
>  drivers/staging/rtl8188eu/include/rtw_mlme.h | 2 --
>  2 files changed, 1 insertion(+), 6 deletions(-)

This patch didn't apply to my tree, can you rebase and resend just this
one as I've taken your others?

thanks,

greg k-h
