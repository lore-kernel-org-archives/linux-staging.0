Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CDC15A8;
	Thu, 14 Apr 2022 00:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649896981; x=1681432981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doUkUAIgXJ69drkRZDzCk6IXBWZ2q70KNvQLAmtwTE0=;
  b=XC9cH1tNEydG2Mllr7AORdQLlYskxJ5kRjGT1NQOffUl24WF/borDzpJ
   VEAZFI0z7gkhftv+qXPTv/uje6q8RD6DWtcENMvoohAS4FPb8AT0e+KiB
   20eI9M6zbLoo0CDV3disPzPY+FZW1qdlyW/iJvXLUcY4bz/TVXpJxYFMW
   IDreSz1kHG+2LRJXhxbhdBGbJ5fjhQbEQgsnxLRlW+mitrDHzNtLCvUwK
   rInrXxoHPZrH8gsnsC9XVcu/gaCp+2zaInB+ySFCEovuUXQzuCPkFeTD1
   nXkK9vmRhuZE9aeCeY/TASjr62iIsX2qRQRvsWezFljveSDnEd1/GVqF/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="244699053"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="244699053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 17:43:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="700467184"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 17:42:59 -0700
Date: Wed, 13 Apr 2022 17:44:54 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in
 hmm_store()
Message-ID: <20220414004454.GA1243697@alison-desk>
References: <20220413225531.9425-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413225531.9425-1-fmdefrancesco@gmail.com>

On Thu, Apr 14, 2022 at 12:55:31AM +0200, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. The same is true for kmap_atomic().
> 
> In file pci/hmm/hmm.c, function hmm_store() test if we are in atomic
> context and, if so, it calls kmap_atomic(), if not, it calls kmap().
> 
> First of all, in_atomic() shouldn't be used in drivers. This macro
> cannot always detect atomic context; in particular, it cannot know
> about held spinlocks in non-preemptible kernels.
> 
> Notwithstanding what it is said above, this code doesn't need to care
> whether or not it is executing in atomic context. It can simply use
> kmap_local_page() / kunmap_local() that can instead do the mapping /
> unmapping regardless of the context.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_store()() is a function where the use
> of kmap_local_page() in place of both kmap() and kmap_atomic() is
> correctly suited.
> 
> Convert the calls of kmap() / kunmap() and kmap_atomic() /
> kunmap_atomic() to kmap_local_page() / kunmap_local() and drop the
> unnecessary tests which test if the code is in atomic context.
> 

Not specifically about this patch, but more generally about all
such conversions - is there a 'proof' that shows this just works
or do we need to test each one. If the latter, then how?


> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 46ac082cd3f1..54188197c3dc 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -482,10 +482,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		if (in_atomic())
> -			des = (char *)kmap_atomic(bo->page_obj[idx].page);
> -		else
> -			des = (char *)kmap(bo->page_obj[idx].page);
> +		des = (char *)kmap_local_page(bo->page_obj[idx].page);
>  
>  		if (!des) {
>  			dev_err(atomisp_dev,
> @@ -512,14 +509,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
>  
>  		clflush_cache_range(des, len);
>  
> -		if (in_atomic())
> -			/*
> -			 * Note: kunmap_atomic requires return addr from
> -			 * kmap_atomic, not the page. See linux/highmem.h
> -			 */
> -			kunmap_atomic(des - offset);
> -		else
> -			kunmap(bo->page_obj[idx].page);
> +		kunmap_local(des);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
> 
