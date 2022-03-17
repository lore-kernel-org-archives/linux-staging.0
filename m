Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125B27A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647504652; x=1679040652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXBqqHeuv6Kfo6eqhu67KJHFiGvTClaGi6ULPJtbxU0=;
  b=lmNy/KjMtMJkiv/qnHqEeIfpIHOTbG8hQ2nkGTQBmZp9MdsvkahOGZdO
   gwx6jKkNAygXPZ9KO3Zzc2bZMMlmgYJVY2fDX7Qit41OLnpJUZpxNVn+o
   9ALjbd5wqVxDIg768O6j9xrKp3nrmF3djRknXmo6WyCD2uT7u/6IxOEw/
   +i2QEu0nT2yWI+5yotbQExeAg9mdir3oPNS3kAw5yrItdyEpio6kDDCnP
   /inpQ49qkjW1Wsr8yV71lEzj7JXJ4yCWpcCPHxOnX38+keJLWvtJS8f8I
   vHV+qdv17wYb7awkG8UPmfaMKKsAkUCYcbiHCx39k2DM9juMVfQgP8MCB
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="257000418"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="257000418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 01:10:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="541277274"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 01:10:48 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 37AE720090;
	Thu, 17 Mar 2022 10:10:46 +0200 (EET)
Date: Thu, 17 Mar 2022 10:10:46 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v4] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
Message-ID: <YjLtBv1/DiqH4/ez@paasikivi.fi.intel.com>
References: <20220317075713.10633-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317075713.10633-1-hpa@redhat.com>

On Thu, Mar 17, 2022 at 03:57:13PM +0800, Kate Hsuan wrote:
> For the AF configuration, if the rightmost stripe is used, the AF scene
> will be at the incorrect location of the sensor.
> 
> The AF coordinate may be set to the right part of the sensor. This
> configuration would lead to x_start being greater than the
> down_scaled_stripes offset and the leftmost stripe would be disabled
> and only the rightmost stripe is used to control the AF coordinate. If
> the x_start doesn't perform any adjustments, the AF coordinate will be
> at the wrong place of the sensor since down_scaled_stripes offset
> would be the new zero of the coordinate system.
> 
> In this patch, if only the rightmost stripe is used, x_start should
> minus down_scaled_stripes offset to maintain its correctness of AF
> scene coordinate.
> 
> Changes in v2:
> 1. Remove the setting of the first stripe.
> 
> Changes in v4:
> 1. x_start is estimated based on the method for both stripes are enabled.
> 2. x_end is estimated based on the width.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, Kate!

Applied to my tree.

-- 
Sakari Ailus
