Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00F2C80
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 11:05:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="215152129"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="215152129"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:05:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="462289320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:05:07 -0700
Received: from andy by smile with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1mcQRl-00025D-6H;
	Mon, 18 Oct 2021 14:04:49 +0300
Date: Mon, 18 Oct 2021 14:04:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>, Alan <alan@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <YW1U0UtNpA9DYZ56@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 18, 2021 at 01:19:40AM +0900, Tsuchiya Yuto wrote:

Just a remark, your To is not filled. At some point I had written a script [1]
to help me with patch series sending, It also tries to be smart to include
necessary people and mailing lists (you can always alter it by adding more).
[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


