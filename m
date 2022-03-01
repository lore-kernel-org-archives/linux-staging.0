Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7C75EC5
	for <linux-staging@lists.linux.dev>; Tue,  1 Mar 2022 21:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E9AC340EE;
	Tue,  1 Mar 2022 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646170384;
	bh=zE5U46KEpiwIEu/kdY8+1tmSvfPUtdtjtmQqm1hgKqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCd8bX5e5w0bK9HR+1GZFoX4DBLQmRuWh04a36e21zm0vzMvjxmOgrvUN0Eazy1ds
	 FCaWt2mRzcLdNNJyEii+QExTNGAJw3ekERTmMT59ts0nSpDZrscwF/d454HdPbJV9r
	 aHt+JbmZfaX1F5bCfycXd18FM1WJ0soVucNb3nFg=
Date: Tue, 1 Mar 2022 22:33:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samuel =?iso-8859-1?Q?Sj=F6berg?= <info@samuelsjoberg.se>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: fix Lines should not end with a '('.
Message-ID: <Yh6RDn1+q6yfo1EG@kroah.com>
References: <20220301205936.3096-1-info@samuelsjoberg.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301205936.3096-1-info@samuelsjoberg.se>

On Tue, Mar 01, 2022 at 09:59:36PM +0100, Samuel Sjöberg wrote:
> Fix the following error reported by checkpatch.pl:
> 
> CHECK: Lines should not end with a '('
> +                                       retval = ms_transfer_tpc(
> 
> Signed-off-by: Samuel Sjöberg <info@samuelsjoberg.se>
> ---
>  drivers/staging/rts5208/ms.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

This does not show up on lore.kernel.org, are you sure your email domain
is correct?  I get a failure when trying to verify your email using
normal tools, so I think it is getting dropped.

thanks,

greg k-h
