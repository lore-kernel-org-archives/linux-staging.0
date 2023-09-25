Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A71095B
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 17:00:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c01f2eab3fso21142181fa.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695661227; x=1696266027; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjkZJBC6Gty9hVSaOaJYhVYV6erBLLSXof8lytqRb4k=;
        b=gdM90HcgH7+E59UdR06I1tXp3etn5mKB8sC/T/SP/LY3xIqnkYEohSbAvA0G3ef5kX
         q7UKIjsztpUjs5ZwCYYX8H3crNMYGURHWi2YT74O93HNq8e6X4fIUYaIhxBZG9QyGntW
         HHl1hrZrPPWHp2V7gem2LXmRseUYl5AzlAxjGri2+HHX5Du0S1JetNLZ/6JtTb+8uoH8
         gQ3/G5hCPCe2i2PMv/fOeazBerW0+Z96LWuzfWyVGoIXHc7lEnI0DkHUHtXLv8BCdgy3
         svGH34tQLOuzTyqRtpZp6+Mw9TYULvrTTAAy/Bv4pH9Nda+veaUjkzOuMmKXMYLc8fv2
         4+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695661227; x=1696266027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjkZJBC6Gty9hVSaOaJYhVYV6erBLLSXof8lytqRb4k=;
        b=olSyxtnvBQDpel+V2WI8S09uIu/42DQ/IPjLAj4B3yI0O5C1K3taBOKkJnnGY8hcti
         z61IYDi4P+FK9PaapzaibuTRXaT3nVCBNOmFxDLAZNozTLDXuogWhnWN9MdSOiOTMDrY
         q9R0oT9xyC37/D1ywaJh+zCg+rdEK9emFPSHX9+cKB3tD6IxZNXCwO9/5bPnZF2HuJlO
         CK2RAe1qrfQsIDUFgJy/9RjpKIWHUCpx2k2wuXZXyRZct7v3nLFpysdO4h6LVv3dzK+h
         7nN10ay/GiewMMvEqyVKeauOzSb4Q6pvGgJKyt44I7VI0vjk3Q8XH8fzQMLj2VVx5hWB
         U8Lw==
X-Gm-Message-State: AOJu0Yw2rIgPLWOvoXLg54Hkd6LVSKT/G2FnAr/3LIlOrhUG8ARye8Jt
	84GBKd6fBbG312WQqgrzCIo=
X-Google-Smtp-Source: AGHT+IE9o4RgPGsDQ/lC2M5jHxfW50sXuyYNDwwSDJ7pHK6hEfy1YgWYsN6WCfwkjd+56Y8ghe6GuA==
X-Received: by 2002:a05:651c:1a22:b0:2bf:fac2:d06c with SMTP id by34-20020a05651c1a2200b002bffac2d06cmr6645226ljb.4.1695661226373;
        Mon, 25 Sep 2023 10:00:26 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id jx14-20020a170906ca4e00b0099caf5bed64sm6584214ejb.57.2023.09.25.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:00:26 -0700 (PDT)
Message-ID: <cc39920b-6d2f-fdc7-ec7f-d821423c7a80@gmail.com>
Date: Mon, 25 Sep 2023 19:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] rtl8192e: renamed (1) mixed case variable
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230925151157.3893-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230925151157.3893-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/23 17:11, Gary Rookard wrote:
> Hi!
> 
> This patch set of (3) addresses the correction of mixed case useage
> in (3) driver/staging/rtl8192e files.
> 1/3) rtllib.h
> 2/3) rtl819x_HTProc.c
> 3/3) rtllib_module.c
> 
> Variable renamed: HTUpdateDefaultSetting -> ht_update_default_setting
> 
> Linux kernel coding style "cleanup", no change in runtime logic,
> compiles with no errors or warnings.

Hi Gary,

you need one patch to change all three usages of the variable.
You need to be able to compile the driver after each patch.

For the next patch you send to the mailing list you need a version 
history of your patch.

If you like you can send the patch first only to me. In case of 
questions feel free to ask.

Bye Philipp


