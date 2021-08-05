Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146170
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 11:11:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E076610FF;
	Thu,  5 Aug 2021 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628161894;
	bh=H7Gfg1h2kqOSCtljjCenctXs9o/KyG2TYbz/k0+uHlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1EN7yDioncoECmYcGjLBeF3frrYI7C2/+xtWZ9LMPHolC7r0tgSFmJ+iYMaz70+i
	 8d6zQTnm1aekNwdo6vsHgS3p9fXE6KzwFLPMlFXHU02DdyUb5OCQ+nHFEUeSjJErmp
	 FbbFSdX+N0LGN9tr4Af0nNwr4XGtJXT9XYGxqtIs=
Date: Thu, 5 Aug 2021 13:11:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: Re: [PATCH 0/4] staging: r8188eu: Fix clang warnings
Message-ID: <YQvHY88v5X/tzLpn@kroah.com>
References: <20210803223609.1627280-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803223609.1627280-1-nathan@kernel.org>

On Tue, Aug 03, 2021 at 03:36:05PM -0700, Nathan Chancellor wrote:
> This series cleans up all of the clang warnings that I noticed with
> x86_64 allmodconfig on the current staging-next. This has been build
> tested with both clang and gcc with x86_64 allmodconfig.

Can you rebase on my staging-testing branch and resend this series?
There is a lot of churn in this driver right now, and your series does
not apply anymore.

thanks,

greg k-h
