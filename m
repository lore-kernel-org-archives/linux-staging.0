Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7588E5CB0
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 10:38:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so40001735e9.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652699; x=1689244699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
        b=oWTv+jER8ka1Qe57jA4SaFw0YkAFNR9MLs8EHWTLGK0gdjURb8827U7zjqwpiSvT5T
         e0eaDxvtT7uG5+Wp8EirrXTjTOUQX2j/fLOLaZq/pJ+64Ba00r5H9S/pK7U4dMRJK0L9
         Qc7Or4upS3NpLZcvQbHuxgTi02642jsuq/VHjVcUfbnag6BeSFitZ8VihbqRMQ/amt5S
         6rAO7D1sOS/m+HDxZaf78NEI9Ak53UleVXMM+lSrWWnyEM8j5n0WiG1dLUXPUJpPa+UJ
         39Dun5o3c331GsTFkjQ3ooru5EdNZi10JosHPeRADIMH5vkoBHrH65cHPo29D6Ml/R0w
         z2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652699; x=1689244699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
        b=h0wI/bJVt8XgO0HifamoUj8V38UwSK4ohs10ETKL8RYtzRMYNAsk2Y4j7C86miYrFj
         1pVIovPcxe0oguJP92cPBFIm+OJLifkgZukLEUY/DdHQH9TYphcJRw7lpgFpOMdrY57M
         fIUhCyOCwZQgeVXc8/tlAcSGZ/ODBLYmF60Hy+0dVy1uTWNpepWAJB0yUllyC0K1+ccS
         IvQ8iaDbTndlbXXXp4N+GdT+HB1rtye5JBnZ9f0+Bec6aKF6LPX3koNkz0kX7ykbfjYC
         ERk98jJDKJXV1dONmhrGs1/Xe3L8iZQ+TllEtZV19s75rqCaeUGhSyiuKGdEFck3y5kP
         NaVA==
X-Gm-Message-State: AC+VfDz1dWlaZu5SW33OKwjwwX97mv9nMC4e/lNzCcXyLN07sqnTFICZ
	7uloS6Ui6lB3b7ZdOq1DNtNLOg==
X-Google-Smtp-Source: ACHHUZ7XbWL7BIDfabVlTuRqNRZTwEQFmx5C8dduAKY+peonAhPu4Kc2nONW4msTEVohgZimbq+iHA==
X-Received: by 2002:a1c:ed03:0:b0:3f6:69f:75e0 with SMTP id l3-20020a1ced03000000b003f6069f75e0mr7721992wmh.25.1686652699406;
        Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id z14-20020a7bc7ce000000b003f50d6ee334sm13982145wmk.47.2023.06.13.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:38:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, jingoohan1@gmail.com,
	dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/38] backlight/bd6107: Rename struct
 bd6107_platform_data.fbdev to 'dev'
Message-ID: <20230613103817.GB169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-3-tzimmermann@suse.de>

On Mon, Jun 12, 2023 at 04:07:40PM +0200, Thomas Zimmermann wrote:
> Rename struct bd6107_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
