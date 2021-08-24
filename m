Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B293FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 06:40:22 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id d16so35741166ljq.4
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQZLq6uBAFATkrorgtZ8B76K/WqmPO2TDZRH4lVEcfg=;
        b=GAFy051dod8TdxyPeZ2ozDpIXNG4JHdRpaYe21tgKtgP81lIWdrnDfyuYJh2gxivIZ
         0yQK6+2AJReiFvjkdTr+DZN2j7gt60ypRvFi0IOCyW3BAwurjmQa8QrenQtSyZfch4x1
         rRJmXioleBwi123kNbHwIyRhDdjx62rmKNRryy056g1CSvwBp/2tSG/8KVoYDDjTt48A
         I1UlDmYR1s3JXbMlp4rXp0VBfTviErB3vr3+RB2dMq+h7ft4/ZHvR/5VuzH8QmFuDi19
         e6Qo0+FD7Zt5O6PkebT5dH/n5gBidY27Q42mJUR6mMPuEnQ7Lwn/P4OAUdiMyOa3dckx
         qLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQZLq6uBAFATkrorgtZ8B76K/WqmPO2TDZRH4lVEcfg=;
        b=YV9xmkQyQbsA0vzmU8c4ZO9QUNY2tXMQaL6w725Pm3BHrmqzLSomSOm8Qamd1l6KLl
         tLak9u3b/AlL3WV6tPVPW+SWGWeRGxh+FLE50IktVeAQz0a/nsAZrq2hwGZ2qU+OnACn
         DK3Fc9rAA1PER9x94+DesLuCMKLcsSjEKBbUZrEiTZGE7uaHOm8cOuWLeUNN5uvGfaSU
         OK29FrtX6hLR7GGaJL1gnOBfNAjU3rqPLlMHygPEsuIHr9MtNj/AbBB1cLrh3OSjmRB3
         ulWX01TdzQhqF8VWSgoPG2DhDa/l31XmyWxmK6QiMVatAdYJM8yq5vYSXIE/wcmv30G8
         NQMg==
X-Gm-Message-State: AOAM530dUg6liYEoU6Ej6hgh3zcQXrO+agSOncyWZljo6wSXPK9OXmJr
	IIAiP5jTaifD5q96Iy7Jg/Q=
X-Google-Smtp-Source: ABdhPJyhmESxjZeg7EX6mXKhJdCMqFbUzDRd5LYK5u7dkdhLmLykXH3rqjUZ9qSgGcC9R/7T1B/7zA==
X-Received: by 2002:a2e:9010:: with SMTP id h16mr30233686ljg.484.1629787220220;
        Mon, 23 Aug 2021 23:40:20 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id w8sm1662598lfn.37.2021.08.23.23.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 23:40:19 -0700 (PDT)
Subject: Re: [PATCH RFC v2 5/6] staging: r8188eu: add error handling of
 rtw_read32
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Greg KH <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1629642658.git.paskripkin@gmail.com>
 <9004eb2972780455db4cba9694244a2c572abba8.1629642658.git.paskripkin@gmail.com>
 <CAA=Fs0=gX66TW3qoHYWcoSsvai6YZn=U81a34V45oij7NrMJrQ@mail.gmail.com>
 <2424268.2DCLMNk6Lg@localhost.localdomain>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <2355365e-d75e-8d1b-aad8-6979b70f33ec@gmail.com>
Date: Tue, 24 Aug 2021 09:40:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2424268.2DCLMNk6Lg@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 3:10 AM, Fabio M. De Francesco wrote:
> On Tuesday, August 24, 2021 1:33:46 AM CEST Phillip Potter wrote:
>> On Sun, 22 Aug 2021 at 15:36, Pavel Skripkin <paskripkin@gmail.com> wrote:
>> > -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
>> > +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32 *data)
>> >  {
>> >         u8 requesttype;
>> >         u16 wvalue;
>> >         u16 len;
>> > -       __le32 data;
>> > +       int res;
>> > +       __le32 tmp;
>> > +
>> > +       if (WARN_ON(unlikely(!data)))
>> > +               return -EINVAL;
>> >
>> >         requesttype = 0x01;/* read_in */
>> >
>> >         wvalue = (u16)(addr & 0x0000ffff);
>> >         len = 4;
>> >
>> > -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>> > +       res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>> > +       if (res < 0) {
>> > +               dev_err(dvobj_to_dev(pintfhdl->pintf_dev), "Failed to read 32 bytes: %d\n", res);
>> > +       } else {
>> > +               /* Noone cares about positive return value */
>> > +               *data = le32_to_cpu(tmp);
>> > +               res = 0;
>> > +       }
>> >
>> > -       return le32_to_cpu(data);
>> > +       return res;
>> >  }
>> 
>> Dear Pavel,
>> 
>> OK, found the issue with decoded stack trace after reviewing this
>> usb_read32 function. Your line:
>> res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
>> 
>> should read:
>> res = usbctrl_vendorreq(pintfhdl, wvalue, &tmp, len, requesttype);
> 
> Dear Philip,
> 
> No, it should read:
> 
> res = usbctrl_vendorreq(pintfhdl, wvalue, data, len, requesttype);
> 
> I suspect that Pavel didn't notice he was reusing a line of the old code
> wth no due changes.
> 
>> With this change, the driver runs fine with no crashes/oopses. I will
>> explain the issue but you can probably see already, so I hope I'm not
>> coming across as patronising, just trying to be helpful :-)
>> 
>> Essentially, you are taking the address of the data function parameter
>> on this line with &data, a pointer to u32, which is giving you a
>> pointer to a pointer to u32 (u32 **) for this function parameter
>> variable. When passed to usbctrl_vendorreq, it is being passed to
>> memcpy inside this function as a void *, meaning that memcpy
>> subsequently overwrites the value of the memory address inside data to
>> point to a different location, which is problem when it is later
>> deferenced at:
>> *data = le32_to_cpu(tmp);
>> causing the OOPS
>> 
>> Also, as written, you can probably see that tmp is uninitialised. This
>> looks like a typo, so guessing this wasn't your intention. Anyhow,
>> with that small change, usbctrl_vendorreq reads into tmp, which is
>> then passed to le32_to_cpu whose return value is stored via the
>> deferenced data ptr (which now has its original address within and not
>> inadvertently modified). Hope this helps, and I'd be happy to Ack the
>> series if you want to resend this patch. Many thanks.
> 
> I think that another typo is having 'tmp', because that variable is unnecessary
> and "*data = le32_to_cpu(tmp);" is wrong too.
> 
> Now I also see that also usb_read16() is wrong, while usb_read8() (the one that
> I had read yesterday) is the only correct function of the three usb_read*().
> 

Hi, guys!


Sorry for breaking your system, Phillip. This code was part of "last 
minute" changes and yes, it's broken :)

I get what Phillip said, because I _should_ read into tmp variable 
instead of directly to data, but I don't get Fabio's idea, sorry.

Data from chip comes in little-endian, so we _should_ convert it to 
cpu's endian. Temp variable is needed to make smatch and all other 
static anylis tools happy about this code.


If I am missing something, please, let me know :) v3 is on the way...





With regards,
Pavel Skripkin
