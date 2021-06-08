Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED929CA
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 14:12:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EB3760FE9;
	Tue,  8 Jun 2021 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623161538;
	bh=UU78FkBvBQ+bGhsuFu7iJ2jbXBPQNaYDh0/ReT/swaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlECTdcCEFg8WxBNBWEoa6V4TQGTwh8v5XDRZSW0dYn0HwCk3tDynaAxsS8fPAGfc
	 m9/LM9M/VMmepG/fc98rvp3VTg5ig7IMQVN42JLi85FtDPAhsyCbYQM9KnbKrMMR6u
	 ORUayTW1zbBHEEvjcERoUtDbF3tIWuqGNJeAfRF0=
Date: Tue, 8 Jun 2021 16:12:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Liu Shixin <liushixin2@huawei.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 2/2] staging: r8188eu: use eth_broadcast_addr() to
 assign broadcast address
Message-ID: <YL96vz4okNehxCBG@kroah.com>
References: <20210608141620.525521-1-liushixin2@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608141620.525521-1-liushixin2@huawei.com>

On Tue, Jun 08, 2021 at 10:16:20PM +0800, Liu Shixin wrote:
> Use eth_broadcast_addr() to assign broadcast address.

That says what you do, but not _why_ you are doing this?

Why make this change?  What benifit does it provide?

thanks,

greg k-h
