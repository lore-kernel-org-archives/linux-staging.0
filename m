Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC13D6D;
	Thu, 17 Nov 2022 18:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B4DC433D6;
	Thu, 17 Nov 2022 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668710761;
	bh=1B+BwC+vAlINE65t387MrQuVJvPq2RKRPkIoo8oLUb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oo7oCp7G+dQTyW+q6rmqRNRDYtB3SKZgvFnizPPXJIwb623xtfrbEcRtmvjEIMR65
	 3pzGJH326pMYiCg3liACw+Mu1LY7RUizeILqTFGhzJlU2WR9HSWkxaRE0X0+iKY3gQ
	 H8ZnprRr3DqFv4FZVo2dXQqPK17RsCtja/F5bZe0=
Date: Thu, 17 Nov 2022 19:45:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: vt6655: change the function name
 s_vFillRTSHead
Message-ID: <Y3aBW9QAB0nGiWBv@kroah.com>
References: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Mon, Nov 14, 2022 at 06:29:25PM +0000, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
> Add indentation to the affected function to follow the Linux kernel
> coding style. This improves visibility
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> v2: corrected confusing changlog message on this patch
> v3: removed unnecessary function prototype

Does not apply to my tree:

checking file drivers/staging/vt6655/rxtx.c
Hunk #2 FAILED at 85.
Hunk #3 succeeded at 567 (offset 12 lines).
Hunk #4 succeeded at 920 (offset 12 lines).
Hunk #5 succeeded at 939 (offset 12 lines).
Hunk #6 succeeded at 953 (offset 12 lines).
1 out of 6 hunks FAILED

