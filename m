Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBD3FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/4QXEOD8J90syLrjyDkqaGDPwNN8IRPTqOTnnGhg5bE=; b=F32ICRcAQBjiJyGtar49N+Z/Sh
	uuXfh3zJ/mZOaU1k09f+TlsxTeDYq+PiRXzAzswu3OQ2cAK8BTl6CqDRNDoZ87becadLx4jsxJLgQ
	nRA775w3F4BudAIxRhoLl6qU6OI62n8TmviYdtp3Ibg6CjVzEHimsyDO2ptD4V3k8KUzq2uxwHdJU
	0R15nMIMeeWh3vy1gcRz5icm9aG8/WHaLXPmjnFTRtw1bgKdcdhnzPtvr/AlXr3jqMftN+pl5UI+a
	2lTmkZLFGmOY1L5Gs99X0Kz+T7HF9AhLyJ0Ypqhs/MlbvBAr+0DVs1OSCx3zbQ034zn7SlxZsTjxT
	m7m5/mbw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKgCt-00083W-1T; Mon, 30 Aug 2021 12:16:18 +0000
Date: Mon, 30 Aug 2021 13:16:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johan Hovold <johan@kernel.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: Convert uart.c from IDR to XArray
Message-ID: <YSzMB80NOkNvdjy1@casper.infradead.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSzGkNfG6HOayiXi@hovoldconsulting.com>

On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> Whether the API is better is debatable. As I said, almost no drivers use
> the new XArray interface, and perhaps partly because the new interface
> isn't as intuitive as has been claimed (e.g. xa_load() instead of
> ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> I know.

I can't just slap a 'deprecated' attribute on it.  That'll cause a
storm of warnings.  What would you suggest I do to warn people that
this interface is deprecated and I would like to remove it?

Why do you think that idr_find() is more intuitive than xa_load()?
The 'find' verb means that you search for something.  But it doesn't
search for anything; it just returns the pointer at that index.
'find' should return the next non-NULL pointer at-or-above a given
index.

