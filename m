Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267081FA2
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 20:47:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id g20so6731633edw.6
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=g31uGSPwPMWewxfQR13fcVJH7Aw4CAneBT6TuPz0pyw=;
        b=GkFVdk4CcIgbip16DYwzTk93slGlP4VxK4SjUKxFM+RSwqm+odkuGpwemzBxpL5e/d
         +k5bNxJU3h1RkY19XdzPABWBUop9L120f2EqmM8zbHC99RMheR2usvUpQght/mgURWga
         OcX+XsBuWOBBZTrCkmWk6xjRqb0cv5vhNkRLHZesnMwKTIE5lYC0dDKcMBZRVzBSWvEk
         ALLZ5RXpVEgU3VYoJmt5BaOON7BXqpM0H85FplGN3UjGvYxC4ygHc7CTx9TVsJh9Kvl4
         uqfZRntJ+HDuNLzDxOT5luEaGd2AXjv46zUTAsdgU1Ka/c1UzonGHQKt8lz+KFPj1Rnz
         14fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=g31uGSPwPMWewxfQR13fcVJH7Aw4CAneBT6TuPz0pyw=;
        b=efto6RHqzDLQI06LeJ2iDgZfrhvyyCQ+1v7s4dXR7hEm0IbRX0Nn8duFRjIUv+Dqv5
         e6YbVL0NxrfcY4jbXvi2Rmxl88GTaVG8Vd2J2Yv0efP+N9doUcLsFdAR5BwNHpxbo+gX
         dUmX/PizZXaD0CNqs0fq16E7sw8zCa+eK7J87JE3azeRqLwEQ3hRHETCDqLTgfTVLypN
         6izEjqR7U9SG9RZTIiXEnC/u2bKiKNEGyQJ64uZOJ7W+CTg3gGhm/gCO+i8A1BVfYDYp
         RS5ZjMoI04XLCUYcC2GG0bn+ICUMWgVh2iVcsO0FpsdsKPMfQjLNXz6tq1/zoIaMZCAz
         /eJA==
X-Gm-Message-State: AOAM531uNH4ztyTY8h1Zs1si1rX3rBhj1FIsZbu59+e8boLoGdA/NUY1
	B1ZRE+kj2J7kY7IZiyOX4gs=
X-Google-Smtp-Source: ABdhPJx65AtVjYJPqt7EjkR34GR2H20ET2zuI1GusFwr0yE3N8N0vgIomKhPw6h20J2TnplqfTB00g==
X-Received: by 2002:a05:6402:1753:b0:41c:c12d:c1e2 with SMTP id v19-20020a056402175300b0041cc12dc1e2mr331748edx.227.1648932449322;
        Sat, 02 Apr 2022 13:47:29 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b006cf488e72e3sm2505910ejc.25.2022.04.02.13.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 13:47:28 -0700 (PDT)
Message-ID: <356c24cf-625b-eea2-2c04-ce132d881cac@gmail.com>
Date: Sat, 2 Apr 2022 22:47:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 straube.linux@gmail.com
From: Michael Straube <straube.linux@gmail.com>
Subject: staging: r8188eu: how to handle nested mutex under spinlock
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

smatch reported a sleeping in atomic context.

rtw_set_802_11_disassociate() <- disables preempt
-> _rtw_pwr_wakeup()
    -> ips_leave()

rtw_set_802_11_disassociate() takes a spinlock and ips_leave() uses a
mutex.

I'm fairly new to the locking stuff, but as far as I know this is not a
false positive since mutex can sleep, but that's not allowed under a
spinlock.

What is the best way to handle this?
I'm not sure if converting the mutex to a spinlock (including all the
other places where the mutex is used) is the right thing to do?

thanks,
Michael
