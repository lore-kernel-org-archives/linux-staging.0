Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870372C94
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 20:13:19 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mcvTx-0003cz-34; Tue, 19 Oct 2021 22:13:09 +0200
Date: Tue, 19 Oct 2021 22:13:09 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a gcc warning
Message-ID: <20211019201309.ezngvhoddsiyms5h@viti.kaiser.cx>
References: <20211018221231.7837-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018221231.7837-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> Replace strncpy with strlcpy to fix the following gcc warning.

> drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function 'rtw_wx_set_enc_ext':
> drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
>  1929 |         strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> The destination buffer size is IEEE_CRYPT_ALG_NAME_LEN and the length
> of the string to copy is always < IEEE_CRYPT_ALG_NAME_LEN. So strlcpy
> will never truncate the string.

> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> index 51f46696a593..4f0ae821d193 100644
> --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> @@ -1926,7 +1926,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
>  		return -1;
>  	}

> -	strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
> +	strlcpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);

>  	if (pext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY)
>  		param->u.crypt.set_tx = 1;
> -- 
> 2.33.0

Hi Michael,

it's too late for another ack as Greg has already taken the patch.

Anyway, thanks for fixing the mess I created with my Makefile patches.

   Martin
