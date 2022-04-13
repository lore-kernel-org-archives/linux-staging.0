Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666882F32;
	Wed, 13 Apr 2022 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649878199; x=1681414199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBmMG/Y1pzjOMY+f80C2PIXPYSoEJlNzIOTHjCL4Elg=;
  b=fxfEYDDsYosGgYuB4Mg89lTuhgPwAXNbIVREuEOSmI6bU1CA7Iplw+NI
   nTb8o6r3ao9SzQvuFiPci2ECxRI7XcY0Tr+jRyIS4VtXfeKTKOpdM9orK
   NKL0wPvi9BTmiYiTVumneDUAuTalFhWzPMPyK87O2ZTuUQIWR4JRCIfba
   ygN6dqDnU9Z5tR23jkGTdktd3cHN1SpOXtIdvIR7NON9hjwjWmoxs36sE
   nNr1bTfy/qkdxf/+QhJbprlYuHzkJA1aWYfgagm4qAHc+lVAvOtD3NUBX
   PVtEe9XdhUso3R1zq6xTqqYlfnT5p7LNCEAqz/fbeLwDdPD2QnTU6ZGip
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242690343"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="242690343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 12:29:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; 
   d="scan'208";a="552337805"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 12:29:57 -0700
Date: Wed, 13 Apr 2022 12:31:52 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Subject: Re: [PATCH] staging: Remove the drivers for the Unisys s-Par
Message-ID: <20220413193152.GA1242449@alison-desk>
References: <20220412215901.31046-1-fmdefrancesco@gmail.com>
 <3988824.6PsWsQAL7t@leap>
 <20220413153824.GA1241369@alison-desk>
 <7390243.EvYhyI6sBW@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7390243.EvYhyI6sBW@leap>

On Wed, Apr 13, 2022 at 11:57:20AM -0700, Fabio M. De Francesco wrote:
> On mercoled? 13 aprile 2022 17:38:24 CEST Alison Schofield wrote:
> > On Wed, Apr 13, 2022 at 09:35:53AM +0200, Fabio M. De Francesco wrote:
> > > On mercoled? 13 aprile 2022 08:52:47 CEST Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 12, 2022 at 11:59:01PM +0200, Fabio M. De Francesco 
> wrote:
> > > > > The Unisys sub-tree contains three drivers for the "Unisys Secure 
> > > Partition"
> > > > > (s-Par(R)): visorhba, visorinput, visornic.
> > > > > 
> > > > > They have no maintainers, in fact the only one that is listed in 
> > > MAINTAINERS
> > > > > has an unreacheable email address. During 2021 and 2022 several 
> patches 
> > > have
> > > > > been submitted to these drivers but nobody at Unisys cared of 
> reviewing 
> > > the
> > > > > changes. Probably, also the "sparmaintainer" internal list of 
> > > unisys.com is
> > > > > not anymore read by interested Unisys' engineers.
> > > > > 
> > > > > Therefore, remove the ./unisys subdirectory of staging and delete 
> the 
> > > related
> > > > > entries in the MAINTAINERS, Kconfig, Makefile files.
> > > > > 
> > > > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > > ---
> > > > >  MAINTAINERS                                   |    8 -
> > > > 
> > > > You forgot to at least cc: the people/list on the MAINTAINERS entry 
> that
> > > > you are removing here, to give them a hint that this is happening in
> > > > case they want to speak up here (and to give us the ability to point 
> to
> > > > that years later when they complain they were never notified...)
> > > 
> > > Yes, this is a good idea. I'll submit a v2 and add two "Cc:" lines, one 
> to 
> > > David Kershner and the other to the "sparmaintainer" list at 
> unisys.com.
> > 
> > There is another contact in the TODO file (last updated 2015 though ;))
> > Ken Cox <jkc@redhat.com>
> 
> Hi Alison, Greg,
> 
> Thank you very much for noticing that other contact :) 
> 
> In the last 12 months I have sent several patches for Unisys s-Par drivers 
> but I never noticed that other contact simply because I only ever use 
> scripts / get_maintainer.pl to find out who and to which lists to send my 
> works.
> 
> @Greg: 
> 
> Do you think that we should care of a contact that is no more active since 
> 2015 and resubmit a v3 with one more "Cc:" line? I have no problems to 
> resubmit, I just want to be sure that this is the right thing to do.

I didn't see a v2, so confused about a v3. You could simply do a group
reply and add the contact, that'll put a trail in lore. Not my call.
Guessing Greg has a protocol for such removals. 

> 
> Thanks,
> 
> Fabio M. De Francesco
>  
> 
> 
