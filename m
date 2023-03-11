Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685957B;
	Sat, 11 Mar 2023 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=94TY6prpmIkG+xcIe1ZrjJUwgTSMdg+tKXutKOn9kZs=;
  b=kc+22KI9dO1GKpH8QtgTJMOWkh3UyQ270gj02DTpj8TAUcdnJ8Ur9LrE
   YdIOuOBnX301ncnDhHOMUyk9mSaU414LXx9m3mrxrjp+GT5s0CJ4nTrHc
   wRVkSV6LOvHDfHqUpK1VKdUNC1tKVMgtMEpi0FKvrWzX+xBOZQtrkLCws
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,252,1673910000"; 
   d="scan'208";a="96628084"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:57:45 +0100
Date: Sat, 11 Mar 2023 09:57:45 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
cc: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, 
    elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
In-Reply-To: <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com> <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
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

The log message could be better, to explain what you have done and why.
The word "fix" doesn't express any of that, and should be avoided if
possible.

julia

>
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>  drivers/staging/greybus/fw-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index f562cb12d5ad..0fb15a60412f 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			}
>
>  			connection = gb_connection_create(bundle, cport_id,
> -						gb_fw_download_request_handler);
> +							  gb_fw_download_request_handler);
>  			if (IS_ERR(connection)) {
>  				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
>  					PTR_ERR(connection));
> --
> 2.34.1
>
>
>
