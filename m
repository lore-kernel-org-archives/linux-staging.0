Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0276D13
	for <linux-staging@lists.linux.dev>; Fri, 16 Apr 2021 08:54:38 +0000 (UTC)
IronPort-SDR: l0vsoy84fQkyN4NP5A8Y7I9IkAYdXSCSvp0iMve0OhqTHjLale1OI3pTYCITfqKsEHYHnM7XhI
 x6cDsife1xTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194570150"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="194570150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:54:36 -0700
IronPort-SDR: BYCOgwJ1gbYMUxmrO50htGnKHmyFxtbXuGOi1ipu6Pihc6LpDHJFD3MRAVOBN/I27YxthQiLyE
 sdpLtBM3Zokg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="453267127"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:54:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 4BE3D20188;
	Fri, 16 Apr 2021 11:54:32 +0300 (EEST)
Date: Fri, 16 Apr 2021 11:54:32 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210416085431.GM3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
 <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam>
 <20210416083728.GL3@paasikivi.fi.intel.com>
 <alpine.DEB.2.22.394.2104161045140.8503@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104161045140.8503@hadrien>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 16, 2021 at 10:46:54AM +0200, Julia Lawall wrote:
> > > If you're running into the 80 character limit, then it's fine to use
> > > two tabs.  I think we have been rejecting patches that push align the
> > > parameters but push past the 80 character limit.  Using one tab is
> > > confusing because it makes the decalarations line up with the code.
> >
> > Interesting. Do you have an example of this? I've thought checkpatch.pl
> > gave a warning if the line ended with an opening parenthesis no matter
> > what.
> 
> Checkpatch is a perl script that searches for patterns that often indicate
> code that is hard to understand.  It is not a precise definition of what
> is allowed in the Linux kernel.  Humans have to amke compromises.

Yeah... but I'd think if this is a preferred style then the warning could
be omitted. It might not be that difficult.

-- 
Sakari Ailus
