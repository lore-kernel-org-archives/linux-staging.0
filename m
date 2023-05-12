Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19748EDA
	for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 09:07:47 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-24dea6d5ce8so9069276a91.2
        for <linux-staging@lists.linux.dev>; Fri, 12 May 2023 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683882466; x=1686474466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oseHv6VTSzckslEr5MWLMD1wKR85pm76Ym5jt2vFoxI=;
        b=XjEIPEkNIvghUZ4sYuX1fCWrgg44BfoxhHVaks66vlF5xl5VUv4r3isABKr/LsYPYw
         Tly6RKPK9BcyMqYvoSOgRdb9WA1254+yurUnYVBO0DpOoyToddB4r3IDlbeJVvJS+aIS
         cIU73rW7ZyB8UfQOdcYe9RWtl8aAXPzz839ZP++4bXfB0lpVKXJehz/EqhRzVPYRv+B7
         z7mpm7xHQaI6a3VIN/7jkY+uvr6L4PuFjgQ3/VPChSlkqopIjEq5foFvjsooPNWZXn2w
         NREm8Inimbied+1qeFmwZQ/2mm1A2tVHyBhiD6Ze7c52BViC2yJfu7/XZ2TmVWhspGu9
         +Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882466; x=1686474466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oseHv6VTSzckslEr5MWLMD1wKR85pm76Ym5jt2vFoxI=;
        b=jojVBjAIeZWFVB53yKMsFsei4XQb7OLJNW03EcYFWPsa7e8HeuSzX4P0UPSfUIxqRy
         5xbhALIkJYvDaN/4+UZU+8dYDjnkRiPkA4APLPcn7iBJLiR9mdM5NwTTaEDEa+v2SNHh
         szy8SBksKgkv8k8uBng/lFgrvt01DiMOXW1s4PWRsP20k/483b8G5Nh9BpsbqdT13D5c
         FRTSmSV29/Q5E7ZMVxtVk29hEecMuWeOauwZPh/bbsvWsHj/GPTmUEwLU05/KzBUHjDl
         CWztYFi+C5BOFov7s8K309aLosYxcy5JCUxlyVmQGvh9ngWB15xyQs9OTGupw1lXLGql
         JCSQ==
X-Gm-Message-State: AC+VfDzGOHYGkmm0IXYPSVTRZ1zRnnbevBjhPuRr+YPju92gS5MEDZ8Z
	XzAuqMXFJ0hmBqux2Z87ubI=
X-Google-Smtp-Source: ACHHUZ7+b/oOCYYoASqforqMy2MxURpPVBmI0FXSJlR2iCNI8DK+oJQKKZTGyZQoOcDqitWf1y1ZzA==
X-Received: by 2002:a17:90a:b317:b0:250:78d0:f797 with SMTP id d23-20020a17090ab31700b0025078d0f797mr18003584pjr.41.1683882466461;
        Fri, 12 May 2023 02:07:46 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-8.three.co.id. [116.206.28.8])
        by smtp.gmail.com with ESMTPSA id cq2-20020a17090af98200b002508f0ac3edsm8373161pjb.53.2023.05.12.02.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:07:46 -0700 (PDT)
Message-ID: <51c2577a-b9d9-4f6e-e79b-c2c324b72347@gmail.com>
Date: Fri, 12 May 2023 16:07:33 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/10] Treewide GPL SPDX conversion (love letter to Didi)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Diederik de Haas <didi.debian@cknow.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 David Airlie <airlied@redhat.com>, Karsten Keil <isdn@linux-pingi.de>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Sam Creasey <sammy@sammy.net>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Jan Kara <jack@suse.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Tom Rix <trix@redhat.com>,
 Simon Horman <simon.horman@corigine.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>, Pavel Machek
 <pavel@ucw.cz>, Minghao Chi <chi.minghao@zte.com.cn>,
 Kalle Valo <kvalo@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Viresh Kumar <viresh.kumar@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Deepak R Varma <drv@mailo.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Thomas Gleixner <tglx@linutronix.de>, Jacob Keller
 <jacob.e.keller@intel.com>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Dan Carpenter <error27@gmail.com>, Archana <craechal@gmail.com>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
 <20230511174105.63b7a6ae@kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230511174105.63b7a6ae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/23 07:41, Jakub Kicinski wrote:
> On Thu, 11 May 2023 20:33:56 +0700 Bagas Sanjaya wrote:
>> I trigger this patch series because of Didi's GPL full name fixes
>> attempt [1], for which all of them had been NAKed. In many cases, the
>> appropriate correction is to use SPDX license identifier instead.
>>
>> Often, when replacing license notice boilerplates with their equivalent
>> SPDX identifier, the notice doesn't mention explicit GPL version. Greg
>> [2] replied this question by falling back to GPL 1.0 (more precisely
>> GPL 1.0+ in order to be compatible with GPL 2.0 used by Linux kernel),
>> although there are exceptions (mostly resolved by inferring from
>> older patches covering similar situation).
> 
> Should you be CCing linux-spdx@ on this?

Oops, I forgot to Cc that list. Will do in v2.

-- 
An old man doll... just what I always wanted! - Clara

