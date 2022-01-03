Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DEE2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 13:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A458C36AEB;
	Mon,  3 Jan 2022 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641216523;
	bh=wwnv/IukshN2lvxyx33nMlELVbHp8RH5n+SQ/wKsvis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rwsSTV/cEOhq975eTrSwbzpMSL+zLBhQzd+3bPjWG8soNBSO29dg/OjvYHWXjzO2y
	 qyG2Ja0S5bbb7pN3Wt990i0NLdN5XBddO2BEvB9gHJs0z4AvL7IgQy0V68PTDaeJrj
	 J8icXNusu0Ocd11aghNJLl5jFd1anRQ31BbQHbnA=
Date: Mon, 3 Jan 2022 14:28:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove unneeded ret variables
Message-ID: <YdL6CE3+CaU6xVvD@kroah.com>
References: <20211231172527.184788-1-abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231172527.184788-1-abdun.nihaal@gmail.com>

On Fri, Dec 31, 2021 at 10:55:27PM +0530, Abdun Nihaal wrote:
> Remove unneeded return variables in ioctl_linux.c that are initialized
> to 0 and are not assigned after. Instead, return 0 directly.

Almost all of these should not be returning a value at all, if they can
not fail and no one checks the values, right?

Please fix this up to be functions that return void, as that's the
correct thing to do here.

thanks,

greg k-h
