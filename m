Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17F1168
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 18:33:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A992660F36;
	Mon,  2 Aug 2021 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627929184;
	bh=Gp55IMxWThXtmCfrpnaEerzWfp54LlNnVwr7XJmciyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXCmVA4bhRQ3M4xtfnibX/ozr6S9KS8+wMeUb80Q5m+BhjAF7l1/j19GWefFytcT5
	 DYBIBR3u9ecQ0C1D190C46AWHg/qx0qgP8d+1TX3bVw5ftSWx4D8pgAtutSv4tdus+
	 uaipDMPyYcnbrLcYKMY8Fx/Law+d6z8l+HSb9zik=
Date: Mon, 2 Aug 2021 18:01:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging: r8188eu: core: Change the length of an array
Message-ID: <YQgW0z+TnCORCtaL@kroah.com>
References: <20210802155817.8179-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802155817.8179-1-fmdefrancesco@gmail.com>

On Mon, Aug 02, 2021 at 05:58:17PM +0200, Fabio M. De Francesco wrote:
> IPX_NODE_LEN == 6, while addr.f1 should only have 4 elements.
> Replace IPX_NODE_LEN with 4. In the while, remove the excess spaces
> before the fields of the union.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

What is the commit id that this patch fixes?

thanks,

greg k-h
