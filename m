Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CA770
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 09:23:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6705860232;
	Mon,  7 Jun 2021 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623057805;
	bh=A4zAYvAyANbFqhltJKq2zyoNqrB3rlfLtGKwOWMjzTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpt7xkkvmewiElQQWNxsRbWGWMDyRcMFFSBuUq7jYs9pNInxR1c8kEUT6qBYhOB5b
	 iEkhfZbmpWeJgyPPhVfFHkqG51sWeQdv17qm5qesWti+UnV29W55AeiV2sA9fM5F0g
	 MYaya5iNBq8fBy4KzX12+khVuzgl6OXwhWa9tLbs=
Date: Mon, 7 Jun 2021 11:23:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wenli Looi <wlooi@ucalgary.ca>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
Message-ID: <YL3lih8OqGOLjVBf@kroah.com>
References: <20210606070021.116284-1-wlooi@ucalgary.ca>
 <20210607083316.GO1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607083316.GO1955@kadam>

On Mon, Jun 07, 2021 at 11:33:17AM +0300, Dan Carpenter wrote:
> Greg asked about struct holes and the answer is "= {}" will zero out
> struct holes but it's not important in this case.  The "= {}" is a GCC
> extension for zeroing structs and it's not part of the C standard.
> The struct has a kernel pointer in it so we had better not be shairing
> it to user space.

I thought we proved that "= {}" will _NOT_ zero out holes in structures.
Or did we really prove that?  I can't remember now, do you?

thanks,

greg k-h
