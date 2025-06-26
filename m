Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E01F2BB8
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961110; cv=none; b=sHNPNDZAFQubjCFxgrRG6u0nZkf2bAeElcfFwS9AEwPDkZSDg7UHbFY1HG2LDyx/4D9SQckJTPW1+z09m6uMWTJAlcOYRs0AbGroG63WFMoQmI/XUEGzT5rqeBgNFFWT/M70M5cRkKYY8vYBX2Z523i2lJrpnyh1baE66YBwVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961110; c=relaxed/simple;
	bh=KaT6NFipBaP+7uuCJdfAzl9+3V9on+Bs/E7nEI3V674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6VzWrl8W/6jo5jpKJAGYJ02H8mGYYs44iPWGP7texZTw4UJSSBzNm5KxatU+fMLb4mIGy+A25I3iWrQN9+hsjFaMJJuWZFtl0KTKHEEilBZXXawE8KOviWyIZmkxiQKKJDU+jVOUfpyrcy9LrTPLSdAvJFlJVA3XwGIC+7Reck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LD0D0jmX; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LD0D0jmX"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40669fd81b5so961307b6e.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 11:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750961108; x=1751565908; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=LD0D0jmXOjIc3+p+MfvkSj/x2lWem/0PC3EndnR8F/geZMkuygqJjkrjRhc/AzrUu6
         itgeVqwkhH79Tc/hJNqMDfN8ZSwv/bOaKci97RpZEu8O5BkhlrCxW+pMDpo1/vBpur96
         d0lIbv6HqMkZ9XtpXsQ9sGuc7eMqqIcupIGKhG1qWcaJQ+oKYH4mwgAcLkOhNNr5iTkP
         +y6vrOK1NNHpA+wGkVSnpBCdfBbrU39TFwkWBMalpLyaefOEgcE7LNHYBIApxQ/ikVQI
         +No89Rjwi0kUAmISrt4Z5xWsONv5PsRQ6p3FJKvFkjtRiaDWmsTNkF6iPUv65sWfeflH
         3JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750961108; x=1751565908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jdIp3t/JcnvNgV/EvawInKAMJ+vsXxeF/1Rq9fXb34=;
        b=DLs0qed9GNoSr3bR6/EOXzxIv8Nsktwmwz1I7NIUfDUwcdkYd3rAkC+6tETlU5hLTe
         sueZeB7Cc/sdtkf0xJOZ8nb+OyszPCn6poMJaqd40qIzfvBipbecexlssZPBmViILMpm
         KXAsXFgB0q4yUUTRcrMSgtCz/d4UYjA9nbwphUZKw5+oSc6o1MC30pdEC907QeasLE8X
         kcE1sSMRcsZ7BRqTksBFppwSR479Fb/dbvKxjRi6twxl1pJY5B8SB3s1A1FX5FXb2cgt
         KwA7lcbq5CNLpCruawpoNFPOWpsWAu4fUcPwowPyg2pEDrnHINcV3h5SRS/X8rwWjeS0
         UgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFMo9CTXFksuHKlSTShXh5zEYlQpN/J9qxuPVZZfa6IkTj6UBpXt1tqFj22O6pnr5UFixIKLcmi+3VRMJv@lists.linux.dev
X-Gm-Message-State: AOJu0YyX9fm5uNkNQBoT0m9pjCPG9KT3wXW8tDfognOnJvMkFgSWl0oB
	tAIUiDXfd3FHA2rFwbvmN/ifEBWFIDOSwkWXCZEpk9McWypP1hyYaef+vSL3+LnUT7GBCQYdKzQ
	g1B/3
X-Gm-Gg: ASbGncs8JNHaKHVjcY/pRQzVsulQUKg3Rhok2U8CWk603zrZz6M7wMUFX/C9JvQFTdx
	4E484Wmrz0XxxCgDNOw3w68nX+6Mz9MXb5t607UbQSv8Is/F9Sv3frY/m5eiuli92LRh07EgAeG
	jv0+87QdYbQewH3sU1VumoTqrQvy/Tn/OWrUdp2ljOglXzJJml7q8awbO5JWwByvG4o3v/kS25Q
	ecpGOS9Yo8RgqQVjiB2hKrjk+smZh/f1o00AIpIEtOIRIQTJqilywpiFrNEGcK1RYLBgc+1fGK4
	HGXwK+Vn+HJTMXoeQp2K9WsUqh9ZCVkInDFtI8gPI2h8nkyLcWMsp6M0NyQw3mmw6Cc0
X-Google-Smtp-Source: AGHT+IEL45qBZ2uXaEhapcM+NgWFI00UFnRWP4NW8+AeUpc2hiUpniAGVTq3f++FmGqy7GeXB2NfPQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id 5614622812f47-40b33e18292mr142490b6e.22.1750961108418;
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32438b5bsm49071b6e.44.2025.06.26.11.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:05:08 -0700 (PDT)
Date: Thu, 26 Jun 2025 21:05:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>
Cc: mchehab@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: av7110: Replace msleep() with usleep_range() in
 tuner function
Message-ID: <4520c798-9372-4aa8-b6cc-f919b0c2dc59@suswa.mountain>
References: <20250626160853.8772-1-pratibimbakhadka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626160853.8772-1-pratibimbakhadka@gmail.com>

On Thu, Jun 26, 2025 at 09:53:50PM +0545, Pratibimba Khadka wrote:
> Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
> waiting loop of nexusca_stv0297_tuner_set_params().
> 
> usleep_range() is preferred over msleep() for short delays (< 20ms) as
> it provides better accuracy and allows the scheduler flexibility for
> power management optimizations. The 10-12ms range maintains the same
> timing behavior while giving the kernel scheduler room to optimize.
> 
> This change improves timing precision during the PLL lock detection
> phase without affecting the overall functionality of the tuner
> configuration process.
> 
> Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>

Sorry, these msleep() need to be tested on real hardware for us to
accept them.

regards,
dan carpenter

