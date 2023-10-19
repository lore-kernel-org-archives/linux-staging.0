Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC23158B;
	Thu, 19 Oct 2023 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqqWujFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697730147; x=1729266147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oh5pmAgDCd2gtHRN+bxNVTY3NzlD1CeuvsiPYhNrM0=;
  b=hqqWujFSduTGjgJXijW2ZfsBtiVW1i/EtkQ4dzsTUHC9hAPXL2z/VdGs
   560Z642d5pKXEwEaCI2z4lp5m/jTSDiHX/dMzqmG4JSh6sjWFcD9kAymN
   7cn8FD9u2nhEGqpghdMkLnOBGjp6nue+Fo3AkkFEm0Sy1dVfMnvz0QHTX
   0vOwSA7PfxZQHgBAJKEE5srvsl3Qu0UkisK0s8EDgoywuZbCBqzmEE7ss
   UyRq8jvn0ePAdP3R8a39sEUCZq7E05DLWRwJjIqwU0c3wPlwapfSCv6lV
   Ta71+dKY68yvwF/NBbDgB/2J43S5cs8lsgWMkLlbXj1r/UiwIToM3MHRx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386110787"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="386110787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="930648762"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930648762"
Received: from jiaminka-mobl1.gar.corp.intel.com (HELO intel.com) ([10.215.251.143])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 08:42:20 -0700
Date: Thu, 19 Oct 2023 17:42:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <ZTFOUdMrDUylwa6F@ashyti-mobl2.lan>
References: <cover.1697696951.git.soumya.negi97@gmail.com>
 <cad6da28b5f772957ced5b561b21b5d8c8204bc9.1697696951.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cad6da28b5f772957ced5b561b21b5d8c8204bc9.1697696951.git.soumya.negi97@gmail.com>

Hi,

On Thu, Oct 19, 2023 at 12:20:09AM -0700, Soumya Negi wrote:
> vme.c uses printk() to log messages. To improve and standardize message
> formatting, use logging mechanisms pr_err()/pr_warn() and
> dev_err()/dev_warn() instead. Retain the printk log levels of the
> messages during replacement.
> 
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>

Acked-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
