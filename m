Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC772FAF
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 14:18:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309624973"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="309624973"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="654949478"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="654949478"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 06:18:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pJxeA-00Dm4U-2l;
	Mon, 23 Jan 2023 16:18:06 +0200
Date: Mon, 23 Jan 2023 16:18:06 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 05/57] media: atomisp: Silence "isys dma store at addr,
 val" debug messages
Message-ID: <Y86XHqPG8VjaIcMM@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:13PM +0100, Hans de Goede wrote:
> These are clearly debug messages, printing these all the time is not
> useful.
> 
> Silence these by simply removing them altogether.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/pci/css_2401_system/host/isys_dma_private.h   | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
> index a313e1dc7c71..d65fe9ec9049 100644
> --- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
> +++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma_private.h
> @@ -34,8 +34,6 @@ void isys2401_dma_reg_store(const isys2401_dma_ID_t	dma_id,
>  
>  	reg_loc = ISYS2401_DMA_BASE[dma_id] + (reg * sizeof(hrt_data));
>  
> -	ia_css_print("isys dma store at addr(0x%x) val(%u)\n", reg_loc,
> -		     (unsigned int)value);
>  	ia_css_device_store_uint32(reg_loc, value);
>  }
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


