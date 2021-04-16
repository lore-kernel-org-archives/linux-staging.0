Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEBF6D13
	for <linux-staging@lists.linux.dev>; Fri, 16 Apr 2021 08:37:33 +0000 (UTC)
IronPort-SDR: tXkWvcMuysh4A9xq/iuLChDdq3Tk30QJQ4VhsWTTmJqDEymwV9AvjDvGu+9+LpeDypaDEVSAEf
 c0W5X1CJbHBw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="215539943"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="215539943"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:37:33 -0700
IronPort-SDR: 0u3B25yUP3DkaMmFYZ3eX/OFY8cwgwhw61cjwZHiTxcc4h/6teNjzrjGE26MhQQ68prrJJNtyk
 7LkFIY8wKxuQ==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="522648878"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 01:37:30 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 74E3C20188;
	Fri, 16 Apr 2021 11:37:28 +0300 (EEST)
Date: Fri, 16 Apr 2021 11:37:28 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210416083728.GL3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
 <20210415195704.GE2531743@casper.infradead.org>
 <20210415195941.GF2531743@casper.infradead.org>
 <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416054941.GF6021@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dan,

On Fri, Apr 16, 2021 at 08:49:41AM +0300, Dan Carpenter wrote:
> On Fri, Apr 16, 2021 at 12:21:58AM +0300, Sakari Ailus wrote:
> > On Thu, Apr 15, 2021 at 08:59:41PM +0100, Matthew Wilcox wrote:
> > > On Thu, Apr 15, 2021 at 08:57:04PM +0100, Matthew Wilcox wrote:
> > > > On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> > > > > On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > > > > > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > > > > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > > > > > -    u32 mbus_code);
> > > > > > > +const struct atomisp_format_bridge*
> > > > > > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > > > > > 
> > > > > > No, this does not match coding style.  Probably best to break the
> > > > > > 80-column guideline in this instance.  Best would be to have a function
> > > > > 
> > > > > Having the return type on the previous line is perfectly fine. There should
> > > > > be a space before the asterisk though.
> > > > 
> > > > No, it's not.  Linus has ranted about that before.
> > > 
> > > Found it.  https://lore.kernel.org/lkml/1054519757.161606@palladium.transmeta.com/
> > 
> > Two decades ago, really?
> > 
> > This is simply one of the practical means how you split long function
> > declarations and avoid overly long lines. Not my favourite though, but
> > still better than those long lines.
> 
> I've always thought we allow either style, but it has to be done
> consistently within the file.  I was pretty sure that was policy but
> it's another thing that goes back decades so I don't have a reference.
> It shouldn't be about breaking up long lines.
> 
> > 
> > My personal preference would be to wrap at the opening parenthesis and
> > indent by just a tab, but I know many people who disagree with that...
> 
> If you're running into the 80 character limit, then it's fine to use
> two tabs.  I think we have been rejecting patches that push align the
> parameters but push past the 80 character limit.  Using one tab is
> confusing because it makes the decalarations line up with the code.

Interesting. Do you have an example of this? I've thought checkpatch.pl
gave a warning if the line ended with an opening parenthesis no matter
what.

-- 
Kind regards,

Sakari Ailus
