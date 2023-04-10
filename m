Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47623D0
	for <linux-staging@lists.linux.dev>; Mon, 10 Apr 2023 23:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681170524; x=1712706524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLABFzxIaBKdwMWhvhRoqNf4XliHa9M847b79qETyi0=;
  b=n3oaUx3W4B5p+hfxHTzGsD62dKB2EcYFNEOQUPEfdhID0YodKSAH4u4f
   jLSMiEtM39stn4jFcM4H9f2zj1hEgP6x8XNCiv2c2NYFFSmJSj7tHw7SQ
   BftouZNbh+mXJ+BVkC4z+3xeP3RlBY7WS1ikLDnNWlxG8hcss4UpQuHBU
   FunXwNBaaav8TO3Fq8biY1EzDD8pNZSJfnptTSKkBPv9dW6co0Zc2sKSD
   MnlDSHvmLjpuz4F1inlBXx/oWmmxAfF6r+gQSDKO65yPRj8f1ZIdELiNe
   mfGiDWCgWtplhocoxw376KqENA5vhyvLj48+1jLy2UF5pyhXmNnFwteom
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="332160675"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="332160675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 16:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="718761257"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="718761257"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.230.103])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 16:48:43 -0700
Date: Mon, 10 Apr 2023 16:48:41 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: fix macro style error
Message-ID: <ZDSgWU5GXPFdJ99o@aschofie-mobl2>
References: <20230409200135.1033677-1-angelalbertoc.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409200135.1033677-1-angelalbertoc.r@gmail.com>

On Sun, Apr 09, 2023 at 10:01:36PM +0200, Angel Alberto Carretero wrote:
> Wrap macro in parenthesis to fix checkpatch error.
> 
> Tested it by compiling the driver successfully.
> 
> Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> ---

Hi Angel,

The code change looks fine. Here are a few patch style suggestions:

- If you do 'git log --oneline imx-media-utils.c' you'll see that
  changes in utils file only, seem to have utils in the patch subject
  prefix. "media: imx: utils:"

- Commit message is vague. How about being explicit so anyone persuing
  those one-liners knows exactly what change was made.
  "Enclose IMX_BUS_FMTS macro in parentheses"

- The commit log 'why' is to conform to the kernel coding style, not
  to fix a checkpatch error. It is good to say Issue found by
  checkpatch, but that itself is not the 'why'.

Alison

>  drivers/staging/media/imx/imx-media-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index 411e907b68eb..eb44c09071de 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -7,7 +7,7 @@
>  #include <linux/module.h>
>  #include "imx-media.h"
>  
> -#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> +#define IMX_BUS_FMTS(fmt...) ((const u32[]) {fmt, 0})
>  
>  /*
>   * List of supported pixel formats for the subdevs.
> -- 
> 2.40.0
> 
