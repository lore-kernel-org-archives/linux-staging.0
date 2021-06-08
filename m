Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7FF2F80
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 17:01:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54C5E60FE4;
	Tue,  8 Jun 2021 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623171697;
	bh=ecAe+OhfU7J/o9ZJKIEooMrENgN6FtOPvUjyKlTezLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvYXMxy9EqfNOZrD6OyZq80jsNMUhxmNVdhPMZp5pJdFdMgnrey1dXVPYlyZyHkMA
	 8UplhOcvGl5hboKO94NVZb/ZMAixQLxCWwSJy6/AMJgnnGsJbdOi3zNcViMUcaNNvE
	 yttLwCKT2YSNnCBN0R80LMLG2WLthddgoaJWWmps=
Date: Tue, 8 Jun 2021 19:01:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Cc: Liu Shixin <liushixin2@huawei.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 2/2] staging: r8188eu: use eth_broadcast_addr() to
 assign broadcast address
Message-ID: <YL+ib+tJwKckXagY@kroah.com>
References: <20210608141620.525521-1-liushixin2@huawei.com>
 <YL96vz4okNehxCBG@kroah.com>
 <b77a3e7b0923344e8c5b9b17f4788d28f3ccfb4f.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77a3e7b0923344e8c5b9b17f4788d28f3ccfb4f.camel@perches.com>

On Tue, Jun 08, 2021 at 09:45:49AM -0700, Joe Perches wrote:
> On Tue, 2021-06-08 at 16:12 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 08, 2021 at 10:16:20PM +0800, Liu Shixin wrote:
> > > Use eth_broadcast_addr() to assign broadcast address.
> > 
> > That says what you do, but not _why_ you are doing this?
> > 
> > Why make this change?  What benifit does it provide?
> 
> The commit message is clear and concise as using available kernel
> mechanisms is better than homegrown or duplicative ones.
> 
> Are you asking merely becuse Liu Shixin hasn't had many staging
> commits?

I'm asking because this changelog text does not explain why this is
needed at all and needs to be changed to do so.

thanks,

greg k-h
