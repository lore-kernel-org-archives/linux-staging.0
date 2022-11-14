Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D96139B
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 10:38:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="310645856"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="310645856"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 02:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707264135"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707264135"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 02:38:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouWqz-00C7oY-1W;
	Mon, 14 Nov 2022 12:38:13 +0200
Date: Mon, 14 Nov 2022 12:38:13 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 04/17] media: atomisp: On streamoff wait for buffers
 owned by the CSS to be given back
Message-ID: <Y3IalSFWZcG0ycjM@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:20PM +0200, Hans de Goede wrote:
> There is no guarantee that when we stop the pipeline all buffers owned
> by the CSS are cleanly returned to the videobuf queue.
> 
> This is a problem with videobuf2 which will complain loudly when not
> all buffers have been returned after the streamoff() queue op has
> returned.
> 
> And this also allows moving a WARN() in the continuous mode path.

...

> +	if (ret <= 0)
> +		return ret ? ret : -ETIME;

You can use Elvis and ETIME is not correct AFAIU, should be -ETIMEDOUT.


-- 
With Best Regards,
Andy Shevchenko


