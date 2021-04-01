Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09B5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 05:59:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E032361029;
	Thu,  1 Apr 2021 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617256755;
	bh=XD5dFTafi/zh+nbVhSvc/b+NA8PLtkafirLsfoVxupQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXyjK55TzCMFvWujSIhwio+Y7BjQ0ZGXfPzsFH6khYyTLw9mRYNjdwX+mN4eZMIQ7
	 pHq7SPRtDRTAvj34fH2JI3Hk3L/czS6TteSXmP8cEkRl16rF0ZVi7SStZB7doGonSP
	 DeIgl6v/pLN0ubNiOO9bcjIrQlVb+Tcy+Zf+YGvk=
Date: Thu, 1 Apr 2021 07:59:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	johan@kernel.org, elder@kernel.org
Subject: Re: [PATCH -next v2] staging: greybus: camera: Switch to
 memdup_user_nul()
Message-ID: <YGVhLiV1EeqIJQnM@kroah.com>
References: <20210401031752.2861248-1-yangyingliang@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401031752.2861248-1-yangyingliang@huawei.com>

On Thu, Apr 01, 2021 at 11:17:52AM +0800, Yang Yingliang wrote:
> Use memdup_user_nul() helper instead of open-coding to
> simplify the code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/staging/greybus/camera.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

What changed from v1?

Always put that below the --- line like the documentation asks you to.
Please fix up and send a v3.

thanks,

greg k-h
