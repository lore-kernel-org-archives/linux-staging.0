Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78D2FB2
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 14:58:34 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1lso2g-0004Fk-R4; Mon, 14 Jun 2021 16:58:22 +0200
Date: Mon, 14 Jun 2021 16:58:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: rtl8188eu: remove RT_TRACE and DBG_88E
 prints from usb_intf.c
Message-ID: <20210614145822.c3dk3e7p44ypglk7@viti.kaiser.cx>
References: <20210612180019.20387-1-martin@kaiser.cx>
 <20210612180019.20387-6-martin@kaiser.cx>
 <20210614113439.GM1955@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614113439.GM1955@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Sat, Jun 12, 2021 at 08:00:19PM +0200, Martin Kaiser wrote:
> > These prints are disabled by default.


> Not, just by default.  There is literally no way to enable them.

> > Replace the print after dev_alloc_name with proper error handling.


> Ugh...  :(  This part really needs to be done first and in a separate
> patch.  You can delete the RT_TRACE() from that one call site since it's
> on the same line but the subject of the patch needs to say something
> like "check for allocation failure".  It can't be "remove RT_TRACE and
> DBG_88E prints".

ok, understood. I'll split this in two (and fix it, I forgot a
semicolon).

Thanks,

   Martin
