Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2CD3FE0
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 13:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44382C3411E;
	Mon,  4 Jul 2022 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656941334;
	bh=UGnIdqdBxNS5V8l3XnavsywBcc/KKsgR2KpDIw2DxHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f06TrNSm0XLVypKRo0cqVQzmI6jqhrKtN1xkocjPtevZWacNo1MzGSbM5NyVXnHyk
	 sOIlNkRmIf4cyLknP5u7pjzRnOUJ1MEUjlVnKmN/lYfrPYoJ6Rlri/3n3VXBf0Xnhd
	 IPK2ERXBu0Zo4iK3tvcogFh+v3MmCrk1oM+Th7B0=
Date: Mon, 4 Jul 2022 15:28:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Huang Zetao <huangzetao1@huawei.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	straube.linux@gmail.com, martin@kaiser.cx, abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev, inux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] staging: r8188eu: Use eth_broadcast_addr() to
 assign broadcast address
Message-ID: <YsLq5vXtJgLWCqqz@kroah.com>
References: <20220704031516.79705-1-huangzetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704031516.79705-1-huangzetao1@huawei.com>

On Mon, Jul 04, 2022 at 03:15:16AM +0000, Huang Zetao wrote:
> Using eth_broadcast_addr() to assign broadcast address instead of memset().
> 
> Signed-off-by: Huang Zetao <huangzetao1@huawei.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

{sigh}

Sorry, but no, I am going to now have to just ignore patches from your
domain.

greg k-h
