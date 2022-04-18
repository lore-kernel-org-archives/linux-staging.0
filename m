Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA80A29;
	Mon, 18 Apr 2022 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ecwavOK8aaEgqKldvns2tNz9sWYL078p6bgiw5ow1Ew=;
  b=o+6LZf4Tbs9QQSqKdMGqjD3c3b1HA0Ik5p0IGoWVu7OIAyPtcmp3ZsDs
   Jbc1rwl3wyZ3zwyYYFEwn0a05sFEWW5wn73pP2755BWD4vO2DWl0ePf+x
   3DpAU2mwlm4Jns53Wuw3+EjjQQouE1bR7TZ1YzgWVzpqwrzA1+/TQ+LvJ
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,270,1643670000"; 
   d="scan'208";a="32172438"
Received: from 203.107.68.85.rev.sfr.net (HELO hadrien) ([85.68.107.203])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 20:22:16 +0200
Date: Mon, 18 Apr 2022 20:22:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Aliya Rahmani <aliyarahmani786@gmail.com>
cc: mchehab@kernel.org, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: comparison to NULL could be
 written "fe_func"
In-Reply-To: <20220418180859.18488-1-aliyarahmani786@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204182018480.13551@hadrien>
References: <20220418180859.18488-1-aliyarahmani786@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 18 Apr 2022, Aliya Rahmani wrote:

> Fixed coding style for null comparisons to be more
> consistent with the rest of the kernel coding style.

The log message (both the subject line and the text just above) should be
in the imperative.  Typically, that means that you should not be using
verbs that end in "ed".

There is too much detail in the subject line.  Consider how you could give
the general idea, but be more concise.

For the text above, what could you say rather than "fix".  When you say
that you fixed something, the reader may know (or at least hope) that it
is better, but gets no information about what you did, nor why.

julia

>
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index d74ee0ecfb36..bdc6adf70d72 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -107,7 +107,7 @@ static int av7110_num;
>
>  #define FE_FUNC_OVERRIDE(fe_func, av7110_copy, av7110_func) \
>  {\
> -	if (fe_func != NULL) { \
> +	if (fe_func) { \
>  		av7110_copy = fe_func; \
>  		fe_func = av7110_func; \
>  	} \
> --
> 2.25.1
>
>
>
