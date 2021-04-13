Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE1E71
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:01:39 +0000 (UTC)
IronPort-SDR: JL6nGqc9kgQYgtLG8iqU+xaSdnKCRMX0pV16blzzUOH58jLNpZd4I1cxK0EIOCqe5wkHJaaRHc
 8ReiHaknuhfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="214857104"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="214857104"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:01:38 -0700
IronPort-SDR: wPSHpWZ2SPGBSIeV8vi+6RojgHgS6TQ9C2Xj6mCzm2/GyS75cD55WA/fxK/3klNVAEJuGrQV2P
 jfJRyb3H1OKg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="451889237"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 03:01:36 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 62258203D0;
	Tue, 13 Apr 2021 13:01:34 +0300 (EEST)
Date: Tue, 13 Apr 2021 13:01:34 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <20210413100134.GR3@paasikivi.fi.intel.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
 <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mitali,

Thanks for the update.

On Tue, Apr 13, 2021 at 10:46:06AM +0530, Mitali Borkar wrote:
> Reduced length of the line under 80 characters to meet linux-kernel
> coding style.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
> 
> Changes from v1:- Reduced length of the line under 80 characters
> 
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 6a72c81d2b67..52dcc6cdcffc 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
>   */
>  struct ipu3_uapi_ae_config {
>  	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
> -	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
> +	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
> +							__aligned(32);

Do you still have the other two patches in your tree? This doesn't apply
here due to the different attribute syntax.

>  	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
>  } __packed;
>  

-- 
Kind regards,

Sakari Ailus
