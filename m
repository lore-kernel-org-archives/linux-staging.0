Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916127829C
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308730; cv=none; b=cVGMIpuHiJRb4WdI6q+i4xe4Oh7KrAVP90GgtF5pIKQbkv00HAOpj8DSipdSQdBjbn/grAsem6qochooFAgVprQrY3dluCk4SPsOon9vRVhlUJv91y1z6UUoR2wN+R3FdVJO5YLrV1nif0mIjrzEeHIGgTg9j5rGlOSTwE8PQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308730; c=relaxed/simple;
	bh=8Ssi1Wk64QWUfBb7mj4mwNzyhBvvKGpbyu23BxvyHPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/UE7w93gxJ/DLNzAv/LkAjIjIDRY8VCS7FyWTbC2I6HRCbw1RGaQlqUU8p6MJvDM4EqKHsYjvonnlGF13mdSqdgpqE+nGbOQmzyyJUUadX9COaXVXva2EeFxFxJv7NcPZGp/SkDVQ+LLvoMCKW/hsSwiS9Px52WVo/OiIwoWK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=unAGD/Bq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="unAGD/Bq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f188e09a8so1145037f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 12:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718308726; x=1718913526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8nD3Tx/2ajPq4oiZeg181ZjliU9kpOqAJj/ASz1bTw=;
        b=unAGD/Bqa2VBuqU0rEt2PHaopufN+6DOYFy6kMlaS+A6Et9Qk8MypgUDyTTekU9Zum
         7b3Kf/doQmrkF+chUT90nXR5eb7dfpWdP7qaBwdGSvIAaK44vXs6THdx6H/l+AfEUd4a
         fmKz5cxH/wtUj1M3hTex9nlC941cyyNm87gj3wOrbMuf9Dnqadl5rfHzmwQ5/epQmCYH
         fhYofF4Beeys0xUWBZ9LH8NEpGF1/Rl1be953F3c/78CsPB42YNvN6tiKcME4Bap0SCm
         IOV7uCRY6NbfKUQDYBjgHF6mtu8f+qH4v6sZ1JGu4tfu/Yb3GAJ4HhF8THmI/iLUz5Wv
         GxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308726; x=1718913526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8nD3Tx/2ajPq4oiZeg181ZjliU9kpOqAJj/ASz1bTw=;
        b=pVZN2B7NocUBbCJTr8ndURWUVn8VL6/TW1qh0xzQxDvoC31T1M2+J1nsKYJ19QGr8C
         miGSmwaAb+uBtVh42wyUOlOabOVA/L8ft9Lq53WRG3RtVcLOnXNBSL1EttX2t6IXcm4N
         MoVmzpZDK33NWE4KVA7g3lmvBWpN9lb+kU1ruM90uc7c/US64+heRngN7bBjf8rJBG21
         pOVm9MI6zy91/R1Dvwr4XLA+4S9Wgj8KDJr3z6iy34h6EENxpObqiBQE7qSwpDB1XWg7
         ucD3mq1LEaKbW1OohD0x5FPgbXwgJx6tSwBBLUmzaU/z+7IjRww7BPGvKVX9xsBkTRZs
         6MKg==
X-Forwarded-Encrypted: i=1; AJvYcCWjJZfiNPncEM0OemUpL5AMBj8ZIvWynDtOX64j0NybTI9np4IVxtsP1nG8pI1s0UnBYY2lW8cep457aNdPldhcpNu7wNXDtQkn4Z3/ng==
X-Gm-Message-State: AOJu0YxJsiUfb5IzJwaSxTEb7nXWTF5i4mcBQXx5u1pPaxoQA2zxAXyl
	DYUrlezRZxWiOn9T/mGB30oZQSKgyhuRPXUdg859A1BPVn7LkSB5bwl062hOWuE=
X-Google-Smtp-Source: AGHT+IGhE54rnPxMpctAzOM52kvVqwoHNWOb3ufa5cu9POuaX89ge9H6lokYmXmoiIrQpIX/ilu++Q==
X-Received: by 2002:adf:e64c:0:b0:35f:1f3c:b632 with SMTP id ffacd0b85a97d-3607a746efbmr516075f8f.12.1718308725147;
        Thu, 13 Jun 2024 12:58:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a0fsm2545651f8f.96.2024.06.13.12.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:58:44 -0700 (PDT)
Date: Thu, 13 Jun 2024 22:58:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>,
	detule <ogjoneski@gmail.com>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH] staging: vc04_services: vchiq_arm: Fix initialisation
 check
Message-ID: <a440cbf7-c6d5-4286-a69f-05e668522931@moroto.mountain>
References: <20240613194150.2915202-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613194150.2915202-1-kieran.bingham@ideasonboard.com>

On Thu, Jun 13, 2024 at 08:41:45PM +0100, Kieran Bingham wrote:
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 4 ++--
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 5 +++++
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 ++++++-
>  3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 54467be8c371..67d853f5f2a0 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -804,7 +804,7 @@ int vchiq_initialise(struct vchiq_state *state, struct vchiq_instance **instance
>  	 * block forever.
>  	 */
>  	for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
> -		if (state)
> +		if (vchiq_remote_initialised(state))
>  			break;
>  		usleep_range(500, 600);
>  	}

:/  In the original code, this would either break on the first iteration
or fail.  The diff looked like this:

        for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
-               state = vchiq_get_state();
                if (state)
                        break;

I feel bad for not spotting this.  A static checker which looked at
diffs could have made this work, but all of our tools look at a momement
in time instead of looking at the change over time.

regards,
dan carpenter

