Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA8625
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 09:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85EEC433C1;
	Thu, 10 Nov 2022 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668072538;
	bh=sbmxJc8wws+3m5vuLlHf4AETn9J4RwdFQ2nudh9xbZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xcfebiooVBBkdvyMzUX5mGgQkLsrO1s7wwggogsFJ0QusfZiDJJv4fGJutBn153d/
	 zz8trLlv4i9ya5gW+qwTCaLbAz0QvSxYOD/TgGWWN2ajoUYvuIAuS9zHuOJ3YwkGYw
	 gxscbuGldSgsPYtjgzAZp3h0RbUpo1Ont0DsHlvI=
Date: Thu, 10 Nov 2022 10:28:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacob Bai <jacob.bai.au@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] staging: rtl8192e: rename r8192E_hwimg.c/h to
 table.c/h
Message-ID: <Y2zEV0kBNSKLBXDt@kroah.com>
References: <cover.1667723306.git.jacob.bai.au@gmail.com>
 <9bb563727915e3f3edd863837608336b99564462.1667723306.git.jacob.bai.au@gmail.com>
 <Y2p0dNLBqiWFPzB9@kroah.com>
 <Y2yt6ERX3szKn2W7@jacob-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2yt6ERX3szKn2W7@jacob-Ubuntu>

On Thu, Nov 10, 2022 at 06:53:12PM +1100, Jacob Bai wrote:
> On Tue, Nov 08, 2022 at 04:23:32PM +0100, Greg KH wrote:
> > On Sun, Nov 06, 2022 at 07:31:17PM +1100, Jacob Bai wrote:
> > > Same as other rtlwifi drivers, use table.c/h.
> > 
> > You say what you do here, but not why.
> > 
> > Why rename the file?  What's wrong with the existing name?  It's not
> > causing any problems, right?
> > 
> > thanks,
> > 
> > greg k-h
> >
> No, it's not causing problems. As we are trying to move this driver out
> of staging folder, so I checked how current drivers naming
> files/variables, turns out they all named those two files as table.c/h.
> Maybe we can do the file renaming as the last step.

There are lots of other issues in this driver to cause it not to be able
to be moved out of staging at the moment.  The name of these files is
not one of those issues from what I can tell.

thanks,

greg k-h
