Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE48F4B
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 17:23:42 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1pMuM4-0000tx-Q3; Tue, 31 Jan 2023 18:23:36 +0100
Date: Tue, 31 Jan 2023 18:23:36 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix NULL check for rcu pointer
Message-ID: <20230131172336.smmc7dfvk54zftw6@viti.kaiser.cx>
References: <20230131090057.241779-1-martin@kaiser.cx>
 <Y9kxkhmS+yEs85s1@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9kxkhmS+yEs85s1@kadam>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hello Dan and all,

Thus wrote Dan Carpenter (error27@gmail.com):

> This patch is fine but it's a clean up and not a fix.  The original code
> doesn't dereference "br_port".  I guess the new code is faster and
> especially if you have lockdep enabled, so maybe in that sense it is a
> fix.

ok, I see. The br_port pointer may no longer be valid after rcu_unlock
but we can still check it for NULL at that time without dereferencing it.

Thanks for the clarification,
Martin
