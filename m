Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C43B8F50;
	Sun, 15 Oct 2023 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dn8ffKcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FDFC433C8;
	Sun, 15 Oct 2023 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697386428;
	bh=fACR+XJLl9B/jjpthQjGUUKc7ebs03eV424puDrJuis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dn8ffKcXqjz/kcKfeFJ2MowejFrBtDPmb1jSxphGkWhMbMdBF5ft8OclL/SGGclQO
	 v46UMb6f6nLAdb17eP5E0gcwdkup4qoIQn/YmSXd13rSVoRaAQAQFP2ebWvo5c0nmw
	 dr5cySAM2THcHcMqajWC6Kxqk/QL3WFeicd6SjxY=
Date: Sun, 15 Oct 2023 18:13:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: remove unused function prototypes
Message-ID: <2023101530-estate-strum-cfab@gregkh>
References: <ZSv2ObWLvlbM2hXn@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSv2ObWLvlbM2hXn@lab-ubuntu>

On Sun, Oct 15, 2023 at 05:24:57PM +0300, Calvince Otieno wrote:
> These functions are declared but not defined or used anywhere.
> Their definitions were removed 15 years ago in the
> commit cbec30c4c00c ("Staging: wlan-ng: Delete a large pile of
> now-unused code.")
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2mgmt.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
> index 083a055ee986..8c3f1ac35913 100644
> --- a/drivers/staging/wlan-ng/prism2mgmt.h
> +++ b/drivers/staging/wlan-ng/prism2mgmt.h
> @@ -78,14 +78,6 @@ void prism2mgmt_pstr2bytestr(struct hfa384x_bytestr *bytestr,
>  void prism2mgmt_bytestr2pstr(struct hfa384x_bytestr *bytestr,
>  			     struct p80211pstrd *pstr);
>  
> -/* functions to convert Group Addresses */
> -void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
> -			    struct hfa384x *priv);
> -int prism2mgmt_set_grpaddr(u32 did,
> -			   u8 *prism2buf, struct p80211pstrd *pstr,
> -			   struct hfa384x *priv);
> -int prism2mgmt_get_grpaddr_index(u32 did);
> -
>  void prism2sta_processing_defer(struct work_struct *data);
>  
>  void prism2sta_commsqual_defer(struct work_struct *data);
> -- 
> 2.34.1
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
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
