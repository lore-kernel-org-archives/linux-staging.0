Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A97B
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 14:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F4EC385A4;
	Mon, 11 Apr 2022 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649687474;
	bh=0GsPIMIyMqFxbNFUf5nCFFo4jiH0XlmIKDB/5ikIqAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0bWui8Gag4bGqzgUysGLYRB9Jszo3b0TfPc6WGgopkTiW83+OVFPHiSsb1wZs4Vzh
	 zbKgOBxr0XHns8qhAwLCxKQ8wY0F0HCizRssxlpc0tYZBjgM9j4V65KPZ2pdLtWzjt
	 D7MpsNRVGJGDvdDVlEVnPKa+ZnaVhh5eT6HHjRKs=
Date: Mon, 11 Apr 2022 16:31:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@infradead.org>
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
Message-ID: <YlQ7sJOOi/7gc0MW@kroah.com>
References: <20220409205857.32083-1-fmdefrancesco@gmail.com>
 <YlJ3ot74ZwfGx53i@kroah.com>
 <YlQ7LBO5xS8ZmsEQ@infradead.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlQ7LBO5xS8ZmsEQ@infradead.org>

On Mon, Apr 11, 2022 at 07:29:00AM -0700, Christoph Hellwig wrote:
> On Sun, Apr 10, 2022 at 08:22:26AM +0200, Greg Kroah-Hartman wrote:
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ba405f6ec31a..3b7497359c2b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -20188,7 +20188,6 @@ F:	include/linux/cdrom.h
> > >  F:	include/uapi/linux/cdrom.h
> > >  
> > >  UNISYS S-PAR DRIVERS
> > > -M:	David Kershner <david.kershner@unisys.com>
> > >  L:	sparmaintainer@unisys.com (Unisys internal)
> > >  S:	Supported
> > 
> > If so, then that means this list needs to be dropped and the entry
> > changed to orphaned :(
> 
> It might also be a good time to drop the staging part of it, which
> has been sitting there without progress for years.
> 

I agree.
