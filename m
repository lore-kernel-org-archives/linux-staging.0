Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854114A3E
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 12:17:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311958487"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="311958487"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707294425"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707294425"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 04:17:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouYOu-00C9xl-2e;
	Mon, 14 Nov 2022 14:17:20 +0200
Date: Mon, 14 Nov 2022 14:17:20 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when
 VIDIOC_S_FMT has not been called yet
Message-ID: <Y3Ix0JXHxj+5ZYdq@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-13-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-13-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:28PM +0200, Hans de Goede wrote:
> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
> works (this was added specifically because of the previously broken
> MMAP support in atomisp).
> 
> Currently this fails because atomisp_get_css_frame_info() fails in this
> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
> it is allowed to do this.
> 
> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
> supported resolution.
> 
> Note this will cause camorama to use mmap mode, which means it will also
> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
> as input format and this will lead to a garbled video display. This is
> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
> that stride == width which is not true on the atomisp.
> 
> I've already send out a libv4lconvert fix for this. Also this can be worked

Link: ?

> around by passing --dont-use-libv4l2 as argument to camorama.

...

> +		struct v4l2_format f = {
> +			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,

> +			.fmt.pix.width = 10000,
> +			.fmt.pix.height = 10000,

If it's just an arbitrary maximum, I would suggest to use definitions from
limits.h, so it will better show the intention.

> +		};

-- 
With Best Regards,
Andy Shevchenko


