Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C0612F;
	Thu, 16 Mar 2023 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jtW6VRfS/JVv0FwoqbkQyH8YBBfB1YyKmLm0wG3RBG8=;
  b=Mrf/MCkanwxvOkIpyGTAJPCLpYaX5tsp+qvOASyL4c2HGCPycCs7wZ9c
   2HHxnexQ1UtiptV09FL0AuTbnMzFVCpb6z82v2mTcP5I8PfzSg086cq4A
   WdGiRlZfMxElMddmDOPaTOMmzKNDJLTyeRdb5RTjpXC8PYqaBsTmO/A7Q
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="50418013"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:37:25 +0100
Date: Thu, 16 Mar 2023 18:37:25 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sumitra Sharma <sumitraartsy@gmail.com>
cc: drv@mailo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH v3] Staging: octeon: Fix line ending with '('
In-Reply-To: <20230316171614.GA82631@sumitra.com>
Message-ID: <92ac2441-aa53-41ad-b5b-a12b465bb826@inria.fr>
References: <20230316171614.GA82631@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 16 Mar 2023, Sumitra Sharma wrote:

> Since, the coding-style limit the code within 80 columns per line. This
> causes splitting the function header into two lines and results the
> first line ending with a '('. This causes the checkpatch error.

This should all be in the past tense: limited, caused, resulted, etc.

julia

>
> Place the function parameters immediately after '(' in a single
> line to align the function header.
>
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
> v2: Change patch subject and description
>
> v3: Change patch description, noted by Deepak R Varma <drv@mailo.com>
>
>
> drivers/staging/octeon/octeon-stubs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 7a02e59e283f..3e7b92cd2e35 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
>  						  int32_t value)
>  { }
>
> -static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
> -	int interface,
> -	int port)
> +static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
>  {
>  	union cvmx_gmxx_rxx_rx_inbnd r;
>
> --
> 2.25.1
>
>
>
