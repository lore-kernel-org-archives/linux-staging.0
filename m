Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21F15AE
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:17:12 +0000 (UTC)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 89E15184A;
	Thu, 14 Apr 2022 01:17:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf10.hostedemail.com (Postfix) with ESMTPA id 46D6336;
	Thu, 14 Apr 2022 01:16:59 +0000 (UTC)
Message-ID: <eda6a3a94b768f06e67581bbc4d9974b391f0651.camel@perches.com>
Subject: Re: [PATCH 4/6] staging: r8188eu: place constants on the right side
 of tests
From: Joe Perches <joe@perches.com>
To: Jaehee Park <jhpark1013@gmail.com>, Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Date: Wed, 13 Apr 2022 18:16:58 -0700
In-Reply-To: <d2469155c37b8677a8dcbed28bc0840745d46f76.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
	 <d2469155c37b8677a8dcbed28bc0840745d46f76.1649880454.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 46D6336
X-Spam-Status: No, score=-4.78
X-Stat-Signature: ucutbhqknse6ajuz6ibq95hioue4rq3x
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19QSXj0Gs9SivOGdTGlKjF8xaHxB+z/K+A=
X-HE-Tag: 1649899019-213656

On Wed, 2022-04-13 at 16:11 -0400, Jaehee Park wrote:
> To comply with the linux coding style, place constants on the right
> side of the test in comparisons. Issue found with checkpatch.
> WARNING: Comparisons should place the constant on the right side of
> the test.
[]
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
[]
> @@ -1997,19 +1998,19 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
>  	else
>  		pnetwork = &pmlmepriv->cur_network;
>  
> -	if (0 < rtw_to_roaming(padapter)) {
> +	if (rtw_to_roaming(padapter) > 0) {

Do you think this change is the same test?

What happens if rtw_to_roaming returns 0?

[]

> -				if (0 < pmlmepriv->to_roaming) {
> +				if (pmlmepriv->to_roaming > 0) {

here too

>  					continue;
>  				} else {
>  					rtw_indicate_disconnect(padapter);


