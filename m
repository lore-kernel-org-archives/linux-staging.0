Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4285317E
	for <linux-staging@lists.linux.dev>; Tue, 11 Apr 2023 00:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681171642; x=1712707642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SkNd/K8iVvE77gyQWPYM8xlrW/4KpOW5swb5hDLO/8=;
  b=R+mSyP/fe/qSr2RMOTdcPpvton0Rf6Vf+fenTpJXOqKrnua/dM+7PIAI
   tQAqHcJbwLhZPCG6KylLRPsH+65La/UK7hbRU04ylA5seci6dfsrefzMv
   8KA9zsXRzNldUQdDtsCgVjwBRepQZDq6fdBiAa6gPNpfhPbQjvXvo5jM1
   m38L5SSLgTkNNrA4mBVt2SVnPm9VG7wKzylBe3Wk3HK4IjSVq8czYnssL
   bh8qlaOQ9loiaNQ1O1NKliOYGk/E9lk7wXAipeEnjpO9yZBv+OBAgfMYm
   zwINSath/Vi/OQeylzkpcIIC9XZ8DIYbka27PETTdy7FcT+wzByR0GkcT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371328676"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="371328676"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 17:07:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="638617968"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="638617968"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.230.103])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 17:07:14 -0700
Date: Mon, 10 Apr 2023 17:07:12 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Fix logical operator continuations
Message-ID: <ZDSksGyxnu5eIo+1@aschofie-mobl2>
References: <20230408171803.GA262580@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408171803.GA262580@sumitra.com>

On Sat, Apr 08, 2023 at 10:18:03AM -0700, Sumitra Sharma wrote:
> Fix logical operator continuation as suggested by Linux kernel
> coding-style. Check reported by checkpatch:
> 
> CHECK: Logical continuations should be on the previous line
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>

Hi Sumitra,

That commit message can be explicit, like "Move logical operator
to previous line"

Alison


> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> index 5a1cd22f5e25..58ed394202ae 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
> @@ -209,8 +209,8 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
>  					&priv->rtllib->pwr_save_ctrl;
>  
>  	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
> -	    (priv->rtllib->state == RTLLIB_LINKED))
> -	    || (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
> +	    (priv->rtllib->state == RTLLIB_LINKED)) ||
> +	    (priv->rtllib->iw_mode == IW_MODE_ADHOC) ||
>  	    (priv->rtllib->iw_mode == IW_MODE_MASTER))
>  		return;
>  
> -- 
> 2.25.1
> 
