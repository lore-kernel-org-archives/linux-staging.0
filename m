Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F794AFC8
	for <linux-staging@lists.linux.dev>; Thu,  6 Apr 2023 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680811945; x=1712347945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnZfiEm0t47fXTNeAj48dJNb8xnqyOJMjzTZLqVN6Iw=;
  b=Ry8q7GlVpmEs9bJ75izsZm+wErojHWyQDiSGrPUAD0ZaoqD8zKvf1PSo
   25XtYvcrKBRfTv/67vqTjXfAcTmy1tePXtTGKnO/h29sBry+4mNLU7Zit
   RYoZFCs00RX1ZAKm3EbSYcD1zGKef1EFmpcyunjDkp2Iok8gaAaCBEF7t
   MsLc26le7/B1ffudX8IaTUGCWv5gNsvzw/6bS3vh0JhOtjsh9/ObL8vEK
   aWB6vmW05GrV0aSWCFer8QP3TLvhIS14zF2zBxphoSbqrLGTSaQo0tRiz
   ZOJvgTLfKPBw8sCps/sDtVoz7hrEN1ymQW3i7Hrh4SIuSCZVR9ALKJDuH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407955366"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="407955366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861528525"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="861528525"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.219.12])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:12:24 -0700
Date: Thu, 6 Apr 2023 13:12:22 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove typedef declaration for
 cvmx_fau_op_size
Message-ID: <ZC8nphkEYdrMvRg2@aschofie-mobl2>
References: <20230405181841.GA6820@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405181841.GA6820@koolguy>

On Wed, Apr 05, 2023 at 08:18:41PM +0200, Dalvin-Ehinoma Noah Aiguobas wrote:
> Fix checkpatch.pl warning: do not add new typedefs in
> drivers/staging/octeon/octeon-stubs.h:216

There are a few more of these 'typedef enum' is this file.
I believe it would be OK to bundle the changes together in one patch.
Perhaps you are going to come back with additional patches. 

There appears to be an inconsistent style with how the enums are
actually enumerated in this file.  cvmx_pow_wait_t is esp odd.

Alison

> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 3e7b92cd2e35..9f269626b862 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -213,12 +213,12 @@ enum cvmx_fau_op_size {
>  	CVMX_FAU_OP_SIZE_64 = 3
>  };
>  
> -typedef enum {
> +enum cvmx_spi_mode {
>  	CVMX_SPI_MODE_UNKNOWN = 0,
>  	CVMX_SPI_MODE_TX_HALFPLEX = 1,
>  	CVMX_SPI_MODE_RX_HALFPLEX = 2,
>  	CVMX_SPI_MODE_DUPLEX = 3
> -} cvmx_spi_mode_t;
> +};
>  
>  typedef enum {
>  	CVMX_HELPER_INTERFACE_MODE_DISABLED,
> @@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
>  }
>  
>  static inline int cvmx_spi_restart_interface(int interface,
> -					cvmx_spi_mode_t mode, int timeout)
> +					enum cvmx_spi_mode mode, int timeout)
>  {
>  	return 0;
>  }
> -- 
> 2.25.1
> 
