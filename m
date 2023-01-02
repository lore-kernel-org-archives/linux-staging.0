Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FAE7C
	for <linux-staging@lists.linux.dev>; Mon,  2 Jan 2023 09:42:24 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id f20so28612361lja.4
        for <linux-staging@lists.linux.dev>; Mon, 02 Jan 2023 01:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcvUq9UmyoEcHCIHRWfiFIf8dqA/idA+5+kkBDP3Jwc=;
        b=Enze+qE85rszC5l162+SsytKiZVRn651c+AptSbBqDeg5CshqP5D9I9DLhQLomlsQU
         aoWaxQ/Uv11McO77pbu15jV+qcjG4Most/S51gDs235PYfDMs/F1gHmF/0kjUb8mZtl7
         yROT4X7bKUc42ZAGuX/MRlZ9Us47NvpEc8KRLl/s1Dag3/VgRa0SnC+M9Lzr2xjqgoCg
         EGwe8Qu+93rEU+1hrm7AG5h6KxX45djw0vW46Zy5hFclNWHL2MoaMF4godTuiTbKcR5u
         4FUkEmM/9agUvzErz8wWtO1qmrOoZ8li66OIEY27EhvCk3UQbBEavCz6KbA+hYtdWWAT
         4nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcvUq9UmyoEcHCIHRWfiFIf8dqA/idA+5+kkBDP3Jwc=;
        b=4sBVSrZqYDFdTTE6eMwPiDwtUrTXS2NVkqoCb3voNrwIOGLMCUO7VxnzDsBrVHBzJy
         F3tFLiPObAtEliLxjY4mkKp9i5N1Yt7/njyIxVffh16iT7qIIOhW4Z1iCQYhg72Y6vOm
         RGlJ0UIgQyqSX/NMPiGi8JMmFyfu6uLm6cwwtc4POgGAcBbZ1SqBcywgzzjRnPk9fSXE
         H67VK8BytwSXmt3EHjKeuGDFLNyDu7uNtPdathOrk1Pull55LT8BMdsBwz6UOw/TGqFU
         Yakg3Qp4/C+SS1K+A/mqPa8F/1Lj8Zj3184QmHkNyjzAISn7Bzqpj7mbWRQin+eLKhLu
         I+Rg==
X-Gm-Message-State: AFqh2kr+RrvTtyeOIXdAn53Tums5w35Sr6fioyPBdbD0ddy53V4o3Pcp
	T7AbVrCyFQYK01H5WwWKhECL5w==
X-Google-Smtp-Source: AMrXdXvIOdKJ5XgKS4KvY6aM9o/FsDhmwNFMqN1FOzgDaixGx2p6xYkl2sb5r+OmNajN9s+2sMoAgw==
X-Received: by 2002:a2e:720f:0:b0:27a:991:4d11 with SMTP id n15-20020a2e720f000000b0027a09914d11mr9304108ljc.30.1672652542942;
        Mon, 02 Jan 2023 01:42:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z14-20020ac24f8e000000b004b55cebdbd7sm4433673lfs.120.2023.01.02.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:42:22 -0800 (PST)
Message-ID: <0de2354a-d140-364d-1a7c-380bb899c3e5@linaro.org>
Date: Mon, 2 Jan 2023 10:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-2-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229133205.981397-2-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/12/2022 14:31, Luca Ceresoli wrote:
> VIP is the parallel video capture component within the video input
> subsystem of Tegra20 (and other Tegra chips, apparently).
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

