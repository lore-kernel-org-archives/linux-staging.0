Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683F47728D;
	Wed, 14 Oct 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005246; cv=none; b=BvE0LGcAoGJxCiDuh7W+i5sfzTuEFYCDxD4dVgKH4G6kQxOKVntwWAsEMhVDbMpDV8Z8P3n5SXsmf7kVlMpOu/WiizVGSON6gUQgXl1FLcQXmJ9O7XzKOZowlL+qj7+8ednX6twPuS6KMsRW6u5PJ2MDOubO5B6vo1bLd3qEmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005246; c=relaxed/simple;
	bh=5/QJ98KYPE0a7nBWrjH4cOW1aV6TKro/1XWWVOZhT8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mlpdYUTI9buBW+yR2Qz3bEE9omV7oa/v+BmbkqimPtZCBxnpmVnF596Z4zW117F2Flz8e9RgwSKMr3QE2RHu/Hcr/NqmBnbux4Mjrc+Rt7M0dmoIdytbsIayzTAMPTcWRuhi04z30dctBMkrGVlbLvWWaCl9GgLi9H2m5a5xI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=hchTF0Qh; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="hchTF0Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jEKZVf5UjTHrAA2sDaeoyhdrG/YWIzgeZA7wBiLvde0=;
  b=hchTF0QhuqaU5H2jV81WMpyO5ZJq8/iFzIWKBwH/lgOv3CNlXKW5M59o
   +cT1duUySsPUjb9Tvg38liCBOnRgG6mdRlKutFk7COAyX2Myj0xMP+Oc/
   fm0UH1ibxmTYcAIOwYWaIoAcdJykpXcyfELEjNkgw66PXooI7aGlOkDGa
   4=;
X-CSE-ConnectionGUID: ufffbtJxTEK5eSPtbUvLHA==
X-CSE-MsgGUID: 8Kr4xvZVSe6LpXCsOtQdSw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300237416"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 21:13:50 +0200
Date: Wed, 14 Oct 2026 15:13:48 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Jeremy Dean Clifton <deaner92@yahoo.com>
cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
    Alex Elder <elder@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Remove unused header declaration
 to_fw_mgmt_connection
In-Reply-To: <20261014171342.97160-1-deaner92@yahoo.com>
Message-ID: <377d4e4f-93bd-6634-c3c5-1113f5057e2@inria.fr>
References: <20261014171342.97160-1-deaner92.ref@yahoo.com> <20261014171342.97160-1-deaner92@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 14 Oct 2026, Jeremy Dean Clifton wrote:

> commit 3228900f80c2
> ("staging: greybus: Remove unused function 'to_fw_mgmt_connection'")

What is this?

>
> Function header declaration needs to be removed after it's declaration.

it's -> its

But I don't really understand the sentence.

julia

> There is no declaration of this function nor is there any place where it
> is called.
>
> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> ---
>  drivers/staging/greybus/firmware.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/greybus/firmware.h b/drivers/staging/greybus/firmware.h
> index 5d2564462ffc..04a67d2d5b8f 100644
> --- a/drivers/staging/greybus/firmware.h
> +++ b/drivers/staging/greybus/firmware.h
> @@ -22,7 +22,6 @@
>  /* Firmware Management Protocol specific functions */
>  int fw_mgmt_init(void);
>  void fw_mgmt_exit(void);
> -struct gb_connection *to_fw_mgmt_connection(struct device *dev);
>  int gb_fw_mgmt_request_handler(struct gb_operation *op);
>  int gb_fw_mgmt_connection_init(struct gb_connection *connection);
>  void gb_fw_mgmt_connection_exit(struct gb_connection *connection);
> --
> 2.43.0
>
>
>
