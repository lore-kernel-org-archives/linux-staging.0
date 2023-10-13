Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A41B285
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 16:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H34ilbkz"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c4a25f6390so1462228a34.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697214283; x=1697819083; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NZs5dBVvL8WiMBXWyFhU0nbTUlLlApXVMkA85zryGNY=;
        b=H34ilbkzLIwRjTf6OZcwepiePISRaSGnE82hxWw/ptSQJ+Vb3fzNLja1kq6BmxBig6
         WSEdksNMpWWFwNOJWQQLaXlsp4buGeSRKx/9RRpqVfyhDCixDsSvsHegVZkDURzhoM2j
         +f6fG4jb7XxUoPELcY8v/LJSMeX0GFRtv4VKQ7IQHSSzmBi8H9IMQXPUgAEavlXJj2BL
         q2hoy0+HIjKjU/b+RjPIBNs8P+CG0lICDsnq45CQuQTPKAwwG4AsJZ26po5cKOHi2l82
         FDcnbg3thNMxsCFeJuWeaJv63ILcN3vHiMC2/9lTclwvGoHPzFlvuVKiTYOQWsFsR7eX
         YCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214283; x=1697819083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZs5dBVvL8WiMBXWyFhU0nbTUlLlApXVMkA85zryGNY=;
        b=qqEJr3WxXnigdZsw5k8DNBKyY92dUrWm3kOcRz69yy04Y6JeZqWQosk7NzRmw/oCOw
         Z2xNeJav9gDfItV8Q8d3i+DtnHcToxp3s7fRLc8nfTRKaMBo0nOzXk0/YLyXMFPrSVKz
         jsUDImRDW87zF9RkCbtIYec7iE8MYidHsMmf7lQTAoxUYqYM0Iqge+RZsS2YnvKSSqcn
         Rkcm7kbVilzgWOWpf3lMj35X/w2r0Mom57HMLHO2YKQCV2fPAjjuMQhO2GHNtp7p0u07
         x24iRn3+5Iwy8qA+LMCZUccaqj7OifU/hwnXoiqfvHTJqJPKiBet9NnW5VhICg/9nqZk
         rNWA==
X-Gm-Message-State: AOJu0YxF1EJT+k3MLxxwMs37dTc7Fu2WgrGsPaSfXw7wyVji9J8HH9Db
	L2Fh7IuEZc0rbSm0Gas0OCQ=
X-Google-Smtp-Source: AGHT+IFGYCd/N+rPNVxVUr5XyZgvZlE2KWP/I3hCNw8Dr+H1r9wACkBJTRNdNs5V8axQznfFCLtaQA==
X-Received: by 2002:a05:6871:5319:b0:1e9:9469:a858 with SMTP id hx25-20020a056871531900b001e99469a858mr8477450oac.39.1697214283317;
        Fri, 13 Oct 2023 09:24:43 -0700 (PDT)
Received: from [192.168.1.119] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id m3-20020a056870a10300b001e98fa5c9edsm818649oae.40.2023.10.13.09.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 09:24:42 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <56fe16bf-3fc9-49f9-9646-c236b885afa5@lwfinger.net>
Date: Fri, 13 Oct 2023 11:24:40 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jakub Kicinski <kuba@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <20231010155444.858483-1-arnd@kernel.org>
 <e93e4008-65c5-4f1d-812a-64b48f0513a2@gmail.com>
 <c8f43e1b-aed1-4b45-ba7c-d896ff66dfa7@app.fastmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <c8f43e1b-aed1-4b45-ba7c-d896ff66dfa7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/23 10:36, Arnd Bergmann wrote:
> At the moment, I'd suggest focusing on the drivers that still use wext (git grep 
> -w iw_handler_def drivers), if we can show that rtl8192e, rtl8712 or ks7010 have 
> been broken for a while, removing those would help with removing wext altogether.

I do not know about the the others, but rtl8712 is still in use according to the 
flow of questions I see on a GitHub repo that I maintain.

There has been some recent effort to convert rtl8192e to use cfg/nl/mac80211. 
That one is problematic as it has the same PCI_ID as RTL8192SE, but the drivers 
differ. Note the special code in the probe routine of 
drivers/net/wireless/realtek/rtlwifi/rtl8192se to detect if the wrong one has 
triggered the routine. That code should also be in the probe routine for 
RTL8192E with the test negated. I have both devices, but it has been a long time 
since I actually used either of them. I also have an rtl8712 device, thus I 
should be available for testing.

Larry

