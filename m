Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139B2F80
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5289661AFC;
	Mon, 16 Aug 2021 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629101425;
	bh=Q2rTcpbGoDYXSqrTZIPCkTl7PTdnF+8YLs/LK9+nyP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vbLiHjOnN9GRqjt1sBayuoYp17GjUWH0LWpDcs0O6gjxcUem0XscP6MkHhBEwDR0E
	 gHAu1iRxWM2cr1odd8cu1kcvwzQYnxLIb5o1w/lDMpa/pagztWSE+JZP8rVRMCqPfY
	 4VW1C5xcHpnblD+NUA3Uure/Tv5qo/gcPCjDRn/M=
Date: Mon, 16 Aug 2021 10:10:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: dan.carpenter@oracle.com, yangyingliang@huawei.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove the dependency on ipx.h
Message-ID: <YRodb5XKDC7NF/pQ@kroah.com>
References: <20210816075406.938-1-caihuoqing@baidu.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816075406.938-1-caihuoqing@baidu.com>

On Mon, Aug 16, 2021 at 03:54:06PM +0800, Cai Huoqing wrote:
> commit <47595e32869f> ("<MAINTAINERS: Mark some staging directories>")
> indicated the ipx network layer as obsolete in Jan 2018,
> updated in the MAINTAINERS file
> 
> now, after being exposed for 3 years to refactoring,
> so to remove the dependency on ipx.h
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 24 ++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)

See:
	https://lore.kernel.org/r/20210816073450.668993-2-gregkh@linuxfoundation.org

for a different approach to this.

thanks,

greg k-h

