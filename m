Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C9A29;
	Mon, 18 Apr 2022 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JEyLkzAr/J9bETgVauK6m0tVJCy2MXHWmUiz3mbifTM=;
  b=ebnXOPWJTF/dmPAHTKvNEJRN+3nIny042uTfNGS4/va65MBGmsQLAhJc
   HMWvcN7CMiutdBDQ2yy/UZgAE1DRRvAM/8YKkIvSL4YFNbdOcyJ4rPnRA
   QOf4fWUxgYUyxd7nimbxk0efAoXy3mQDzX4HKcWjXb4o8+8fKEh6w7XwB
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,270,1643670000"; 
   d="scan'208";a="11802419"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 18:40:04 +0200
Date: Mon, 18 Apr 2022 18:40:03 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: clabbe@baylibre.com, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: media: zoran: fix warnings reported by
 checkpatch
In-Reply-To: <20220418162244.15346-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181839370.13551@hadrien>
References: <20220418162244.15346-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 18 Apr 2022, Aliya Rahmani wrote:

> These patches address style issues found by checkpatch in the
> zoran/videocodec.c file.
>
> changes since v1: Rework commit description and subject.

The change description is not very specific.  Does it affect all of the
patches, or are some unchanged?

julia

>
> Aliya Rahmani (3):
>  staging: media: zoran: use seq_puts() instead of seq_printf()
>  staging: media: zoran: else is not generally useful after a break or return
>  staging: media: zoran: avoid macro argument precedence issues
>
> drivers/staging/media/zoran/videocodec.c | 9++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>
>
> --
> 2.25.1
>
>
>
