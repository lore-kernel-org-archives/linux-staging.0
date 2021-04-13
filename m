Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479270
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 16:28:33 +0000 (UTC)
IronPort-SDR: m4Y8fyVtL7/hRzvbzJv+Oy0DDMpRemDWKMu8jesjpKU8z+FGhIXqvy78RndkImLDw8nEqe/szK
 0+7YoKhagUxw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="194476846"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="194476846"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:21:18 -0700
IronPort-SDR: Q51ZUF7fUPgxel3O2ZVeJfjn/hFIrUOaCHA0a9nTOCojMvw50WfJKB6VLPSXbNQS/DgH8ZP5Ay
 AmhW2FitOWsQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="382016739"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:21:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id D28A62082C;
	Tue, 13 Apr 2021 19:21:11 +0300 (EEST)
Date: Tue, 13 Apr 2021 19:21:11 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH v3 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <20210413162111.GX3@paasikivi.fi.intel.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 13, 2021 at 08:58:19PM +0530, Mitali Borkar wrote:
> Changes from v2:- Rebased these four patces and made changes against
> mailine code

Thanks for the update, Mitali.

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
