Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA928E8
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 11:06:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o15so5968130wmr.4
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=YnQ3fGmpuRUapOzbtVRlN3HBT8Iorta3LecpdB0log7XED7u1IJxEqQs0QccmZxOai
         MfS/ZZSQ5WKDa9o6C1cGRqmSlALsDF7dYw8bC0mLYpQtTD17RkfW4+nHFkmXWXMpmBze
         LZwVtCyv46vyu0ZifdpdHibLyN3SfkifcK+AXWfJG2T0iyPzAA9pLINli7HH1gS+p9g3
         O+B5gLSVUqo8PEgDoBB9hhiNpI9OFz7Cq+mzvc+xnE3YYo3cKvbMrMpNiAgcOYu4257/
         //cyEe3wFJV/FzRNJeYb81OLG4xcEJtdkHClXQjHgPbLWfvpN3QzLV2BDagvGkziL0gK
         obhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjRwbpuBx9A4o4cRoFcJqEE5mXsy0UsyNYHbW5KtG4M=;
        b=zcz+iKwnx0ZMrxxoiWOWidN/T2Nov9hi9yfN9W8JnOeRdSx0NnZmMAJkvVn70xCCEf
         lVD9+WLLakSoq0Ek8GGfgsSxl8+PthmvcWKa/TPPmpEkapwubB+NoxU7teJhuoTzmpFj
         CTa7gkw7djGGiUXrW12+6uER+kOmh8LM5CVVOgRvglY7brxrbJIaUll//C6RjuxQLzNR
         cMdlK8N/GyWobGUoi8944PEFWi49GMnz/2f+idjDM23h5sw79XigsBdXOlv9nGhYVOz7
         noaR4Bs3Rvf3rfagmOhyyL+YxGnF4xwJV0Klou7HnmxH5/gzOOFVip1+PcrowSDsLNKN
         hMcQ==
X-Gm-Message-State: AFqh2kpxURdcAy8nnPC2AI2kyhTx73LDEHTTYqCYAYRL7cvKgOWjOCGt
	rgLqwzIxgi20cegB9YHH2z9l5w==
X-Google-Smtp-Source: AMrXdXshcTe7Yre9OY4C4E6jNr30wzlSQe0BxicvczyjAULATvXvRnPw2diLMpZVvSEBR8IGX/Vbtw==
X-Received: by 2002:a05:600c:3550:b0:3d9:ed30:6a73 with SMTP id i16-20020a05600c355000b003d9ed306a73mr3129624wmq.9.1673262397923;
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12453314wmj.14.2023.01.09.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:06:37 -0800 (PST)
Date: Mon, 9 Jan 2023 11:06:35 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Antonino Daplas <adaplas@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y7v1OxdowGdxgvUj@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>

On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> With all users gone remove the deprecated fb_blank member in
> backlight_properties.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>


Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


PS Please don't treat this like a maintainer Acked-by: and merge it
   (Lee's not on holiday so work with Lee to figure out the merge
   strategy ;-) ).
