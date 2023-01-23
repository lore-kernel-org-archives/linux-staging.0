Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C92EA5
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 14:38:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="327311746"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="327311746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 06:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="654962103"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="654962103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 23 Jan 2023 06:38:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pJxy7-00DmaB-1m;
	Mon, 23 Jan 2023 16:38:43 +0200
Date: Mon, 23 Jan 2023 16:38:43 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 14/57] media: atomisp: Check buffer index is in range
 inside atomisp_qbuf_wrapper()
Message-ID: <Y86b86l5Bi1mb7oj@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-15-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-15-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:51:22PM +0100, Hans de Goede wrote:
> Check buffer index is in range inside atomisp_qbuf_wrapper() before
> using it do index pipe->frame_request_config_id[].

...

>  	/* FIXME this abuse of buf->reserved2 comes from the original atomisp buffer handling */

Does the comment belong to this check?

> +	if (buf->index >= vdev->queue->num_buffers)
> +		return -EINVAL;
> +
>  	if (!atomisp_is_vf_pipe(pipe) &&
>  	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
>  		/* this buffer will have a per-frame parameter */

-- 
With Best Regards,
Andy Shevchenko


