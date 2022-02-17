Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F64341
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 14:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B496CC340E8;
	Thu, 17 Feb 2022 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645109873;
	bh=HrzRuGxXxj1uEEHmrmqfEzcWIpxaXqGuQjxOWM2QryU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1pgJkTcXnFqBwDNMQdVH3Mpe+y2kNs8JCs6DdvQtXQVe9bm2H39LhTmnYZht6mril
	 9zHNb3FqdSBlLkAiXH4/2mRmTkMoRDdDMP0xfafCZ00qoSaBT23lO9vDMA4oQ8NJIj
	 Hkq1wJVXJQZyzkMAQVF1izWUtjH7Tfi04cY4Yyek=
Date: Thu, 17 Feb 2022 15:57:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: jerome.pouiller@silabs.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wfx: check the return value of devm_kmalloc()
Message-ID: <Yg5ibnScTz37yfCw@kroah.com>
References: <tencent_437C4189E07F1CC482B923779E839DA23005@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_437C4189E07F1CC482B923779E839DA23005@qq.com>

On Wed, Feb 16, 2022 at 08:25:20PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> devm_kmalloc() returns a pointer to allocated memory on success, NULL
> on failure. While there is a memory allocation of devm_kmalloc()
> without proper check. It is better to check the return value of it to
> prevent wrong memory access.
> By the way, all the error handlers of this function return without
> calling ieee80211_free_hw(hw), which may result in memory leak. So I
> add one err label to unify the error handler.

This is doing 2 different things in one patch.  Please submit this as 2
different patches, the first one doing the error handling for the
existing "return" statements, and then the second one for the
devm_kmalloc() test.

thanks,

greg k-h
