Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9F03D98
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 19:47:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z22so9351889edd.6
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 12:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=u8p9xdNn7AphQhSjTR38SZgliksZusGzeLWxWOeSIsI=;
        b=p7a+xQRMZj1sZmp6R2/fug3p+ICh5Q6Yzj5N7E/hCrjJj6hDA0/Vlr9y/GjHCFx71B
         WF/XGYYtQ0Vq5J1cpnEFNAENIjbljP2/X+/E1RoZ/jCw1A4C+hb7ExLtJeqOIsH/8Y5C
         U4UAw4C3rcWoJ5cOELNSzAEog3w/Nu8bs351PIjqw5t9iHS0tg6to4B9TiqrbGzDS1Ks
         fWGXthh6jz1VzFWFBptXX31GZamWzcY+yF8R0Baa9ONbUzK7EciLfn4jXJDJtEd4mR7N
         qy0e/1iqmahn7e7qCwklb+Jej300q1tYzOGDwcW0z+7v2Vx1GTTuZDnxzXTowsF7xdiA
         qa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=u8p9xdNn7AphQhSjTR38SZgliksZusGzeLWxWOeSIsI=;
        b=lPn0pG6oE3oeYQsvlVrNAeFJotFN7oR4nO54ja3miUB7NvxtwG1jksrww/GmXZrdXW
         41yt5tDYTrtb5dpk8IiN9FJj0TXGOC/k/ve4uKJp559JKlvvS+rsutjnQ1g91LcU8DO+
         dZXo3BcSbVq5Az6y/lyLZ0OPPk1QsYpksxAMNZnOQFXeNezm5JTXkIdHTl2XpUPuDwmb
         LI6AxMsKApe6H97Oai+ZC5OCOsTF7Q+Mm0gPVaPJpoerFgIBL9zYj/J4kQeClAMVHT+M
         i7j0TYuBNYUnTj2EuXLXq4ndcdvvfgDdfYcM9IR6gwAwBQ0k73PxEaNO4PQ2+Y3qICSp
         rmjw==
X-Gm-Message-State: AJIora9FDR7yBGpLDpUaJ4aSlFvUkEuYpGPBp/zbWBlBFDiYv49WTjcL
	k7lmwVgYq/T7dBp1gilVo2E=
X-Google-Smtp-Source: AGRyM1up2ueIwyvBrkko8CHKRnUL/UMXztYwr5Le/tXj/HwsNwQeXT+udlbsx0p7JVfYvVEQDvEHaQ==
X-Received: by 2002:a05:6402:287:b0:43c:c604:addb with SMTP id l7-20020a056402028700b0043cc604addbmr8797967edv.201.1659210456477;
        Sat, 30 Jul 2022 12:47:36 -0700 (PDT)
Received: from [192.168.1.103] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id o5-20020a056402038500b0043cfb6af49asm4168403edv.16.2022.07.30.12.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jul 2022 12:47:36 -0700 (PDT)
Message-ID: <41da68e4-67ab-29fd-342b-a5619aaf6110@gmail.com>
Date: Sat, 30 Jul 2022 21:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: clean up dump_chip_info()
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220730150637.3550-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220730150637.3550-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/22 17:06, Michael Straube wrote:
> These two patches clean up the function dump_chip_info() as suggested
> by Greg Kroah-Hartman and Joe Perches.
> 
> Michael Straube (2):
>    staging: r8188eu: convert dump_chip_info() to use netdev_dbg()
>    staging: r8188eu: refactor dump_chip_info()
> 
>   .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 37 ++++++++-----------
>   1 file changed, 16 insertions(+), 21 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
