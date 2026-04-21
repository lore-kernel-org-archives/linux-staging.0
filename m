Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F8282F02
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784965; cv=none; b=E3/TsVqF6Zw93EP3fO8bd2LiTQpwBd0ukXx1y4PU1gnbS55+xHHe7ty7rIHeh72H6WZkuDNayyjx9mG/4KJxHegvDNaUMAKlfac+FjKyGevO7Va4annne7Z/DP5saMnqeaIhdQlGc73TYU3XrC10JM80rr5RRyaIQdj6y2/Vci4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784965; c=relaxed/simple;
	bh=HMNvGqLv040NZfv6YZcZCu7mmmkWMxHN0x+jgkbGw/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFw8Iz676oye7ULQh0N+2LqbvW/qX23NmPjoDC3ItZvD/HGbMSjkWx+xB/1efD6E4p3ShIoGw0vl+TpSQnuIGdjn4QL4wrhpO5XUXg7qVe0kCyV/snpm84uMnYIBW7rKfhqfylN+cQFHA1UXJdRY/FrbZp69kYqV2P7kGc4Gi1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u7xUhSBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u7xUhSBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A11DC2BCB0;
	Tue, 21 Apr 2026 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776784964;
	bh=HMNvGqLv040NZfv6YZcZCu7mmmkWMxHN0x+jgkbGw/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7xUhSBA6kK3ByPmsxFCTmrYjKJaqOMjXqKGRRDO23d9K8HLanhQKogcc+nh/OkOn
	 0zcZIJiN3GSFV1aR97x4V33Mu5rZkfcs2rf1GeY/mKQ/BcMiIj6/7964yQ7ffwDofV
	 UcLqyVtNUFNC2hYuBPvJtnQ/SNZlvCQRRAZOQ6bI=
Date: Tue, 21 Apr 2026 17:22:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matan Cohen <matan@matanco.space>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com
Subject: Re: [PATCH] staging: most: video: replace BUG_ON with WARN_ON_ONCE
 and add recovery
Message-ID: <2026042135-fragile-bluff-024c@gregkh>
References: <20260420113503.62552-1-matan@matanco.space>
 <aeY0vL0SEteMZUbz@stanley.mountain>
 <eb5f1c7f-f363-49a0-9a3e-5bf8923ffca9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb5f1c7f-f363-49a0-9a3e-5bf8923ffca9@app.fastmail.com>

On Tue, Apr 21, 2026 at 06:15:29PM +0300, Matan Cohen wrote:
> On Mon, Apr 20, 2026, at 5:14 PM, Dan Carpenter wrote:                                                                                                                                                                                                                     
>   > I always dread these kinds of patches...  The comment is useless.  Way
>   > too vague and kind of wrong also.  I want to see a much more thorough                                                                                                                                                                                                    
>   > explanation.
>                                                                                                                                                                                                                                                                              
>   Hi Dan and Greg's bot,                                                                                                                                                                                                                                                                    
>    
>   First of All Thank you for the review and quick reply. 
>   This is my first time Contributing, I wanted to start with something well contained that I found using checkpatch.pl
> 
> My intention was twofold:                                                                                                                                                                                                                        
>                                                             
>   1. Replace BUG_ON with WARN_ON_ONCE — the kernel should not crash                                                                                                                                                                                                          
>      unconditionally here since the cleanup above already completed.

Note, you have trailing whitespace in yoru email client, please fix that
up.

Anyway, you can not replace BUG_ON() with WARN_ON() and expect the crash
to go away due to panic-on-warn being an option that a few billion Linux
systems have.  If this type of thing can happen, then handle it properly
and deal with it, otherwise if it is so bad that all data will be lost,
live with the BUG_ON().

thanks,

greg k-h
