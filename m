Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D51758C
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940909; cv=none; b=PqMXyECOANGhkU0XLDbPLxYygN6u3aNyqvuyzHnpjEBvUA5+2ELSUR9LFd+Yw6UCq/kFZwoWBQZ0usIsulvyUCbqwumRVDSS1GI0VJcAVFzck3Kep+ogrzgh5v/TBXjymRouYBE47P9VPpYrIvxxzX+wma0GZCW2Lm4SmT6Go74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940909; c=relaxed/simple;
	bh=RBwkYvZvQ7HcRtcbWXlW1lKInMy240xUm9Azw4zpgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuUeduW2u4l57g+X/klg46zuI4SBF+lZpDGjwnEDOkzyB1oTLnzbG/XPylegCRgzANsALDFWG8dofYMKUoO137dHNXJ3neMcPFQIaRwjo3+Zl2BUoTlXNYaeaE+KZxF7HNYksIFMJTyjkrbhKZcVJR0vWS/PBqNRWaaLJOFrPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XE6Z3TNJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XE6Z3TNJ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e95a60454fso15996271fa.1
        for <linux-staging@lists.linux.dev>; Tue, 28 May 2024 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716940906; x=1717545706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
        b=XE6Z3TNJqbF8IN4Bwrmp3sXlyMc+RmlLj35Inr3+iVqIDNPkj5vGSStjDl2qYqIVTP
         MO6WkL5/sdInVeADkvsqN6VrVVnt8+a93EAwvci8fLaROez7V9yO7oFzXUnTAOGDTKSj
         epxch/cUyvcvYQlFE5wzrAActdYlxuR+tNZf9VP16BA+CvSE6D1zprc9E1cEZm/9ek4I
         sfdF7oUdCTgtIZIICygS614v3Rl12J853e7wsOpfusMdQMPywIlBEAmVqLwWVfyzFfVW
         cJGJKTfJaE2I+x30usQ9uHP9efs3ZixKYfnlDURCFbJhB+az3SnKXFh9/JqxYAi4K0LD
         r3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716940906; x=1717545706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbSUJZ3lWVi558UySXJCbOkQXUwg/BY6swouuGo3h3M=;
        b=NaAyo4z87bSYuQ/YfVtt8HvhgtSHO+z2juNK8YQgcqHGqAJjcj8IvLulReMeuNCvJY
         BRN1vLyXlVCiyu8xs2qXwPwTlI0FuanGWs21bfa/em0SgAEqs/QfAsYR81ICFLGaDs18
         mJlUNWdNTFWF787USGyIuAE6k+8G5khdAuzNdNIcIB8vAN7Q+wLa2AAuWglhfZBP4RIB
         7PThnwZURDPbRyiTIz0WKC6f/LAI/V0qwO/LvndpVPL6t7gEjcgQTC88T9CjUGH7Dz4q
         fnnByRIDPxuT2ZPAKTElJeFZvW3JFGp5uShQKbwgvYaluwKv7BUfSzvV+XZDNSXEnFGO
         AC6A==
X-Forwarded-Encrypted: i=1; AJvYcCUkqElhiDvjOIqCX1lBX2QDO7Zn8mClnMlLksCMbjvUj/qlA2XYquhpT3RS6BlBQXnCMUiWylQXnTI2IvgRpqsJbqGUH5RTX9teI0pMCA==
X-Gm-Message-State: AOJu0Yw62NMDeS0Tkpkg9iBarhCSmvT9gzD2rJ1sbJwrzTVsb1vF725h
	jQoER9dMo1wWus5KM/bn5JHMTSm8oNt98Ay87pJ8vqG2+5fcabwKpZ+7tw8X/oc=
X-Google-Smtp-Source: AGHT+IGMFvu7tNMpu3hd4ZI4DzSWJEhLR+W1+ptB5RwKxDpz/xmWeD3EGSsLralZrE8N3ltg8VCBsw==
X-Received: by 2002:a2e:9e57:0:b0:2e9:795a:c25c with SMTP id 38308e7fff4ca-2e9795ac301mr46868491fa.39.1716940905814;
        Tue, 28 May 2024 17:01:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd159fsm23674921fa.94.2024.05.28.17.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:01:45 -0700 (PDT)
Date: Wed, 29 May 2024 03:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: prabhakar.csengg@gmail.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Helge Deller <deller@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 resend 1/8] gpu: drm: use for_each_endpoint_of_node()
Message-ID: <3wxib4xs4shnhn6ekokmi2uwo5daqhomefqosmocvyuashxqsq@wwp6a6yrl7ag>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6eh4hld.wl-kuninori.morimoto.gx@renesas.com>

On Tue, May 28, 2024 at 11:55:26PM +0000, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
