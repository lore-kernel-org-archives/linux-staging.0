Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B75272
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 10:01:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7F3B611AD;
	Thu,  9 Sep 2021 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1631181714;
	bh=/1f9r8n9WVDTH6/Q/V695DPtM4Oyh3rAnEy9HTpXCm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaBNtYTxaCkbW00RDO9jLMx28TcPJ2arczOBGqvAa6l6vLBjt9nYPnTO8sf8d37j4
	 SqR3oQan0g82yJ1F90YPW1cK9o2jeW2+sKJ2HgIIXtkYm2NwSY4+Q7qzZs/zJHSpGF
	 7pdh/UB9TvVYOUn+xTSm5h4nduILlOBa1UXHgI5Q=
Date: Thu, 9 Sep 2021 12:01:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove conditionals
 CONFIG_88EU_{AP_MODE,P2P}
Message-ID: <YTnbj+1fLVav5fyN@kroah.com>
References: <20210908050109.1279-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908050109.1279-1-Larry.Finger@lwfinger.net>

On Wed, Sep 08, 2021 at 12:01:09AM -0500, Larry Finger wrote:
> These two conditional compile symbols are explicitly defined.
> As a result, their included code is always compiled. They could be
> converted to Kconfig symbols; however, my experience with this driver
> in a GitHub repo is that many users of the device have it built into
> a SOC or SBC that they wish to use as an access point. As a result,
> CONFIG_88EU_APMODE would need to be selected. Thus it should be built in.
> 
> There have also been many users the wish to establish peer-to-peer
> networks with this device. For this reason, I am also proposing that
> CONFIG_88EU_P2P be automatically included.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>

Makes sense.  If this really does need to be split up in the future, it
can be done better without all of this #ifdef mess in the .c files.

thanks,

greg k-h
