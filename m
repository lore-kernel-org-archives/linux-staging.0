Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009972
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 12:09:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B560D611AF;
	Sat, 10 Apr 2021 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618056585;
	bh=ZnQfVUJlE/hyrfgDFzqUZAHEdNuh2Ys/CDqf/79/Vl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPaF0A6B+VWseOzTBs5PhQccHCzxoAYjsGaEBcaRskDQfpQ6GMK6LZEEh1ms0BmtH
	 4TKcMYCGyP7x3twJVuDIYbIbTWKxofA+Jgl3RWVb/ZqEdJPoDoKOgHQo/MD1JA4fM7
	 z05MaURqUHeD2JPoJ3daINyzKku8j59OZhMd7ziY=
Date: Sat, 10 Apr 2021 14:09:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: rtl8712: Use existing arc4 implementation
Message-ID: <YHGVhjprFvmqMaY9@kroah.com>
References: <7e16c40d5baa007dca81a12b967a597ed00d8dd7.1618055514.git.christophe.jaillet@wanadoo.fr>
 <a793f56d34e53397607df54c683943d2c48b84f7.1618055514.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a793f56d34e53397607df54c683943d2c48b84f7.1618055514.git.christophe.jaillet@wanadoo.fr>

On Sat, Apr 10, 2021 at 01:56:57PM +0200, Christophe JAILLET wrote:
> Use functions provided by <crypto/arc4.h> instead of hand writing them.
> 
> The implementations are slightly different, but are equivalent. It has
> been checked with a test program which compares the output of the 2 sets of
> functions.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I can not see patch 2/3 of this series, what happened to it?

thanks,

greg k-h
