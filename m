Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E49BE6D
	for <linux-staging@lists.linux.dev>; Sun,  5 Nov 2023 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ddqRSNea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1699215212; x=1699820012; i=wahrenst@gmx.net;
	bh=caRh6iGshs8JM98y+UJVWdyammKqZobAjUhdcJnYC/c=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ddqRSNeaaZ50Pyb8opDmTteY0drD60UvtKhx/zxQvNqYW8+S+A0Wz25AjZ7PuBNe
	 PSDCJR1xLKqXGKJE5BqVN9n+g25LS3Ac8pvRaLqV1+KBsjX9PhRbyIAJxogySHv93
	 1OpnS2KVi1eKY7KiCOVKF6sjzKw6PnMbq7hhAehiTLtmZbRx/z6huqpJ4ktHxEIEf
	 rR91xc4az9Ecg6Qy14krikK4Dh3c2mvK0eXSNuWhSnLfEtaYtBvgWdLUsT9AyoPOW
	 2virXLxiwrqCkf/XwTW0afaGVvyxXaawLrBU0xrDh6jBszEeelNf++yyxVl9BT9lr
	 xbqeUovgZDDriQi8mQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1rfcst1S59-00kBCp; Sun, 05
 Nov 2023 21:13:32 +0100
Message-ID: <cbe1fdf0-513a-42d0-9daf-7d1855cec8c9@gmx.net>
Date: Sun, 5 Nov 2023 21:13:31 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] staging: vc04_services: vchiq_core: Log through
 struct vchiq_instance
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Phil Elwell
 <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231102210603.1201311-1-umang.jain@ideasonboard.com>
 <20231102210603.1201311-2-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231102210603.1201311-2-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:V/nk+9suORzxP+mPaU48ps0u6HTl9cCo7ilj63KMPgLuiZ06Chk
 MAzTUFJ8VgEu/6saqEwzr3GiUlF9Ox1Kmgu8WFWNI0Bsy3zt2SEBE0bpyyOoFJqOiA2wQo6
 9e7ml/eFjFE9NNDclBcCmThVJ9fV1JioQ1CI2ly2bY3gRCLjbOp2CLjX4S6WyURRnRBOYyS
 HNM+7cRN0Mb0DYN33d+jQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4othP36TDTE=;n3fdNRyG8+W2pY8ouOxFGbkWj6J
 xWWv37jvJWEWeLSaBUwMQ7SDwFwFTCKAYcJkhLuj7UnKDtvYuA3td9Hybq2gJ8HrkvB50PhLj
 vL+gDkK4re8WmDmIKz8whnqPPVOa6kRL6WbOFK+YdeWyFymMB8KL/nYC0Y8bDhB2eU2GVDgzr
 2ctECuJoVgNYvCmfpVG+K0P/AhUWFQuYXQ76A6lto8+olqALGSHfwU8djlIL6sQEq+gODKYjF
 sXyPpZyBGZSX5p9Qg4UQ4hAkRqjv62YNDO/gDuagbTG2nqIb+enZ9ErQm/QNZCR7Q5279iP/Q
 EA/I35mZRf2qpwto6CaW0aOu7ROicTPtCQdIumvb/f/U5iO1SRJM3dumnyyhmQT4e5AmZpoCz
 6xWSsGeD7m3hxj2AkfuMtfimJ1aoI1bED6NP2Rr579X1Rea772X9p0cr3eklQHRi5qVCq0WDm
 6ocStOSu/LUubav6s92KdXWOjDW2feqhYIbi9BvxWpu1PIa4TYx9wWnKk4Cf+xQ8di4NXw4J4
 cqrGOm8UYBUKkoqeIbvuARPEzqqwUb+2q28bG/hXlhUdzNouxTfXU9W2RUI2GMf2dphpyiN0u
 4PJVhIg8tLr6cHGt3i/tx0YrLx6gVeO2pCSDcm0jhfCpP8o6qe1oQudp658WJGp4fIwakPBIh
 JZTBPXvSWkIVGg6Z2vNAKKLVod44yFHAM0viQTaMK1+n5SiDRTpc8T/9/3U3Sh0ICdC+c0iXE
 fcrqzXEOs2MSXI7x3YOqFlkrCTxO8N0NbsyYztV1+mffjAMhqH7kZzQ7JbBLInaXHQXJ5iAo4
 aQxJVJCjesfZqJgAuFo2IJDBcO2nlh+qNo3lvHCfHXUFgylqVDJBe+yq1VNfMPYpv6eyK327f
 LoInztTW3smGBoopCDJBr3/XNd72tinFWa/5uwInrLlNUV2V0VjoBQCRl1f9livYWmKC55Yri
 eFhEerv2kEpygDQPHxZIJYgjzZc=

Am 02.11.23 um 22:06 schrieb Umang Jain:
> The handle_to_service() helper can return NULL, so service pointer
> can indeed be set to NULL. Hence, do not log through service pointer,
> use the vchiq_instance function argument to get access to the
> struct device.
I'm not sure but the change looks like fix, which deserve a Fixes tag to me.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 39b857da2d42..8a9eb0101c2e 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -245,7 +245,7 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
>   		return service;
>   	}
>   	rcu_read_unlock();
> -	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
> +	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>   			"Invalid service handle 0x%x", handle);
>   	return NULL;
>   }
> @@ -287,7 +287,7 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
>   		return service;
>   	}
>   	rcu_read_unlock();
> -	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
> +	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>   			"Invalid service handle 0x%x", handle);
>   	return NULL;
>   }
> @@ -310,7 +310,7 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
>   		return service;
>   	}
>   	rcu_read_unlock();
> -	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
> +	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
>   			"Invalid service handle 0x%x", handle);
>   	return service;
>   }

