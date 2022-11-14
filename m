Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B94A3E
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 11:53:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="376215294"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="376215294"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 03:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727497671"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="727497671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2022 03:53:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouY2D-00C9SJ-2i;
	Mon, 14 Nov 2022 13:53:53 +0200
Date: Mon, 14 Nov 2022 13:53:53 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 06/17] media: atomisp: Also track buffers in a list
 when submitted to the ISP
Message-ID: <Y3IsUUUjonfNclcb@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-7-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:22PM +0200, Hans de Goede wrote:
> Instead of using an integer to keep count of how many buffers have
> been handed over to the ISP (buffers_in_css) move buffers handed
> over to the ISP to a new buffers_in_css list_head so that we can
> easily loop over them.
> 
> This removes the need for atomisp_flush_video_pipe() to loop over
> all buffers and then (ab)use the state to figure out if they
> were handed over to the ISP.
> 
> Since the buffers are now always on a list when owned by the driver
> this also allows the buffer_done path on flush vs normal completion
> to be unified (both now need a list_del()) and this common code can
> now be factored out into a new atomisp_buffer_done() helper.
> 
> This is a preparation patch for moving the driver over to
> the videobuf2 framework.

...

> +int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
>  {
>  	unsigned long irqflags;
> +	struct list_head *pos;
> +	int buffers_in_css = 0;
>  
> +	spin_lock_irqsave(&pipe->irq_lock, irqflags);
>  
> +	list_for_each(pos, &pipe->buffers_in_css)
> +		buffers_in_css++;
> +
> +	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
> +
> +	return buffers_in_css;
> +}

Looking at this I come up with the
https://lore.kernel.org/r/20221114112842.38565-1-andriy.shevchenko@linux.intel.com

But I think your stuff will be earlier in upstream, so feel free to create
a followup later on.

...

> +		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
> +		if (vb) {

Wouldn't simply list_empty() work here? (Yes, you would need to have else
branch under spin lock, but codewise seems better to me).

> +			list_move_tail(&vb->queue, &pipe->buffers_in_css);
> +			vb->state = VIDEOBUF_ACTIVE;
>  		}

>  		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>  
> +		if (!vb)
> +			return -EINVAL;


-- 
With Best Regards,
Andy Shevchenko


