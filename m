Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A343845AC;
	Fri, 16 Oct 2026 02:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117070; cv=none; b=ikx9Y/tAY+moqMb7wIeIAWrl7EUcKnB3MTbDXtmVNYjHPA5Xqlm99qB9RnlC69o9V/WI8oP1mOUf4lYyH10eIWZD/JimNVmtSxM1n9QwwV/IxyUUd67YXi0JZBlRHCwXsSnTSg36REgaBlTEzUikYcqMr8E4Y4khx/RvKbMpqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117070; c=relaxed/simple;
	bh=8CVjULxw1Qae8Qz6Vwp8+Ozk2dvMPLfvrgZOdhJxKdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hW+4d6SHM8k3sLtJkl5v9Sv3HsCb8A6dnyRU0SEWz8CWUGPFYW8ZcUelbgE4s77qpkWBeEKAL4qAQdkgePEfq6cwMipV/UOXAJ0mzt2D5B+P9PapYv5ArPvxjDMq4YT8eNDj4mI9+yGDmdjVOnbr6Pm3LQboq2EbiF7GQ9Zl6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=lhH97SQU; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="lhH97SQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qSKq1SQxgrg3nMP6/wpK9hSRG2aMAkgSMQurDxr0tnM=;
  b=lhH97SQUvly31jMdMdb5xenP2oszSt1WN89c81icY9eK1LqI20gkX1em
   ETSZAoPtjJ1LYC0tZpWfi3T2TUpFYGEHbLQFfuilb4fJeLweC0GlifUYH
   mREPzND9ajFVFPn7jeYosabFvbOcRDm072sj0wgToS0P6YYQ8zfhokqyl
   s=;
X-CSE-ConnectionGUID: DEb1+WoYT0mGWeFYXLSQ5A==
X-CSE-MsgGUID: PINxWsyBR3maTnnRMwdIuw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,161,1787004000"; 
   d="scan'208";a="300457787"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:17:37 +0200
Date: Thu, 15 Oct 2026 22:17:35 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
cc: outreachy@lists.linux.dev, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add blank lines after struct definitions
 in gbphy.h
In-Reply-To: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
Message-ID: <fcdee571-d94c-a5ae-5ae5-b41977f22073@inria.fr>
References: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 15 Oct 2026, Okhuomon Ajayi wrote:

> Add blank lines between the structure definitions and the
> to_gbphy_dev() and to_gbphy_driver() macros to improve
> readability. This fixes the following checkpatch warning:

Thanks for the patch.  But I suspect that the lack of a newline was
intentional, to show that the #define is closely associated with the
previous structure declaration.

julia

>
> CHECK: Please use a blank line after function/struct/union/enum
> declarations
>
> Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
> ---
>  drivers/staging/greybus/gbphy.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
> index d4a225b76338..1de510499480 100644
> --- a/drivers/staging/greybus/gbphy.h
> +++ b/drivers/staging/greybus/gbphy.h
> @@ -15,6 +15,7 @@ struct gbphy_device {
>  	struct list_head list;
>  	struct device dev;
>  };
> +
>  #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>
>  static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
> @@ -43,6 +44,7 @@ struct gbphy_driver {
>
>  	struct device_driver driver;
>  };
> +
>  #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>
>  int gb_gbphy_register_driver(struct gbphy_driver *driver,
> --
> 2.43.0
>
>
>
