Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D74A3E
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 12:14:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="310662355"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="310662355"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="701981449"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="701981449"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2022 04:14:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouYLz-00C9ug-2w;
	Mon, 14 Nov 2022 14:14:19 +0200
Date: Mon, 14 Nov 2022 14:14:19 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 10/17] media: atomisp: Convert to videobuf2
Message-ID: <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-11-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:26PM +0200, Hans de Goede wrote:
> Convert atomisp to use videobuf2.
> 
> This fixes mmap not working and in general moving over to
> the more modern videobuf2 is a good plan.

...

> -				/* The is the end, stop further loop */
> +			if (list_entry_is_head(param, &pipe->per_frame_params, list)) {
> +				/* The is the end, stop outer loop */
>  				break;
>  			}

You can drop {} by writing this as

			/* If this is the end, stop further loop */
			if (list_entry_is_head(param, &pipe->per_frame_params, list))
				break;

...

> +		if (!list_empty(&pipe->buffers_waiting_for_param))

Why not positive conditional?

> +			atomisp_handle_parameter_and_buffer(pipe);
> +		else
> +			atomisp_qbuffers_to_css(asd);

...

> +	/*
> +	 * Workaround: Due to the design of HALv3,
> +	 * sometimes in ZSL or SDV mode HAL needs to
> +	 * capture multiple images within one streaming cycle.
> +	 * But the capture number cannot be determined by HAL.
> +	 * So HAL only sets the capture number to be 1 and queue multiple
> +	 * buffers. Atomisp driver needs to check this case and re-trigger
> +	 * CSS to do capture when new buffer is queued.

Indentation of the above seems arbitrary.

> +	 */

...

> +	/*
> +	 * FIXME This if is copied from _vb2_fop_release, this cannot use that

 _vb2_fop_release() ?

> +	 * because that calls v4l2_fh_release() earlier then this function.
> +	 * Maybe we can release the fh earlier though, it does not look like
> +	 * anything needs it after this.
> +	 */

...

> +out:

In some cases you use 'unlock' in some 'out' for the same, I would suggest to
unify as

out_unlock:

in all affected locations.

> +	mutex_unlock(&isp->mutex);
> +	return ret;

-- 
With Best Regards,
Andy Shevchenko


