Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D572
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 02:05:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9266560F9C;
	Wed, 28 Jul 2021 02:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627437915;
	bh=2pHGTZ3zG2izbzSDc/FoK6QLfwWAp2guM0LU9c0ReoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A90UDbvYC68sVjy8WS8RsYKs+VyQnHbePNodp+Mph5MJd1I4oIlaX+oskjcTjKTyH
	 yQ7mTTTNdv2h+JXdWv1KSFEc7PjWzPD6+c34uce4NAaAc1bic5Idu3jxsehfLL6Eij
	 mARz6S+1199MQ2Upy0mfQnwpDIJrFHEl93pv8eXy4T1H4MHPRRCGAxGQywIOjH/ISG
	 ZQfRRT3l9E/AZ+djOHJp8RsjaL+YqCgcVrG+OebfxlYzxYZslrcvKQ+G8STZSl/MiW
	 A46vS61UDoPhBUZWvI5rnvf6u//RdOKM+e6TXxw5V+iHumywol5vccdZwZaFpyXjlS
	 4vjW7Esac6Huw==
Date: Tue, 27 Jul 2021 21:07:45 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 03/64] rpmsg: glink: Replace strncpy() with strscpy_pad()
Message-ID: <20210728020745.GB35706@embeddedor>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-4-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-4-keescook@chromium.org>

On Tue, Jul 27, 2021 at 01:57:54PM -0700, Kees Cook wrote:
> The use of strncpy() is considered deprecated for NUL-terminated
> strings[1]. Replace strncpy() with strscpy_pad() (as it seems this case
> expects the NUL padding to fill the allocation following the flexible
> array). This additionally silences a warning seen when building under
> -Warray-bounds:
> 
> ./include/linux/fortify-string.h:38:30: warning: '__builtin_strncpy' offset 24 from the object at '__mptr' is out of the bounds of referenced subobject 'data' with type 'u8[]' {aka 'unsigned char[]'} at offset 24 [-Warray-bounds]
>    38 | #define __underlying_strncpy __builtin_strncpy
>       |                              ^
> ./include/linux/fortify-string.h:50:9: note: in expansion of macro '__underlying_strncpy'
>    50 |  return __underlying_strncpy(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~
> drivers/rpmsg/qcom_glink_native.c: In function 'qcom_glink_work':
> drivers/rpmsg/qcom_glink_native.c:36:5: note: subobject 'data' declared here
>    36 |  u8 data[];
>       |     ^~~~
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 05533c71b10e..c7b9de655080 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1440,7 +1440,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  		}
>  
>  		rpdev->ept = &channel->ept;
> -		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
> +		strscpy_pad(rpdev->id.name, name, RPMSG_NAME_SIZE);
>  		rpdev->src = RPMSG_ADDR_ANY;
>  		rpdev->dst = RPMSG_ADDR_ANY;
>  		rpdev->ops = &glink_device_ops;
> -- 
> 2.30.2
> 
