Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9B2C9C
	for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 19:06:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id cf42so36223868lfb.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Dec 2022 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=DqhzdZ8GMGONjk1/mTp01nVTS73jara4hArPcV1nK4bXiYc9TbLAiKNZt4Q46wLOk3
         kUHVSzEfgAcdS6QoYjWNP2xExsCibkI4td+Z5kxheIMrxM9HNsJ04aQQyn+bFksXompC
         ZtkhNHUXgLBKEcUICB4qz6yqnrbPza3Ksaz5GJ+iDSp9b3gFIssULh1nr+83YqAgkRkJ
         EHPniaYDfdhwqccTrNmJ0ma/NUu/qFZcYHIsrePpconOOeQxnZn21Rc4uKx2ZaPAtECN
         Tg/UHmUXAMxMzNKxPghUA/NQ3uEsw67KOrlk1e8tOQg9ZBmlUnkGqRh0Yip6MAX2JIcf
         mLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIySvWkaHMhvHNet3xt7JxoPX9peCF4NsB4XrthbUdQ=;
        b=T2X10lOZ+3Mg/AA1wQJvCURpiSskN3ndKW/EYmKPrEsZ2UXQ+gT5OHUw+nBLsZDbos
         /qGUxmUk55owbF103BZU6cS6NCtdNIRnquQlSox392uisNvDlOp86FWqCCXOdERsvy4Q
         7jcRkt9S0qXnGrtCnpAYxw+WtAGALrdQEd+0cDIrjmiAhbukT5kn6H3Zk8I00Ux1yvTy
         i1cjutsOIEMEEpFchUpea8bUewA5d0OnEy6p12yeS/NbMruAhPJ7DfNC4UTmmstPd46h
         T3HYozD1dzcgnCbTRiGvKnyMhE9MCQwnhSRnr/zqDmgdZfQPAWlCJNL51hzjgMQFc+0N
         XmqQ==
X-Gm-Message-State: AFqh2koSS6hMbaaNn3Z4zCzIVXJvU4T/c5TwafglP2S5AwhImumTsT6A
	VScFiIewS40X/Wl77eHY3z+rNw==
X-Google-Smtp-Source: AMrXdXuTfgdQbhaGaIjJutw1ngrQ/aadPT4CRRlOEuJUlZU1qHVVzJzumSK1QyfcO5SFZUTpCaL1Gg==
X-Received: by 2002:a19:f001:0:b0:4b6:e4c8:8a48 with SMTP id p1-20020a19f001000000b004b6e4c88a48mr11142739lfc.63.1672513559388;
        Sat, 31 Dec 2022 11:05:59 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020a05651205cb00b004cb34b81150sm80316lfo.282.2022.12.31.11.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 11:05:58 -0800 (PST)
Message-ID: <ea18d873-29a2-2311-d10f-ed3f82d2a46c@linaro.org>
Date: Sat, 31 Dec 2022 20:05:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain
 references
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/12/2022 17:46, Samuel Holland wrote:
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the

"PPU" is not a nickname, so just PPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

