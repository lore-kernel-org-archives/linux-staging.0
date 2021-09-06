Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEBE3FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 13:49:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BE9460F45;
	Mon,  6 Sep 2021 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630936198;
	bh=Oc0yRowwr2RWee7fH/21myDQmy8r5h2obyPq+HeSit4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vyLoVfngKqby7thz3HaOVnMDYjeOXL42SWskDM2NxdueE96KEmVagJXtx2SVUJKH9
	 08IgYI5VNGhbPGBoXGmCoG9kukJP79sDEGYmGw7dSGn4ZFYshCVNdH4CePSDzLn7J1
	 L3f33c4Cs+UA6NLiO0Kd+NQ1rUlklOwVUK3k37tw=
Date: Mon, 6 Sep 2021 15:49:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: core: remove duplicate structure.
Message-ID: <YTYchKn/l3GboOsd@kroah.com>
References: <YTSj7upqzTiccWH2@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTSj7upqzTiccWH2@user>

On Sun, Sep 05, 2021 at 04:33:10PM +0530, Saurav Girepunje wrote:
> Remove duplicate structure mlme_handler and action_handler. Both
> structure are having same member. Replace it with mlme_action_handler.

Why merge both names together?  Why not just pick one name and stick
with that if they really do the same thing?

thanks,

greg k-h
