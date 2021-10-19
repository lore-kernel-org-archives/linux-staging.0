Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F422C88
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 05:51:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 336B060F46;
	Tue, 19 Oct 2021 05:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634622679;
	bh=uaEXJ3RE9jDoGR1866eq9CZgtVSDD9EmXddcscP6CJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1jaYZVkWljjguq/uRaCDjXbZY1d/6YWziRxEud/fdl9psi8BrjDBtxRFal8UnYmp
	 TADTAABlj8C415f3G1lme89lH/PXQNy4JkPpcu/xTOY3dmzXqGOeyLdPiY5xciQJgn
	 Ym44euzflVaqfq4paOqvmHy9Y9RU3ekgzBxbirCI=
Date: Tue, 19 Oct 2021 07:51:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: Remove redundant 'if' statement
Message-ID: <YW5c1BpyTKV5YpMC@kroah.com>
References: <20211017142812.4656-1-fmdefrancesco@gmail.com>
 <20211017142812.4656-4-fmdefrancesco@gmail.com>
 <YW2H63JAWKcM6+hL@kroah.com>
 <2162009.ybMk9oByy7@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2162009.ybMk9oByy7@localhost.localdomain>

On Mon, Oct 18, 2021 at 06:28:46PM +0200, Fabio M. De Francesco wrote:
> On Monday, October 18, 2021 4:42:51 PM CEST Greg Kroah-Hartman wrote:
> > On Sun, Oct 17, 2021 at 04:28:12PM +0200, Fabio M. De Francesco wrote:
> > > Remove a redundant 'if' statement.
> > > 
> > > Acked-by: Martin Kaiser <martin@kaiser.cx>
> > > Acked-by: Phillip Potter <phil@philpotter.co.uk>
> > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > ---
> > >  drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
> > >  1 file changed, 6 deletions(-)
> > 
> > Why is there not a "v2" in the subject line like the other patches in
> > this series?
> 
> Simply because I edited manually the "Subject" and overlooked to write "v2".

'git format-patchj -v 2' is your friend.

