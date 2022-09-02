Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02B7E
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 08:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AEEC433C1;
	Fri,  2 Sep 2022 08:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662107152;
	bh=IBe8kavET6PS7TCxeMEGpmpa2hOUF0cnlKxL1drFluU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xEjWqJwIBRHFUrUB9huKjX3jx1m2zzHeT/nCzEmh/ojuhoMCSh75B/AjVlM1dKn1O
	 Xu2XagemOEoQdlblKv5ozVvfSdLHFOtKczlCNKqBfRDLm0Ng9AwxApXXccDFNbR8BX
	 scYKOCbHULBFEpQPpzIi+qmAgyp1RutQxZIqzpVg=
Date: Fri, 2 Sep 2022 10:25:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: GUO Zihua <guozihua@huawei.com>
Cc: linux-staging@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com
Subject: Re: [RESEND PATCH] staging: r8188eu: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <YxG+DNzyUcPIjXZC@kroah.com>
References: <20220902081653.60682-1-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902081653.60682-1-guozihua@huawei.com>

On Fri, Sep 02, 2022 at 04:16:53PM +0800, GUO Zihua wrote:
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this might get
> cought out by CFI and cause a panic.
> 
> Use enums from netdev_tx_t as return value instead, then change return
> type to netdev_tx_t.
> 
> Signed-off-by: GUO Zihua <guozihua@huawei.com>
> ---
>  drivers/staging/r8188eu/include/xmit_osdep.h | 2 +-
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Why is this and the other commits, marked as RESEND?

And any reason you didn't cc: the staging maintainer on this commit?

confused,

greg k-h
