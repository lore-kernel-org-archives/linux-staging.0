Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAA36E;
	Wed, 30 Mar 2022 05:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648618493; x=1680154493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAL7/34vJ25bamv8Fr/9MpfHVJ+j2ue84dl6hFHp+n0=;
  b=DXnJ0t7+MgWnYuaM+WnY69wBy1AgVnwkU2pjjdP4DXTBOzhP1Otgfboq
   bH0VRhsl/Djjb5wQZ1M6rUewTFOnkJXTLQvobcYe+urjDEBIvuWgTcrWk
   tQV9u+pZL6/ItYn+lW/p12eo0qSYpXjOLekUU0yZHf2qah3wNRoQEUn05
   Hq9tFM6B0rm/vRpjobajTRv18/6GFGRQVZ70OzEX/zuimBNNt6srhzLV4
   hXzmXWmP2EeIQCFjxqmHnDOOO9khYfkO+/ZFRJTXUfNtH8B/jCqF3zytY
   +m8iVLv1lObqLGSXPMxvPGdQYkTrAtqqJa/O6x0b2ZgL+TzdaoFwOTc3P
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="284355836"
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="284355836"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 22:34:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,221,1643702400"; 
   d="scan'208";a="503175602"
Received: from micastro-mobl1.amr.corp.intel.com (HELO localhost) ([10.212.81.34])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 22:34:51 -0700
Date: Tue, 29 Mar 2022 22:34:51 -0700
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
Subject: Re: [PATCHi v3] staging: rts5208: Convert kmap() to kmap_local_page()
Message-ID: <YkPr+4lRbha/LV+9@iweiny-desk3>
References: <20220329162055.28006-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329162055.28006-1-fmdefrancesco@gmail.com>

On Tue, Mar 29, 2022 at 06:20:55PM +0200, Fabio M. De Francesco wrote:
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
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> v1 -> v2: Rework the commit message and use the appropriate helpers
> instead of open coding the use of kmap_local_page()/kunmap_local_page().
> (Thanks to Ira Weiny <ira.weiny@intel.com>).
> 
> v2 -> v3: Use memcpy_{to,from}_page() arguments correctly.
> (Thanks to Dan Carpenter <dan.carpenter@oracle.com>).
> 
>  drivers/staging/rts5208/rtsx_transport.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
> index 805dc18fac0a..b702c7caf944 100644
> --- a/drivers/staging/rts5208/rtsx_transport.c
> +++ b/drivers/staging/rts5208/rtsx_transport.c
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

This code is great...  But I went and looked at the function and found a
comment which needs to be updated as well.  :-/

 57         /*
 58          * Using scatter-gather.  We have to go through the list one entry
 59          * at a time.  Each s-g entry contains some number of pages, and
 60          * each page has to be kmap()'ed separately.
 61          */

I would update it to say something like:

...  Each s-g entry contains some number of pages which have to be copied one
at a time.

Sorry for not catching that earlier,
Ira

>  
>  				/* Start at the beginning of the next page */
>  				poff = 0;
> -- 
> 2.34.1
> 
