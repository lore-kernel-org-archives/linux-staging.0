Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A971
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 09:19:01 +0000 (UTC)
IronPort-SDR: SgKCRFdzJb+GLU4CrqiYGkxCLQOy9RuvgdqdirE+w7yYIK/obrRVAQmDWO9c8yd5dvvX6UgMI0
 t08UMlLoPVcg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195858627"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="195858627"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:18:59 -0700
IronPort-SDR: gUc7e3gkI8Fyv0bXaNY1wSQeG2wcpR4s1OBErdbZZRNtUf088ofFUROUULEAZ3mHmbwcgZQ8tU
 YMeuNiiax4+w==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="615320703"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:18:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 2EAEB203BC;
	Mon, 26 Apr 2021 12:18:55 +0300 (EEST)
Date: Mon, 26 Apr 2021 12:18:55 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210426091855.GT3@paasikivi.fi.intel.com>
References: <20210421123718.GA4597@focaruja>
 <20210421131522.GI3596236@casper.infradead.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421131522.GI3596236@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 21, 2021 at 02:15:22PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 21, 2021 at 09:37:18AM -0300, Aline Santana Cordeiro wrote:
> > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge *
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> As I said, better to break the 80 column rule than do this.

May depend on the maintainer, as well as other reviewers. It's a question
of priorities.

I'd suggest otherwise.

-- 
Sakari Ailus
