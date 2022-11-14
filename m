Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497C24C63
	for <linux-staging@lists.linux.dev>; Mon, 14 Nov 2022 12:22:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="313758413"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="313758413"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="616292190"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="616292190"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 14 Nov 2022 04:22:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1ouYTc-00CA4N-0X;
	Mon, 14 Nov 2022 14:22:12 +0200
Date: Mon, 14 Nov 2022 14:22:11 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 00/17] media: atomisp: Convert to videobuf2
Message-ID: <Y3Iy86AUKvoMz2l1@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 20, 2022 at 09:55:16PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my patch series converting the staging atomisp driver to use
> the videobuf2 framework, fixing MMAP mode not working.
> 
> New in v2 is that the "media: atomisp: Convert to videobuf2" patch
> now also contains moving over to using a per vb_queue lock as is
> standard for v4l2 drivers. This removes a bunch of FIXME + checkpatch
> warnings (due to commented out prep for this) from v1 of this patch.
> This v2 also fixes the 1 new warning pointed out by the lkp test robot.
> 
> For some more background info here are the still relevant bits of
> the v1 cover-letter:
> 
> This also contains an important fix to try_fmt handling, so that
> the various supported output formats can actually be used by userspace
> which calls try_fmt before doing s_fmt.
> 
> So slowly this is starting to look more and more like a standard
> v4l2 device (with all the complex pipeline handling hidden in the driver,
> moving that to userspace seems to be impossible with this design since
> multiple pipeline steps are handled by a single firmware program).

I completely in favour of the series, so
Reviewed-by: Andy Shevchenko <andy@kernel.org>
for non-commented patches, for the commented, where comment is a "side note".

For the rest depends on your action, if you are going to address as suggested,
feel free to add my tag.

-- 
With Best Regards,
Andy Shevchenko


