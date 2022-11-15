Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569068498
	for <linux-staging@lists.linux.dev>; Tue, 15 Nov 2022 12:16:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id d20so17220635ljc.12
        for <linux-staging@lists.linux.dev>; Tue, 15 Nov 2022 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
        b=dVbIYOtdGkdVqly/KvZDhArnIz9Fg5uIJ7HwKYzGD5l3QqfLqCS/BgEctba5QO/jRi
         QrQrKowMdp+yub+BQE1jtloLdOnm4gFG4hi7EbaGD5AcNAOYhc3KlzgsrLOXoGQotw3b
         cz5E8/tR9A3SbwixqCSFycD2rCk/lxKGiiAcMPp2DgvE13Q7dEZm8DKTfduPgzfj9pdx
         CoVW2rzOHgAK/Qw/35cnKfyG3+lu7BYhpElAPXD65RgK4fSTncSy5LSU/tI6ZnOQmJPJ
         zsu/wY00PJYxTYXIcaGFou97tq3YGcZvHLHeKsDErsVfV3MY0ps3JFlKnUhwlcCqnFN8
         H7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8a2trAk20zeNjRwRS1+8oYlaEQHwTwjT9p/pnuw5YU=;
        b=PrnrnZFufsRVfkIc2IWd4LnpMVrcPBKJWDLCKQDQSI6FFgoyRkALkFw4Z9wJoRUy2P
         3aaaFNeXwE3e4hhSnIuZET7f9uhe9jbK4ADVczxzmMWq6jcK2UT1x3oX6UKsfC3hFljC
         zziwrlMK1xCJnDr++L26u58cGskuOiLceRrgruzIS6Z3+DGLulJ/lUeYvKfzfNTBg8UC
         meVk9qFMYLuWWJPGlUSck4eXSEDtoB82Mijzlo+oUzW5X0fMEgq/NQ0G9HTSNbu2tuLD
         UEr8ElfV8BJurE5JtdZv5KZLn3jTdPDu3pyGF0QcCWP76Qg21YkonHlG4NxpiaepnKnf
         6QNw==
X-Gm-Message-State: ANoB5pnTar899hM5PzXo+KvWV+2rwDMC4LHoylTRh6x8hUXBFzLGeNTB
	gVCA8sM7Y3QARtNEh9PSbZ9reQ==
X-Google-Smtp-Source: AA0mqf4WeDRLRTpDDIEIh3ypaNHFe3jqjG4gsVQVteBMWm/oxYn2XR1BnUd2CwXWpgdeL568DSRP4Q==
X-Received: by 2002:a05:651c:904:b0:277:1d64:f21c with SMTP id e4-20020a05651c090400b002771d64f21cmr5984950ljq.373.1668514570434;
        Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020a2eb90d000000b0027781448499sm2489000ljb.85.2022.11.15.04.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:16:10 -0800 (PST)
Message-ID: <9d894b13-78f3-bcd0-28ee-911e09799426@linaro.org>
Date: Tue, 15 Nov 2022 13:16:08 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/23] ARM: dts: tegra20-tamonten: add label to avdd_vdac
 regulator
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
 <20221109141852.729246-5-luca.ceresoli@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-5-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Useful to enable it from a board DTS.
> 

No, it does not make sense. Adding unused labels is not useful. This
must come with an user.

Best regards,
Krzysztof

