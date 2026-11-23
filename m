Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432894;
	b=qPESNhNGOOGar3Fb+e21S4/OWApZO3x2IZYnmia0Tf3PVpZPHhF8L7tmc64SW2vueahH
	 qURXCDDfAy76rc9vDIjyfYb5WPJmcoRWZq5kfAZOLf0uk6PVe/ye/8QsOH3j48AOPyMPJ
	 JloV2ig5Y9Yozr13i/luOyhytHexCNC09IeJCZ0GRfhGTdk7/ABAY0g+TM+iAwlHE20HR
	 xL/c+rbgvdP3R+2z7MTsouuzAKJ35Rbz30fPdjIJrEnIBVZhuSB39vh8Ri+/XbqLmJzEC
	 +u93xqcysGbvPBH7lj4wiBbJpaFq4xHxg3DI666li/OAjTU/uSdUqMV+HOuKSZgV+aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432894;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=GbX6flQ02VkAIB6vD/jZQgC2nDjC28v9tILnTQJqHIs=;
	b=vdT5Euqxq+XYPAVbczCGOK/h4SiBnt6yPhNeceZsbmIleQ31DtLVOog7bfJ03cIXhyg2
	 kBw/t9mtYLHrWj9vETrUo0VdIJYn35mk1Ln6lS0cZGdmEB4N47798M8KaBILN9GvvLf+m
	 t2p0Pp1ZvaWb1xhMsZxKjQr0KP513w0ZpD/jnr4A0qEr4L7yJ+dEw1pzFdx15KsZ7NwWr
	 +bgtcS3Ppncd+3t0MeIPDEl0P3lBk0g2k8iiRCIXUohDoViGcK+SW8EHLL6gacqE2wrfc
	 vQaaVpVBFkIyrU76wD3zFHCQzLksX/opsz6TokZ9JKQZ7BEbzJiZ5LCOHp95od9fePQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wq99awHH;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D40606A31E
	for <linux-staging@lists.linux.dev>; Mon, 23 Nov 2026 11:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D40606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wq99awHH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795432894; x=1826968894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k2mj3EEzXAMHzvPUuw/LfMnrNEHeM3dh64V7wG35asc=;
  b=Wq99awHHFDoOBrbujzjmUW5d3rF05lfbQpwzrQnps5GvT5p8t8X4g4fR
   ZC2YJSxq/ZXtwVSKXUpcOH5zwFULivsd8v+8Rt9kD6tSHXxQbutjzcqhQ
   eheGSRahcSGLuRkJb37lgJjgmm3AHmfXAyjRX97Kr67iNjm1TGJK7Nvlg
   pZb29iObD4tcMIh/GovDb6rMQo8WRHhZZzlRvRQmmk/ffwS2ibb/j7iBy
   Rna5ae+ZOi3mJa0JYHdPnwb2ejAx+/efbTP7ck70EtUXMlrpWRz34stV6
   gtuAU9KB1GSlAiMPkKIXWuQTIXAXzYBuD05mQtXkkjSZlw7YUuspTepDn
   w==;
X-CSE-ConnectionGUID: uJyqW2QpSjmCpYB0YnHeYQ==
X-CSE-MsgGUID: /q4AsUlgTSSR6d/mbgbUbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4073287"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4073287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:21:32 -0800
X-CSE-ConnectionGUID: fT2OWFF3S56AIDaFfS8yiw==
X-CSE-MsgGUID: pzLlHaqQTrGMBWsUeYuNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11590559"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:21:29 -0800
Date: Mon, 23 Nov 2026 13:21:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Remove unused ISP vmem load/store
 functions
Message-ID: <awQht2Avu-PHs4l_@ashevche-desk.local>
References: <20261122074552.545-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122074552.545-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Nov 22, 2026 at 07:45:52AM +0000, Avishek Chaulagain wrote:
> 
> isp_vmem_load(), isp_vmem_store(), isp_vmem_2d_load() and
> isp_vmem_2d_store() are the only external functions provided by
> vmem.c, and none of them has a caller anywhere in the tree. Every
> other function in the file (load_vector()/store_vector() and the
> hive_sim_wide pack/unpack helpers) exists solely to implement those
> four, so the whole translation unit is dead.
> 
> Remove vmem.c along with its Makefile entry and the four prototypes
> in vmem_local.h. The t_vmem_elem/t_svmem_elem typedefs and the
> VMEM_ARRAY/SVMEM_ARRAY macros in that header are used elsewhere and
> are kept.

Looks legit, if it compiles,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


