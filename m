Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4671A1397;
	Sun, 16 Oct 2022 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GAXZusUTGXd8GtiU3oJfzZebCfauRy06xX4D1JKKRTs=;
  b=oAEVFMcRqNHtG/vJGzX4mpJJNG/R7AG95bbmRpYPVe8WhaAEVjBzY93E
   x4BxMLvBoaQdXos/iDPbcTkijV/88bO1IiFIMVqesNQpwDZDLvY40k3Mq
   ssrdGzgYsGeaJ8m3ZKWzOxN2VgA6b1b6UIFdufbZjw/1l/tLnJUwF7mYH
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,189,1661810400"; 
   d="scan'208";a="31574090"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 16:51:10 +0200
Date: Sun, 16 Oct 2022 16:51:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: enclose macro statements in
 do-while loop
In-Reply-To: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
Message-ID: <alpine.DEB.2.22.394.2210161649400.2876@hadrien>
References: <Y0wS4HQo9m/W/TrQ@debian-BULLSEYE-live-builder-AMD64>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 16 Oct 2022, Deepak R Varma wrote:

> Include multiple statements of macro definition inside do-while{0} loop
> to avoid possible partial program execution. Issue reported by
> checkpatch script:
>
> ERROR: Macros with multiple statements should be enclosed in a do - while loop

I don't think this change will compile.  See if you can figure out why
not.

julia

>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/greybus/loopback.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..37214cb43937 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
>
>  #define gb_loopback_stats_attrs(field)				\
> +do {								\
>  	gb_loopback_ro_stats_attr(field, min, u);		\
>  	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	gb_loopback_ro_avg_attr(field);				\
> +} while (0)
>
>  #define gb_loopback_attr(field, type)					\
>  static ssize_t field##_show(struct device *dev,				\
> --
> 2.30.2
>
>
>
>
>
