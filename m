Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF33AD39
	for <linux-staging@lists.linux.dev>; Mon, 13 Feb 2023 19:58:11 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pRexi-0004E8-HY; Mon, 13 Feb 2023 20:58:06 +0100
Date: Mon, 13 Feb 2023 20:58:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "staging: r8188eu: simplify rtw_get_ff_hwaddr"
Message-ID: <20230213195806.usp23da6dfqfz7zl@viti.kaiser.cx>
References: <20230211183205.426820-1-martin@kaiser.cx>
 <Y+nKSc6fPf4E1Y2S@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+nKSc6fPf4E1Y2S@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (error27@gmail.com):

> On Sat, Feb 11, 2023 at 07:32:05PM +0100, Martin Kaiser wrote:
> > This reverts commit fd48124e09825797bdc8ff0120f2401030c618ee.

> > The cleanup in this commit removes the qsel to addr mappings in
> > rtw_get_ff_hwaddr. The underlying assumption is that rtw_write_port
> > uses its addr parameter only for the high_queue check.

> > This is obviously incorrect as rtw_write_port calls
> > ffaddr2pipehdl(pdvobj, addr);
> > where addr is mapped to a usb bulk endpoint.

> > Unfortunately, testing did not show any problems. The Edimax V2 on which I
> > tested has two bulk out endpoints. I guess that with the incorrect patch,
> > addr could only be 0 (no high queue) or 6 (high queue), both of which were
> > mapped to the first bulk out endpoint. Data transfers did still work...

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---

> > Hello Greg,

> > sorry for introducing a regression in commit fd48124e0982 ("staging:
> > r8188eu: simplify rtw_get_ff_hwaddr").

> > Could you take this revert before the 6.3 pull request?

> > Thanks,
> > Martin


> I feel like the ancient `git revert` script is not at all in line with
> current standards and sets people up for failure.  This one at least
> has a commit message.  But
> 1) The subject doesn't have a correct patch prefix.
> 2) "commit fd48124e09825797bdc8ff0120f2401030c618ee" is not human
>    readable or how we describe commits these days with a 12 char hash.
> 3) There is no fixes tag.

Thanks, I fixed these points in v2.

Best regards,
Martin
