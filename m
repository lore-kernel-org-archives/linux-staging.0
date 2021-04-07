Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD86D10
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:14:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 182C861222;
	Wed,  7 Apr 2021 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617808442;
	bh=nErVba1gmF100xpOfZS1/cp4xFDT4vG9CwBj8teGB8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUC3ZTOpBBWQVK8+e74PjBBjhfSTOzvl2O1FI6g9/c+JItRtAz1asKOLYFIi11DLm
	 XksLBJ9G/CdzHpHmtsLz139Yxa26hAKCQh0wU8FoGn1o2EVGktdBNf8dT4pmzPxhyO
	 VoS5J6sRZgQH0URlJicrLxAGbOAJ9LvOgyaqD1OY=
Date: Wed, 7 Apr 2021 17:14:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/19] drivers: rtl8723bs: rewrite comparison to null
Message-ID: <YG3MOCQHu3o/qHTg@kroah.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
 <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>

On Wed, Apr 07, 2021 at 03:49:31PM +0200, Fabio Aiuto wrote:
> fix following post-commit hook checkpatch warnings:
> 
> CHECK: Comparison to NULL could be written "!psta"
> 97: FILE: drivers/staging/rtl8723bs/core/rtw_ap.c:2115:
> +		if (psta == NULL)
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Nit, your subject line has "drivers:" not "staging:" here.  Be a bit
more careful next time please.

thanks,

greg k-h
