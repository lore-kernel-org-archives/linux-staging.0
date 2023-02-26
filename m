Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556263D61
	for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 19:35:24 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id l2so2901791ilg.7
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 11:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66rKgYfZ0JLlcjc08pOa7T5lBmt7OeLV5Mls9m6P4To=;
        b=kfwmXBXyMnP1MYB5Ig1BrT74qDINOeVwX90wBRDFNCIl/LI2S6CmEWvmlM2YW+nAZj
         UcCwxyUJ61YJfhcPE/eMYz8A/KlaBJVGwYKf8nReNotptRi7TI5ujXKB8MdlRKdVnKFo
         1vMh7gRbP4oRKkYr+MwLPbWt0N/39j98PHJ8JMMCM2Y0K3bmqsKtkPJEFPCZOEXIo7ah
         9fkORH73kP228UZGaUIgJ42ITczZCS4NFK1s073nX+I6OfjNQlFnqTre8BWNhHSILlQv
         4rvmtJTNhNVWs+zJ9uc2BQ6GEiLAGtYxoBh9rU2XOKT9tKR+N/igWeytlCFXEwrw4Y3D
         mj3w==
X-Gm-Message-State: AO0yUKVSVdxecW2IqVSiTxgaK2g44wOza8bZjK0K+CBqGXrd3tEwxb7D
	vxB8d94PrPYu2b3wuE5OrA==
X-Google-Smtp-Source: AK7set8Bj7b1HrLAuEwFy1Z07OGWlcmrCj32SezzjBkYQCTEExRPs577ubZoQrkIYamfFRL3si5Dxw==
X-Received: by 2002:a05:6e02:1a6f:b0:315:3d25:231b with SMTP id w15-20020a056e021a6f00b003153d25231bmr22091467ilv.9.1677440123270;
        Sun, 26 Feb 2023 11:35:23 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id z12-20020a92cecc000000b003154f7c11f7sm1417544ilq.39.2023.02.26.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:35:22 -0800 (PST)
Received: (nullmailer pid 187425 invoked by uid 1000);
	Sun, 26 Feb 2023 19:35:19 -0000
Date: Sun, 26 Feb 2023 13:35:19 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-staging@lists.linux.dev, Maxim Schwalm <maxim.schwalm@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 01/10] dt-bindings: sound: nvidia,tegra-audio-common:
 add new property
Message-ID: <167744011865.187365.15488649749142004179.robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-2-clamor95@gmail.com>


On Tue, 21 Feb 2023 20:32:02 +0200, Svyatoslav Ryhel wrote:
> Add nvidia,coupled-mic-hp-det property to use Mic detect GPIO only
> if HP GPIO is in active state.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

