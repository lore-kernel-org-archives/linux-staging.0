Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958C2770A;
	Mon, 16 Oct 2023 21:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCAU7UOU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697491993; x=1729027993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eh05HXNF+uhobEEb9DOvictgVpHsWXXJ0PGHpYZu27Q=;
  b=kCAU7UOUEmIjoVP7Ndk3dERTi3XCRK0dbzcAF8+EMZ9+H4QqCZYq2CPz
   DXO+xK0RSJwccloWZ/u9t1rlzwyqV4dNNHUsq46nPu4uAOvNFN7SVf7l9
   jJo0YQK5ug7qlgF7ewOD3Ir1auhADNnGhmqQ8KvkkC4/A37GDqSAsjQAB
   SAS7aCSobDqKc05+o2d8lt3ZkkrgM0JTw3VRz39zAoIw7l+jnZxjdBaIl
   mReQHrOCs0KaK0SpVxmjDkrG4MGbSNsNag6vkljkli5zALe58aqT0FcvX
   GX/Q0ogQ8c9siD2KaGQNA2wXWOxFLfJA9+w7/iVQ3d16j4YG48QHe97nS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449866261"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="449866261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:33:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929505713"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="929505713"
Received: from yckhoo-mobl2.gar.corp.intel.com (HELO intel.com) ([10.215.157.119])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:33:03 -0700
Date: Mon, 16 Oct 2023 23:32:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] Staging: sm750fb: Rename
 displayControlAdjust_SM750E
Message-ID: <ZS2sCEF/LsO8Fzk1@ashyti-mobl2.lan>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-2-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016201434.7880-2-anonolitunya@gmail.com>

On Mon, Oct 16, 2023 at 11:14:08PM +0300, Dorcas AnonoLitunya wrote:
> Rename function displayControlAdjust_SM750E to
> display_control_adjust_SM750E. This follows snakecase naming convention

I'd go one step further and call it display_control_adjust_sm750e.

Andi
