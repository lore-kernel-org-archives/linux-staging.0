Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A70185F
	for <linux-staging@lists.linux.dev>; Tue, 14 Jun 2022 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655212123; x=1686748123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msXBuZ0bvyzVTesaAvJbe4Mq7cZJT3HuRTTi9LBEfKY=;
  b=ODvw08MlsmVIfDqQY8P2h3K2iIybcvt2vdoomhvlmc7pnUSfOa28HSCh
   H48K7r/fk4GGDfUKFcZZxvel0YeMynIsCJEvcPEpIJOxodxRX/0/MrzU2
   VrJISZVLObY9jbmiTsOdgxVm74ZawGhObHClD/I5tXFRiUIXeSnN4vDwA
   /uZIBoomFPTUWEFahBJ44NeftziVWEXO7LTx8iKyAzxeFb3ZsQnGwSFU+
   LLjPzH0jopjo6Kq8rv68456T6SJ3LSDz9vqJwmyzB+XpqT6KVWnE/lzoL
   Elolp2ftQ3PHGp4Wmox4kJIcsPe/uWLxYpUlnUjFP46Fb7nh0EkRycqdV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="340274830"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="340274830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:08:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="652027565"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:08:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1o16Hc-000cNW-Ua;
	Tue, 14 Jun 2022 16:08:36 +0300
Date: Tue, 14 Jun 2022 16:08:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 24/40] media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_*
 defines
Message-ID: <YqiIVPjp1ERaVueM@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-25-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-25-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 13, 2022 at 09:51:21PM +0200, Hans de Goede wrote:
> Drop the ATOMISP_ACC_FW_LOAD_* defines, these are no longer used anywhere.

Yeah, we have expect no modification to FW at all (carved in stone) and I do
not believe we have got any alternative firware just out of thin air. OTOH
the definitions are kept in the index, so we can restore them anyway.

-- 
With Best Regards,
Andy Shevchenko


