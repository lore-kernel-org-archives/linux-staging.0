Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0775BEBB;
	Sun, 15 Oct 2023 08:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmCh7m1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697359159; x=1728895159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CAca8yqES/vwF/dRn76EQ04yWk+MHXJZqlcatewvia4=;
  b=YmCh7m1HMiAV5xynZHdUWKcjWy2cPI1Y/R6N5etxLlS8uKcWYkvbSNqP
   HtvTkgjT3+LgXvSUshb+TfzjTjpB0Bn9E1kN2HwlWR68AMbE4oyLwXwRh
   EZDIUhyMEwGZxP0Wg+iYVvHPT54hSSBlmMmQeyEwowDtZi3qT7SeEwlHO
   6rLNbqAF67nPyQ5OzLdofDud0u+rlELb+/Mb2722+T0TMIY08gcVG12RH
   DmeomBo+0PNjDCGlBoKj/uiAEDcXI3Xe/wcd4y1LTBLeMTDoJ7cokPqiu
   iwudY/IQEqxLvy1SrnBRFsu2KFixgEKG6aWrbpmhxPiDVXn1WN+7Q7RyI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385212782"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="385212782"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="731919556"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="731919556"
Received: from ingmingt-mobl1.gar.corp.intel.com (HELO intel.com) ([10.214.164.147])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:39:13 -0700
Date: Sun, 15 Oct 2023 10:39:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192u: Align descendant arguments
Message-ID: <ZSulKrvrrLyfnzND@ashyti-mobl2.lan>
References: <ZSuhYpyYfZz5EhDB@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSuhYpyYfZz5EhDB@gilbert-PC>

Hi Gilbert,

On Sun, Oct 15, 2023 at 09:22:58AM +0100, Gilbert Adikankwu wrote:
> Adhere to Linux kernel coding style.
> 
> "...A very commonly used style is to align descendants to a function
> open parenthesis" - (Excerpted from Linux kernel coding style (#2))
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>

I don't like this commit message. Although it's correctly
written, I think it can be improved in order to be more
immediately understandable.

Write what you did in imperative form:

"Adhere to Linux kernel coding style" doesn't mean much, you can
write

  Align descendant argument to the open parenthesis as per the
  "Linux kernel coding style" in
  Documentation/process/coding-style.rst.

Yuo tell immediately what you did and where to find the
reference. Citing the document in the commit log, in this case,
looks to me like an unnecessary information.

Copy pasting the output of the error is a very good practice and
you can write it as:

  Mute the following checkpatch error:

    CHECK: Alignment should match open parenthesis

> ---
> v2: In the first patch I changed my commit title in the
> email and sent it before amending it in my git tree which then changed
> its SHA ID. I felt it might cause an issue so that is why I did a v2
> of the patch.

It's not an issue, you can do that.

But I'm going to give you another piece of advice that I already
gave in this list. Do not send patches between versions too fast.
Reviewers need some time to review... wait some time before
sending the v2, so that the v1 gets enough visibility. Sometimes
reviewers correct each other, but they need time to read the
e-mails.

This way you would also avoid unnecessary noise.

Andi
