Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2C72
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 12:57:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7635460EE2;
	Sun, 10 Oct 2021 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633870636;
	bh=jMKprDtSDUuryJ5jHXv3kadbXCJNGZ1aD8piqWTAmQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzSYd+1uThyn6OLYpDrXsFBTx3ovQDE/ul0LYUdF8B14FRObL+ErOHC0NDWMWiuqP
	 TkRBa6Q0NaOqzi69Mee50NwAxpd5cw7pPkV1ykF9s/hCY/qL+vqbFsyIXECDfv3K2R
	 uHyQq3T48fvvy4pguPUlsCxd2vsYOjy2bws5hpTw=
Date: Sun, 10 Oct 2021 14:57:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] staging: r8188eu: remove struct hal_ops
Message-ID: <YWLjIwKnruameNBg@kroah.com>
References: <20211007103943.8433-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007103943.8433-1-straube.linux@gmail.com>

On Thu, Oct 07, 2021 at 12:39:38PM +0200, Michael Straube wrote:
> This series removes the remaining pointers from struct hal_ops and
> the struct itself.
> 
> Note that I sent the first two patches separately yesterday, so this
> series makes the separately sent patches obsolete.
> 
> Tested with Inter-Tech DMG-02 on x86_64.

Nice work, thanks for getting rid of this unneeded structure!

greg k-h
