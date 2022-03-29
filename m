Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DA2572;
	Tue, 29 Mar 2022 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648570506; x=1680106506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V7I1wdGG6eu8VtqmUYmFQ80cpXVRC0RQdim1swUODT4=;
  b=jb6UEUH/ymhxSYzY8GuLFNIKQ1KGlK1He1p8h15HzrzQxzcF/yEx6gI9
   SZD9ZQuW8AYRfhZcDYgrdkswovxV7aZ6/vVl76eKuT4tsvmtwPknVIftc
   Y47ewiu2BkaTWGN9w4nOZGzDfnikSPYRyq51lRD32nIeOoHKSxKRvBavo
   8jfLsb2dqJ5TrWxfYeaLJffIDOMWMJatIcxc3Y9KbRs1jrOIG/aMq+2j7
   Fa3uDaGsz1TiHDWlxpRY9xIffTMtIf+9RHdoQM9gMBLG0CJSOriEjXxbc
   Aaff3p+D1XQ6kabihFN5xewMoLttFq1YOPF8AkNwFY3VydlcubEtODYHv
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="256866020"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="256866020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="564742695"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:14:06 -0700
Date: Tue, 29 Mar 2022 09:16:32 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Rebecca Mckeever <remckee0@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: fix suspect code indent for
 conditional statements
Message-ID: <20220329161632.GA1169956@alison-desk>
References: <YkK7ABTVt0TCbd18@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkK7ABTVt0TCbd18@bertie>

On Tue, Mar 29, 2022 at 02:53:36AM -0500, Rebecca Mckeever wrote:
> Align the if and else if branches of the conditional statement
> to improve readability. Prevent bugs that could be introduced
> if developers misread the code. Issue found by checkpatch.

Thanks for the patch Rebecca!

Lots of stuff done right - passes chkp, compiles, patch is sent to
correct recipients, the commit message follows the format of the file.

Let's set a pattern here for all checkpatch related cleanups,
for you and others that follow.(Thanks for being the first ;))

Commit msg says 'what'. Commit log says 'why'. Acknowledge that
it was found using checkpatch in the commit log also. (In the future
you may be acknowledging use of other tools like sparse, coccinelle.)

Note that the 'why' is never that a tool reported an error. The 'why'
for these checkpatch reports is usually to follow the Linux Kernel
Coding Style.

'Fix' in the commit message is needlessly generic. Perhaps:
[PATCH] staging: r8188eu: align both branches of a conditional statement

Commit log: (what you have is fine in the log)
I usually paste in the checkpatch error explicitly so it can be grep'd
for. Something like:

Issue found by checkpatch:
WARNING: suspect code indent for conditional statements

Thanks,
Alison

> 
> Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 6eca30124ee8..ccc43c0ba433 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1408,7 +1408,7 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>  		/* TODO: cancel timer and do timeout handler directly... */
>  		/* need to make timeout handlerOS independent */
>  		_set_timer(&pmlmepriv->scan_to_timer, 1);
> -		} else if (pcmd->res != H2C_SUCCESS) {
> +	} else if (pcmd->res != H2C_SUCCESS) {
>  		_set_timer(&pmlmepriv->scan_to_timer, 1);
>  	}
>  
> -- 
> 2.32.0
> 
> 
