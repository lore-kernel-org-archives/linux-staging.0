Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6AA70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:37:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47D6861A44;
	Fri, 26 Mar 2021 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616747870;
	bh=HGsGnoth2ZOZS+sjsAFalgHFAKd065RGy6pi92g7wx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJ8z8x6vuSW6qeM5GEtRUqkwRr9Zc4YHEx1EzbEMy9KlkAep15GklBnnZlMMqEOlI
	 i+4EMw6EyHbAok6ri9e+irAT1PXuX4PwPNDFryc97mEKcvmc2Ur1yK138ZwE49889E
	 ZhQiMMpRtlbJlvAe38UUpknc/Ofh1MQ0zwiDtepY=
Date: Fri, 26 Mar 2021 09:37:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Cc: zhangxuezhi1@yulong.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <YF2dXIxMOUyLzfnQ@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>

On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> From: "Carlis" <zhangxuezhi1@yulong.com>
> 
> Change 'tft' to 'TFT'

Why?  What is wrong with "tft"?

> 
> Signed-off-by: Carlis <zhangxuezhi1@yulong.com>

Full name please.

thanks,

greg k-h
