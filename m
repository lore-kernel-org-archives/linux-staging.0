Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3ED1FD1;
	Tue, 12 Apr 2022 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649787228; x=1681323228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDaXrLDw4lgEJumSnzdhY5w+I+hBHbc9J2e6IHG1N5I=;
  b=UgUNIauu60evxxC50ssd2WFnvHvGCPDMo+H+HshnJyaec5UyTThc9rNf
   Tgjiv2VvDACA7Ye9cprII75Z355Os2eykB6fyU6J53s9k+MIHtXVPq5Vj
   5tQtg3AqAxxuL2QtUyQ3BuNFjLo4JJYo8B5qEbp7I5/PsIJvFbeQHQ4qR
   /WPRZ5w9VJmgAwk0GmIqxKxr2Rz/NihYLOO+neCo47uqbtmUkLVl6C7rc
   MasG1z+0bKRQqxNtQxj7tvXMcXSur7efo9Y+VyAj/WbBCOFxI3+PwE+2e
   QY7+SBniHuD8tZMQCuctmRt9dzv0GmqFUaoFt4eFmz3Fw6CjrZ//dmUzC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261909058"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="261909058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:10:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="526605347"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:10:29 -0700
Date: Tue, 12 Apr 2022 11:12:25 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Bruno Moreira-Guedes <codeagain@codeagain.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 3/3] staging: vme: "drivers/staging/vme" tree cleanup
Message-ID: <20220412181225.GC1236898@alison-desk>
References: <cover.1649721450.git.codeagain@codeagain.dev>
 <142698e3761c1e7ba8b17cdd9dc077472ef81668.1649721450.git.codeagain@codeagain.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <142698e3761c1e7ba8b17cdd9dc077472ef81668.1649721450.git.codeagain@codeagain.dev>

On Tue, Apr 12, 2022 at 03:58:25AM -0300, Bruno Moreira-Guedes wrote:

> [PATCH v2 3/3] staging: vme: "drivers/staging/vme" tree cleanup

Only the commit msg again ;)

staging: vme: Move drivers/vme to drivers/vme_user

I think that's the whole point here.

That's all!

snip
> 


