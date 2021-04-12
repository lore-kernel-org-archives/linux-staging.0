Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0672
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:49:46 +0000 (UTC)
IronPort-SDR: S91kaWlVFWMBrO7/KRvVH0O1eNkucnU0h1SmLsJ2nw6WPEiKqfKdLvbs4NlfXg7JCE/gL/xCCV
 Uc6m7Ugoe4iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255474500"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255474500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:49:46 -0700
IronPort-SDR: /uH/qozKRs83kwg3Fusf37qVxeq+FBgDrIn9DfqqIgVcbBOWGdhg6qm/fx4UFMkTlQhm0ysKKu
 /kfDSS/Il+Bw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="442996816"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:49:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 6B95C205AA;
	Mon, 12 Apr 2021 12:49:41 +0300 (EEST)
Date: Mon, 12 Apr 2021 12:49:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 5/6] staging: media: intel-ipu3: line should not end with
 '['
Message-ID: <20210412094941.GK3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mitali,

On Mon, Apr 12, 2021 at 04:39:58AM +0530, Mitali Borkar wrote:
> Fixed the issue of line should not end with '[' by moving arguments
> from next line to line ending with '['
> Reported by checkpatch.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 53f8e5dec8f5..0451f8b7ba4f 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -246,8 +246,7 @@ struct ipu3_uapi_ae_ccm {
>   */
>  struct ipu3_uapi_ae_config {
>  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> -	struct ipu3_uapi_ae_weight_elem weights[
> -			IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);

Could you still wrap it to stay under 80?

>  	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
>  } __packed;
>  

-- 
Sakari Ailus
