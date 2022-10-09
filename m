Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811CD5C84
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 18:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F43C433D6;
	Sun,  9 Oct 2022 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665339664;
	bh=xeS8rOSNzyiOZUIlZl5WMMdsuP7zC5c7jALt4Demauo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHuY0IL5jxbmLLEvPQnGKM5KSKaMZjwvy0/GeSX50AR4GfUiCDNUJOYGZ5llR7fNe
	 VMSeL+tKP0FrYZeNLAL9dQqYiqGpaE33RG+oIUelUBfS9KCVYNR/YmpfI9e/9b7+Xj
	 31QNkSVtepNYVORKwgdLab5FktSJ6kVtyUaenXlU=
Date: Sun, 9 Oct 2022 20:21:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiangshan Yi <13667453960@163.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>, k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] staging: rtl8723bs: fix spelling typo in comment
Message-ID: <Y0MROo7YMrVoYyZ8@kroah.com>
References: <20221009065647.2635700-1-13667453960@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009065647.2635700-1-13667453960@163.com>

On Sun, Oct 09, 2022 at 02:56:47PM +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>

Then why is this being sent from a 163.com address?

What is wrong with using your real mail server?

> 
> Fix spelling typo in comment.
> 
> K2ci (Kylin Continuous Integration) is a code pre-verification tool
> independently developed by KylinSoft, which is used for ensuring the
> code quality of code submission. K2ci includes the comment check tool
> notes_check.
> 
> This spelling typo was found using notes_check tool.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c     | 2 +-
>  drivers/staging/rtl8723bs/core/rtw_efuse.c   | 2 +-
>  drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index d3f10a3cf972..a421c430164a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1656,7 +1656,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
>  	return res;
>  }
>  
> -/* dont call R/W in this function, beucase SDIO interrupt have claim host */
> +/* don't call R/W in this function, because SDIO interrupt have claim host */

That is not a spelling fix, but rather a "punctuation" fix if you want
to be picky :)

>  /* or deadlock will happen and cause special-systemserver-died in android */
>  u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
>  {
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 06e727ce9cc2..71800917d132 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -277,7 +277,7 @@ bool		bPseudoTest)
>  	return bResult;
>  }
>  
> -/*  11/16/2008 MH Write one byte to reald Efuse. */
> +/*  11/16/2008 MH Write one byte to real Efuse. */

The date should just be removed entirely, right?

>  u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoTest)
>  {
>  	u8 tmpidx = 0;
> diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> index 69c377eeeaf0..1c3f83867cb0 100644
> --- a/drivers/staging/rtl8723bs/include/sta_info.h
> +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> @@ -190,7 +190,7 @@ struct sta_info {
>  
>  	/* ODM_STA_INFO_T */
>  	/*  ================ODM Relative Info ======================= */
> -	/*  Please be care, dont declare too much structure here. It will cost memory * STA support num. */
> +	/*  Please be care, don't declare too much structure here. It will cost memory * STA support num. */

Same here.

thanks,

greg k-h
