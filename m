Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6520E6
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 12:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EA3C433C8;
	Sun,  2 Jul 2023 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688299356;
	bh=8bLEnUYc7wEzh+SSE9/0jlwi4h6W7dJNNRt3uf4BLDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUrM5RxqjUF/JOgKqmDozbciP2lgT9QI5eOe32JYsSTsSUxEYuQ8wCsz6LtY+Ecmx
	 D7LJO1zjDaIPNeAWHDJRoMog2JVK+kubREifRIvGskNmugyjp7R0rfnHaYJssVAo6N
	 w1dV0S/TE13204CvGS/4f0qjlp73UxyvcXzzOaRA=
Date: Sun, 2 Jul 2023 14:02:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Message-ID: <2023070254-embark-subplot-4dd4@gregkh>
References: <20230702080324.120137-1-rgallaispou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702080324.120137-1-rgallaispou@gmail.com>

On Sun, Jul 02, 2023 at 10:03:24AM +0200, Raphael Gallais-Pou wrote:
> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
> ultimately causes the module to an early exit at probe time.

So this doesn't work at all today?  Has it ever worked?  What commit
does thi fix?

> In addition the MODULE_ALIASes can be dropped.

Why?  When you say "also" or "in addition", that's a huge hint it should
be a separate patch.

thanks,

greg k-h
