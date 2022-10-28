Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EF320E;
	Fri, 28 Oct 2022 18:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666980695; x=1698516695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lOfBg+KlCrq6cb2QH12RSluxIBmgdy3fmEm6/zLxFb0=;
  b=bae8GWJltozydDKICF78TWQlingFrfacx3fA+n6BurVwKF/1+3QTnMQd
   kCyzODVDlabKb5ALBLLlA+AM1NuqWOwEB+xmY4C9h3Bw1nELUb1SeSszl
   QDXJ+CE2uWYw+Jj6CeMq+TVobIthOaGPuhDwINvf+8DQyfwcPkzDbypd3
   4T1J33ykIJOAOlSRNP/hCI6jbhjZbSJEnvoOJTcJL3IYQ3CZLF/6SvU96
   n6LU4UiqJooc0Fw3tiqAKAK3O6P9Z3xlLAx5QQxUkNxppSN81LayIPfTc
   5Mg2YXJw+CR5Lx2B4LEGn+RKNnvmSmaKzK5EoXitQ9XyTfO3DvNDMrL8+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="295967988"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="295967988"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:11:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="627605452"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="627605452"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.175.207])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 11:11:35 -0700
Date: Fri, 28 Oct 2022 11:11:33 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v8 0/6] staging: vt6655: a series of checkpatch fixes on
 the file: rxtx.c
Message-ID: <Y1wbVeLCLZClEQ6L@aschofie-mobl2>
References: <cover.1666978292.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666978292.git.tanjubrunostar0@gmail.com>

We know it's a patchset or series, saying so in subject line is 
redundant. Perhaps - 'Checkpatch cleanup in rxtx.c'

On Fri, Oct 28, 2022 at 05:40:52PM +0000, Tanjuate Brunostar wrote:
> The fixes are similar, mostly long lines splitting. I had to make
> serveral patches to ease the work of inspectors
  ^
Please use a spell checker.

> 
> v2: fixed a compilation error found by the kernel test robot and
> recompiled the code

Expected to be in reverse order, with latest changes first.
ie. Here you would start with v8

> v3: tends out the error persisted in the second version. this version is
> a correction of that

?

> 
> v4: did some corrections as recommended by Greg KH

State what changed. Do not expect your review to go back
hunting for past review comments.

Same for all below.

> 
> v5: shortend changelog comments as recommended by Greg KH
> 
> v6: did some corrections as recommended by Greg KH
> 
> v7: fixed some errors on my changelog comments
> 
> v8: fixed some errors pointed out by Philipp Hortmann
> 
> Tanjuate Brunostar (6):
>   staging: vt6655: fix lines ending in a '('

Move ( to end of line

>   staging: vt6655: fix long lines of code in s_uGetRTSCTSDuration

This doesn't match what was actually done

>   staging: vt6655: fix long lines of code in s_uFillDataHead
>   staging: vt6655: fix long lines of code in s_vGenerateTxParamete
>   staging: vt6655: fix long lines of code in the rest of the file

Each commit msg needs to stand alone. The one above only makes
sense (still it's a poor message) when viewed in this patchset.
Once the patches are applied, it must stand alone.

The commit msg should read like a directive. Fix is too general.
Commit msg states what you did, commit log states why you did it.

I see you took 'refactoring' out of the commit messages, but left it
in the commit logs. It doesn't belong in the logs. As another
reviewer pointed out, this is not a refactor.

Alison
> 
>  drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
>  1 file changed, 324 insertions(+), 218 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
