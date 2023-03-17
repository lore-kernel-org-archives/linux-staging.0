Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824F6AC0;
	Fri, 17 Mar 2023 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qd2c1F/RKdoyuacgKR4OV54q/5MbNHgOuA8VsG4BQkA=;
  b=e90ijvQJeI9BvI7viY2cIsQHfTiu49w87bUT4mETpphBKqq5ykqQ2zjl
   QnzeXla93Qhk+2LVDmtjaob3emxmCVqLKt0M6ZEYDW4eMEVTjbYJ/njsh
   o/B74bFAJNKiU3eeUqG/jV1uzSnmuLAIpmOG4Yy/hZq90jETe/cpE0wHM
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,268,1673910000"; 
   d="scan'208";a="50508195"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 15:32:24 +0100
Date: Fri, 17 Mar 2023 15:32:24 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Mark Thomas Heim <questioneight@gmail.com>
cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, 
    Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: extract a fxn to improve clarity
In-Reply-To: <20230317141756.GA43753@pikachu-Z97-D3H>
Message-ID: <5f036ea-4a8c-54ee-5eaa-4ee1aac0472c@inria.fr>
References: <20230317141756.GA43753@pikachu-Z97-D3H>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 17 Mar 2023, Mark Thomas Heim wrote:

> The gb_audio_gb_get_topology function at the top of the file
> needs to be split per a TODO comment above the function. It
> is necessary to refactor the code to pull out a method
> that has fewer parameters to improve readability. A
> prototype for the new function is now in the relevant header,
> and the simpler function calls replace the old ones.

Mark,

Please go back and read the outreachy tutorial, in particular

https://kernelnewbies.org/PatchPhilosophy

The commit message is not written in the imperative, as it is required to
be.

Also, words like "needs to" and "necessary" express an opinion.  These
things may indeed be good things to do, but "needs to" and "necessary"
don't help to understand why the change is being made.

julia

>
> Signed-off-by: Mark Thomas Heim <questioneight@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.h |  2 ++
>  drivers/staging/greybus/audio_gb.c    | 21 +++++++++++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index ce15e800e607..a2e8361952b8 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -177,6 +177,8 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
>  void gbaudio_unregister_module(struct gbaudio_module_info *module);
>
>  /* protocol related */
> +int fetch_gb_audio_data(struct gb_connection *connection, int type,
> +			void *response, int response_size);
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
>  			     struct gb_audio_topology **topology);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..3c924d13f0e7 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,7 +8,13 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>
> -/* TODO: Split into separate calls */
> +int fetch_gb_audio_data(struct gb_connection *connection,
> +			int type, void *response, int response_size)
> +{
> +	return gb_operation_sync(connection, type, NULL, 0,
> +				 response, response_size);
> +}
> +
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
>  			     struct gb_audio_topology **topology)
>  {
> @@ -17,28 +23,23 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	u16 size;
>  	int ret;
>
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> -				NULL, 0, &size_resp, sizeof(size_resp));
> +	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> +				  &size_resp, sizeof(size_resp));
>  	if (ret)
>  		return ret;
> -
>  	size = le16_to_cpu(size_resp.size);
>  	if (size < sizeof(*topo))
>  		return -ENODATA;
> -
>  	topo = kzalloc(size, GFP_KERNEL);
>  	if (!topo)
>  		return -ENOMEM;
> -
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> -				topo, size);
> +	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
> +				  topo, size);
>  	if (ret) {
>  		kfree(topo);
>  		return ret;
>  	}
> -
>  	*topology = topo;
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
> --
> 2.25.1
>
>
>
