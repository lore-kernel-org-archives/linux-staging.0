Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B728D168
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 10:18:20 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id t9so8270298lji.12
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 02:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ix2P1Qb5ofQ32QsYkBPXKMooy+IhErtwFmSskoxD7SE=;
        b=HeDUP1mJe5Wh7L3Q7OGU3bD0vrHT35bY3RPQL27RrmknbAcnZRL5iJpoWD+mFG2SV2
         qh0YRbrARJJ+Qlu3XnBT6QX8t+1gBDwL6iyvf6B9E+4T8F+PH4dKJvdiJWG4ILQTdBFe
         WMqyYiiSSKliFToRWugPWsxurGNdumszzo2nbc73NZRzcG9E8wj2bohO8yQKy+FwDFVN
         eLW+xh6jHZCMB2dGEz7dsTfL/PX5Ckx7r27LBzA3/upqJrcE0BHt2zfGIqrd6PDx2sGS
         1Mmpox9pvKYsUotNxW6VPOKYv03J3WHh2cViaiSQTjzDEyNOybPo+1gOWUf4iwgXJmaa
         zZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ix2P1Qb5ofQ32QsYkBPXKMooy+IhErtwFmSskoxD7SE=;
        b=4HY1UtQKw7G5na+9jrtOlXbPTgv5B32SoPGl1ktSL7o+nTrdlOp7E6EHNfpck/gZ82
         QA7DJWjtBDuL0pVeZocfu9F4bCiVixQrbMTwIi5OgIUh9E2Oah8m4a3gIbk+OeMBL5N4
         gHHgiB67bB5xCdT56sna8YHFqazlTHJm0MYdG3sG+n5q6bZmGTOlCxWMoyohKfe/5oXE
         eW5ykDfwDMgcdUebb70dfNJ4bkWVZOPvvximpob8L6OLXPzFyUxcD2SJRBMoy7X7NVN6
         sJGmj7NzYCYJgk5kLsd0cU3rrj1VD3CLH2zPwe94asqxq1kHyOtzSVPiou4AyoV9sOcH
         d5Rw==
X-Gm-Message-State: AOAM5300XEnkmraowY+V8BJ5bAeeY46uEbHDZVk10WE1hehil0hCM65n
	21kriYyO6oMCIfDup4WhYSk=
X-Google-Smtp-Source: ABdhPJyB16VsXVJnNjJMJADy3aApl/JsRwD6PTo2A73BfnawYgkLg1UmTv6X0o3ez3H1uCaT+ZH+Ew==
X-Received: by 2002:a2e:9f4a:: with SMTP id v10mr5239509ljk.233.1643365098684;
        Fri, 28 Jan 2022 02:18:18 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.83])
        by smtp.gmail.com with ESMTPSA id j15sm1005692lfr.203.2022.01.28.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 02:18:17 -0800 (PST)
Subject: Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
 Woojung Huh <woojung.huh@microchip.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c26a4348-fa0c-6eb6-a571-7dbc454c05d0@gmail.com>
Date: Fri, 28 Jan 2022 13:18:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/27/22 2:32 PM, Sebastian Andrzej Siewior wrote:

> Provide generic_handle_irq_safe() which can be used can used from any
                                          ^^^^^^^^^^^^^^^^^^^^
   You're repeating yourself. :-)

> context.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
[...]

MBR, Sergey
