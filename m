Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F91FB7
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 08:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B9EC34115;
	Mon, 11 Jul 2022 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657526715;
	bh=q4hZ5dAOv+NEWL4wDWpk+yHIaXbKs/PWCF6KRLMu/O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v1A4TmeOjf5P4w0Juk+VqmGfXpqMWOOzO3QijyvW2pesY1ns7ly+dbG8kqjAlHAVF
	 8IQTd8QBKdBKxCWQemkp7m+QXHDI+MgucdBv4GapsncP6mhmS56DAzBCsMgYn+eYV4
	 xvyerp/GZ2xiKTi3K8O+b63ZxkaKbggtF5Mo6CBM=
Date: Mon, 11 Jul 2022 10:05:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Binyi Han <dantengknight@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>, Joe Perches <joe@perches.com>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: qlge: Fix indentation issue under long for
 loop
Message-ID: <YsvZuPkbwe8yX8oi@kroah.com>
References: <20220710210418.GA148412@cloud-MacBookPro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710210418.GA148412@cloud-MacBookPro>

On Sun, Jul 10, 2022 at 02:04:18PM -0700, Binyi Han wrote:
> Fix indentation issue to adhere to Linux kernel coding style,
> Issue found by checkpatch. Change the long for loop into 3 lines. And
> optimize by avoiding the multiplication.
> 
> Signed-off-by: Binyi Han <dantengknight@gmail.com>
> ---
> v2:
> 	- Change the long for loop into 3 lines.
> v3:
> 	- Align page_entries in the for loop to open parenthesis.
> 	- Optimize by avoiding the multiplication.

Please do not mix coding style fixes with "optimizations" or logical
changes.  This should be multiple patches.

Also, did you test this change on real hardware?  At first glance, it's
not obvious that the code is still doing the same thing, so "proof" of
that would be nice to have.

thanks,

greg k-h
