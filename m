Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4305D3216
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 10:19:35 +0000 (UTC)
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 05BE2872;
	Wed,  6 Apr 2022 09:54:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id B021B32;
	Wed,  6 Apr 2022 09:54:31 +0000 (UTC)
Message-ID: <e56d9ca89544ad015c6cfabaf2859027c0dd50e5.camel@perches.com>
Subject: Re: [PATCH 1/5] staging: r8188eu: use round_up() instead of RND4()
From: Joe Perches <joe@perches.com>
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 06 Apr 2022 02:54:30 -0700
In-Reply-To: <20220406061859.9011-2-straube.linux@gmail.com>
References: <20220406061859.9011-1-straube.linux@gmail.com>
	 <20220406061859.9011-2-straube.linux@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B021B32
X-Spam-Status: No, score=1.60
X-Stat-Signature: 9p4n6hp4bwzyho9dbps5m731my6skqgq
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18hEanTJvaHZuwtmlEzInomiVMehvlXBqI=
X-HE-Tag: 1649238871-371560

On Wed, 2022-04-06 at 08:18 +0200, Michael Straube wrote:
> Use in-kernel round_up() instead of custom RND4().
[]
> diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
[]
> @@ -63,7 +63,7 @@ void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
>  				arc4_crypt(ctx, payload + length, crc.f1, 4);
>  
>  				pframe += pxmitpriv->frag_len;
> -				pframe = (u8 *)RND4((size_t)(pframe));
> +				pframe = (u8 *)round_up((size_t)pframe, 4);

Perhaps use PTR_ALIGN

				pframe = PTR_ALIGN(pframe, 4);

etc...


