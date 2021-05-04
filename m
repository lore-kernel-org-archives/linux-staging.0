Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F471
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V4U9OF/5A5A7+ex1Qlqu0+oFqFyil+2DW5bEVur773Y=; b=pazQueOhDe2ARSKQLwocmk9zmx
	eUloDS38mmm+XUf0HA2b2cNeWLq8cyH8LB36OfpBrEgOo7TAHEC2wd+V3QmEp+K4JgkCErZecwCtd
	N/h+0hDGI8m9R6hYUgCLjZoHQebjj1W2rpDTRbPsqF7sEd8hU8z3rnLXuTGeF7GNQAHXL8pLdImnv
	dJEay8jYsdGVaIwCK6T2d8X8FGnpif/TdDsjpJrTbiWsX0Tb/GC373ohR+lx9NnSKXNMj/qZ6SG4W
	7cZj/XqdcxEpVeCApoyutZm3gYkNT+H/Ltc83JjRkYqXh5dwEmZPmWAqKUcc69Eix1l7wbtisNT0i
	ZobOxktg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvbz-00GeEB-E3; Tue, 04 May 2021 14:01:23 +0000
Date: Tue, 4 May 2021 15:01:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy-kernel@googlegroups.com,
	David Kershner <david.kershner@unisys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparmaintainer@unisys.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Outreachy kernel] Re: [PATCH v7] staging: unisys: visorhba:
 Convert module from IDR to XArray
Message-ID: <20210504140119.GH1847222@casper.infradead.org>
References: <20210504133253.32269-1-fmdefrancesco@gmail.com>
 <20210504134216.GG1847222@casper.infradead.org>
 <3550993.e1xmc6yJDa@linux.local>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3550993.e1xmc6yJDa@linux.local>

On Tue, May 04, 2021 at 03:58:02PM +0200, Fabio M. De Francesco wrote:
> On Tuesday, May 4, 2021 3:42:16 PM CEST Matthew Wilcox wrote:
> > On Tue, May 04, 2021 at 03:32:53PM +0200, Fabio M. De Francesco wrote:
> > > Changes from v6; Added a call to xa_destroy() that I had forgotten.
> > 
> > What?  No!  Go back and re-read what I wrote about this previously.
> >
> I remember that explanation you gave me some days ago for not using it. But I 
> was mislead by a comment ("Do we not have to call xa_destroy()?") by Dan and 
> your "Correct" soon after the above comment. So I thought that I had 
> misunderstand and the put back that call to xa_destroy(). I lost something in 
> following the flow of the reviews, I suppose.

English doesn't have the equivalent of the French 'si' or German 'doch',
unfortunately.  I imagine Italian does.
