Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4807D72
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 10:04:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B46460FDA;
	Thu, 26 Aug 2021 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629972241;
	bh=lJsmHi+w1ViexqMynoQ/cMzxko90hLvycjVlB1fVtVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCxRB6tiVCwPOvLP4817NkN58ursGzpnuf2PTUuiffWyKw5aZgBc8UjheTpygXi10
	 smPk+t2wHV+Q8NSYQVMMWy6mN5QkNrtJx/p3LR+WLht5qtUkVF1YSnzWxREYunlWVQ
	 gOWZFEdkPOTBfskZ/AoyShPRK2lo4+GyhJ9Wr/5k=
Date: Thu, 26 Aug 2021 12:03:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: rtl8723bs: remove sdio_write_mem()
Message-ID: <YSdnDBH7Er7nLr+d@kroah.com>
References: <20210821235456.2502681-1-hello@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821235456.2502681-1-hello@bryanbrattlof.com>

On Sat, Aug 21, 2021 at 11:55:05PM +0000, Bryan Brattlof wrote:
> The sdio_write_mem() function is unused in the driver. We can remove it.
> 

How do we know it is unused?

Please remove the pointer as well, at the same time, so that we can
obviously see that it is unused (or not).

Same for the other patches in this series.

Also, when you resend this, please use git send-email properly, so that
the patches are threaded so our tools can pick them up easier.  This
series was not threaded for some odd reason.

thanks,

greg k-h
