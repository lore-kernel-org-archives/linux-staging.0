Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02002C80;
	Wed, 30 Mar 2022 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648674680; x=1680210680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keon6mJSiu6oJTFE85youukWofwphPuyQTu9o5aZfkI=;
  b=IHlTFB+2s8niBP3np51PR7rAGkkpRpK42uzFh4VfYV63RhixM+Cmb606
   Y9krwY35KyW1CZfZ+pPqMcLezy6+VtEmnMZllP44u8soDl+Y9wTdwWiOp
   WaaJv2BtalAdkqspSk4Aw+CLe6dahazsGiQbiIAyIyR3VHmPyC8z+zdbm
   Miqw1TVWxdtYE5bCEI6ui4WvSNRxX99yZ2DYhOpDGPFCAQe2kFYh1c4uo
   WU6nyt419UiXkTdKk5hAy+qls70CJbkdvxearTpybqhlN8k5xSuXZaDP+
   OpEXgtXf6N91NAq2FAHCn5a2FqmF95HxBMVO6zFUOcFL7MsEXsPQtwUoN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346083831"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="346083831"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 14:11:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="639869076"
Received: from npeper-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.16.15])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 14:11:19 -0700
Date: Wed, 30 Mar 2022 14:11:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Philip <benjamin.philip495@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Colin Ian King <colin.king@intel.com>,
	Samuel =?iso-8859-1?Q?Sj=F6berg?= <info@samuelsjoberg.se>,
	Charlie Sands <sandsch@northvilleschools.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: rts5208: Convert kmap() to kmap_local_page()
Message-ID: <YkTHG+HSlU9u1FoV@iweiny-desk3>
References: <20220330143331.8306-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330143331.8306-1-fmdefrancesco@gmail.com>

On Wed, Mar 30, 2022 at 04:33:31PM +0200, Fabio M. De Francesco wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page()
> where it is feasible.
> 
> With kmap_local_page(), the mapping is per thread, CPU local and not
> globally visible. Therefore rtsx_stor_access_xfer_buf() is a function
> where the use of kmap_local_page() in place of kmap() is correctly
> suited.
> 
> Convert to kmap_local_page() but, instead of open coding it, use the
> helpers memcpy_to_page() and memcpy_from_page().
> 
> Make a minor change to a comment related to scatter-gather.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks!

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
> 
> v1 -> v2: Rework the commit message and use the appropriate helpers
> instead of open coding the use of kmap_local_page()/kunmap_local_page().
> (Thanks to Ira Weiny <ira.weiny@intel.com>).
> 
> v2 -> v3: Use memcpy_{to,from}_page() arguments correctly.
> (Thanks to Dan Carpenter <dan.carpenter@oracle.com>).
> 
> v3 -> v4: According to a suggestion by Ira Weiny, change the test
> of a comment related to the use of scatter-gather.
> 
>  drivers/staging/rts5208/rtsx_transport.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
> index 805dc18fac0a..d5ad49de4c56 100644
> --- a/drivers/staging/rts5208/rtsx_transport.c
> +++ b/drivers/staging/rts5208/rtsx_transport.c
> @@ -55,9 +55,9 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
>  		*offset += cnt;
>  
>  	/*
> -	 * Using scatter-gather.  We have to go through the list one entry
> -	 * at a time.  Each s-g entry contains some number of pages, and
> -	 * each page has to be kmap()'ed separately.
> +	 * Using scatter-gather. We have to go through the list one entry
> +	 * at a time. Each s-g entry contains some number of pages which
> +	 * have to be copied one at a time.
>  	 */
>  	} else {
>  		struct scatterlist *sg =
> @@ -92,13 +92,11 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
>  			while (sglen > 0) {
>  				unsigned int plen = min(sglen, (unsigned int)
>  						PAGE_SIZE - poff);
> -				unsigned char *ptr = kmap(page);
>  
>  				if (dir == TO_XFER_BUF)
> -					memcpy(ptr + poff, buffer + cnt, plen);
> +					memcpy_to_page(page, poff, buffer + cnt, plen);
>  				else
> -					memcpy(buffer + cnt, ptr + poff, plen);
> -				kunmap(page);
> +					memcpy_from_page(buffer + cnt, page, poff, plen);
>  
>  				/* Start at the beginning of the next page */
>  				poff = 0;
> -- 
> 2.34.1
> 
