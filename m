Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1C9436A5;
	Tue, 17 Oct 2023 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="clSb5/6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66226C433C8;
	Tue, 17 Oct 2023 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697550009;
	bh=Iux2S6qho2rTgeWzeBYd0Yu7vcjQMmCIVq4EvLtB6TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clSb5/6ZoZlCvDEEmQezAhlI/9FJ+Ky5yHtWVzD6AUU9P9kPIHFxCN2OmR6Af2twB
	 CzaBv6u6g7t+zPjUOau6iQi61AT1HZyQUEwGCOOzE43haZpU94+ZMMcfDbBQZeOihD
	 f+ziwNspp3t6eQouy0WPnKqqlTI8nTz1vc3X/g+A=
Date: Tue, 17 Oct 2023 15:40:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
	forest@alittletooquiet.net, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Rename variable bUpdateBBVGA, byCurrentCh, byCurPwr
 and byBBPreEDRSSI
Message-ID: <2023101747-goal-curing-5577@gregkh>
References: <cover.1697495597.git.gilbertadikankwu@gmail.com>
 <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f6661a4-7281-4d26-8c26-ba03a567fcaa@gmail.com>

On Tue, Oct 17, 2023 at 08:19:49AM +0200, Philipp Hortmann wrote:
> On 10/17/23 00:58, Gilbert Adikankwu wrote:
> > Make the variable names adhere to Linux kernel coding style and mute
> > checkpatch.pl errors.
> > 
> > Gilbert Adikankwu (4):
> >    staging: vt6655: Rename variable bUpdateBBVGA
> >    staging: vt6655: Rename variable byCurrentCh
> >    staging: vt6655: Rename variable byCurPwr
> >    staging: vt6655: Rename variable byBBPreEDRSSI
> > 
> >   drivers/staging/vt6655/baseband.c    |  2 +-
> >   drivers/staging/vt6655/channel.c     | 18 +++++++++---------
> >   drivers/staging/vt6655/device.h      |  8 ++++----
> >   drivers/staging/vt6655/device_main.c |  8 ++++----
> >   drivers/staging/vt6655/dpc.c         |  2 +-
> >   drivers/staging/vt6655/rf.c          |  4 ++--
> >   6 files changed, 21 insertions(+), 21 deletions(-)
> > 
> 
> Hi,
> 
> -       if (priv->byCurrentCh == ch->hw_value)
> +       if (priv->current_ch == ch->hw_value)^M
>                 return ret;
> 
> ERROR: DOS line endings
> 
> What does the "^M" at the end of the new line?
> Did you run checkpatch on your patches?

I don't see that on my side, are you sure this is there?

thanks,

greg k-h
