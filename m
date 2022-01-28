Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C52C80
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 16:44:41 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id e9so9874487ljq.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lGbJdBWOVm4Va2Wgu00QXQ6qBSeWp/5p1TodM7voG/M=;
        b=gi8dnSZB6Jf3ARKxPcuzQilOA1X+IiqrSJpDqa0UwPNSbvxlAZhn7o27PEBX6T4Pt0
         Yy6l0mN+LNiSyQQWHHAmf6parJzpyeXFAkkxL5K7luFmmIlaRL2LfjpG0L/TAIz1bTF9
         i7uzFMuBqGG3XviwNlXn7b799D8RxFzBpjwSZmu3RWfi8ru7YbpoFcVo5g88KsceELfy
         lIZuTKJyqdnQ59c2ztH/IFQSmsKWFYSWfk99sySz8rE0ttv6MHCV9Yo++nJdsP6ntQIH
         zeq+MWJsiwRWavnQIl8R2mLwvpLx0V4yVwg82LUiDJWia8a5F0Ypj1Y64q0qvTav4zhX
         BOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lGbJdBWOVm4Va2Wgu00QXQ6qBSeWp/5p1TodM7voG/M=;
        b=Z6OGg6pMneBqdk6dc32yZCTr2nBd2CSoL2ZecfePAKsd6UMIHAy/ffFvGm9/MBJ9FJ
         pdOXuD59QgOPbag59Dc26/QotwJU3p2Y5XPymfVXeqanwaKa57GKyO9c6h3kXP0QxmwR
         1YGFFy6JXITd8IYNx66vIKAMybLNMjx8dS7oExbG3gmkkkypEDDBO6vLnBs3hS5RFram
         +O5IKczXdxDUBxh9UVMB2Dp6I+XgZznv9szqV2+6GxoMpajwwcOal2hO5cm2+rvuV1ee
         Qct7KgvlH63ZkhDNt0PNC1/czVsRCbRWVZp93o24+8TYd7TsICXdAanK7ocpvZ6O65Ur
         v+yQ==
X-Gm-Message-State: AOAM533DXyC7kFguZyCtcEjr8UpY4SdeRmNK3ZOpZbt5h1O9BrVrHoac
	GXiwypwoCJtHwou2wbQwKio=
X-Google-Smtp-Source: ABdhPJyJ6jgjwOjzC8CzJQXbRwBcvXaRgKVo2AAd4HIFZT41VNXT41y1PVAPuiy0ARZx4En3ka4wwQ==
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr6499514ljp.196.1643388279294;
        Fri, 28 Jan 2022 08:44:39 -0800 (PST)
Received: from [192.168.1.103] ([31.173.86.67])
        by smtp.gmail.com with ESMTPSA id f9sm1988948lfm.166.2022.01.28.08.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 08:44:38 -0800 (PST)
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
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <d351e221-ddd4-eb34-5bbe-08314d26a2e0@gmail.com>
Date: Fri, 28 Jan 2022 19:44:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YfPwqfmrWEPm/9K0@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/22 4:33 PM, Lee Jones wrote:

>>> generic_handle_irq() is invoked from a regular interrupt service
>>> routing. This handler will become a forced-threaded handler on
>>
>>    s/routing/routine/?
>>
>>> PREEMPT_RT and will be invoked with enabled interrupts. The
>>> generic_handle_irq() must be invoked with disabled interrupts in order
>>> to avoid deadlocks.
>>>
>>> Instead of manually disabling interrupts before invoking use
>>> generic_handle_irq() which can be invoked with enabled and disabled
>>> interrupts.
>>>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> [...]
>>
>> MBR, Sergey
> 
> What does that mean?

   Ah, you were asking about MBR! My best regards then. :-)

MBR, Sergey
