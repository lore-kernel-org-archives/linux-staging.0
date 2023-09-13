Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDAF10F5
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 08:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E6BC433C7;
	Wed, 13 Sep 2023 08:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694594066;
	bh=+vLsPOJIEE3ddOBJtGfG6YGOIXsFBc668uaq68GXi40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yPF+5mGuGk1AuMLZfMDIgpT2jos683isZdvTxMZ/IgNf0RSpv7I5cGi7IDtvxkxPA
	 r3Yb8DfMVjEZNEnVi9A8ZognWDbptsP0TjKr23lVzmOTjYiJFyy+hraNgE75SbHZhX
	 +DOH3Ce0mf09Vfi2rUd4QpQOElw6Vjyb3T71dhuo=
Date: Wed, 13 Sep 2023 10:34:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: philipp.g.hortmann@gmail.com, straube.linux@gmail.com,
	Larry.Finger@lwfinger.net, wlanfae@realtek.com, mikem@ring3k.org,
	seanm@seanm.ca, linux-staging@lists.linux.dev
Subject: Re: [PATCH -next v2 1/3] staging: rtl8192e: rtl_core: Call
 dev_kfree_skb_irq() instead of kfree_skb() under spin_lock_irqsave()
Message-ID: <2023091352-mouth-escapist-6eb4@gregkh>
References: <20230825015213.2697347-1-ruanjinjie@huawei.com>
 <20230825015213.2697347-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825015213.2697347-2-ruanjinjie@huawei.com>

On Fri, Aug 25, 2023 at 09:52:11AM +0800, Jinjie Ruan wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with hardware interrupts being disabled.

Why not?  Seems to work so far :)

Are you fixing up all of the normal network drivers for this first?

thanks,

greg k-h
