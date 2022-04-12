Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3923AC;
	Tue, 12 Apr 2022 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649806587; x=1681342587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mjhF2LEHO+cHqCM8/1aoy6xD1SETj0bTEeakqPsejYM=;
  b=Z3q9uojZOMckXphVwEM/LMdnE7MP2VKtclK+nevu+G0bmOjiC3DtXdlu
   PKOToyy0j20eGHWTb+zbKbsUY77mwCCdFbqjq5VukUF8oMLtv25Oi+bfJ
   p79SvbPpHUfY4DScg+7I91TYtKvNEV2tnlnqxNz8aXYHiFpFlsCE3oDhC
   TUf2mya5juvFKtiTb/ZMbgpgKXXf6D5ciyp8grC+c7EAv8BwgU7duKZxX
   YwmFB7v6ZvZ/DP35U4PTwiv07AQMlEhjVVEgnf1s3o24IYZHJxLTrmpcV
   mjaCYAaMSyNwYNR0d+nug+Y/lFuLit+cTd80XwjsXIsATMKEzx/EeS0xJ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242468038"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="242468038"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:36:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="660707822"
Received: from aalaniz-mobl.amr.corp.intel.com (HELO localhost) ([10.209.160.104])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 16:36:25 -0700
Date: Tue, 12 Apr 2022 16:36:24 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Rebecca Mckeever <remckee0@gmail.com>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/3] staging: r8188eu: combine both sides of conditional
 statement
Message-ID: <YlYM+LjgZWALaa1R@iweiny-desk3>
References: <cover.1649011311.git.remckee0@gmail.com>
 <d33c51bc3a20fa25e4737b258f3b1c42cc8124e3.1649011311.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d33c51bc3a20fa25e4737b258f3b1c42cc8124e3.1649011311.git.remckee0@gmail.com>

On Sun, Apr 03, 2022 at 02:17:05PM -0500, Rebecca Mckeever wrote:
> Both sides of conditional statement are the same except for the comment.
> Additional instance found with git grep.
> 
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index da455eb4d8cb..2d316a6c8294 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1411,11 +1411,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>  {
>  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
> -	if (pcmd->res == H2C_DROPPED) {
> +	if (pcmd->res != H2C_SUCCESS) {
>  		/* TODO: cancel timer and do timeout handler directly... */
>  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> -	} else if (pcmd->res != H2C_SUCCESS) {
> -		_set_timer(&pmlmepriv->scan_to_timer, 1);
>  	}
>  
>  	/*  free cmd */
> @@ -1445,11 +1443,9 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>  {
>  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  
> -	if (pcmd->res == H2C_DROPPED) {
> +	if (pcmd->res != H2C_SUCCESS) {
>  		/* TODO: cancel timer and do timeout handler directly... */
>  		_set_timer(&pmlmepriv->assoc_timer, 1);
> -	} else if (pcmd->res != H2C_SUCCESS) {
> -		_set_timer(&pmlmepriv->assoc_timer, 1);
>  	}
>  
>  	rtw_free_cmd_obj(pcmd);
> -- 
> 2.32.0
> 
