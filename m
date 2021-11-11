Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FDD2C81
	for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 16:10:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="212973394"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="212973394"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:10:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; 
   d="scan'208";a="534447537"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 08:10:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mlCe5-005nYt-Ji;
	Thu, 11 Nov 2021 18:09:49 +0200
Date: Thu, 11 Nov 2021 18:09:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nable <nable.maininbox@googlemail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <YY1ATbqn2fAg8Oct@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-5-kitakar@gmail.com>
 <20211026092637.196447aa@sal.lan>
 <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan>
 <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan>
 <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 11, 2021 at 11:34:23PM +0900, Tsuchiya Yuto wrote:
> On Mon, 2021-11-01 at 14:10 +0000, Mauro Carvalho Chehab wrote:
> > Em Mon, 01 Nov 2021 22:38:55 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:

...

> The full output of the make error is here:
> 
>         ("NOTE: issue: some undeclared errors")
>         https://github.com/kitakar5525/linux-kernel/commit/a932d16681f941161385659b9d0316a3a4975e86

I just realize that we may do at some point

cflags-y += -Werror

to avoid changes that breaks build (with warnings). And also I would suggest
to run build with `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`

-- 
With Best Regards,
Andy Shevchenko


