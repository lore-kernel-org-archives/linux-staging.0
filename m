Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E42589
	for <linux-staging@lists.linux.dev>; Mon, 12 Sep 2022 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662983022; x=1694519022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K8wjR7XrLw/ghno2pkZYT2g65/NP/XaLvcEo8Ee8X3g=;
  b=g3AqMMjTltqmdqcr9Uj4V4sPxzKaZ0WBrVAjuk4eFOf/svQUqzQh5YQk
   JMnbFoWEHCuqxKhfMpT4f/cIMOVBrZ+wmcY5Et1e4D0UxZcS821CZqvd5
   rhWbUoxbTNofvhbH3xz8Sf0FcrtPzzSN5Ou5IzaRp3ougGEhQRMfTsWlE
   4Mpbhjtux3oyN3avikhWCnxJNBBwdfWq5ISvztDSH3wxRIqNl4/ON8lFk
   ASQVkeSx3zWJ5zZX98KzkALif37ZsNuU8S2SvMG922Wc2hIFk+pOhp0rc
   HcMv4m/tZoSwN/mp3kB4C01rcEVqhYsZAOP73rrnAutiWlUPbn43S6yJV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="324075979"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="324075979"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:43:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="684400965"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:43:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1oXhqh-001KUn-2L;
	Mon, 12 Sep 2022 14:43:35 +0300
Date: Mon, 12 Sep 2022 14:43:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 16/17] media: atomisp: Remove
 atomisp_source_pad_to_stream_id()
Message-ID: <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-17-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-17-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Sep 11, 2022 at 07:16:52PM +0200, Hans de Goede wrote:
> atomisp_source_pad_to_stream_id() returns ATOMISP_INPUT_STREAM_GENERAL
> unconditionally now. Drop it and directly use ATOMISP_INPUT_STREAM_GENERAL
> in its callers.

...

> -				atomisp_css_capture_enable_online(asd, stream_index, false);
> +				atomisp_css_capture_enable_online(
> +					asd, ATOMISP_INPUT_STREAM_GENERAL, false);

asd can be left on the same line. no?


...

> +		ret = atomisp_css_copy_get_output_frame_info(
> +			asd, ATOMISP_INPUT_STREAM_GENERAL, output_info);

Ditto.

...

> -		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
> +		atomisp_css_input_set_effective_resolution(
> +			isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
>  			crop[pad]->width, crop[pad]->height);

In the similar way...

-- 
With Best Regards,
Andy Shevchenko


