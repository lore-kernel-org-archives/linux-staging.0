Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305103FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 08:06:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="280777760"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="280777760"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:06:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="454711699"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 01:06:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id E51D42051E;
	Mon, 23 Aug 2021 11:06:25 +0300 (EEST)
Date: Mon, 23 Aug 2021 11:06:25 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: CGEL <cgel.zte@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jing yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] ipu3: use flexible-array member instead of
 zero-length array
Message-ID: <20210823080625.GE3@paasikivi.fi.intel.com>
References: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821034709.28061-1-jing.yangyang@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jing,

On Fri, Aug 20, 2021 at 08:47:09PM -0700, CGEL wrote:
> From: jing yangyang <jing.yangyang@zte.com.cn>
> 
> Fix the following coccicheck warning:
> ./drivers/staging/media/ipu3/ipu3-css-fw.h:174:21-34:i
> WARNING: use flexible-array member instead
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>

Thanks for the patch.

Gustavo Silva's patch "media: staging/intel-ipu3: css: Fix wrong size
comparison imgu_css_fw_init" has addressed this, and fixed another problem
as well. In other words, removing array entries from structs can have side
effects.

-- 
Kind regards,

Sakari Ailus
