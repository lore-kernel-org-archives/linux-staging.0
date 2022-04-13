Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BC2F23;
	Wed, 13 Apr 2022 22:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649888645; x=1681424645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lQvTZgp3nYD8xLl9vXBiy5U1JTi15pjSvf2S1fGEa24=;
  b=JoykGhWm/siIjUA6C5Qj9T96jslV85f6DjqWrcTlA/KRuSqauOuwXHxK
   X4BoFDWtVDg4axsP3cV8Iw2Qf2sY/k1QowG/5CWGwYIX7WOTZnVtd7xKR
   KuDFjgv4oq2eg+pR4Su+m2VIjVDHfvGW9RHmxi/RazoBZBYX3PShk9aWt
   /QPHJOZRLpjav/+idVg6mlvhl4Sm/rmq/CgnPB0aUI/a11jwVQX5fGYhc
   fzQwMTZ+HnD2wTqWr6NO67G+IM1iaijVxB8XKpTRNkc8lQ/CsWvwltNps
   frPaWhg2M+k5+9MPQLejxokXOyiEfI+fHA5DiNaE/D1z5gd67aZ7S3vQD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="261635669"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="261635669"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 15:24:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="623854294"
Received: from sdoyen-mobl1.amr.corp.intel.com (HELO localhost) ([10.213.179.195])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 15:24:04 -0700
Date: Wed, 13 Apr 2022 15:24:04 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in
 hmm_set()
Message-ID: <YldNhErgt53RqYp7@iweiny-desk3>
References: <20220413212210.18494-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413212210.18494-1-fmdefrancesco@gmail.com>

On Wed, Apr 13, 2022 at 11:22:10PM +0200, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible. In file pci/hmm/hmm.c, function hmm_set() calls
> kmap() / kunmap() where kmap_local_page() can instead do the mapping.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore, hmm_set()() is a function where the use
> of kmap_local_page() in place of kmap() is correctly suited.
> 
> Convert the calls of kmap() / kunmap() to kmap_local_page() /
> kunmap_local().
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> index 6394385b6637..46ac082cd3f1 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> @@ -563,7 +563,7 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
>  		idx = (virt - bo->start) >> PAGE_SHIFT;
>  		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
>  
> -		des = (char *)kmap(bo->page_obj[idx].page) + offset;
> +		des = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
>  
>  		if ((bytes + offset) >= PAGE_SIZE) {
>  			len = PAGE_SIZE - offset;
> @@ -579,7 +579,7 @@ int hmm_set(ia_css_ptr virt, int c, unsigned int bytes)
>  
>  		clflush_cache_range(des, len);
>  
> -		kunmap(bo->page_obj[idx].page);
> +		kunmap_local(des);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
