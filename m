Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03CB20E3
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 04:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2776EC433D6;
	Thu, 13 Oct 2022 04:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665636347;
	bh=tycp+HpY7xFT7uu/g1Wk0+ZRaC+dObiE4v4oSVgzYOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOLJqZvpLwVqqqyza4XnyTcw6r87BdqvfKNi6SxUn43OfNLBAShpSQfOD8eWZvQJc
	 dDatoFIjuAHyYCxfFgCyzNcs+uLYFW7xBf7dCmvq6VzrHDCbb1p6u9hesjlR1/Yuhl
	 neXTh2Yq+CdIYNJAD6cMGdzI3glL0VqdGZszCT80=
Date: Thu, 13 Oct 2022 06:46:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	remckee0@gmail.com, martin@kaiser.cx, straube.linux@gmail.com,
	makvihas@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.19 47/63] staging: r8188eu: fix a potential
 memory leak in rtw_init_cmd_priv()
Message-ID: <Y0eYJ/LujniobZLu@kroah.com>
References: <20221013001842.1893243-1-sashal@kernel.org>
 <20221013001842.1893243-47-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013001842.1893243-47-sashal@kernel.org>

On Wed, Oct 12, 2022 at 08:18:21PM -0400, Sasha Levin wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> [ Upstream commit 06bfdb6d889f57fe9ce7bd139ce278b68f3a59de ]
> 
> In rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
> in failure, then `pcmdpriv->cmd_allocated_buf` will not be properly
> released. Besides, considering there are only two error paths and the
> first one can directly return, we do not need to implicitly jump to the
> `exit` tag to execute the error handling code.
> 
> So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error
> path to release the resource and simplified the return logic of
> rtw_init_cmd_priv(). As there is no proper device to test with, no
> runtime testing was performed.
> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> Link: https://lore.kernel.org/r/tencent_1B6AAE10471D4556788892F8FF3E4812F306@qq.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

This isn't needed in stable trees, please drop from all branches.

greg k-h
