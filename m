Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968002CA0
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 19:37:33 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id t7so10439999ljc.10
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aiENhwM8k5s4CI1T29f+7g3ngGtWKHx/bWX81I/XFuo=;
        b=VsehauSzbNf0n6Z/JkRnEEIXEmu5fPVfxgn01c1ll5kYNgwjlRcLEloqB4fUIcPxJt
         GdWfe/XgkyzNkttXaf4aRo4s7sUlgvNyt69j5WJbMbArnqwuf1BUpEMr8TlmjgDNGybx
         GPHmkyvIebgiAMcnbQPPsSM5jTsT7eb7SPBjnj0l58rV9Gv/qWKq+N4WB2sBRVWlnN+e
         mI/b+m/izcdyzR9uwE/UxKgQIY2cJRrPxoP9E2aglmiokMSP32rwDDmwCMlpniTOG9bO
         krI+E0b+sC7vs+YUAjpzDr1AQccTFkvb2PGASdFJcSplJN0FxuH5cvMj8AtcuzZQdoyc
         O6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aiENhwM8k5s4CI1T29f+7g3ngGtWKHx/bWX81I/XFuo=;
        b=txkE70CdUck3cwiOsphAp+jL1XbAZWWXhImdiQWjKI+4HJf6W0rELCMCyPyWqnuRpY
         fh+XLajfpyDCrvWPIPw/WRIYOEuvk84JwEYCe211oLcvfcO7JqTh8/hWnA2xTjum6EMI
         MTLH+rx4wpN+f8fqY5majGNQ6NJfSP5/4EOB17iPoQeVtVsTTOgCKpkiVYmeFQTOavjV
         5byDAZHkkgGH2zGl9u4+ZvNS3c/4HtXKEkqrQ5PpzP6UpYk0s0npglCzwNPMAvqnwBxo
         lmzXYXLrI0ZiRaohrtsoDL2Cnz0ghN6gxLIzu2h+efKwpQ7Myb6UMnDj7ztkz1OQYotg
         0xUQ==
X-Gm-Message-State: AOAM531KaJ17QMBg7/i8KNKTX6FpghPjEonSOaOqFVrd0c47VpEtOqEC
	zHjAOmpKRsCfGECSzpIZV5M=
X-Google-Smtp-Source: ABdhPJwrjMI4ZpB5Ov1Fk2wbeI8iclUzrmf1/QctXusS4SbUXC0q/1kcZ3akLOrdfD9K15D7hbd1+A==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr6552416ljp.491.1643398651584;
        Fri, 28 Jan 2022 11:37:31 -0800 (PST)
Received: from [192.168.1.103] ([178.176.74.103])
        by smtp.gmail.com with ESMTPSA id d15sm359077lft.202.2022.01.28.11.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 11:37:30 -0800 (PST)
Subject: Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
To: Lee Jones <lee.jones@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
 Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
 <YfPwqfmrWEPm/9K0@google.com>
 <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
 <YfQeuWk0S4bxPVCg@google.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <42d216c4-abf2-7937-1a99-0aecc4ef2222@gmail.com>
Date: Fri, 28 Jan 2022 22:37:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YfQeuWk0S4bxPVCg@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/22 7:50 PM, Lee Jones wrote:

[...]
>>>>> generic_handle_irq() is invoked from a regular interrupt service
>>>>> routing. This handler will become a forced-threaded handler on
>>>>
>>>>    s/routing/routine/?
>>>>
>>>>> PREEMPT_RT and will be invoked with enabled interrupts. The
>>>>> generic_handle_irq() must be invoked with disabled interrupts in order
>>>>> to avoid deadlocks.
>>>>>
>>>>> Instead of manually disabling interrupts before invoking use
>>>>> generic_handle_irq() which can be invoked with enabled and disabled
>>>>> interrupts.
>>>>>
>>>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>>> [...]
>>>>
>>>> MBR, Sergey
>>>
>>> What does that mean?
>>
>>    Ah, you were asking about MBR! My best regards then. :-)
> 
> Yes this.  It's okay, Dan was kind enough to enlighten me.
> 
> Every day is a school day on the list! :)

   It's not exactly a well known phrase, I like it mainly because it also stands
for the Master Boot Record. :-)

MBR, Sergey
