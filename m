Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0E70
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 16:37:37 +0000 (UTC)
IronPort-SDR: Ezm4pbM3gMTaitkRjZXcprH7L5PK4H0mymmCTIJ5/ybN1jR4yA4WFVHm/seNM7Z/ZKVho6/4/o
 pfIzC2u67XNg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="200341854"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="200341854"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:37:34 -0700
IronPort-SDR: eDYEv6J9mE48IvFZZmQYVJZZg1dkizKn7462J1jAilYLdjkiuNLklBUak49FYkqeZK5tLtFBHT
 5KWc6U1bg8Qg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="546698766"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 09:37:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 75B3E20337;
	Tue, 25 May 2021 19:37:30 +0300 (EEST)
Date: Tue, 25 May 2021 19:37:30 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: atomisp: Use sysfs_emit() instead of sprintf()
 where appropriate
Message-ID: <20210525163730.GJ3@paasikivi.fi.intel.com>
References: <20210513034650.252993-1-phind.uet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513034650.252993-1-phind.uet@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 13, 2021 at 11:46:50AM +0800, Nguyen Dinh Phi wrote:
> sysfs_emit() is preferred over raw sprintf() for sysfs attributes since it
> knows about the sysfs buffer specifics and has some built-in sanity checks.
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
