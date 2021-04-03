Received: from smtprelay.hostedemail.com (smtprelay0151.hostedemail.com [216.40.44.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1C259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 15:49:17 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id DE476181CA088
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 15:24:21 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2D0F118026B23;
	Sat,  3 Apr 2021 15:24:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf13.hostedemail.com (Postfix) with ESMTPA id 341331124F5;
	Sat,  3 Apr 2021 15:24:14 +0000 (UTC)
Message-ID: <eb2db42b7e721e6fbeaf8324d33801b5a9bfc03a.camel@perches.com>
Subject: Re: [PATCH v3 23/30] staging: rtl8723bs: fix comparison in if
 condition in core/rtw_recv.c
From: Joe Perches <joe@perches.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 03 Apr 2021 08:24:12 -0700
In-Reply-To: <5acf0d9573f2d9cd5d249f928fbfeee010f5f3fc.1617440834.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
	 <5acf0d9573f2d9cd5d249f928fbfeee010f5f3fc.1617440834.git.fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Rspamd-Server: rspamout02
X-Stat-Signature: zt1nspw3kad7tm9qeokqwpacs364i44y
X-Rspamd-Queue-Id: 341331124F5
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+w7r9xgpov50X4YYjx3W+YPKMYulw10ZA=
X-HE-Tag: 1617463454-954665

On Sat, 2021-04-03 at 11:13 +0200, Fabio Aiuto wrote:
> fix post-commit checkpatch issue:
> 
> CHECK: Using comparison to false is error prone
> 27: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
> +				if (psecuritypriv->
> 			bcheck_grpkey == false &&
> 
> Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index cd4324a93275..21949925ec77 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -378,7 +378,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
>  
> 
>  			} else {
>  				/* mic checked ok */
> -				if (psecuritypriv->bcheck_grpkey == false &&
> +				if (!psecuritypriv->bcheck_grpkey &&
>  				    (IS_MCAST(prxattrib->ra) == true))
>  					psecuritypriv->bcheck_grpkey = true;
>  			}


