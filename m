Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567006ADF
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 16:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7446C433D6;
	Thu,  8 Dec 2022 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670515283;
	bh=YlO69Sc0M8Hc8I5mYxw/iz45w3vbyvj2NPmlRe3hG4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diXhpftUYUNVV/xIU+zq/ngEF+033EtYdp0LlZUDACKMnR8/ChR42F8SMRWIyIOe4
	 Vt8EV2+2sQJglWj2gP7yrDYXyf0E3MA0eMeumH4n75T3W+M6AXdKvQz62ca9stccxA
	 MFYhVmHa0N9CI+blJQvgdyciE9cQI2myvEk5CpEg=
Date: Thu, 8 Dec 2022 17:01:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matt Jan <zoo868e@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <Y5IKUMH+mq++Kx9s@kroah.com>
References: <20221208140531.3840-1-zoo868e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208140531.3840-1-zoo868e@gmail.com>

On Thu, Dec 08, 2022 at 10:05:32PM +0800, Matt Jan wrote:
> Add a space around the "*" at vme_bridge.h to clear up a checkpatch
> check.
> 
> Signed-off-by: Matt Jan <zoo868e@gmail.com>

This series never showed up on lore.kernel.org, why not?

It seems like you are spoofing the gmail.com address?  Or is something
else going wrong on your email side?

thanks,

greg k-h
