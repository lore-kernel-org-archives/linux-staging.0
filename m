Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688C97473
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 19:47:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40471c054f9so11444235e9.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 12:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694980026; x=1695584826; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7Ov0YCML94M5SspHfxk0f+6nTANT0RMxVpo3riDHPA=;
        b=YxScKv7C71i43ACEBdIYOqVmnLsxDK5fo/+Gx2DJoaINlLz7OYJvErZ6nMaXtxMTnN
         Au0mzCvDMqvyXjteWWIKCaIfT4C+phMuKGVnO2a2qx6sHn8z7KENXdrcPbyhmFb0Ekia
         YYHZf3euLAwYb3pHKqe+pFnbL94M2NOlYNeOV3IhK1KIN+ylEYmY0ZF2dGhFXVz/rWYO
         MQPT1seKEUD+OSFSCyDrZoW6Gi7P+Nf7jQ87zJWejFFKBypGPuJnKZZlkMP/souXLhVi
         JkQtD3v5Ppza+4b7LQKHmU7u6Y3l0iyg1jCbWBAxZMuZhWosynwkv/aWY0yN2NIZieAc
         H3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694980026; x=1695584826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7Ov0YCML94M5SspHfxk0f+6nTANT0RMxVpo3riDHPA=;
        b=pvsjbep8w/ZaShneLKdoXn8mC6N+gES9kq12IW977BWcEerG2RWA64GqPk8gAvO3uQ
         BNtpLEj4Pff6lFZRbIGUSKTPgjoxfiyyvrR3s/xh+XQeX7E/0p+Vb0ApMs+H4DyHVDOQ
         gplUjIEEJfF1c63di+RCx3JeABI1anDp0rUato8wK057IfQQ6bHe6ZzRHp8nZihhgQJS
         S/KWuBHDElLqpFQdN0lUuNepXMxhGNIWJqO/MXerT7z0sNaaxiwMdRQ38PPIyclj2iI8
         6irPXmE/IwSrBV4QbZnGtJnf03rOI4nVB8IxQ0AV/dZXGoNv1UmOrn63nFiW1NeK81Id
         uV9w==
X-Gm-Message-State: AOJu0YxjgtUzbjcdrL3IfKMQBI6Sx3HvmmlY3c0cPOgvoSvEVhH+fr80
	LBoYwi5cfZ7ray0buaiOeFs=
X-Google-Smtp-Source: AGHT+IFv32MBpFNUGCzF9bXTwkfn0m4zA7NDKplheTDY9YqyARGbaLD6fMPu8kd8xVD9wWBcfxjgSQ==
X-Received: by 2002:a05:600c:5103:b0:401:faf5:85c3 with SMTP id o3-20020a05600c510300b00401faf585c3mr7196291wms.0.1694980026343;
        Sun, 17 Sep 2023 12:47:06 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id ay18-20020a05600c1e1200b003fef5e76f2csm1949523wmb.0.2023.09.17.12.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 12:47:05 -0700 (PDT)
Message-ID: <9548bc1c-23c9-427f-446e-61f051f14f9c@gmail.com>
Date: Sun, 17 Sep 2023 21:47:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] staging: vme_user: Fixed prink formatting issue
Content-Language: en-US
To: Piro Yang <piroyangg@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <2023091756-duct-agile-0023@gregkh>
 <20230917192359.78711-1-piroyangg@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230917192359.78711-1-piroyangg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/23 21:23, Piro Yang wrote:
> Fixed issue relating to prink message:
> 	*using __func__ to replace function's name
> 
> Issue found by checkpatch
> 
> Signed-off-by: Piro Yang<piroyangg@gmail.com>
> ---
>   drivers/staging/vme_user/vme.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Hi,

you need in any case a changelog what you changed with the v2 Version.

Your subject is to general. Please consider that the maintainer needs to 
recognize what it is about. So make it more unique.

Bye Philipp
