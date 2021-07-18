Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E4168
	for <linux-staging@lists.linux.dev>; Sun, 18 Jul 2021 19:43:18 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id my10so9995965pjb.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jul 2021 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7exFBskhTjXcI0G1jQYaweC6zi6nB0YxhW9GhW8QVJk=;
        b=hTAqgsHvvgfNcEagZtVOoEg9FPZ1K7swFoeQE74LVxhVPjWe4cMJ36z1icfI5N90l0
         Q5NEeHaePN4cZlD/CHtW4Q3HajTJXac5NUjQ3Tfn2qYdk7cJOxD93QiuahCUEOdvoYan
         yWAQXjAMKElZboyb3fVwi3x1JZL/sJ6Kaf4cbOmJ4HWzjIM7H5CRcv+C/ovoiTK5KLZO
         MewH468+Xkk/Jq2ehDT+j7bKEfHjqYerJXYXfL+fUWicAa9dKBPN3mXL6A41iuyJcvu0
         q699wJgigkj4sMp84K14HXfLRz4drOEqjzlqLQhWSBDA6e5vjBNH9oe/EgXH+w0RCd+7
         LXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7exFBskhTjXcI0G1jQYaweC6zi6nB0YxhW9GhW8QVJk=;
        b=qNXPpk3mc4qcjsXQoh6E5tiSoVHZhdjYj6CkyrzkCSOrQgcv33Nv7PqnOQOkSWmW3j
         QHQ+BDtmp2blSCalDuAZxiXI85wTMY8WUkZD2R5xZ1FaibwEQhXyz70qheSY9qxDkjI+
         tHLIz6jfhtBzxHq2lZBivf1/Yd1z41xjqxpVvfXNdiVPnIMcuBuFfXS10EVnpMhn9dWt
         8A3auPvRupVOHQLbONBQNmslywo3e7EHnRFoUdAG6V6szJsJrMgl7vmRqGXHVrBfUb9a
         orAvYs0BW1oAMQQXQmN91KLe7SqJexeL7BfO6oD1ZPxZB2UzimZO7Q6ZzNoizgsxDHXI
         iHRA==
X-Gm-Message-State: AOAM533sbC+P98RuN6IfJ7GfRK6qMXp4PD1sxCUPKBNAASI5tSj1IWeT
	mJyrvMgzBW4Y5mmE6G5ewDZG5AUCImKA+jKsPkM=
X-Google-Smtp-Source: ABdhPJxzjFnbQny4tL/Gtmd96c7VmxuNdY93ug+tJ2p9Dj5gOXvWXiaA+eeh1wWvAvNR+4wesFTmw2sp9FFlCmRM9oI=
X-Received: by 2002:a17:902:b198:b029:11b:2246:e374 with SMTP id
 s24-20020a170902b198b029011b2246e374mr16552094plr.17.1626637398478; Sun, 18
 Jul 2021 12:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210718133920.15825-1-len.baker@gmx.com>
In-Reply-To: <20210718133920.15825-1-len.baker@gmx.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 18 Jul 2021 22:42:42 +0300
Message-ID: <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
Subject: Re: [PATCH] staging/fbtft: Remove all strcpy() uses
To: Len Baker <len.baker@gmx.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Phil Reid <preid@electromag.com.au>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 18, 2021 at 4:43 PM Len Baker <len.baker@gmx.com> wrote:
>
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy() but in
> this case it is simpler to add NULL to the first position since we want
> to empty the string.

> This is a previous step in the path to remove the strcpy() function.

Any document behind this (something to read on the site(s) more or
less affiliated with what is going to happen in the kernel) to read
background?

...

>                 case -1:
>                         i++;
>                         /* make debug message */
> -                       strcpy(msg, "");
> +                       msg[0] = 0;

Strictly speaking it should be '\0'.

>                         j = i + 1;
>                         while (par->init_sequence[j] >= 0) {
>                                 sprintf(str, "0x%02X ", par->init_sequence[j]);


-- 
With Best Regards,
Andy Shevchenko
