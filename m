Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4C2C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 12:44:52 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id 187so2863943pfc.10
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yyWIeD3i9WahRcz0ArlWA7aLt2M5TmzmbUQm2c2ABac=;
        b=osvHtzEQaUSIgQ+5TW2kFqmhU7DTyHXW13DjYTPWkeKcXJbSOltHkYB2aVxd3tu4ae
         Ree1mWZ27PMcyVdk/yUTt0iM+dUHpaConpD2uCs6hSdYnMBbZRG/bMW4epO98wONZqTa
         +SCiwzviYDc2mt6lNYI2kY3SN1ZPTjKAZnoza9EFbs74kPwmUE5oa8zS6tk4bu6bMLJd
         icBUEDIWP5e8pvIibZGoNIXW4Y9IuESIkjpqNOaeR4l/VWxwDecZEVDG0AhakIkM/0wk
         VcR296nF+P5NXqpfTBCRZ+YGMoNWM0Z7vUw+7rW6lF8mu/o8eckxpFVl0FIHOZvkRLfe
         RIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yyWIeD3i9WahRcz0ArlWA7aLt2M5TmzmbUQm2c2ABac=;
        b=OLq13iuJlXTaCde7UMT1TtAVdtnQKx6VZBnQlnZ39j3rZV88z7HgkYWvF8ivdCIp2o
         Bxw2AtPqRMQFWmTPj5d/kF268D5J4TdTBfFDHmDZJ1VaDeeP3hFZ8e3j2+hPzfe749sx
         El4ppzhnr7g0TyiSJzwHHCfT/ZhWqHSk7hXpkEXo9pIX7QNZZAOdmu7q4/AUKbMZWcFd
         WqFH4jp97xdHeL0Cf3ZnJmHLoAKF/ATp1UC6zDmpONYhLlaFuHsLQ09rYitVx27FPvn7
         RQeCiLEaxTYi1+M9IENFNys3reIvyrKftsUhetzFzvVNqP+AvP6BS1ur3VR9/dpu8xC7
         zwgQ==
X-Gm-Message-State: AOAM531OCasysZher13lh+RgOJ3SPgKAhXXcJGKd3ljT6YAk9ySYsPCf
	WahXzZsu5+4TRqunCMhR/0cZL+Xet0xKnA==
X-Google-Smtp-Source: ABdhPJwwRky6RP6pTJ7x3IlNFf1UhIyZWGl8fIItdeYH/giK7DJt9lv86LhmSCihuRBiCaer4sv2MQ==
X-Received: by 2002:a62:d11e:0:b0:446:d705:7175 with SMTP id z30-20020a62d11e000000b00446d7057175mr6288265pfg.74.1634733892023;
        Wed, 20 Oct 2021 05:44:52 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id w11sm2264932pge.48.2021.10.20.05.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 05:44:51 -0700 (PDT)
Message-ID: <b8b15020618e9b099cc0f22624cb726410bdec06.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yang Yingliang
 <yangyingliang@huawei.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Aline
 Santana Cordeiro <alinesantanacordeiro@gmail.com>, Dinghao Liu
 <dinghao.liu@zju.edu.cn>, Alan <alan@linux.intel.com>, Linux Media Mailing
 List <linux-media@vger.kernel.org>,  linux-staging@lists.linux.dev, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Date: Wed, 20 Oct 2021 21:44:47 +0900
In-Reply-To: <20211020075015.316d827c@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
	 <20211020075015.316d827c@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-10-20 at 07:50 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 18 Oct 2021 10:56:40 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
> 
> > On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
> > > 
> > > Hi all,
> > > 
> > > This patch series contains fixes for atomisp to work (again). Tested on
> > > Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> > > v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> > > 
> > > I'm still not used to Linux patch sending flow. Sorry in advance
> > > if there is some weirdness :-) but I did my best.  
> > 
> > I agree with Hans, you did an excellent job!
> > I will try to find time to look into this.

Thank you :)

> > In any case it seems to me
> > that this is a material more likely for v5.17-rc1, rather than v5.16.
> 
> Yeah, it sounds to late to apply it for 5.16.

I see, but no problem. This series does not contain any fixes for
critical issues (like NULL ptr deref)

Regards,
Tsuchiya Yuto

