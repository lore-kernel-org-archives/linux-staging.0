Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C942BFF;
	Wed, 18 Oct 2023 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnKBOTMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697667433; x=1729203433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uYBVBXbi85koNDPpvMhT/9afV4TOrNCWEn+UPSqZ71o=;
  b=VnKBOTMf74ngIQGTLukRhPp8hY3JRQl9+jKS8wx7J3QqihZ/HMyqkR/T
   eKwzIonjB1betlUiHb0DKVL0uCAYXhhUeOX+lfCGjdeJN2e4eDoNYLsXw
   B5BZxejLFBqt/uSb8lb2rty89cZ+8d1cWZZb9a1ChecMKu5cbd1JX2RFr
   x9okIQNm7OdewxjcsSYqnx0ExWLK5otIJ0JC1PrTVKC1ppHD7wPwnMcZ5
   3nPV7Pu898haQkRsbxfdDdMmrFrG41suavPxm/88lMm9eYzC2wMO42Vqa
   akU6wEjRBXUTdUmuEBu1wh/nWsJto9PxawDe0OPt/L2MMFWQiuWhcoCaZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="385005526"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="385005526"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="733331062"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="733331062"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2) ([10.212.171.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:17:12 -0700
Date: Wed, 18 Oct 2023 15:17:10 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kenechukwu maduechesi <maduechesik@gmail.com>,
	outreachy@lists.linux.dev, shreeya.patel23498@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Replace delay function.
Message-ID: <ZTBZZvE/oYqCYNPp@aschofie-mobl2>
References: <20231018004300.GA3189@ubuntu>
 <7bc719c4-459f-3d8-7ed-b1e1adf158@inria.fr>
 <1118ec6d-e1e7-79f3-08e4-9a79c996eed1@intel.com>
 <2023101853-axis-stylist-f1b9@gregkh>
 <7dde176b-1059-e9a4-a023-0243cce61d01@intel.com>
 <12b375b1-acd3-476e-17bc-b4db22efba69@inria.fr>
 <cf483cb5-7d94-9514-2213-46778b5ac9f4@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf483cb5-7d94-9514-2213-46778b5ac9f4@intel.com>

On Wed, Oct 18, 2023 at 12:40:33PM +0200, Karolina Stolarek wrote:
> On 18.10.2023 12:28, Julia Lawall wrote:
> > 
> > 
> > On Wed, 18 Oct 2023, Karolina Stolarek wrote:
> > 
> > > On 18.10.2023 09:45, Greg Kroah-Hartman wrote:
> > > > On Wed, Oct 18, 2023 at 09:32:46AM +0200, Karolina Stolarek wrote:
> > > > > On 18.10.2023 09:03, Julia Lawall wrote:
> > > > > > 
> > > > > > 
> > > > > > On Tue, 17 Oct 2023, kenechukwu maduechesi wrote:
> > > > > > 
> > > > > > > Replace udelay() with usleep_range() for more precise delay handling.
> > > > > > > 
> > > > > > > Reported by checkpatch:
> > > > > > > 
> > > > > > > CHECK: usleep_range is preferred over udelay
> > > > > > 
> > > > > > This message is typically not a good candidate for outreachy patches,
> > > > > > because you need access to the device to be sure that any change is
> > > > > > correct.
> > > > > 
> > > > > Could we add a paragraph on how to pick good checkpatch.pl error to fix to
> > > > > the Outreachyfirstpatch docs? This could go to "Find a driver to clean up"
> > > > > section, for example.
> > > > 
> > > > The ability to find a "good" error changes over time, so this might be
> > > > hard to do.
> > > 
> > > I agree, but we can all agree that experimenting with udelay during Outreachy
> > > is not a good idea, and people should know about it
> > 
> > In general, I think that it is better in the contribution period to do the
> > wrong thing and then learn about why it is wrong, but this case comes up
> > over and over, and it is always not the right thing to do, so I added an
> > appropriate explanation.  Thanks for the suggestion.
> 
> Absolutely. Thanks for the docs update. Still, one thing -- is empty section
> after "Some drivers that are on their way out of the kernel are:"
> intentional?
> 
> All the best,
> Karolina

Perhaps an applicant can expand on that "Find a driver to clean up..."
section with a overview of how to use the Outreachy Mailing list,
or any Mailing list to search for patches that cleaned up up the
checkpatch error/warning/check that they are examining.

Here's the query for the udelay one:
https://lore.kernel.org/outreachy/?q=%22CHECK%3A+usleep_range+is+preferred+over+udelay%22

When submitters include the actual checkpatch string in their commit log 
it very easy to find and reference.

For the first patch tutorial, I'll suggest something as simple as:
1) goto https://lore.kernel.org/outreachy/
2) enter the checkpatch string in the 'search' box
3) boom - go see what others have done with this checkpatch error

Or, if someone wants to get fancy they can add screenshots :)

Note, that we really like to keep the language similar on these
cleanups. Find a few references, and do as they did.

> 
> > 
> > julia
> > 
> > > 
> > > All the best,
> > > Karolina
> > > 
> > > > 
> > > > good luck!
> > > > 
> > > > greg k-h
> > > 
> 
