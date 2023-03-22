Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F823AD;
	Wed, 22 Mar 2023 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PYNtrfbTrgWXps9hIv+gLj5vvQqBeOvzaAxQ9ZWQjXo=;
  b=eiSRkcfDADq0FBmuUWsom/KcUq7vpwqPS7/+K/Ym8Ya3c0wcjYjaczJV
   7kqX9M5hdbzfY7Px3lUo1VLcLjI6jX9mC0sjB2oCbqXZ3IyQROQ2MctMc
   ycT9a1eQ9VazY48A4UR/mhQpZRAxNAl8j+ehP0RdsqStetGdyEMu+mhWy
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,281,1673910000"; 
   d="scan'208";a="50902796"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 11:14:19 +0100
Date: Wed, 22 Mar 2023 11:14:18 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, 
    u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, 
    linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-pwm@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: remove unnecessary blank line
In-Reply-To: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
Message-ID: <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
References: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 22 Mar 2023, Menna Mahmoud wrote:

> Remove unnecessary blank line before struct as reported
> by checkpatch:
>
> " CHECK: Please don't use multiple blank lines "

Since there is no vX indicator, one doesn't know that this replaces some
previous patches.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/greybus_authentication.h | 1 -
>  drivers/staging/greybus/pwm.c                    | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
> index 7edc7295b7ab..48b4a9794d3c 100644
> --- a/drivers/staging/greybus/greybus_authentication.h
> +++ b/drivers/staging/greybus/greybus_authentication.h
> @@ -41,7 +41,6 @@
>  #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
>  #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
>
> -
>  /* IOCTL support */
>  struct cap_ioc_get_endpoint_uid {
>  	__u8			uid[8];
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 3fda172239d2..26d39e08c3b6 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -24,7 +24,6 @@ struct gb_pwm_chip {
>  #define pwm_chip_to_gb_pwm_chip(chip) \
>  	container_of(chip, struct gb_pwm_chip, chip)
>
> -
>  static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
>  {
>  	struct gb_pwm_count_response response;
> --
> 2.34.1
>
>
>
