Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77B7F
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 07:35:54 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1oXdym-0006OW-40; Mon, 12 Sep 2022 09:35:40 +0200
Date: Mon, 12 Sep 2022 09:35:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: r8188eu: add kfree() on an error path of
 rtw_xmit_resource_alloc()
Message-ID: <20220912073540.l7z56kgjde47r3pr@viti.kaiser.cx>
References: <tencent_3B46EE3287288555389AD2EC3F388827B306@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3B46EE3287288555389AD2EC3F388827B306@qq.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote xkernel.wang@foxmail.com (xkernel.wang@foxmail.com):

> From: Xiaoke Wang <xkernel.wang@foxmail.com>

> In rtw_xmit_resource_alloc(), if usb_alloc_urb() fails, then the memory
> `pxmitbuf->pallocated_buf` which is allocated by kzalloc() is not properly
> released before returning.
> So this patch adds kfree() on the above error path to release it in time.

> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description.
> v2->v3 rebase.
> v3->v4 update the description.
> v4->v5 rebase and update the corresponding subject and description.
> Note that the original function name was changed, so the subject of this
> patch is updated from "[PATCH v4] staging: r8188eu: fix potential memory
> leak in rtw_os_xmit_resource_alloc()" to "[PATCH v5] staging: r8188eu: add
> kfree() on an error path of rtw_xmit_resource_alloc()".
> In addition, thanks to Philipp Hortmann for his testing and advice.
>  drivers/staging/r8188eu/core/rtw_xmit.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
> index 67f9c05..9c39d08 100644
> --- a/drivers/staging/r8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/r8188eu/core/rtw_xmit.c
> @@ -44,8 +44,10 @@ static int rtw_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf *px
>  	pxmitbuf->dma_transfer_addr = 0;

>  	pxmitbuf->pxmit_urb = usb_alloc_urb(0, GFP_KERNEL);
> -	if (!pxmitbuf->pxmit_urb)
> +	if (!pxmitbuf->pxmit_urb) {
> +		kfree(pxmitbuf->pallocated_buf);
>  		return _FAIL;
> +	}

>  	return _SUCCESS;
>  }
> -- 

Reviewed-by: Martin Kaiser <martin@kaiser.cx>
