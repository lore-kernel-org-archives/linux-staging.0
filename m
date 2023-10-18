Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519D134BF;
	Wed, 18 Oct 2023 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWtHTJ5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697624639; x=1729160639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=omynuW7I9or0lJmk/yREjU5Lhj/eeHnYKy2S+nUuHeU=;
  b=ZWtHTJ5AbA4ZzwvOQF/v3oOfx2EkBx/NMVqDyBpVuwseZdiJrfrrEgPT
   QgBrLs9qHmIUXPnf8jGAXDWMKGvND7DcMZhcXM0BrccmB5NwJ4oXx4NYq
   wE6wElJNGYoTBJSLoasQQ3F3xx9URefZ8na0QISTIBrDX8XrBDqe2F3kw
   Z0kYcG2ThVuv8l6dxBaeyuD3n5UISvV9DlJXjFDCEQZpDHiKRuXZbMM7N
   P/QBcwieKga/SCCBc3z7fk0XD95PZxv2eAQJboBN3ngwFmz24RQ3l8wb0
   gk8XGvpBG3mSnhbyTEc3i9oVbSweOO8yhYlIUPjpEFZ65NXmm1Q89OpVJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="417097653"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="417097653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1087886761"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="1087886761"
Received: from nurfahan-mobl3.gar.corp.intel.com (HELO intel.com) ([10.213.159.217])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 03:23:34 -0700
Date: Wed, 18 Oct 2023 12:23:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gdm724x: Add blank line after declaration
Message-ID: <ZS+yHg8uILyX4uHo@ashyti-mobl2.lan>
References: <20231018044609.22616-1-soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018044609.22616-1-soumya.negi97@gmail.com>

Hi Soumya,

On Tue, Oct 17, 2023 at 09:46:07PM -0700, Soumya Negi wrote:
> Fix WARNING: Missing a blank line after declarations
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>

Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
