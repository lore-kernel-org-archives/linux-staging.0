Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EB51FD1;
	Tue, 12 Apr 2022 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649786887; x=1681322887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAG5O+Uw+D2QHrHyu7UtILoUVvKnaKhfn+G8WwPaG38=;
  b=hfEKRdkAdLMnkCFsiHPsDvbglXZ3eCype2k7pmrTcBmlQev7lVAEF/Xr
   4zJJcCNpS3kxGoR50+VWua4OfWVMrDw672RPCmwWpL1zYzxAqtsF8QkH0
   mKp8JUZ3ym7weXP12sLxAmFWrIU4ZX5fBSlkSsPguHW21rjIl0tfM0AZQ
   WxVwA93t6q1HzLWtgDevrxFib1lWoZSzCSi3W0N6si3Qyr4j0DJ81B2Os
   rK7yfXwYRD+Tts6AQNLjso9jKo3/SClJAWNrklBJfZjqBytQVT7dmX6Qs
   2Q8qpvS5In4JxjFYPdYigL6FsaZ3EMcfMdAQRh++WL7dQohwRDnCuNTfG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="322908963"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="322908963"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:01:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="526600127"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:01:53 -0700
Date: Tue, 12 Apr 2022 11:03:50 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 2/3] staging: vme: Fix missing `depends on` at KConfig
Message-ID: <20220412180350.GB1236898@alison-desk>
References: <cover.1649721450.git.codeagain@codeagain.dev>
 <aab0591ac73a54059621c722a63635d43a446fd2.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab0591ac73a54059621c722a63635d43a446fd2.1649721450.git.codeagain@codeagain.dev>

On Tue, Apr 12, 2022 at 03:56:43AM -0300, Bruno Moreira-Guedes wrote:

> [PATCH v2 2/3] staging: vme: Fix missing `depends on` at KConfig

Be direct in the commit msg. Perhaps -
'Add 'depends on' VME_BUS to Kconfig'

That's all!

snip


