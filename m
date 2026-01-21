Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBAB288C2F;
	Wed, 21 Jan 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002061; cv=none; b=InMb423/5XGrdqCsHwdkWmPPz7XU7I4nxm519hfWdhO+ub6UugNpGSvbEu2fjPlWAGM9+thUu47spO+zkgZqHf4B4xNfBCfA5kTKVAXoe98jUo32RZOkaIEzDPNFJUWuD1Xj5ejn7YJkn8ETf0SXnGw+XGSrmU+AqcO3jE/AjAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002061; c=relaxed/simple;
	bh=mXwjGYgm+XfeEX1I3oOP8gcnJxsrC+KmCZKgdD/Ex2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxZc85q/SuKLy/HLbaaWhR5jpjpcKlpZarux8IX8uzkIqtFqBS1Jy8eXqtRJ9d+CE3qFvbYG4XW7qes2uBDIyIGIL/JjNsqh2e+TKKfsCf/xgp3d/Ph9GVJ1gaorFWFv5dGbvstOPQqSbE2PLOhLIdI7g6PFmbtNp/aOITTLAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uq60M0FZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uq60M0FZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B00C116D0;
	Wed, 21 Jan 2026 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769002061;
	bh=mXwjGYgm+XfeEX1I3oOP8gcnJxsrC+KmCZKgdD/Ex2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uq60M0FZVsxXXK74mlPQp4omKEShndVaDuEFu5bbqHQVJMijjvyRl5QnEJ3gMqBRb
	 Zh4o4pfLpkWH8HqLqSJPNniVq5RyuQpH4nABhAUw+sGepFaUD9757FTB6fLwb2uGIz
	 SnerSBBmBxdpdZHUh+P67I6WzDZA/kCpG3WFETsY=
Date: Wed, 21 Jan 2026 14:27:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: 2023060904@ycu.edu.cn, linux-staging@lists.linux.dev,
	guagua210311@qq.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtl8723bs: Refactor continual_io_error check
Message-ID: <2026012117-blinks-smitten-5874@gregkh>
References: <2026011937-snugness-movie-9e32@gregkh>
 <5A122A378F3E53A7+20260120141129.8262-1-2023060904@ycu.edu.cn>
 <aXDTJIERbdMPN8-b@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXDTJIERbdMPN8-b@stanley.mountain>

On Wed, Jan 21, 2026 at 04:22:44PM +0300, Dan Carpenter wrote:
> On Tue, Jan 20, 2026 at 10:11:25PM +0800, 2023060904@ycu.edu.cn wrote:
> > From: Changjun Zheng <guagua210311@qq.com>
> > 
> > Refactor the error count check logic to follow kernel 'single responsibility' principle:
> > 1. Move the increment logic (atomic_inc) from rtw_inc_and_chk_continual_io_error() to its callers in sdio_ops_linux.c (line 226/302)
> > 2. Keep only the check logic in rtw_inc_and_chk_continual_io_error() (use atomic_read to get current count)
> > 
> > This change addresses Greg KH's feedback to move increment to callers, while keeping atomic operations to ensure no compilation/run-time errors.
> > 
> 
> There are a lot of style issues in this patch.  I also still don't
> really understand why we are doing this.  Was Greg's email this one?
> 
> https://lore.kernel.org/all/2025121757-crowbar-junkman-a96a@gregkh/
> 
> I'm guessing that Greg wants you to change this to refcount_t.

Nope!  Please don't do that, it's not needed at all.

greg k-h
