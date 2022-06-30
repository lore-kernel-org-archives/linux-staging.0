Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BC7B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 11:59:01 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1o6sor-0008S7-1B; Thu, 30 Jun 2022 13:58:49 +0200
Date: Thu, 30 Jun 2022 13:58:49 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] staging: r8188eu: remove unneeded semicolon
Message-ID: <20220630115848.hkzavd67cwjubjq4@viti.kaiser.cx>
References: <20220630090937.4983-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630090937.4983-1-yang.lee@linux.alibaba.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Yang Li (yang.lee@linux.alibaba.com):

> Eliminate the following coccicheck warning:
> ./drivers/staging/r8188eu/hal/HalPwrSeqCmd.c:70:2-3: Unneeded semicolon

> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/staging/r8188eu/hal/HalPwrSeqCmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
> index b5f6d41464db..5b0f66573d94 100644
> --- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
> +++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
> @@ -67,7 +67,7 @@ u8 HalPwrSeqCmdParsing(struct adapter *padapter, enum r8188eu_pwr_seq seq)
>  		break;
>  	default:
>  		return false;
> -	};
> +	}

>  	do {
>  		pwrcfgcmd = pwrseqcmd[aryidx];
> -- 
> 2.20.1.7.g153144c

Thanks for spotting this.

Fixes: df8d0a55047b ("staging: r8188eu: make power sequences static")
Reviewed-by: Martin Kaiser <martin@kaiser.cx>
