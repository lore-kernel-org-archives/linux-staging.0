Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203713AC2;
	Fri, 13 Oct 2023 11:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gye196l+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196096; x=1728732096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4qcZWCWIBIltuQKs7SwdL1M/OoXqzM5+6D1gYOXf61Q=;
  b=Gye196l+sHNeBGmmNgyIVc/hVEdqv62VhMywB0+OUBZupTIbDQNVeK43
   KpEGtf5coJYdT7YT34vG06oNeZXv1PYWJYXCBzC73s6WxQeo7qY7578Qa
   EmXXOZCHPqy83O4aLWvH2gbcx7hYa6gCpmKJx0gqBA5uPE8zguhHdpvvr
   qQZFrQfWXvIfa+u8FuEGfF7bsRDMF/QnMW80NCjw/3Yz2ukj/kRSeL/iK
   L5lw+g1H0YF6VgkE0ehpe/BAfPr/4CLjR7Q+RFUPFI1z4kOP12AD0xc8E
   dS/6bNagvNBjLDxp4YtfYoMsjER9vxZ2bpz06i747JH7LRtmRF/isLuyt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388010208"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="388010208"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825024794"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="825024794"
Received: from kesooi-mobl1.gar.corp.intel.com (HELO intel.com) ([10.215.155.173])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:21:30 -0700
Date: Fri, 13 Oct 2023 13:21:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <ZSkoNhWDxntTbGpm@ashyti-mobl2.lan>
References: <ZSkg7y2Y2T3midXB@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkg7y2Y2T3midXB@lab-ubuntu>

Hi Calvince,

...

> @@ -1697,7 +1697,8 @@ void prism2sta_ev_info(struct wlandevice *wlandev,
>  	/* Dispatch */
>  	switch (inf->infotype) {
>  	case HFA384x_IT_HANDOVERADDR:
> -		pr_debug("received infoframe:HANDOVER (unhandled)\n");
> +		netdev_dbg(wlandev->netdev,
> +				"received infoframe:HANDOVER (unhandled)\n");

but then you generate this:

CHECK: Alignment should match open parenthesis
#240: FILE: drivers/staging/wlan-ng/prism2sta.c:1701:
+               netdev_dbg(wlandev->netdev,
+                               "received infoframe:HANDOVER (unhandled)\n");

total: 0 errors, 0 warnings, 1 checks, 9 lines checked

:-)

Make it a habit... before sending a patch check it with
checkpatch, in order to be sure you are not introducing other
checkpatch errors.

Don't rush... take your time, check your changes carefully; use
checkpatch, compile test, run sparse, etc. Give others time to
see your patch and comment.

Andi
