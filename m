Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313737700
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710763744; cv=none; b=WIxNMfnKw38frm2q+TvZ/W7up4PUzccwxNoH5+xUcKcAHSTvG+v+vhISBqCaUJWdG/nNOAXV9hjsz3XFXql5xO9frj9fcaezcIV/+MNVG1dxrNwPlPckLPzehZ7cJ6ehuboNXaBWpNBB4UkW7t3Wi/WS8JrfeXhONl5e9XI10CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710763744; c=relaxed/simple;
	bh=xAybBLkWgFxKDG7sYQQx+lNSx140fHQbpq7UeP5HG4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6mUMofgH9Giz4+A/AHOkRe2hlJK1HL9nOfuH0UFqGrdT51S8aHe5fH0pV1hmL5IfpZHNHEvHIk9TKWnRkDs+vH/fevRaQzxIOulUTR3wP/aIX1n8Rp4eE774LOAIXggUVC2+XhBXoNL8PmJHloDLJRAfFmjbV+tjDH0L9uf/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eU801n2i; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eU801n2i"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso56813411fa.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710763741; x=1711368541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xAybBLkWgFxKDG7sYQQx+lNSx140fHQbpq7UeP5HG4I=;
        b=eU801n2iue4EWfWiv3dlrJIJBU70/kvnw9oH0DvWyXkThTmqZ5njJY3To/ioOn/ltM
         nuBdK+PBbv0+wuMBzIb3oGDDCos0fEEzOYDfd7mwWNjJRMviAynLNC4AryT31adOH2cP
         yZzc/j2I1qYVnMN7gT1pJ05xXAVQOR/lFp8IeoTEQguP7vRYBqOOl1rxHfMNl6g7uIru
         5/S3fgnd2MUoqu7uLNBtC3mDJKqn7KowL9mYMyGnsOwh8jDEHkbTEu+lOZy2IiKZkgVz
         bfU/zIaRpz6hRBwPSEcY3XKPs6Zo2/TIembx2EsEP/H7IAthpRfXMtgLcKy7X16xhTum
         bkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710763741; x=1711368541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAybBLkWgFxKDG7sYQQx+lNSx140fHQbpq7UeP5HG4I=;
        b=C8T9MtCN6FwwDMlK7YGLr9/Wi1obWm4U5JdtGVGi0bQxQ9qGO1eEJL7RiF1Fha/uah
         tgjbI0NtAqQ9WvmP3MNmWSd6yYN8vAGk+cuIJMG3a7yyAv84QMFy58EcQqAWNO200czO
         5bJH+fGGsNlbwTSlibq39QffBHqzsHk3lS2GqJb12t6EwaWh3brvkDUuWTtiPeW8505t
         RGQnwGjYQ5KYu2M9+nKYwmdVivqFxov5yznRBurivY4MKWKEtA+i2gdr4NUBuI8sXxk+
         jIpO1xl8vRHhaopgTjSwk0Xk1EX9dnwqNPd7lySvXtP265w4d3ZrDMIs94teDQpNF3MU
         WHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbZjJO3bw37l/sMum/Q5Ubzi8bl5GMnIvg5Q1l2p8FRihLfuT0qI3bSaebvG4RS1OdeQHWbzr6jgS4Fm66AlFrRTlOkTGVjk5OBHJznQ==
X-Gm-Message-State: AOJu0YwUfVgUF1bVb9X2zpCMSqeR/k/lhCdDJ4KxL4V2I8Ifu/JzdLz3
	kFUZ/0NE1XCs6pYfEVTc5TCt1ykd9iHbpuums8AuiqVlpeWeEBWFMjZ4c+WdAfM=
X-Google-Smtp-Source: AGHT+IH0Qo1V/USqCdqcNMm459DG/tRzeARTYW0jeYurKwM5uusC9A3CrTByB/OVG1fAn26K2fG9eA==
X-Received: by 2002:a2e:9cc2:0:b0:2d4:8d75:7a69 with SMTP id g2-20020a2e9cc2000000b002d48d757a69mr4921690ljj.45.1710763740965;
        Mon, 18 Mar 2024 05:09:00 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id k3-20020adff5c3000000b0033e7eba040dsm9779310wrp.97.2024.03.18.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 05:09:00 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:08:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, Flavio Suligoi <f.suligoi@asem.it>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 6/6] backlight: Remove fb_blank from struct
 backlight_properties
Message-ID: <20240318120858.GE16260@aspen.lan>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-7-tzimmermann@suse.de>

On Wed, Mar 13, 2024 at 04:45:05PM +0100, Thomas Zimmermann wrote:
> Remove the field fb_blank from struct backlight_properties and remove
> all code that still sets or reads it. Backlight blank status is now
> tracked exclusively in struct backlight_properties.state.
>
> The core backlight code keeps the fb_blank and state fields in sync,
> but doesn't do anything else with fb_blank. Several drivers initialize
> fb_blank to FB_BLANK_UNBLANK to enable the backlight. This is already
> the default for the state field. So we can delete the fb_blank code
> from core and drivers and rely on the state field.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Flavio Suligoi <f.suligoi@asem.it>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
