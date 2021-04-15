Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C407C71
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 19:50:00 +0000 (UTC)
IronPort-SDR: 92ThmLrhBFVC7vpzN1OpUZAa0mK4QzZ23m+j+yR0ICZOK2idST6YXOTZZxNTjobZLZNz8ykmk3
 rr6gUHeNp1fA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="194490225"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="194490225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 12:49:59 -0700
IronPort-SDR: eOU2zCcD3J55/9SE1uLBp57qUwy3FyckoLw/AMgywqjXcLADDBre4t1KbW/NcFUjDBDpz43G9S
 YC2gJK2tk/1Q==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="533244995"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 12:49:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 911F1200E8;
	Thu, 15 Apr 2021 22:49:55 +0300 (EEST)
Date: Thu, 15 Apr 2021 22:49:55 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415194955.GI3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415171409.GC2531743@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge*
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> No, this does not match coding style.  Probably best to break the
> 80-column guideline in this instance.  Best would be to have a function

Having the return type on the previous line is perfectly fine. There should
be a space before the asterisk though.

-- 
Sakari Ailus
