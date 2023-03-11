Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C01D7B;
	Sat, 11 Mar 2023 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jMouezBBL3soxbH8ICdrUfcoEX4o/23uUVRU1belL5g=;
  b=GlR/HC9kkXXaCptGLEXGraiUmvEnantMZ+bt+V1FCAVQEXVbs0ztVP1o
   uJgIqdmw2aE5Njv0KuVAIZsXZqEFSoiMyTyXc1EJaoVo0MmFVmYiNDMlg
   lKDSVceKin35Lt8rHYta2Idi2pCFAn5NjgNrLidLaWLclhyKpIIDEwHoo
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000"; 
   d="scan'208";a="96649449"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:36:01 +0100
Date: Sat, 11 Mar 2023 15:36:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: eclose macro in a do - while loop
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Menna,

There is a typo in the subject line.

On Sat, 11 Mar 2023, Menna Mahmoud wrote:

> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
>
> Reported by checkpath.
>
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
>
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error

The log message should focus on what is done and why.  The checkpatch
warning text and the fact that the problem was detected using checkpatch
is useful, but less, so it should come last, not first.

Here, what is done is to enclose a sequence of statements in a macro
definition in a do-while loop with a test expression 0.

The reason why is to make it safe to use the sequence anywhere a single
statement can be used.

A period at the end of a sentence should be followed by some whitespace
before starting the next sentence.

julia

> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..e86d50638cb5 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  }									\
>  static DEVICE_ATTR_RO(name##_avg)
>
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do { \
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);				\
> +	} while (0)
>
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> --
> 2.34.1
>
>
>
