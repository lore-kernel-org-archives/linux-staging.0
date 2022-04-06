Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610533221;
	Wed,  6 Apr 2022 22:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649284214; x=1680820214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQxd2dKoArtzp9jyVHH2eE54PtstPiRRMOLriIfTTJ8=;
  b=Q1pt287To3TbTUAcPuucf9Y8oDKkipJbLKHNOgQpFdx6FZNym5bmg4Lk
   u2WCMajKey/ctiTqhS4r0nlAPAxbFD76+3Lxs/GOiy+g5Cy1SzF4p+dLc
   heXN2IZmiNx3OGXp8PspGequFeQngUZ6SRGjmjo9DW4YVyi28NO9EltJJ
   J3ToZu96OOiPs9PS3bCyiBL778go9Fcpf6IkzVes/z51txZbJT6sdXiZn
   n7OrLG1/nEg/bxZRprpxFQ+3AtMf/RYOwZbNp8/GndQYxNVv5doJ3VsQp
   GUsCQ9gFPQqGzZdiZdRovJGyWksqxr152OkcwCu3R94E6bgpdWra811IR
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="243303836"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="243303836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 15:30:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="549748206"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 15:30:13 -0700
Date: Wed, 6 Apr 2022 15:32:22 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Rebecca Mckeever <remckee0@gmail.com>
Cc: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] staging: r8188eu: remove extra 'the'
Message-ID: <20220406223222.GB1210425@alison-desk>
References: <cover.1649233201.git.remckee0@gmail.com>
 <e259a035b79c814f871b490aa277bf0dfe23fe11.1649233201.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e259a035b79c814f871b490aa277bf0dfe23fe11.1649233201.git.remckee0@gmail.com>

On Wed, Apr 06, 2022 at 03:30:58AM -0500, Rebecca Mckeever wrote:
> Remove repeated 'the' in comment to be grammatically correct and
> conform to Linux kernel coding style.
> 
> Found with checkpatch:
> WARNING: Possible repeated word: 'the'
> 
> Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 9f5ece52bd39..cd20811ae152 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -519,7 +519,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
>  
>  	psecnetwork->IELength = 0;
>  	/*  Added by Albert 2009/02/18 */

I don't know if this type of thing "Added by Albert" is sprinkled through
the file, but it seems they can be removed. Git will keep history of
this file from here on. (And in case anyone asks what happened to
Albert's notations, they can find that in the git history too ;))


> -	/*  If the the driver wants to use the bssid to create the connection. */
> +	/*  If the driver wants to use the bssid to create the connection. */
>  	/*  If not,  we have to copy the connecting AP's MAC address to it so that */
>  	/*  the driver just has the bssid information for PMKIDList searching. */
>  
> -- 
> 2.32.0
> 
> 
