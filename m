Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951B70
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 18:28:57 +0000 (UTC)
IronPort-SDR: Y/w9pDJnpZktGS+c7wAMiFK0q2uy9B77rYTactHD+p19Sd1MYj4NWR5hWU0cCF9tt9UgQZV6XU
 lKadmSzy93Yg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="202024524"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="202024524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:28:55 -0700
IronPort-SDR: xb0JZcsaIncRDSCIKA0BzvLhrQZgKW46F5371pNdkTp5DIdtSSqUf80AGvDJXz7jvjLch3vJ1p
 CtkITH4RDCWg==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="442158558"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:28:53 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 6E841202F7;
	Mon, 24 May 2021 21:28:51 +0300 (EEST)
Date: Mon, 24 May 2021 21:28:51 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Aniket Bhattacharyea <aniketmail669@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Fix whitespace at the beginning of
 line
Message-ID: <20210524182851.GR3@paasikivi.fi.intel.com>
References: <20210524173609.672153-1-aniketmail669@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524173609.672153-1-aniketmail669@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 24, 2021 at 11:06:09PM +0530, Aniket Bhattacharyea wrote:
> This patch fixes whitespace at the beginning of line by wrapping after
> the type name and aligning the arguments with the open parenthesis.
> Identified by checkpatch: WARNING: please, no spaces at the start of a 
> line.
> 
> Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
