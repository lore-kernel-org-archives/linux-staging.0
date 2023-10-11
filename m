Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E193994A
	for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZKTAc+0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40651b22977so428835e9.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697048007; x=1697652807; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QjCK+8QWq0gyUTkOiemvLVBkLYH9fn7QPYSepTTFeHY=;
        b=HZKTAc+0P8Yd5ua4dvhVw1Er4DuGR1Yui+k0JMUqLVzSMlYgsrPhFImz8vksvblMza
         rJQkSyyg2ioVhcuSPhyxmMBZKVt8nG6v12g01XncxE2TThKOqTm+letOlofuHwaZs8++
         FMI/UY9Rnyptd8vDIEAhsskRl5obANaYZApgN1KEfg3ySY4XJZICUsSnCzKW6Oml30f2
         sbvWO4DuJxHeZxyYpm6cPksdao/VdBg24WXdWVAjU95azu30OH2ePtmLFoGXxS1IIN1q
         gdLuaohFse5+2LPDXxqSgZKyWKoZ+LGyg2HVB2NsAI/P3qdCCDYp17t7eGHvyOb386M8
         9E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697048007; x=1697652807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjCK+8QWq0gyUTkOiemvLVBkLYH9fn7QPYSepTTFeHY=;
        b=HVtU3PvuyltsQJGhD9JuWcUe2iBFw/yLrcO+wjG1uyeBsXl76x8KKTG5DkVb3k0oCm
         hFwsi/DtqpymLq+Lj2fLXg6Qk3JxVhFELRBtO9VO3plEZV52ApfnC8lu9y7m3FOWLsxF
         pa2sCdhecywj/Zg4jeSn3b/rRWZT2WrsEIFtDrwD66KVml7i/dhZkR1ISoxD7wCyL6kx
         jovDqQWmXyoiFdbu7DOEN2vsSFLhv2jlLPtradO8MXRw4jLzZ7RdKkWFXESRN60vAS2c
         q/ljoedUS5CnoYYx17mGfxT07CUZWw4U5ffrLSImktQREk3ZP09Mgt0d2hC6SYf7fUv2
         vE9A==
X-Gm-Message-State: AOJu0Ywkqp6L/Jc4vpN3WfimyVnQhrkKpNc/lOwURCpSz+3xAzKNtVZR
	xZzw/x408UXfnSVDqfg9vE8=
X-Google-Smtp-Source: AGHT+IFK4ka32EySjBz/6awgdfZmmdt1F6crkvar+uu1FGIncSQscSUhhQ50bPLYw87kYR5wveh+5g==
X-Received: by 2002:a05:600c:5117:b0:407:52f0:b01a with SMTP id o23-20020a05600c511700b0040752f0b01amr5639522wms.2.1697048006483;
        Wed, 11 Oct 2023 11:13:26 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id az17-20020a05600c601100b003fef5e76f2csm1366706wmb.0.2023.10.11.11.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 11:13:26 -0700 (PDT)
Message-ID: <da777a72-55d1-4ee3-91c8-30afe7659f54@gmail.com>
Date: Wed, 11 Oct 2023 20:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jakub Kicinski <kuba@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20231010155444.858483-1-arnd@kernel.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231010155444.858483-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/23 17:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de> While looking at the old drivers 
> using the obsolete .ndo_do_ioctl() callback, I found a number of network 
> drivers that are especially obsolete, in particular for 802.11b 
> (11Mbit/s) or even older wireless networks, using non-busmaster 
> ISA/PCMCIA style bus interfaces, and using the legacy wireless extension 
> ioctls rather than the netlink interfaces that were meant to replace 
> them in 2007. All of these drivers are obsolete or orphaned. We had 
> previously discussed this topic, but nobody ever moved the files, so I 
> now went through the list to my best knowledge. These are the drivers 
> that I would classify as "probably unused" by now:

I found a USB WLAN Stick with a rtl8192u. I got it last Saturday and 
found out that the firmware is missing in my ubuntu 20.04. I found it on 
the web and fixed it. When I started the driver my computer crashed. The 
missing part was: priv->priv_wq = alloc_workqueue("priv_wq", 0, 0); 
Fixing this the next error was a network = kzalloc(sizeof(*network), 
GFP_KERNEL); in wrong context with leads to a crash of my computer. 
Fixing this leads to another issue which lets my computer crash.

For me the firmware of rtl8192u was intentionally missing because of the 
issues with the driver.

What this has to do with your question?
Can we check for missing firmware in main distributions to know which 
drivers are considered to be old and unused?

Bye Philipp
