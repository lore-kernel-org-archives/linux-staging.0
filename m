Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C983D60;
	Thu, 20 Oct 2022 15:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA82FC433D6;
	Thu, 20 Oct 2022 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666278008;
	bh=OFeNuLuhtNbSF5lAejx5iAH9B5SR/HHR8g8Rex0/S58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/6TAO9OZLddLi7hzNQ47kbDUwdm7xxtYbNCQMheQOcTumx9B1KNEbCTaY/QEqGHN
	 ibgfrsLxebQ4CatSanQ9Mw8rh3RCwa97hjO7N/b13PrfawzdL0EGo45RoPtH1ob665
	 z9I/3d4e3DW9/5LwjVi7U3636RyVNjur3y+i5azM=
Date: Thu, 20 Oct 2022 17:00:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1FidbSpv6cxuqjg@kroah.com>
References: <Y1ExXEuhV3cJnTiD@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1ExXEuhV3cJnTiD@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Thu, Oct 20, 2022 at 11:30:36AM +0000, Tanjuate Brunostar wrote:
> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> Put the first parameter immediately after the '(' and align the other
> parameters underneath it.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> 
> ---
> v2: put static and void on the same line and adjusted the indentation as
> suggested by Greg KH
> ---
> v3: Reformat the code by inserting tabs and white space as recommended
> by Nam Cao and Julia Lawall

I see 2 "v3" patches sent to the list, yet they are different.  So I
don't know which one is correct :(

Please resend a v4 with the correct change.

thanks,

greg k-h
