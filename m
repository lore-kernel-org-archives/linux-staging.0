Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587871849
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0FWx0HZsH0sPQtYt0bY61ZA24d5GnyNIZ60QyVBhFHs=; b=hIbGH2gyk3jPjRzQLxHaxOWQ/n
	yXBYxxo8uEdUr3LWoythvjbnshPmcT1LeP68kZRKJzGoAUkCUDM6KRaLcI2ZCLVXCH5nHm8Ccw/Tc
	xoEtMs/AT0SznA8u2cqJv2TWtOT57qYnEgqefXTIc0Qy3MnFDgcITlBrgAeQKjSp4+HrpFbgqem2G
	1gxp5FzfHMH+DasRlv1AvhIdOsefeMb76N/mCFz07m/f6na1y7GUIwwo0Xib8kBAi7l9WLc/kK+kV
	xKNW74kI1YMooWE3CcMHXmChgSjbMB/B+lu9OW3AlIe/O4EvaZe4XwcTS/UEUQz8rzyOqYUr5Pj8Q
	2ZxxJRWA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndv2K-009OjY-3n; Mon, 11 Apr 2022 14:29:00 +0000
Date: Mon, 11 Apr 2022 07:29:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Liu Junqi <liujunqi@pku.edu.cn>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Leonardo Araujo <leonardo.aa88@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, sparmaintainer@unisys.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove D. Kershner from Unisys S-PAR
 maintainers
Message-ID: <YlQ7LBO5xS8ZmsEQ@infradead.org>
References: <20220409205857.32083-1-fmdefrancesco@gmail.com>
 <YlJ3ot74ZwfGx53i@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlJ3ot74ZwfGx53i@kroah.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Sun, Apr 10, 2022 at 08:22:26AM +0200, Greg Kroah-Hartman wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ba405f6ec31a..3b7497359c2b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20188,7 +20188,6 @@ F:	include/linux/cdrom.h
> >  F:	include/uapi/linux/cdrom.h
> >  
> >  UNISYS S-PAR DRIVERS
> > -M:	David Kershner <david.kershner@unisys.com>
> >  L:	sparmaintainer@unisys.com (Unisys internal)
> >  S:	Supported
> 
> If so, then that means this list needs to be dropped and the entry
> changed to orphaned :(

It might also be a good time to drop the staging part of it, which
has been sitting there without progress for years.
