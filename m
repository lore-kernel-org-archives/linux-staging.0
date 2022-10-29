Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F115A9;
	Sat, 29 Oct 2022 00:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667003387; x=1698539387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=129hnGUQvsxt/lwpqd+6L+N0PJvRLE66kgZPbDoSL7I=;
  b=aLQj3mc+8zEFxtLxMdG7R3dTZ/HkF7hkze35fsy3ctyL2qKscr01d+Wg
   puuCFPYC37DCTOzNt4SgZ/tKRxR3RoIKDV7+QivoGc8Z3e3VmRwHzkX1V
   AM1yrYp14ii7nx+PjvXYP1hH4PFbFfbRd9fewkYdKf8kMTgPikRVnu9O2
   ASq1o6tkswtqvpCFg7R3dMbthwDQWt0HWZDOuUfny+Gl7XVx72VC3sr4N
   V6UC+BH3kRVWBsKqMiFM9+TBGgcEDRDIwOuRc7tMxmRGvYjtnyMiNBMyv
   0xSgRJgWoisLJIXqRcHQ9HHCjaJ+Z+wJfUhmYia2FhkT7sO6dxpYCIJk3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="335268803"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="335268803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 17:29:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="584104027"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; 
   d="scan'208";a="584104027"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.175.207])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 17:29:46 -0700
Date: Fri, 28 Oct 2022 17:29:44 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v9 0/6] Checkpatch cleanup in rxtx.c
Message-ID: <Y1xz+ETEgDg5dd9u@aschofie-mobl2>
References: <cover.1666995639.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666995639.git.tanjubrunostar0@gmail.com>

Tanjuate,

Wow - I've seen 4 revs of this in 12 hours?!

I reviewed each Patch against the feedback previously
offered, and it was not addressed, so I'm going to NAK
this set and ask you to rework carefully before resending.
I expect to see each specific piece of reviewer feedback,
called out as addressed in the changelog.

BTW - I still prefer a single patch at a time while you are
learning these mechanics, and to make sure that this type
of patch is going to be accepted.

If you are still amenable to doing that, keep the version,
but only send one patch at a time. When one gets accepted,
apply those learnings to the second patch, and so on.

That should go more smoothly for you and your reviewers.

Alison

On Fri, Oct 28, 2022 at 11:23:21PM +0000, Tanjuate Brunostar wrote:
> v9: reorganized the changelog messages on this patch
> 
> v8: made commit messages clearer, unsuccessfuly
> 
> v7: made log messages less confusing
> 
> v6: fixed some errors on commit messages
> 
> v5: shortend changelog comments
> 
> v4: made some changes on the code
> 
> v3: fixed compilation errors
> 
> v2: tried fixing compilation erros unsuccessfuly
> 
> Tanjuate Brunostar (6):
>   staging: vt6655: fix lines of code ending in a '('
>   staging: vt6655: split long lines of code in s_uGetRTSCTSDuration
>   staging: vt6655: split long lines of code in s_uFillDataHead
>   staging: vt6655: split long lines of code in s_vGenerateTxParamete
>   staging: vt6655: split long lines of code in some functions
>   staging: vt6655: fix lines of code ending in a '('
> 
>  drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
>  1 file changed, 324 insertions(+), 218 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
