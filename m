Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC41C32;
	Mon, 20 Mar 2023 15:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812EEC433D2;
	Mon, 20 Mar 2023 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679326949;
	bh=AZDfh3YjXnOORQifCX1A9Zi+Ke86D7+DHnwmz7SWMkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxFKTA9DCJ68FwMFyvHkg89kkx9iXcciTs2Dj8rU/ApvVRfQ/1gNcRlEm4XgNpaVD
	 rRBgOobGURRC+59mb6mfS19ydozuTpxQ1q+ZRTnM9M/DClRzEpjFf6KEYXtA7MHAiI
	 c2GLBSW6W1a+tQjCxtX8ZeqQvVDzGbVGYida0RNk=
Date: Mon, 20 Mar 2023 16:42:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3] staging: greybus: use inline function for macros
Message-ID: <ZBh+3W4eTL9IMW3n@kroah.com>
References: <20230320103258.6461-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320103258.6461-1-eng.mennamahmoud.mm@gmail.com>

On Mon, Mar 20, 2023 at 12:32:58PM +0200, Menna Mahmoud wrote:
> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> static inline function.
> 
> it is not great to have macro that use `container_of` macro,
> because from looking at the definition one cannot tell what type
> it applies to.
> 
> One can get the same benefit from an efficiency point of view
> by making an inline function.
> 
> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
> change in v2:
> 	remove newlines added in previous patch.
> 
> change in v3:
> 	fix the patch to be against Greg's tree.

I am lost in a twisty maze of patches from you for the greybus code that
all seem alike but are different :(

Can you send a patch series of the latest changes you have made, as I
really don't know what is, and is not, the latest versions at all, so
I'm going to have to drop them all from my review queue right now.

thanks,

greg k-h
