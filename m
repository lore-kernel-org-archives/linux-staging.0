Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37E3FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 23:33:57 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id w8so18098054pgf.5
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 16:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUD3URlQQ4xgxg25mMWImAQvOjSa5iTY45I32xJuvNM=;
        b=JcBiXlmqhj3LPM6JqRufWO+Vsm8GT83ezqt7zzR0ISlNoJT4DworPjGgVfm1t+4i0/
         5B5aeOKwnYAp1tvZcXrJaRUoMfkfcqKAeqrzRkwkDL+5wb6ExRcGCQyiQ3sYaQS3z0Nn
         CICdkqDIC84EGcGGgVSaYzc0Fdn+Fqo0ruCifLry18SYaAm1K+6H/2j8/jj53i7ghvYM
         p5NukNFZdAbOhQXeQxLjTvdcCjnt8T9uHDLIniGMr0K5/9LB96xVpviaX0iUYdvw72jz
         FTOCVnnp83SuRXES+s7h3nZ1OXHSCCTQoSkNKUSvJBG0QdbLuU0bhZ7GgPC8LO/aabBt
         F/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUD3URlQQ4xgxg25mMWImAQvOjSa5iTY45I32xJuvNM=;
        b=NJKMZgfHOOKSZ0EarTAcuAVBVzY151/s3YrdlJzIEGCTU2t1kA3WEM5/vIAlHq1qbR
         o8U87wm+/F3DhRNiy+e6k1vcckE9bg6ksqYfWVqudU8B416bfmO7FxutwYIBdd1MlAM7
         UV6T01giQCqK5MquARVnvKpBdi01Mky4oSh1uEEiRsBZYiuyFchOOC8JcLzTeQiYoC37
         5PZ3Mk7jPBAGiYK9EWB51DKShkrebNB1QIZlkrYbji8ZM++KZzft2cfHeVC/mM+j3VaW
         8K2xfK/uxzhh+OAjZFv1e1CMeXKQcy16ployDAqGq/Rh5Nfzbt65S0cnXIgI+9o3ePhg
         dKrQ==
X-Gm-Message-State: AOAM531NztXzjdZ/PZiXAHtkI+MgWzWKGbJQoeRzPdQmJPLy1AVLCHi3
	GQQ7XGO2tirfLDP64T/OWAIMd/cFnVd/x/YtaAauUQ==
X-Google-Smtp-Source: ABdhPJx/7mwpvlh4TrY49LIoOv9osixhVrk+2zmmOflygabPw1FsjiknYx/WsT7h7IzFz7ssY0Pfr+/K2hx7NAmMjXg=
X-Received: by 2002:a63:d910:: with SMTP id r16mr33990805pgg.318.1629761637490;
 Mon, 23 Aug 2021 16:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1629642658.git.paskripkin@gmail.com> <9004eb2972780455db4cba9694244a2c572abba8.1629642658.git.paskripkin@gmail.com>
In-Reply-To: <9004eb2972780455db4cba9694244a2c572abba8.1629642658.git.paskripkin@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 24 Aug 2021 00:33:46 +0100
Message-ID: <CAA=Fs0=gX66TW3qoHYWcoSsvai6YZn=U81a34V45oij7NrMJrQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/6] staging: r8188eu: add error handling of rtw_read32
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Aug 2021 at 15:36, Pavel Skripkin <paskripkin@gmail.com> wrote:
> -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32 *data)
>  {
>         u8 requesttype;
>         u16 wvalue;
>         u16 len;
> -       __le32 data;
> +       int res;
> +       __le32 tmp;
> +
> +       if (WARN_ON(unlikely(!data)))
> +               return -EINVAL;
>
>         requesttype = 0x01;/* read_in */
>
>         wvalue = (u16)(addr & 0x0000ffff);
>         len = 4;
>
> -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> +       res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> +       if (res < 0) {
> +               dev_err(dvobj_to_dev(pintfhdl->pintf_dev), "Failed to read 32 bytes: %d\n", res);
> +       } else {
> +               /* Noone cares about positive return value */
> +               *data = le32_to_cpu(tmp);
> +               res = 0;
> +       }
>
> -       return le32_to_cpu(data);
> +       return res;
>  }

Dear Pavel,

OK, found the issue with decoded stack trace after reviewing this
usb_read32 function. Your line:
res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);

should read:
res = usbctrl_vendorreq(pintfhdl, wvalue, &tmp, len, requesttype);

With this change, the driver runs fine with no crashes/oopses. I will
explain the issue but you can probably see already, so I hope I'm not
coming across as patronising, just trying to be helpful :-)

Essentially, you are taking the address of the data function parameter
on this line with &data, a pointer to u32, which is giving you a
pointer to a pointer to u32 (u32 **) for this function parameter
variable. When passed to usbctrl_vendorreq, it is being passed to
memcpy inside this function as a void *, meaning that memcpy
subsequently overwrites the value of the memory address inside data to
point to a different location, which is problem when it is later
deferenced at:
*data = le32_to_cpu(tmp);
causing the OOPS

Also, as written, you can probably see that tmp is uninitialised. This
looks like a typo, so guessing this wasn't your intention. Anyhow,
with that small change, usbctrl_vendorreq reads into tmp, which is
then passed to le32_to_cpu whose return value is stored via the
deferenced data ptr (which now has its original address within and not
inadvertently modified). Hope this helps, and I'd be happy to Ack the
series if you want to resend this patch. Many thanks.

Regards,
Phil
