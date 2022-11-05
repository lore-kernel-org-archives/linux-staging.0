Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088E97C
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 14:18:20 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id n186so7954420oih.7
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhR6hYWBdnOcbKjn7H8NpQf1Qg9j5JtEEKHrz9oi/g=;
        b=cEC5IT1XpqlAK68Dgo5+fxnDFCjVpzY0DRagRqxTDry42i1dK2tcbNHYd7Ayss+LTR
         Zq5Ih2v2443bsxwUvCZI2AevutQelDkhHOJqQhhh90RAdGwH1ztuIkNBULvbO0OWUDyB
         Zs3Rt+XqCTKE2Cs9eS/ndyLispMby6sUmCV9hIPpDCZ1JKOuE8AnRRE6npVgjTBnltto
         YYH4ZircOfT5HS0GEZGZOnxYVDveuMG1fd0QtTxHxYW8Huxn/roqBK+JFSqL6Tdp87g+
         GSZROE0361WHir4UDtfX6jA945ccs7fZ7mz9TOtoNTCBa80eZ2tSlHY0p6xlLXtkRQTo
         pyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhR6hYWBdnOcbKjn7H8NpQf1Qg9j5JtEEKHrz9oi/g=;
        b=GjeveDxaNu7eU4M1PHo12YgNGPWOOO57lRKIkOXmRVoD3+bSja0DoIZmwE3fKKNHeG
         UcBLCedOjTS8DxcE5g0IF5CegYKloysN1f6c5E8EAci2xvnYtkER0X0gT7vQWFVnKwKV
         BNcnApc8TPTa0Ab8IrBtPBkmkrE+v7OY0iSbnqx63nvUQ+Y/cxNlJ+UXG7qpSTcGcFJL
         gnlJEtSpO5la7hS1kGU4ZgQleGGIO167ykPDUDJ1vpPT9J2g24qQHZ425tWK0Z+NsN8t
         N++5z1aHT6fzlXenCFIzd6y4EXqvNjH0a09kti8H8ATh9b8xzZ3jBH/+JCrVluD4Nt//
         UFSg==
X-Gm-Message-State: ACrzQf3Hb+m3o7auQpMQTPGX3L0w+KfZ+acXFDa5pJYC7k2afNB9C/Se
	ZAMDfikjjufbrWzYVS0tyqI=
X-Google-Smtp-Source: AMsMyM5In/UjkQAOQkguZQ2rHL63I8msSs9c6an0J/9gKdjSX2hezT8PwL34Y+85tQUi0BEYyplo0Q==
X-Received: by 2002:a05:6808:2104:b0:35a:5e9:a411 with SMTP id r4-20020a056808210400b0035a05e9a411mr18764923oiw.168.1667657900081;
        Sat, 05 Nov 2022 07:18:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e1-20020a056870c0c100b00132741e966asm830469oad.51.2022.11.05.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 07:18:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 5 Nov 2022 07:18:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>, rcu@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-edac@vger.kernel.org,
	cgroups@vger.kernel.org, linux-block@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org, linux-pm@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bluetooth@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-leds@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	bridge@lists.linux-foundation.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, lvs-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-nfs@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105141817.GF1606271@roeck-us.net>
References: <20221105060024.598488967@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105060024.598488967@goodmis.org>

On Sat, Nov 05, 2022 at 02:00:24AM -0400, Steven Rostedt wrote:
> 
> Back in April, I posted an RFC patch set to help mitigate a common issue
> where a timer gets armed just before it is freed, and when the timer
> goes off, it crashes in the timer code without any evidence of who the
> culprit was. I got side tracked and never finished up on that patch set.
> Since this type of crash is still our #1 crash we are seeing in the field,
> it has become a priority again to finish it.
> 
> The last version of that patch set is here:
> 
>   https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/
> 
> I'm calling this version 4a as it only has obvious changes were the timer that
> is being shutdown is in the same function where it will be freed or released,
> as this series should be "safe" for adding. I'll be calling the other patches
> 4b for the next merge window.
> 

Just in case you didn't notice:

Looking through the resulting code, I think some of the remaining
calls to del_singleshot_timer_sync() can be converted as well.

The calls in drivers/staging/wlan-ng/prism2usb.c:prism2sta_disconnect_usb()
are obvious (the containing data structure is freed in the same function).
For drivers/char/tpm/tpm-dev-common.c:tpm_common_release(), the containing
data structure is freed in the calling code.

Thanks,
Guenter
