Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ADB28E3
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 15:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4717C433EF;
	Mon, 30 Jan 2023 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675091888;
	bh=cetnjI2pIEvb88AtbDqKJWriBmwrANJ8A5ZPKyKWqZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIyCwwil78M1e388tlGTouqOIRBa3us8+y8ZgiZbYp2pTDQEezh3G+zwikJKpEL4O
	 mycxSyZ5CORESO+o/yQcn/x5dG3XFDiEYNh1tJnKnHXEOEy0cA9tCRa9jf3Gy+4046
	 rBQZ4NqJ54Epc0u8StrBzzBaP+uvmbQs1Dcb2+Bs=
Date: Mon, 30 Jan 2023 16:18:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jongwoo Han <jongwooo.han@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vc04_services: mmal-vchiq: fix typo in comment
Message-ID: <Y9ffrfjQ6ElhV3/Z@kroah.com>
References: <20230130145400.40890-1-jongwooo.han@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130145400.40890-1-jongwooo.han@gmail.com>

On Mon, Jan 30, 2023 at 11:54:00PM +0900, Jongwoo Han wrote:
> Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can not take patches without any changelog text at all, sorry.

greg k-h
