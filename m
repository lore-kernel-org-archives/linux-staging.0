Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291612C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:43:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 418986112D;
	Thu, 25 Nov 2021 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637858596;
	bh=N/jdimBGeacM/sqHqyrWLbH0xJ6Ub0wkYUVmtUU3vzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Myb59he5cu2+2ClHd93Jw5jhE3gRQvrbmeHrI0gNncRvvOjBKSZszotgCm3mYWGM9
	 OxpDTwNXoVXchkZCJpzPLllBuqsqA4CuCZ/r45yOUJJElYuX476aScLkM8B4BwLHt3
	 85tIXzGxhs4KWjtTXsOWfEUxzuAMFvjbPHbYtAGs=
Date: Thu, 25 Nov 2021 17:43:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Satoshi Ikeke <satoshi.ikeke@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace printk(KERN_CRIT...) by
 netdev_crit()
Message-ID: <YZ+9ICwGXxuIJ6g7@kroah.com>
References: <YZkb3t83RFxVMWH4@debian>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZkb3t83RFxVMWH4@debian>

On Sat, Nov 20, 2021 at 11:01:34AM -0500, Satoshi Ikeke wrote:
> Replace printk(KERN_CRIT...) by netdev_crit() for more uniform error reporting. Issue found by checkpatch.

Please properly wrap your changelog comments at the correct line width.

Please fix up and send a v2.

thanks,

greg k-h
