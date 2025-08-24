Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8A2A1BB
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756060628; cv=none; b=diFNDTJ0BKHVoLBEdaYhuVkzbPVSRXcBYjXRZO/F1e3jR+cQnlEvf1CAVVTAOV6pzLeJJ9zx1thRdTflw9+/2IU+eAQastvSgp/3HYYNwNSjX1prC3CqRgENpp4qT8CtW5p6A/siL9P6F9bPiSEDJN1l5okcNUW8JK2eY0ycLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756060628; c=relaxed/simple;
	bh=uTjvRcDBxADJ/2p8uUisfNnwNgbfvhjss0+ioDY099s=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QcpgJ0hj1SCZNygvfVaq5eXe212cGBFIQx1LVq68Wq/UxuCDi2fOZfE6WkH8OAcnJ/jfL3Thu/VBJM8hzkK3pCmrY4LduB6ssldtAzBFgccWh2S3HuUGFs2+CHUdl8lTIyqmQgbo3EdkN31so51V5t73rYuC50fys7zhWI4KDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=dietpi.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=dietpi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c79f0a5c5fso814945f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 11:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756060624; x=1756665424;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJNInCKotokpg08dFdCyoptfoiTsDxT23ewwFqVxTWc=;
        b=CkiJZGNIGgUpHR7ZQ+OKaETqE0osPKK4mArz7YczY4pYPRDp90aZVUQtOhQkyjD789
         at4iFP16pnUu8o6YeeEVhGqYHt84YmbctVQWI2HVxaVgineuAVpPUyDlz+qtIzuGBkdE
         WuktPbcRDYPTIv6tDfUwu8vibq39mBhYvOyXXl+fsljOm3iWdOdcKzT429kdADXCxAZo
         zIiYX372djXE4QKFalC5s0yzgvvsAE+0p1OdxNSRIGfy3t7wP1G7JKFCG3QLk/6QevoO
         E2ZG+eQaBzMLGGJn4ETPXgRNLQqMHoYroPSxS+Lpc5MnBscICeuZhVF+zf4jqockvRXZ
         uIqw==
X-Forwarded-Encrypted: i=1; AJvYcCUUMKEkX9NnYOkia6PX0aqUHj9Lex2QGMngppBpx28naptnCqNYJcsdVuDURGCrWXu0HGu4e4IWM9yT71/S@lists.linux.dev
X-Gm-Message-State: AOJu0YzgmsmZ4H6SHu19mXBsSli147EaOPniBUB5rvGaA7evNoHfWW3r
	ESi3yxqkL2yg1QinOUZ5LrVy9Cff6p5PvONCc1DVhhZ/xPDTirIErys4
X-Gm-Gg: ASbGncvuxcrTA5nMJLGfDuSGItprwDHGDNCpOP9UORE/gN0CaOaLMKMFY+mAAiAXL1T
	AoxvN04De/F+/byEmqSpeHBxpdo97UtoL/feHVPkTTcGil6nXLUEajyqV4H+ui4In+oAiIgJMqy
	45tZA/gIciTgbuzV1BJFPhd+xt85BAoyEm3E4xoiljIKUiB53vd5fEHfSkMyPWlKsiDKqjFGNSD
	mkfmnAhhevzCni3w1Sr9ODtwGQAvgJiBEN3Rs9QbfIH/jo1HZ4IMo0l+uCEJfhtQ1ca4Mr8IlBb
	td0cG1P2AnwDSFpMq/VFygFeQ/ZOvVwBCLSOibYjUVeZdYEomoz3VZup+fMeaGZuK8UiRCLaINJ
	ddQXBBkYAjRPjgpPjy5RwykWopX6q2SOz9gZ+QJc2wSLgRWAP3Ivjk6E1pzQPT0lb/IbLrvA4VB
	HxXZbR0vkxLaBnoOaJJc2pi9BdTFy1wKn9WftE1n6ITxRbz1hLfr/vN9FJ
X-Google-Smtp-Source: AGHT+IH5j0UvIS82bjhhqeCU8DCDhmiIbkeoK5enM/feDWHI+hOlE37X2eJAFtCPWPCGzoWvQE05+g==
X-Received: by 2002:a05:6000:2089:b0:3c4:4e8:2539 with SMTP id ffacd0b85a97d-3c5dae0572dmr7290484f8f.14.1756060624369;
        Sun, 24 Aug 2025 11:37:04 -0700 (PDT)
Received: from ?IPV6:2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d? (p200300e06f2bf231547bd9c096ec4a8d.dip0.t-ipconnect.de. [2003:e0:6f2b:f231:547b:d9c0:96ec:4a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba390sm8680981f8f.12.2025.08.24.11.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 11:37:03 -0700 (PDT)
Message-ID: <dafff4b4-f022-453e-935f-6d79c4c57292@dietpi.com>
Date: Sun, 24 Aug 2025 20:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wahrenst@gmx.net
Cc: arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 dan.carpenter@linaro.org, florian.fainelli@broadcom.com,
 gregkh@linuxfoundation.org, kernel-list@raspberrypi.com,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 mcanal@igalia.com
References: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
Content-Language: en-GB, de-DE
From: MichaIng <micha@dietpi.com>
In-Reply-To: <0c2840c2-241c-4f98-9518-6a3676286823@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > Okay, after disabling all VCHIQ users including VCHIQ_CDEV and 
enabling DETECT_HUNG_TASK, i was able to reproduce it.

 > I will try to fix that.

Hi Stefan,

is there any progress in this regards, or a way we can help? Would it 
make sense to share the issue to the RPi Ltd. downstream repository?
https://github.com/raspberrypi/linux

We ship images with downstream RPi Ltd. kernel packages, but with 
non-GUI/server setups and low memory usage in mind, we disable/blacklist 
camera and GPU related kernel modules by default, and reduce the 
dedicated GPU memory to the minimal 16 MiB, so that our users report as 
well these errors every few minutes on their main console, until GUI, 
video codec, or camera features are enabled.

I am thinking about letting one kernel module load by default which 
releases the hanging task. But the majority of systems are headless, and 
really don't require any of those. Reducing the console log level or 
muting hung task timeout messages would be another workaround, but that 
could mute important messages as well.

Just in case someone else is in the same situation: I found the VC CMA 
driver "vc_sm_cma" module to be the lightest way of releasing the 
waiting task. Other than the camera/video modules, it does not pull in a 
large stack of dependency modules. With less than 32 MiB GPU memory 
(where the cut-down firmware is used automatically), it fails to 
initialise, but releases the vchiq-keep thread regardless. Its size is 
also tiny compared to the Broadcom camera/video drivers.

-- 
Best regards,

Micha (aka MichaIng)
DietPi project lead

