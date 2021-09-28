Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F83FD6
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 06:56:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9D460EE2;
	Tue, 28 Sep 2021 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632812196;
	bh=slbtk4vXYQNVIpSuotFdi6NhYqF0kbrJ8vFKHzWdp/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0C4bOtErtGlJvbyV1Ra/gmnxW9UVTpO2cLjytjVKKw4M2zLwH9dIGiGJKMP3au+CE
	 hS6zqKwRR5y+OfcNVHF+obYIOKGDhWqEecIIBra5F3MlgD3kdK8CeXrti/0OMql6oI
	 PUgDKN3goGwLhPicWsFMtkv8Ffl2Eylcg9A+txC0=
Date: Tue, 28 Sep 2021 08:56:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Longji Guo <guolongji@uniontech.com>
Cc: fabioaiuto83@gmail.com, ross.schm.dev@gmail.com, marcocesati@gmail.com,
	hdegoede@redhat.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove meaningless
 pstat->passoc_req check in OnAssocReq()
Message-ID: <YVK8oYtxpTYOVNs6@kroah.com>
References: <20210928061319.4784-1-guolongji@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928061319.4784-1-guolongji@uniontech.com>

On Tue, Sep 28, 2021 at 02:13:19PM +0800, Longji Guo wrote:
> kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
> is not necessary.
> 
> Signed-off-by: Longji Guo <guolongji@uniontech.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 375d2a742dd2..51390a30fa55 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1344,12 +1344,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
>  
>  		spin_lock_bh(&pstat->lock);
> -		if (pstat->passoc_req) {
> -			kfree(pstat->passoc_req);
> -			pstat->passoc_req = NULL;
> -			pstat->assoc_req_len = 0;
> -		}
> -
> +		kfree(pstat->passoc_req);
> +		pstat->assoc_req_len = 0;
>  		pstat->passoc_req =  rtw_zmalloc(pkt_len);
>  		if (pstat->passoc_req) {
>  			memcpy(pstat->passoc_req, pframe, pkt_len);
> -- 
> 2.20.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
