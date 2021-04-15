Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143136D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=USIt7kQju8YFJVq4Oq/9MfaoCKu4uLeI8t4U8FPhcmk=; b=bT3jy1Cxw3z/cEHs8tgvzwL3u5
	7wRsbvatgfLKvp+ni8I1+1LRiWSNDU6dpwMNk3YCaMDJpWlh6fK70Fl8MByC9hNDlD502a2Acf552
	qk+x2nkMAB5vl5CGsHU0t3yP6d9YTqTIrM4W/39a6qMxDEApmSyE9SNokr8vrufuQseacbVFtFJgV
	KLsZywHDDAAstkbh1g9qc32ne7wmwEmJ35+CbkNyJLwPuMbgDQOiGKk6n0tndBvQMEVQvcY5Myw/M
	Cac9ti3V/K2BYBIIXbz7J+7YzlTPEAoebb0A1F6p60CEa7PWdjm/qjJk6inVbDxuIX0JPbeHJ//XX
	d56scmVg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lX5ZB-008rHM-US; Thu, 15 Apr 2021 17:14:12 +0000
Date: Thu, 15 Apr 2021 18:14:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415171409.GC2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415170819.GA17534@focaruja>

On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge*
> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);

No, this does not match coding style.  Probably best to break the
80-column guideline in this instance.  Best would be to have a function
and/or struct name that isn't so ridiculously long, but that would
require some in-depth thinking.

> -void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param);
> +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> +				  struct atomisp_css_params *css_param);
> +

Good.

