Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3617C
	for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 08:22:28 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id f26so15046798qto.11
        for <linux-staging@lists.linux.dev>; Sat, 17 Sep 2022 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kS8/EgIlVdJnBMCVvBf9aPAIIxffkGnw4kBuKXRgqFs=;
        b=g/6pWuE0v50HWvMzl5+qN79haywPF3Hi8wzStgv7ClpOaT8zUu6yYVxhliNnbc9FI7
         s4PIsRiiA7y5/XEem/84kb6I/KOcgUjvJ6t7NgGT9QlOjzffDSU16GAgEn1Lfnb8k4G8
         wWTDPV2BiUW9Z8Bgm3wHsGaCfCUWk0yAZXmLLWYmdPXVGwDnvwpgyMByutNQZXz1jOKc
         GXD8xDllscd9kifkrwQx7WNwsH0l9TzXvNytm7vcDMNoetWau0x5RX4bL9Io+Z43/igJ
         Kkaa7yyUdzFHueEL47SXD+Uv+gOypS5a7t+47CdbP/MDWA0fTcKPZxTFRgZ2vp1I7BTu
         ra7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kS8/EgIlVdJnBMCVvBf9aPAIIxffkGnw4kBuKXRgqFs=;
        b=Onj9tCGrW0dKOhNIT2jIliSIt+ZaGgI+GgFJoV24RpxWCP+yd72TTiG5Ny6L7IqC2K
         RR4xSLSjiUI8o0e3R/AxulT4QiRjNKgGLiYEUgeYQDa4AC63Mb+baetcpc981Ei1unSS
         9gJifYUDXA3b1X0d+t7FGuxp7z/yXOB0Zky9ZyyrV4MPQ+hLLk9JCrv7qioe8qZBD8uQ
         diHEyiBxsPeDn/qManINu2RqpJBsNViFZP7SY7z3pugNdNDZlFDTDHKLBPnfxtTK4WKx
         GVYPaWiEIzsEJC/3tOdwt7EqxgRiz9PMSqyQ/2Qmc/mw5FgrZbRSFRpku+U3aTczVVx+
         px7A==
X-Gm-Message-State: ACrzQf27p6GsO1KkIvpwmlgu94k19MpVqhfFT04l/7EBzA/xoXmuQ8LZ
	Cf8mrVQ6UO8xazduRWPIqReIasdq2K/GrJSkQK0=
X-Google-Smtp-Source: AMsMyM5sLzH5BLhVXGVQnU3o3IuaDXq7rnfO+hQvULcHS4ocIwpBK9lFO4aEGcuYq0dE7X4qjUSgcIbTaT7Eqsa4fFU=
X-Received: by 2002:ac8:7c43:0:b0:35c:cd8f:3da5 with SMTP id
 o3-20020ac87c43000000b0035ccd8f3da5mr6305030qtv.61.1663402947357; Sat, 17 Sep
 2022 01:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220917024709.5017-1-shangxiaojing@huawei.com>
In-Reply-To: <20220917024709.5017-1-shangxiaojing@huawei.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Sep 2022 11:21:51 +0300
Message-ID: <CAHp75VcH_iWh2yaGLzGevKo1a6h5gptdLR8922cd0KvRKnioHQ@mail.gmail.com>
Subject: Re: [PATCH -next] staging: fwserial: Switch to kvfree_rcu() API
To: Shang XiaoJing <shangxiaojing@huawei.com>
Cc: gregkh@linuxfoundation.org, ilpo.jarvinen@linux.intel.com, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 17, 2022 at 5:12 AM Shang XiaoJing <shangxiaojing@huawei.com> wrote:
>
> Instead of invoking a synchronize_rcu() to free a pointer after a grace
> period, we can directly make use of new API that does the same but in

a new

> more efficient way.

...

> sorry, the previous same patch have the wrong v3 flag in subject.

has

First of all, this brings even more confusion. Since the below needs
some work, we want to have a v4 with a proper changelog, explaining
also v1 and v3.

...

> -       synchronize_rcu();
> -       kfree(peer);
> +       kvfree_rcu(peer);

This is not equivalent. The commit message doesn't explain why the "v"
variant is needed. So, shouldn't it be the plain kfree_rcu()?

-- 
With Best Regards,
Andy Shevchenko
