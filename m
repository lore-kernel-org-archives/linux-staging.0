Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBBA7E
	for <linux-staging@lists.linux.dev>; Sun,  6 Mar 2022 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6380C340EC;
	Sun,  6 Mar 2022 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646604732;
	bh=Vg4dg+rtnXwPXxFzIQ41Fx4epBxcehS/Bu7Z4cIzmXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOuQOc40xppJhSkTOioF4U7Q6Dn2jMdyVnE7XKLORst016QJcqwbwdfM9q8/oz+m7
	 H9s1szundRyDYNkOYGu4gxiWDkYhA3HLtaefkrE1PcLMkf5tflDIpCORqctHFaaDnJ
	 f9pXcyQQvNRiMa8FRE1HmfcwotzLNx6nr4qYAecI=
Date: Sun, 6 Mar 2022 23:12:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-staging@lists.linux.dev
Subject: Re: [PATCH net-next 02/10] staging: Use netif_rx().
Message-ID: <YiUxuBxop3AtLmnw@kroah.com>
References: <20220306215753.3156276-1-bigeasy@linutronix.de>
 <20220306215753.3156276-3-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220306215753.3156276-3-bigeasy@linutronix.de>

On Sun, Mar 06, 2022 at 10:57:45PM +0100, Sebastian Andrzej Siewior wrote:
> Since commit
>    baebdf48c3600 ("net: dev: Makes sure netif_rx() can be invoked in any context.")
> 
> the function netif_rx() can be used in preemptible/thread context as
> well as in interrupt context.
> 
> Use netif_rx().
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/staging/gdm724x/gdm_lte.c      | 2 +-
>  drivers/staging/wlan-ng/p80211netdev.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
