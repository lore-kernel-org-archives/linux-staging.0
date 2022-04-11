Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021B31840
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 18:39:31 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1ndywY-0008Nb-GI; Mon, 11 Apr 2022 20:39:18 +0200
Date: Mon, 11 Apr 2022 20:39:18 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] staging: r8188eu: don't set _SUCCESS again
Message-ID: <20220411183918.4mw5x6tatslii7mg@viti.kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
 <20220409151557.207980-3-martin@kaiser.cx>
 <20220411101834.GW3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411101834.GW3293@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sat, Apr 09, 2022 at 05:15:51PM +0200, Martin Kaiser wrote:
> > ret is initialized to _SUCCESS, there's no need to set it again.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>

> I liked the original code better.  Otherwise you wonder, is it
> intentional to return success on this path. 

You're right. The original code is easier to understand. It's not
obvious that this check should return _SUCCESS and the remaining ones
return _FAIL.

Greg, could you drop this patch or should I resend the series without
this patch?

Thanks,
Martin
