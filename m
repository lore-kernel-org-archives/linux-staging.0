Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1C2FB4
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 19:52:59 +0000 (UTC)
IronPort-SDR: gbhbKcS5pbm6F5oQyR1BEQy4EDaN3u/wguTQb3hNfmBQ/hgwrdGliwdyPP0JpQUzZxZJcsKTbh
 p89p6ltNDiVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199779940"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; 
   d="scan'208";a="199779940"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 12:52:57 -0700
IronPort-SDR: pykGfpnCpfM7zswMkG1eNMwP9EvLV5DsCACCVn3dUeT7jqZBMj0NRGrSZAVwLC8FKINODHNq71
 ZMTuGZ+adxrw==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; 
   d="scan'208";a="547747177"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2021 12:52:55 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 1C2A120248;
	Thu, 27 May 2021 22:52:23 +0300 (EEST)
Date: Thu, 27 May 2021 22:52:23 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: pci: Remove checks before
 kfree/kvfree
Message-ID: <20210527195222.GK3@paasikivi.fi.intel.com>
References: <20210527193922.25225-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527193922.25225-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 27, 2021 at 09:39:22PM +0200, Fabio M. De Francesco wrote:
> Removed checks for pointers != NULL before freeing memory. If kvfree()
> and kfree() are given NULL pointers no operations are performed, so
> there is no need for the above-mentioned checks. Coccinelle detected the
> second of the two unnecessary checks.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
