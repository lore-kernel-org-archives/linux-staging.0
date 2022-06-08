Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B47B
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 09:27:43 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1nyryN-00080S-Cs; Wed, 08 Jun 2022 11:27:31 +0200
Date: Wed, 8 Jun 2022 11:27:31 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>, phil@philpotter.co.uk
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG] staging: r8188eu: driver stopped working with commit
 ("staging: r8188eu: add check for kzalloc")
Message-ID: <20220608092731.hz26q37fhmrhipmj@viti.kaiser.cx>
References: <20220606064055.12565-1-straube.linux@gmail.com>
 <ded4b3f5-a9bc-4612-33cc-68bd85cb92fe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded4b3f5-a9bc-4612-33cc-68bd85cb92fe@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Hi Michael & Phil,

Thus wrote Michael Straube (straube.linux@gmail.com):

> The driver does not work anymore on my system. In dmesg there is:

> "r8188eu 1-4:1.0: _rtw_init_xmit_priv failed"

> I bisected it to commit f94b47c6bde ("staging: r8188eu: add check for
> kzalloc").

> ~/kernels/staging> git bisect bad
> f94b47c6bde624d6c07f43054087607c52054a95 is the first bad commit

> At the moment I have no time to look further into it.

See also

https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#mb5e56a285b8eb1ebb0e798462fc388cb02b4a7cc

Phil said in

https://lore.kernel.org/linux-staging/YoyU4zXf45UpF1Tq@kroah.com/T/#m7a21d460b2569f6b59965ecc3298a6337fa3458a

that he has submitted a patch to fix this issue for now until we
get around to changing the _SUCCESS and _FAIL values.

Phil, did you really send this out? I don't see it.
If you don't have anything ready, I can try a simple fix.

Thanks & best regards,

   Martin
