Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC637B;
	Sat, 11 Mar 2023 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9vMClXHgKKDUNctqNLx3NLcZgB2P32JxxIQV8C/UNS8=;
  b=iKizZpBCciyOswxjQCZxfB8Fg3AKqwit5zC0L8H3hrJD2vvJA9bMOrZB
   GyNsU9pPkU4Wo9x6SmQl0MIOpcRFpe+qCwqFZzLCX9fv3jOkoc98feXbr
   d8pXcH/wlQrPsR+7ThFRv0TZeHRl3IQmGn0opO5je4vyDDW89OAMXqlN4
   4=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000"; 
   d="scan'208";a="96628191"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:59:34 +0100
Date: Sat, 11 Mar 2023 09:59:34 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
In-Reply-To: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 10 Mar 2023, Menna Mahmoud wrote:

> Fix " CHECK: Alignment should match open parenthesis "
> Reported by checkpath

See the message in the other mail about the log message.

Also, you should not have two patches with the same subject.  Here, the
changes are on the same file and are essentially the same, even involving
the same function call.  So they can be together in one patch.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/fw-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 57bebf24636b..f562cb12d5ad 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			}
>
>  			connection = gb_connection_create(bundle, cport_id,
> -						gb_fw_mgmt_request_handler);
> +							  gb_fw_mgmt_request_handler);
>  			if (IS_ERR(connection)) {
>  				ret = PTR_ERR(connection);
>  				dev_err(&bundle->dev,
> --
> 2.34.1
>
>
>
