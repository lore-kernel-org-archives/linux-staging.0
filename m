Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408FE8479
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 18:27:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="328201799"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="328201799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:27:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="661812061"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="661812061"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 10:27:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pK1Xd-00Ds9X-2r;
	Mon, 23 Jan 2023 20:27:37 +0200
Date: Mon, 23 Jan 2023 20:27:37 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: Re: [PATCH 56/57] media: atomisp: pci: hive_isp_css_common: host:
 vmem: Replace SUBWORD macros with functions
Message-ID: <Y87Rmdv84KrQ34Yg@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-57-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-57-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 23, 2023 at 01:52:04PM +0100, Hans de Goede wrote:
> From: Brent Pappas <bpappas@pappasbrent.com>
> 
> Replace the macros SUBWORD() and INV_SUBWORD() with functions to comply
> with Linux coding style standards.

...

> +static inline hive_uedge
> +subword(hive_uedge w, unsigned int start, unsigned int end)
> +{
> +	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
> +}

...

> +static inline hive_uedge
> +inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> +{
> +	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
> +}

...

Brent, maybe you can look at these deeply and convert them to use GENMASK()
instead? (It can be done as a followup patch, this one is fine)

-- 
With Best Regards,
Andy Shevchenko


