Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF73C3B29
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 13:56:35 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nL3kM-0007k1-Hu; Fri, 18 Feb 2022 14:56:30 +0100
Date: Fri, 18 Feb 2022 14:56:30 +0100
From: Martin Kaiser <lists@kaiser.cx>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] staging: r8188eu: comment about the chip's packet
 format
Message-ID: <20220218135630.hodcdxnvcavk54jn@viti.kaiser.cx>
References: <20220218092252.853807-1-martin@kaiser.cx>
 <20220218102227.GE2407@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218102227.GE2407@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Dan Carpenter (dan.carpenter@oracle.com):

> On Fri, Feb 18, 2022 at 10:22:53AM +0100, Martin Kaiser wrote:

> > Would it make sense to add a word of warning to prevent others from
> > repeating this exercise?

> Just the fact that these structs are endian means they're from the
> firmware or the network.

> If a struct has a pointer in it, then it's rarely part of the UAPI but
> if it has endian data then it probably is.

ah, these are useful criteria, thanks. I see that the comment isn't
really necessary...
