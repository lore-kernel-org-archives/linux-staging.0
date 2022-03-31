Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119F7F6
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 09:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACD7C340F2;
	Thu, 31 Mar 2022 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648717754;
	bh=AuOZchoDYiYjYJhdm9pzSMXcF4+iwRw1lSwSphKuXj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYG3ZMRWIfD3jvNxp98TSxHaWdteoiSezZEWsB2v0ZwQIzP/N+EFrILUFsV3ecq/n
	 GpSxhbIj7RcQ5CrO1KX3+Xd9iENao8swF4V6J0BsjF5bleqm3c5d1/QaKPaRpPVnlD
	 eWt7z7GajHWvVCbksEK8QxnLuFC6ftNNqAD2I4dc=
Date: Thu, 31 Mar 2022 11:09:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: change the allocation type of
 pdata_attr
Message-ID: <YkVvr/Pxfud21Mut@kroah.com>
References: <tencent_884B806033C3E7D6734450A085172A55FF0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_884B806033C3E7D6734450A085172A55FF0A@qq.com>

On Thu, Mar 31, 2022 at 03:37:00PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> `pdata_attr` was allocated by kzalloc() in go_add_group_info_attr(), but
> there is a lack of error handlers along the call chain it lies and the
> lifetime of `pdata_attr` is only in go_add_group_info_attr().
> Therefore, changing it to a local variable on stack like the other
> functions in rtw_p2p.c is a possible choice, such as
> `u8 p2pie[MAX_P2P_IE_LEN] = { 0x00 };` in build_probe_resp_p2p_ie()
> which is the caller of go_add_group_info_attr().
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_p2p.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
> index e2b6cf2..f1a5df8 100644
> --- a/drivers/staging/r8188eu/core/rtw_p2p.c
> +++ b/drivers/staging/r8188eu/core/rtw_p2p.c
> @@ -27,15 +27,14 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
>  	struct list_head *phead, *plist;
>  	u32 len = 0;
>  	u16 attr_len = 0;
> -	u8 tmplen, *pdata_attr, *pstart, *pcur;
> +	u8 pdata_attr[MAX_P2P_IE_LEN] = { 0x00 };

As I said before, this is way too big to put on the stack.

