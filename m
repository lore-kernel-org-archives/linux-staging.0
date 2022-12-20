Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033BE8F63
	for <linux-staging@lists.linux.dev>; Tue, 20 Dec 2022 20:21:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b13so20354744lfo.3
        for <linux-staging@lists.linux.dev>; Tue, 20 Dec 2022 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uem/Rg0y7RK0QKRnhhb+pOTt6PVpCehNtdD/fJMouvo=;
        b=n2RYVym0j++xBdJtTs4jg7kJ6kCMuuFIVQy8UMoq3D3cChxpobhm4EnaHRumBO3T6c
         n8HhrHZRe6UaO7eYyTBwSlP+0mkd4ZkkKAb1TZx/TfXAAGhKnHcrXg3m1kSycklnNo8b
         OYuVVUb8eF4pBTGpvfC8YHlV+JPyUDc7YY9txn0/p/KOaz/Nfuej9WaP0d2ieVWP/Pf0
         ml1amYkOw92Z9rXLpnTeq+ch/Rs9y6Y/naGXrsq0C2acTynwGu7WQazalH8yD4seB8Dq
         XBPBak24O5Fmxfzm2tZTu5f/Qn3HKJKxIpGAEW0I1gDMA2K7tRMhy8/X28gncf44dScD
         QZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uem/Rg0y7RK0QKRnhhb+pOTt6PVpCehNtdD/fJMouvo=;
        b=05Vb/qmc0O0kOyNFQ19YAof+70LZtqMZg6qAtGtxWXrxzi2iybuPo5W0/2Iu0xX/iP
         436W4N4w4pyNoSXXqO00VKCk6Zh2NH3O9yUg5xvw9i/sentLWr97yawM6zOXOATg1Kci
         LY8nriyaPW1tkHH0aXZZ0m0jGLa4X1yuNfbUPWCee+B1jKTPLCAZ6aJnf35VWBjLYpG4
         B2D/b+mq+8xRxLmLsa1rD7DeweoC3MDPk6AExcXvFwmZLAaWdrONo0ACK3HzY5FZErNU
         SV8vzYXUINVXIpmvt8ALzOE3pJhXqJcKR2fopw3JPIe2SCRm+l0tdunh7SCZHVFkSb6+
         mnfA==
X-Gm-Message-State: ANoB5plijCKM1OcXAO/7DhP9hRqR/JDQ62+8G5FpDCJedxRWStx+lCBK
	HLo6BAACulUk1W5zh+syQt4=
X-Google-Smtp-Source: AA0mqf50xiaxLBBtKZY+3R63yU+WhzuT/XVOd54mJpdrGz3UjV0WgTPmLiUveiXcBdAvF7VTtc3LxA==
X-Received: by 2002:a05:6512:260c:b0:4b5:8e1e:867b with SMTP id bt12-20020a056512260c00b004b58e1e867bmr16677059lfb.59.1671567717063;
        Tue, 20 Dec 2022 12:21:57 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru. [109.252.113.89])
        by smtp.googlemail.com with ESMTPSA id s1-20020a19ad41000000b004b59c9b7fb4sm1573738lfd.126.2022.12.20.12.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 12:21:56 -0800 (PST)
Message-ID: <a99fa7e5-31bc-4286-17e5-6ba6e4932bcf@gmail.com>
Date: Tue, 20 Dec 2022 23:21:49 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 00/21] Add Tegra20 parallel video input capture
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

28.11.2022 18:23, Luca Ceresoli пишет:
> Tegra20 and other Tegra SoCs have a video input (VI) peripheral that can
> receive from either MIPI CSI-2 or parallel video (called respectively "CSI"
> and "VIP" in the documentation). The kernel currently has a staging driver
> for Tegra210 CSI capture. This patch set adds support for Tegra20 VIP
> capture.
> 
> Unfortunately I had no real documentation available to base this work on.
> I only had a working downstream 3.1 kernel, so I started with the driver
> found there and heavily reworked it to fit into the mainline tegra-video
> driver structure. The existing code appears written with the intent of
> being modular and allow adding new input mechanisms and new SoCs while
> keeping a unique VI core module. However its modularity and extensibility
> was not enough to add Tegra20 VIP support, so I added some hooks to turn
> hard-coded behaviour into per-SoC or per-bus customizable code. There are
> also a fix, some generic cleanups and DT bindings.
> 
> Quick tour of the patches:
> 
>  * Device tree bindings and minor DTS improvements
> 
>    01. dt-bindings: display: tegra: add Tegra20 VIP
>    02. dt-bindings: display: tegra: vi: add 'vip' property and example

This series adds the new DT node, but there are no board DTs in upstream
that will use VIP? Will we see the board patches?

In any case, given that you're likely the only one here who has access
to hardware with VIP, you should promote yourself to the tegra-video
driver maintainers and confirm that you will be able to maintain and
test this code for years to come.

