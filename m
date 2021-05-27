Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D82FB9
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 12:13:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B476613AA;
	Thu, 27 May 2021 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622117580;
	bh=WZlLrGiAfimJpbKiCXTF3f4pAK3pDk1vE3WUqLZZ720=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYV+yWlL//W+NZUTY1CPRBHDR2thsamhs1IogKgRvgauvtS9osicQZO4QS5DyNWUC
	 NWS42AAbvPUHQkyJN7JXCwTxr2j1vdxfi+HGW78qv0gcPTaQPWYZ5Sb4fae7UqiFcA
	 ZWFddqngKHOobjE2DTHmR3GZWBcxA8VxcavUAUA0=
Date: Thu, 27 May 2021 14:12:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Baokun Li <libaokun1@huawei.com>
Cc: ross.schm.dev@gmail.com, fabioaiuto83@gmail.com, marcocesati@gmail.com,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, weiyongjun1@huawei.com,
	yuehaibing@huawei.com, yangjihong1@huawei.com, yukuai3@huawei.com
Subject: Re: [PATCH -next] staging: rtl8723bs: Remove set but not used
 variable 'reason_code'
Message-ID: <YK+Mye9eXudCf6/r@kroah.com>
References: <20210527120210.321810-1-libaokun1@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210527120210.321810-1-libaokun1@huawei.com>

On Thu, May 27, 2021 at 08:02:10PM +0800, Baokun Li wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function 'OnAction_back':
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1729:30: warning:
>  variable ‘reason_code’ set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.
> 
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 9fc612fb736f..97b3c2965770 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1721,7 +1721,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
>  	struct recv_reorder_ctrl *preorder_ctrl;
>  	unsigned char 	*frame_body;
>  	unsigned char 	category, action;
> -	unsigned short	tid, status, reason_code = 0;
> +	unsigned short	tid, status;
>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>  	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
>  	u8 *pframe = precv_frame->u.hdr.rx_data;
> @@ -1790,9 +1790,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
>  					~BIT((frame_body[3] >> 4) & 0xf);
>  				psta->htpriv.candidate_tid_bitmap &=
>  					~BIT((frame_body[3] >> 4) & 0xf);
> -
> -				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
> -				reason_code = get_unaligned_le16(&frame_body[4]);
>  			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
>  				tid = (frame_body[3] >> 4) & 0x0F;
>  
> -- 
> 2.25.4
> 

Does not apply to my tree.  Are you _sure_ you are using the latest
version of linux-next?

thanks,

greg k-h
