Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4BB70
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 06:20:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA86560F9C;
	Tue,  3 Aug 2021 06:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627971642;
	bh=KFMCVPIMKcMJnCLKQzmv4zHTkJF8NX258rq+X+2IlNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHeyNy9c/FoMaBXWIR0Beybldvq2gTmYZ+OU8jX1ir0h4pJ6xbhAN1hp8DLSVdXLP
	 aBOBDk+OFrTPQ5fTiD/g6kXnoswV0R/8eaTTsUlAE9k5PgZ+KJMRpBCFdZANEIWDNb
	 ScBadz22q2MWE2UmRpkSUW7BCL3ijShCtXiFMa7k=
Date: Tue, 3 Aug 2021 08:20:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: core: Change the length of an array
Message-ID: <YQjgN/Xx5LUYtzz0@kroah.com>
References: <20210802203020.9679-1-fmdefrancesco@gmail.com>
 <20210803061441.GK25548@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803061441.GK25548@kadam>

On Tue, Aug 03, 2021 at 09:14:42AM +0300, Dan Carpenter wrote:
> On Mon, Aug 02, 2021 at 10:30:20PM +0200, Fabio M. De Francesco wrote:
> > IPX_NODE_LEN == 6, while addr.f1 should only have 4 elements.
> > Replace IPX_NODE_LEN with 4. In the while, remove the excess spaces
> > before the fields of the union.
> > 
> > Fixes: 56febcc2595e ("staging: r8188eu: Fix different base types in assignments and parameters")
> 
> Ugh...  I really feel we'd be better off reverting that patch entirely.

I do too, let me go revert that...
