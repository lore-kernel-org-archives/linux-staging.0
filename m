Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84B6D28
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 21:22:03 +0000 (UTC)
IronPort-SDR: cFMIntCwd7eh+P2Z3hL55UuWgD1pBYXpz0VMibBefEzoqbiTD7ljiJ+i2mPn5dEMRZVtmdCdnF
 z73gFOtcPUiw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="195057504"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="195057504"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 14:22:02 -0700
IronPort-SDR: edfhmDWBq4D32ytRDaSJdaCo3lFDKzjLHcP4EAWXKQUPkEKrVTbYXKXBIceoIwGr8lx19WZnMn
 YI+F1VdRQubg==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="451258859"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 14:22:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 608852051E;
	Fri, 16 Apr 2021 00:21:58 +0300 (EEST)
Date: Fri, 16 Apr 2021 00:21:58 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415212158.GK3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415195941.GF2531743@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 15, 2021 at 08:59:41PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > > -    u32 mbus_code);
> > > > > +const struct atomisp_format_bridge*
> > > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > > 
> > > > No, this does not match coding style.  Probably best to break the
> > > > 80-column guideline in this instance.  Best would be to have a function
> > > 
> > > Having the return type on the previous line is perfectly fine. There should
> > > be a space before the asterisk though.
> > 
> > No, it's not.  Linus has ranted about that before.
> 
> Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/

Two decades ago, really?

This is simply one of the practical means how you split long function
declarations and avoid overly long lines. Not my favourite though, but
still better than those long lines.

My personal preference would be to wrap at the opening parenthesis and
indent by just a tab, but I know many people who disagree with that...

-- 
Sakari Ailus
