Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD854C64
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 16:04:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330394955"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="330394955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="735523576"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="735523576"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2023 08:04:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pUV80-00A1o7-0l;
	Tue, 21 Feb 2023 18:04:28 +0200
Date: Tue, 21 Feb 2023 18:04:27 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous
 mode support
Message-ID: <Y/Tri9ArpjxWZfoB@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 21, 2023 at 03:58:56PM +0100, Hans de Goede wrote:
> Hi All,
> 
> This is the first step of the removal of special/obscure features
> discussed here:
> 
> https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
> 
> Plus some follow-up patches removing some dead code (some new dead
> code as well as some pre-existing dead code).

As usual for non-commented
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


