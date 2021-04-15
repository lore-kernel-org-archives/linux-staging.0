Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B2E71
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 19:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4GXPFxKdyq+7gB1Susv2wZJndNmxWkS7LuCF5KQHuQY=; b=Y4SXCkeAXvazsSvkYkiE2sv/Pv
	AFnQLfRsLbw3EfJa/blThV05+ruUaq+5QWnu4IGf8VxPEI/MaWMETP6OM+aDqntMSveNjJHPCMHQ9
	DyURa+XnTOOgxb4i+b+ig/wdjemKR9RQnkrDROQ++h+2Xd0CJ7MWen+N98LCOOHncqxoMDMsI8/aC
	69jcVea62je9MdgWzVhD5sw66UoB8EPPPBrpOo5VYNvsGgvRjtl/Yun8pnpwhW17ht+m8nuQ8p3Iy
	tX5+Fgl3pnsGfHdbexZPnotCQF8K+nWKKhOMcSfkb7L46SlJnVuzV0pNXSIFbB6jqADbOpUerCzRY
	bCqZOfvQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lX86q-0091RC-GQ; Thu, 15 Apr 2021 19:57:07 +0000
Date: Thu, 15 Apr 2021 20:57:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415195704.GE2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
 <20210415194955.GI3@paasikivi.fi.intel.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415194955.GI3@paasikivi.fi.intel.com>

On Thu, Apr 15, 2021 at 10:49:55PM +0300, Sakari Ailus wrote:
> On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> > On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > > -    u32 mbus_code);
> > > +const struct atomisp_format_bridge*
> > > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> > 
> > No, this does not match coding style.  Probably best to break the
> > 80-column guideline in this instance.  Best would be to have a function
> 
> Having the return type on the previous line is perfectly fine. There should
> be a space before the asterisk though.

No, it's not.  Linus has ranted about that before.
