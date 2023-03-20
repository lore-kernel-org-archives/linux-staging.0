Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893071C32;
	Mon, 20 Mar 2023 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42DBC4339B;
	Mon, 20 Mar 2023 15:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679327078;
	bh=jVotV7PCuo3EryZ0m72dclvZaKdhsKt6vWYQUGWl+Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIErnD8Dlq7lahLhcQ2DSNbfuMCt3VOzs/F1c769vyiZeqQLydKac4C1Gv/jKwmHF
	 9gx6TyrE5SWEx9mJumQM9lMc/gatI5rUOBN0rEbwwRje1Q9o/JGq0h+z0R3ZYp39C2
	 ulsWZO+N4uLWS1inS5KdJg96dWWfP0MeLBLNNGyY=
Date: Mon, 20 Mar 2023 16:44:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, drv@mailo.com, dave@stgolabs.net,
	yang.lee@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] staging: most:  use inline functions for iface_to_hdm
Message-ID: <ZBh/Yw49fubf1GDb@kroah.com>
References: <20230320103335.6479-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320103335.6479-1-eng.mennamahmoud.mm@gmail.com>

On Mon, Mar 20, 2023 at 12:33:35PM +0200, Menna Mahmoud wrote:
> Convert `iface_to_hdm` macro into a static inline function.
> it is not great to have macro that use `container_of` macro,
> because from looking at the definition one cannot tell
> what type it applies to.
> 
> One can get the same benefit from an efficiency point of view
> by making an inline function.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/most/dim2/dim2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Your subject line has a "  " when it should have just a " " :(

Please fix up and send a v2.

thanks,

greg k-h
