Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8D229CA
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 16:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCC0C36AE7;
	Tue, 28 Dec 2021 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640708044;
	bh=8pgeOPA8EqGCFEfOIbMvaFwgkk4HKoIO5on3e+sDTLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGI3XRUg8Sh6IVWeqZh/8rjtALG/l8Iozdk1pklnZwAHIcF1G5xTM7MOsk3AEItn0
	 ziNIduXLMrjqRHmJAE+Z6J8rAWXiiVP8Gr6FnuXvYdp1K889k193XKEfcsKKNtmuwx
	 k7dLlnyiKwAblrSVf5b0mBdEYHacPGDRm8QdbYPM=
Date: Tue, 28 Dec 2021 17:14:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] staging: r8188eu: clean up private ioctls
Message-ID: <Ycs3yiJMSWSeehJS@kroah.com>
References: <20211226212535.197989-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211226212535.197989-1-martin@kaiser.cx>

On Sun, Dec 26, 2021 at 10:25:25PM +0100, Martin Kaiser wrote:
> Clean up the definitions of private ioctls.
> (Maybe it would make more sense to remove them completely?)

If none of them are really "standard", then yes, they should be removed.

At the very least, the correct macros should be used for the remaining
ones.

I'll go queue this up now, thanks!

greg k-h
