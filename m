Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E007B
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 14:54:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so9279259wms.4
        for <linux-staging@lists.linux.dev>; Wed, 08 Jun 2022 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/UVSlpPd3rsOTMDlQ1ZyeboYDpPQXRxEscJnVQE7aXc=;
        b=NOVyZ0ybVuagM0hyY5lUQmNY5Z6tlfSssVLuHrioj4pFXSStCE299BtFou21UZk/8m
         VepKg6OpRednAFUOH+DrFvmLI9yOlC/IAMdYiSfQ6UOc7UJzfTqtO3wrZhRQ6Y3PkLuY
         gqjs0vLD5jjUsL/mscM1fXT35tsnMSwcomlX6a9/g3w8TXZ3R497MNNJCeBYOYZ22HGL
         9l/NPiOWTrux+f9ruw4K5CJf1Cr/GWmk6hkYBSp06qahIqkm03PO9JisT+Q0fZgMrbut
         ZpW2yIjJYDnnTb1+8qLVNW55t1H1tePx44wBwq4uu593J2cdba146uVXx2JRI0sZqR7f
         x2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/UVSlpPd3rsOTMDlQ1ZyeboYDpPQXRxEscJnVQE7aXc=;
        b=o+HIgrMUfioucEM6eWmlP4ZtX7CTtpLTJb0xyTVfW6+g/VVaOnKQM9H1y2wcwI0MTJ
         YIkSmlsOofTkxHss81HCqh33bvlwDd3uQZszsYjqKRjzznRgRca7BRb44hPjwImVAYiw
         0H0ifYA/Hycow6CQTT1gDtzIDShavV/GauuXk2r4rr0Dp3D2nSonVPSC41mC9RGetlKa
         eWwQzBS/YrCZ9i1HO/EzblSQ1i0pgiVH3iWmcrNQKu79iIB5lRGn6GpGh1ZU4INnw1Pa
         EFxFGYRLOpQLR5mtjzr5xFxEkJHUkOdKwTJg5Iq1EQaEAN3O1xvbQFd1efG9fIydSqpZ
         9XPQ==
X-Gm-Message-State: AOAM531WHSeDvuDcsivkI76q9nx46pKL60fuZ607VucTCL7F7mfPv/vi
	7Pqz+4DnLsydVXe1kL62c6PSqg==
X-Google-Smtp-Source: ABdhPJyEA+RemPKIQuk742PCiLnKJ52To3H1lPVlBXw0lq0Iq7rdYqBME7INiy/5snTFyMG/KiRGTQ==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id l20-20020a7bc354000000b0039c675321f8mr707309wmj.113.1654700044185;
        Wed, 08 Jun 2022 07:54:04 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b003942a244f2esm30757054wmq.7.2022.06.08.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:54:03 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:54:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Len Baker <len.baker@gmx.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <20220608145401.qaycvdfc7ks3bbx3@maple.lan>
References: <20220607185516.1129900-1-steve@sk2.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607185516.1129900-1-steve@sk2.org>

On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> backlight_properties.fb_blank is deprecated. The states it represents
> are handled by other properties; but instead of accessing those
> properties directly, drivers should use the helpers provided by
> backlight.h.
> 
> Instead of manually checking the power state in struct
> backlight_properties, use backlight_is_blank().
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Len Baker <len.baker@gmx.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-staging@lists.linux.dev

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
