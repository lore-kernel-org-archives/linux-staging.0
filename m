Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C413158B;
	Thu, 19 Oct 2023 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVuc/U9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697730092; x=1729266092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CDx3gZhvxaM5/jmqnpt21Zm3HDhkPDg+Lf+cMLXSiOI=;
  b=LVuc/U9Nh9ULiai5rlolCZUn9ZSBqEjq6SeyyUSCnqkKm7pdxRpxS4Rd
   VTwiR4b8rlN8QHnQSTecApwMhFvoPQlQol4ILHqbNVCmTTgW7cQpsFzSR
   seKDuIIHfuUf3C6YtgSSQ0fy538pOO63hoP4izl8opfn2MrQQ0aHn1+sK
   yC0gPGVDxX+cgA9JDjw4ctEsfyLTS/5/vHH4Egmz3qZaA7mWKPyswUEwg
   HCHVgR6X6TIS/3zawRidr64kYU+9bxWy3492PRoCIQrXAk1G3fIOny8EX
   9IVn/6/gYl1DtuZahM2R+JqloCZ4zH9qhfLgkZFzX47WqKgvLWhSy07mq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385157829"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="385157829"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792050472"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="792050472"
Received: from jiaminka-mobl1.gar.corp.intel.com (HELO intel.com) ([10.215.251.143])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:41:21 -0700
Date: Thu, 19 Oct 2023 17:41:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: vme_user: Use __func__ instead of
 function name
Message-ID: <ZTFOGIu5U+ZUodXW@ashyti-mobl2.lan>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
 <996c9f92e7fd288f67c02dfb0ba524ab7c5fe421.1697696951.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <996c9f92e7fd288f67c02dfb0ba524ab7c5fe421.1697696951.git.soumya.negi97@gmail.com>

Hi Soumya,

On Thu, Oct 19, 2023 at 12:20:10AM -0700, Soumya Negi wrote:
> Replace function names in message strings with __func__ to fix
> all checkpatch warnings like:
> 
>     WARNING: Prefer using '"%s...", __func__' to using 'vme_lm_get',
>              this function's name, in a string
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>

you forgot my ack here:

Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> ---
> Changes in v2:
> * None
> 
>  drivers/staging/vme_user/vme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 640b2dda3ac6..e533cce8e54e 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -424,7 +424,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
>  	image = list_entry(resource->entry, struct vme_slave_resource, list);
>  
>  	if (!bridge->slave_get) {
> -		dev_err(bridge->parent, "vme_slave_get not supported\n");
> +		dev_err(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -576,7 +576,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
>  	image = list_entry(resource->entry, struct vme_master_resource, list);
>  
>  	if (!bridge->master_set) {
> -		dev_warn(bridge->parent, "vme_master_set not supported\n");
> +		dev_warn(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -1576,7 +1576,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
>  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
>  
>  	if (!bridge->lm_set) {
> -		dev_err(bridge->parent, "vme_lm_set not supported\n");
> +		dev_err(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -1612,7 +1612,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
>  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
>  
>  	if (!bridge->lm_get) {
> -		dev_err(bridge->parent, "vme_lm_get not supported\n");
> +		dev_err(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -1649,7 +1649,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
>  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
>  
>  	if (!bridge->lm_attach) {
> -		dev_err(bridge->parent, "vme_lm_attach not supported\n");
> +		dev_err(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -1682,7 +1682,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
>  	lm = list_entry(resource->entry, struct vme_lm_resource, list);
>  
>  	if (!bridge->lm_detach) {
> -		dev_err(bridge->parent, "vme_lm_detach not supported\n");
> +		dev_err(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> @@ -1750,7 +1750,7 @@ int vme_slot_num(struct vme_dev *vdev)
>  	}
>  
>  	if (!bridge->slot_get) {
> -		dev_warn(bridge->parent, "vme_slot_num not supported\n");
> +		dev_warn(bridge->parent, "%s not supported\n", __func__);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.42.0
