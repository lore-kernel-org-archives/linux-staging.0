Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101EAD28
	for <linux-staging@lists.linux.dev>; Tue, 15 Nov 2022 12:16:27 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id a29so24120060lfj.9
        for <linux-staging@lists.linux.dev>; Tue, 15 Nov 2022 04:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=tR3w+a+JPTo0vZAk4sSj/mNTKv+ZhOTcOtCx2+3qEkMteQ3XTVzYbbKnLZLDmXNQZm
         EpWwiKYR7wHiNnFffVMVMw6i/SIXUy6yohd81DoWzdGvds6PL3NO/qTsBfqLMYhwbcPv
         +sLgujjc/1qTpymQnm2VbB4NjDWm6oZP7PTKtPAGtlgIFU1P3IotJ+Yg720TvfvWK5LY
         So997eksu3gD1Yrl5CpB2+flKWypWap7lE2wGRgW5DGu26fYiFHytTfTK5NYRcUtI4Rt
         OndCqUCzEim7UJBrC8EzWWZ93vwXJ8uYvAvn6KlHwiXbfEJU14Zda6YMkqNoUA5y05u3
         YGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw1sjbR71GpDX4+lhHk1yLaScEbbe6ryeafI3CiJP10=;
        b=34u8nu8k2puPslTn7WdcrzvPYrmGGbhgEEjSnPDF9V6qSShPeeoescJRXNwoN6LAP6
         Ye6eF3k0eMUcmF+V6gznYANPc6zngM4i98qNaC3Y/cNKYHb/YkzzI7B3R6F9boKzTUrC
         W9qNI2bz+EB13lIg9wt2Mx8ad2+ba4+EPMLeeObH4eZiLnVO77dXZvPltQCK2Aor6Rcs
         tPiMl5rolWkHNxjIZDV0reSNJ29AN+12GpS89GowkJ6nUva3HxuuIyreUOZCBX8ZMfgW
         +WC4ClNMWnJk5e2VOjMtIOlyKpZlh/7t/H2jbA/gEcHwNE3Sl2/WFf495kQa+2XN3uMx
         FTQw==
X-Gm-Message-State: ANoB5pmTy+T5WPE4oFh+Tcs1nvAIK+yvYmXpC/3nCKvBdpUfDYi506u6
	jrBQwATmaP5m73G/Lo1G1i1mxQ==
X-Google-Smtp-Source: AA0mqf7VWxyl1RZKscxhjDznC/kqYEwrVwdbg5fIWlrY+D8kHURt5sGT6UffK1OwKrikT7PXoa0dPA==
X-Received: by 2002:ac2:47ea:0:b0:4b4:1324:6ed3 with SMTP id b10-20020ac247ea000000b004b413246ed3mr5262252lfp.19.1668514585345;
        Tue, 15 Nov 2022 04:16:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u11-20020a2eb80b000000b0026dc7b59d8esm2482225ljo.22.2022.11.15.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:16:24 -0800 (PST)
Message-ID: <35bb9f38-d89b-77c6-a546-f575da5a79f5@linaro.org>
Date: Tue, 15 Nov 2022 13:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/23] ARM: dts: tegra20: add label to nvidia,tegra20-vi
 node
Content-Language: en-US
To: luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-4-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-4-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Adding unused labels is not useful at all.

Best regards,
Krzysztof

