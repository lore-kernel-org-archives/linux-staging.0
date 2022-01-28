Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F172CA1
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 10:23:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id u6so10765696lfm.10
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 02:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x/9CSXvgs7itWENuvqfwnHsLwy/dW8BRtkhJB5JxTZM=;
        b=aXkn21kttW5XZ4d68NPV9wmASb9mf0RHDdkv6aulozhRSlQW34zPV7+ur53K14vwwh
         IcICBR1PxZQfYDwSPVaTfmQgpL6iPHnjKMg5F0NKkRlJbUWKmCsZJzpI2VduiaENRn7y
         ZF0+eHElCngqXmKKPODJHRTUDw1Cvn+Ljx/2WdORDAK/i8ro3GxZEoJQGLHxvkCkPQT7
         d7tgs/0TYqx5KhulapVwyCqEhatGxB16EzVySjZHiIMAL0sLh5WN+bP3BZ3KjgwowI7I
         V+14HotO3p5eCDVnU9OOzp4dh9Qbx160uk5ijngcQF96omkN3+AdROuYvAun0AAcqSoz
         DcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x/9CSXvgs7itWENuvqfwnHsLwy/dW8BRtkhJB5JxTZM=;
        b=Dp6cThztMbhIiDhRotnDZQU0xmbkGKCjWrpGlo+XhkwUIc5jTdsEPiHJl1CHCLNymz
         Mba5jptjA4oPun4zQFw+b/N7dsYSlrkRWG8yGAiLWblkJbGL/eDHx3eQ07xTesyAgg0E
         fn8q9HrDVrPvi9LphifQtSKUwPQkJRLsRB7G8U3nkJSyVZlqRkQnDn0vfNv+288Z3Bxi
         HFUnPXJRzX3wGiDBpzF8u/iU6zE8p4ryzuBeEGlTw4SH/aTqHOzp8bqPwphnpiX0XOt5
         rpTyc6pjXPyBoRizBZtXg3cABL0e/4UrGE/3c1w3EV89nkoJoy0WO2W+J6G8mNDFdsTv
         kSGA==
X-Gm-Message-State: AOAM532bgse6YIQAq3wQmgkn9Gd444Yg+2DO/AviM4tarwVdXCl0Zx5f
	SObeI8fQFnXt2FgvGQp6ErKVtTt+/nU=
X-Google-Smtp-Source: ABdhPJwxbAYkS9/zKQirmZw5BCnQdN8trlg3dDjqY6SqJZzRCjj27U6ilBxgsbR6RGVKu/bAlx/kQA==
X-Received: by 2002:a05:6512:39c2:: with SMTP id k2mr5582026lfu.586.1643365390218;
        Fri, 28 Jan 2022 02:23:10 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.83])
        by smtp.gmail.com with ESMTPSA id u25sm626293ljg.134.2022.01.28.02.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 02:23:09 -0800 (PST)
Subject: Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
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
 <20220127113303.3012207-5-bigeasy@linutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Date: Fri, 28 Jan 2022 13:23:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-5-bigeasy@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/27/22 2:33 PM, Sebastian Andrzej Siewior wrote:

> generic_handle_irq() is invoked from a regular interrupt service
> routing. This handler will become a forced-threaded handler on

   s/routing/routine/?

> PREEMPT_RT and will be invoked with enabled interrupts. The
> generic_handle_irq() must be invoked with disabled interrupts in order
> to avoid deadlocks.
> 
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
[...]

MBR, Sergey

