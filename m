Received: from relay5.hostedemail.com (relay5.hostedemail.com [64.99.140.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718B2577
	for <linux-staging@lists.linux.dev>; Sat, 14 May 2022 18:00:57 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay12.hostedemail.com (Postfix) with ESMTP id 90D7412094E;
	Sat, 14 May 2022 17:54:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 2F51D2D;
	Sat, 14 May 2022 17:54:46 +0000 (UTC)
Message-ID: <b69cd7d3f0e3b62c5ef12cd1b98eac45f56022a4.camel@perches.com>
Subject: Re: [PATCH 4/7] staging: r8188eu: replace if with ternary operator
From: Joe Perches <joe@perches.com>
To: Martin Kaiser <martin@kaiser.cx>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	 <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Sat, 14 May 2022 10:54:45 -0700
In-Reply-To: <20220514164740.282552-5-martin@kaiser.cx>
References: <20220514164740.282552-1-martin@kaiser.cx>
	 <20220514164740.282552-5-martin@kaiser.cx>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: of6njk9kz39zwsw47omzsej8oneyxy4w
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 2F51D2D
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/9dge58uXWeAVx2Yd3Zdw4G+hZcBv5j64=
X-HE-Tag: 1652550886-835860

On Sat, 2022-05-14 at 18:47 +0200, Martin Kaiser wrote:
> Replace an if statement with a ternary operator, making the code a tiny
> bit shorter.
[]
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
[]
> @@ -1503,10 +1503,8 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
>  		preorder_ctrl->indicate_seq = 0xffff;
>  		preorder_ctrl->enable = pmlmeinfo->bAcceptAddbaReq;
>  
> -		if (pmlmeinfo->bAcceptAddbaReq)
> -			issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP, 0);
> -		else
> -			issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
> +		issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP,
> +				pmlmeinfo->bAcceptAddbaReq ? 0 : 37);

Seems like magic numbers.  Maybe add/use defines?


