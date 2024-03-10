Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586781DFEF;
	Sun, 10 Mar 2024 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710070870; cv=none; b=dEhS9tcOZa1ChYhpG2QUf4uosYJfecUOlAwoRoE7dE8kkP2u5ATEEJ/c/sxPamBv/yioQ6Becbn9zo9MlgnbF/GZeyKWvCyEIHa2UCSPunbEYjA/zFoMz88e6dezHHRXjwl7MI6fdv8lBeOkllb+lBhqHRaaGXwD13Xu83IzNCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710070870; c=relaxed/simple;
	bh=4zVuw6n4FDbfS+SEaHFHSsBWFVY/7LGll7MoIb1kS/k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QQMIPOPT+tcbC1KmZhEztxreO1TAxggX6RJKdzSywZhOLewiIeZY3LdvRgpPCMtDVP/ABv1oeuxADCYnWEQMx3qKyQhGLZYggnYvC8lxwLd8N7tIJSYhHH0I4VDAep/wNFQPlIyoMZWYkblSYJNT9e9awBGr72U2wf7CCOSadKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=i75yQ5OW; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="i75yQ5OW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bKqlCj0ylEtRNaC5j3mp6/W2oRB238JKjEfiF378dCk=;
  b=i75yQ5OWA9hVhigZgRYtkdTvr5UrDM4CSwCNfKJy5XNZA2r9TDYRAwjy
   nYGsSd6mnimiCVVHEhPMIExOKcxoQJwFXuCWWWBODKsPNc1Dsih+YC+F9
   GSQIddQc06mLyr6LnVQw3QRuwTacAZyVBuC/v1hjT5Yydv8g0/9oKFMRc
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,114,1708383600"; 
   d="scan'208";a="81721027"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 12:41:01 +0100
Date: Sun, 10 Mar 2024 12:41:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dorine Tipo <dorine.a.tipo@gmail.com>
cc: gregkh@linuxfoundation.org, pure.logic@nexus-software.ie, johan@kernel.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: greybus: Add blank line after struct
 declaration
In-Reply-To: <20240310104714.22224-1-dorine.a.tipo@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2403101240300.3156@hadrien>
References: <20240310053718.6435-1-dorine.a.tipo@gmail.com> <20240310104714.22224-1-dorine.a.tipo@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 10 Mar 2024, Dorine Tipo wrote:

> Add a blank line after the loopback_class struct declaration to improve
> code readability and adherence to coding style guidelines
>
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>

Acked-by: Julia Lawall <julia.lawall@inria.fr>

> ---
> Changes in v2:
>   - Make the commit message clearer
>
>  drivers/staging/greybus/loopback.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index bb33379b5297..4313d3bbc23a 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -101,6 +101,7 @@ struct gb_loopback {
>  static struct class loopback_class = {
>  	.name		= "gb_loopback",
>  };
> +
>  static DEFINE_IDA(loopback_ida);
>
>  /* Min/max values in jiffies */
> --
> 2.25.1
>
>
>
