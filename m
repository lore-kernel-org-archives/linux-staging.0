Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77862FB1
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 21:44:36 +0000 (UTC)
IronPort-SDR: R29ZxEguEEYfVVRc8Q+6NWzLnWrpRqmyBiXfShWhck6U4XMUgbLAbYBRnvexrzckCuliCRVla8
 yWq3glFn/lfg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="182238714"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="182238714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 14:44:36 -0700
IronPort-SDR: GH11bSp8S/cra3Q9SJWk0U7zPh/U2jh/8L7+L0fYi1JEqVaRcM4nEUPILQLkuDrHh/SzZq/m8f
 Tfw8nuLWGuRQ==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="547391651"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 14:44:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 0BE542031C;
	Thu, 27 May 2021 00:44:32 +0300 (EEST)
Date: Thu, 27 May 2021 00:44:32 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiabing Wan <kael_w@yeah.net>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] staging: media: atomisp: Align block comments
Message-ID: <20210526214431.GJ3@paasikivi.fi.intel.com>
References: <20210518112938.88240-1-wanjiabing@vivo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518112938.88240-1-wanjiabing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jiabing,

On Tue, May 18, 2021 at 07:29:35PM +0800, Wan Jiabing wrote:
> From: Jiabing Wan <kael_w@yeah.net>
> 
> Fixing the following checkpatch warning:
> WARNING: Block comments should align the * on each line
> 
> Signed-off-by: Jiabing Wan <kael_w@yeah.net>
> ---
> Changelog:
> v2:
> - Fix the author style in patch.
> ---
>  .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
> index be3534e46c15..9b22f2da45d5 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
> @@ -17,8 +17,8 @@
>  #define __IA_CSS_ANR_TYPES_H
>  
>  /* @file

Could you fix the first line, too, i.e.:

/*
 * ...

> -* CSS-API header file for Advanced Noise Reduction kernel v1
> -*/
> + * CSS-API header file for Advanced Noise Reduction kernel v1
> + */
>  
>  /* Application specific DMA settings  */
>  #define ANR_BPP                 10

-- 
Kind regards,

Sakari Ailus
