Received: from smtprelay.hostedemail.com (smtprelay0125.hostedemail.com [216.40.44.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555502101
	for <linux-staging@lists.linux.dev>; Wed,  4 May 2022 07:36:28 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 7C22318160AC3
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 12:48:41 +0000 (UTC)
Received: from unirelay.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id A235F83666B3
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 12:48:33 +0000 (UTC)
Received: by unirelay12.hostedemail.com (Postfix, from userid 108)
	id 74C541202F3; Tue,  3 May 2022 12:48:19 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay12.hostedemail.com (Postfix) with ESMTP id B9CC7121F1B;
	Tue,  3 May 2022 07:08:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 8799E6000C;
	Tue,  3 May 2022 07:08:47 +0000 (UTC)
Message-ID: <f6421e8f75a030222bf9cc7ef191648f7495a511.camel@perches.com>
Subject: Re: [PATCH 12/12] staging: r8188eu: check the return of kzalloc()
From: Joe Perches <joe@perches.com>
To: xkernel.wang@foxmail.com, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk,  gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 03 May 2022 00:08:46 -0700
In-Reply-To: <tencent_702C3C4AA9F65F0EE48859211795E3800205@qq.com>
References: <tencent_A80380E4306BE7BA73E450F084232B4DFC0A@qq.com>
	 <tencent_702C3C4AA9F65F0EE48859211795E3800205@qq.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: ojcbzps174iwotm4ttmiixjy5siz9zhh
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 8799E6000C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19WfupWeU9aLuhwiAuAjGXwG8kD2eH7z/Y=
X-HE-Tag: 1651561727-358919

On Tue, 2022-05-03 at 15:02 +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to handle the return
> of it to prevent potential wrong memory access.
> 
> Besides, to propagate the error to the caller, the type of
> rtw_alloc_hwxmits() is changed to `int` and another check is added to
> its caller.
> Then if kzalloc() fails, the caller will properly jump to the
> corresponding error hanlding code.

It'd be better to use the typical error returns

> diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
[]
> @@ -176,7 +176,9 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
>  
>  	pxmitpriv->free_xmit_extbuf_cnt = num_xmit_extbuf;
>  
> -	rtw_alloc_hwxmits(padapter);
> +	res = rtw_alloc_hwxmits(padapter);
> +	if (res == _FAIL)
> +		goto free_xmit_extbuf;

	if (res)
		goto free_xmit_extbuf;

[]

> -void rtw_alloc_hwxmits(struct adapter *padapter)
> +int rtw_alloc_hwxmits(struct adapter *padapter)
>  {
>  	struct hw_xmit *hwxmits;
>  	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
> @@ -1495,6 +1497,8 @@ void rtw_alloc_hwxmits(struct adapter *padapter)
>  	pxmitpriv->hwxmit_entry = HWXMIT_ENTRY;
>  
>  	pxmitpriv->hwxmits = kzalloc(sizeof(struct hw_xmit) * pxmitpriv->hwxmit_entry, GFP_KERNEL);
> +	if (!pxmitpriv->hwxmits)

		return -ENOMEM;



