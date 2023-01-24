Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684437C
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 12:52:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="412517485"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="412517485"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725460542"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="725460542"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 04:52:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andy@kernel.org>)
	id 1pKImW-00ELRL-13;
	Tue, 24 Jan 2023 14:52:08 +0200
Date: Tue, 24 Jan 2023 14:52:08 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till
 streaming is started
Message-ID: <Y8/UeKTin7fyUrLl@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-47-hdegoede@redhat.com>
 <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
 <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 24, 2023 at 12:31:14PM +0100, Hans de Goede wrote:
> On 1/24/23 11:51, Andy Shevchenko wrote:
> > On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:

...

> >> +	if (sensor->is_streaming == enable) {
> >> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
> > 
> > stopP ?!
> 
> Yes the format string is "%sed" so "stopp" gives us "stopped".

Can we, please, use full words, so it will be easier to find a candidate for
including into string_choices.h or so?

-- 
With Best Regards,
Andy Shevchenko


