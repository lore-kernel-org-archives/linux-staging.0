Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469C2C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 11:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA03C341C9;
	Sun,  5 Dec 2021 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638702222;
	bh=oRGP/ta5t+1nOoDu2mLF02x3hunvstyw3cZxRZv2vyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1HwuYftcHlP4kqPb0LJmRDiKhWSoKfLS3/k5k5JszqoTXKN5gcNY+mnb4YeOqZAze
	 zOd6PThpULSXGDgMGqXLIWVurJHDwQFN2lPYzGn6JOKD3xWgvUI1NpvAARxg3CQJoC
	 MGSjB8kEZdFKBUc/sm20vZkk1KK8yxcI+t0bPn2Q=
Date: Sun, 5 Dec 2021 12:03:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: remove unused variable byMinChannel
Message-ID: <YaycjDWo2QJBTz1t@kroah.com>
References: <20211204113407.3941035-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211204113407.3941035-1-alb3rt0.m3rciai@gmail.com>

On Sat, Dec 04, 2021 at 12:34:04PM +0100, Alberto Merciai wrote:
> Remove set but not used variable byMinChannel.
> 
> Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> ---
> 
> v1 -> v2
> - Add Signed-off-by

I have a number of patches from you for this driver, all in different
orders and some being obsoleted by others, making this impossible for me
to easily determine what is, and what is not, viable for applying and in
what order.

Can you please resend all of your pending patches, in a patch series,
properly numbered, so that I have a chance of understanding this?

I have now dropped all of your pending patches from my review queue.

thanks,

greg k-h
