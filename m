Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888BF2F5D
	for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 15:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C970FC433D6;
	Wed, 31 Aug 2022 15:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661958345;
	bh=Q6d3pDRoHtTi4NS/RK8aEsh0CDoq9zHRXkuK0tuD5mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eAzm/pYjBtK92yRC1zmrWaRRsimNleP4z4iPkPHSjZMtGi8dzdDwzhd7zFXiZUXlb
	 0MnMkn8CIhLn36hDhWXHfoRgGKOLdxlroVcndMB7GKmE///z6RtRXJ9n7UVpx8B/KF
	 wFRWt8qZ2Ke8rYx7eVqmMLhgJnb6OdsykqKmPNc4=
Date: Wed, 31 Aug 2022 17:05:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: cgel.zte@gmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	martin@kaiser.cx, straube.linux@gmail.com, abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] staging: r8188eu: remove redundant variable
 ret
Message-ID: <Yw94xsOp6gvdS0UF@kroah.com>
References: <20220831144529.304636-1-cui.jinpeng2@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831144529.304636-1-cui.jinpeng2@zte.com.cn>

On Wed, Aug 31, 2022 at 02:45:29PM +0000, cgel.zte@gmail.com wrote:
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> 
> Return value directly from rtw_set_wpa_ie() instead of
> getting value from redundant variable ret.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Again, please read the documentation for how to properly report issues
found by research tools.

> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

And again, how do I know this is the correct address, it was sent from a
random gmail.com address.  Until I get some sort of confirmation from
the zte.com.cn developers that I can accept patches from patches outside
of their domain, I am going to be safe and not do so.

thanks,

greg k-h
