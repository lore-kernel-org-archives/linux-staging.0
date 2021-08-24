Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2C72
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:38:13 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id i21so1430883ejd.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4b40t/eWr8ai9pPrkcsBo+tZKaYPHscMWDlmcLM2/gg=;
        b=He6/1sNJkUTkXG/UrwEWkJntXPgY7kK4Wy5b7qbCXv3QaosIcjb1Kv86VjCu9nUdlq
         kaaNm5WqsE9RMmea9o0vPDgRiimpJiLzFazl07Od6X3pejIohUFOofXgHgqbe50vRFjG
         W29vZNlc586oNNipIYFgBc776BpUWcGkzstdlTl3Ml/lyMfIKLDSk+lpfvyj4O2Fp/EV
         AdEhqJLPDo8YkC9ItoAw6DFLZFX5ttr4gVC8PTU9AzkWPpiWXuVQQRzDOhjgVDBNhdaf
         MMwhx94BoveJ/3FS8Bw/orpq7cbBxljKUgDSmqfUtqpY4J1P9UUu3s+7BO8s5K208Btk
         JhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4b40t/eWr8ai9pPrkcsBo+tZKaYPHscMWDlmcLM2/gg=;
        b=Zn5AWw64eVG+2kwu0H1Wn3fa70GCBg5Mas3xBPkCpt2rjwQ7u66Imym+P1nLD3y1fs
         2B4FADGlQVoOyqlmqbeT897sDzR1cDWpf+m/1E73w/IvYdwWHeUj54xjwttB33h+q9Fv
         4XVa2HdAoEnQhzq6+TvljZKrsxbQ+wNlSszYIOGSTkFsAKlnv1KkRPzgVlXhaMZnfuN+
         snnUsBSejX1c7rcd6mI/VvNXkFvg1R3bb997h/6dAdZbqiyIwm+3Qti/dbHJGtFNCo4b
         Yg9NPv4AWnuU9Wccn4HBMFqUuC/wJJLX2SHUQiXABs/HgFxgRExzT3WBTHKl6eC2aA1W
         6HeA==
X-Gm-Message-State: AOAM530ghcFsiP1AhFOrmzfEuZkNNtNfcurLPFjK0+y4nfjZQaeUd1TR
	O+OfbCGyHimBAtsxTUF/SLk=
X-Google-Smtp-Source: ABdhPJyE5QELpVU0+UM2UwBJN0VkpzofLqhP9usLSmK4vxJGeNgQS7E80aRONCMRAOxsiUc4uhm2GQ==
X-Received: by 2002:a17:906:74d:: with SMTP id z13mr1127068ejb.127.1629794291898;
        Tue, 24 Aug 2021 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id f30sm3334602ejl.78.2021.08.24.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 01:38:11 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC v2 5/6] staging: r8188eu: add error handling of rtw_read32
Date: Tue, 24 Aug 2021 10:38:09 +0200
Message-ID: <3419359.n4KOUNuIW1@localhost.localdomain>
In-Reply-To: <2355365e-d75e-8d1b-aad8-6979b70f33ec@gmail.com>
References: <cover.1629642658.git.paskripkin@gmail.com> <2424268.2DCLMNk6Lg@localhost.localdomain> <2355365e-d75e-8d1b-aad8-6979b70f33ec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 8:40:18 AM CEST Pavel Skripkin wrote:
> On 8/24/21 3:10 AM, Fabio M. De Francesco wrote:
> > On Tuesday, August 24, 2021 1:33:46 AM CEST Phillip Potter wrote:
> >> On Sun, 22 Aug 2021 at 15:36, Pavel Skripkin <paskripkin@gmail.com> wrote:
> >> > -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> >> > +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32 *data)
> >> >  {
> >> >         u8 requesttype;
> >> >         u16 wvalue;
> >> >         u16 len;
> >> > -       __le32 data;
> >> > +       int res;
> >> > +       __le32 tmp;
> >> > +
> >> > +       if (WARN_ON(unlikely(!data)))
> >> > +               return -EINVAL;
> >> >
> >> >         requesttype = 0x01;/* read_in */
> >> >
> >> >         wvalue = (u16)(addr & 0x0000ffff);
> >> >         len = 4;
> >> >
> >> > -       usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> >> > +       res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> >> > +       if (res < 0) {
> >> > +               dev_err(dvobj_to_dev(pintfhdl->pintf_dev), "Failed to read 32 bytes: %d\n", res);
> >> > +       } else {
> >> > +               /* Noone cares about positive return value */
> >> > +               *data = le32_to_cpu(tmp);
> >> > +               res = 0;
> >> > +       }
> >> >
> >> > -       return le32_to_cpu(data);
> >> > +       return res;
> >> >  }
> >> 
> >> Dear Pavel,
> >> 
> >> OK, found the issue with decoded stack trace after reviewing this
> >> usb_read32 function. Your line:
> >> res = usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> >> 
> >> should read:
> >> res = usbctrl_vendorreq(pintfhdl, wvalue, &tmp, len, requesttype);
> > 
> > Dear Philip,
> > 
> > No, it should read:
> > 
> > res = usbctrl_vendorreq(pintfhdl, wvalue, data, len, requesttype);
> > 
> > I suspect that Pavel didn't notice he was reusing a line of the old code
> > wth no due changes.
> > 
> >> With this change, the driver runs fine with no crashes/oopses. I will
> >> explain the issue but you can probably see already, so I hope I'm not
> >> coming across as patronising, just trying to be helpful :-)
> >> 
> >> Essentially, you are taking the address of the data function parameter
> >> on this line with &data, a pointer to u32, which is giving you a
> >> pointer to a pointer to u32 (u32 **) for this function parameter
> >> variable. When passed to usbctrl_vendorreq, it is being passed to
> >> memcpy inside this function as a void *, meaning that memcpy
> >> subsequently overwrites the value of the memory address inside data to
> >> point to a different location, which is problem when it is later
> >> deferenced at:
> >> *data = le32_to_cpu(tmp);
> >> causing the OOPS
> >> 
> >> Also, as written, you can probably see that tmp is uninitialised. This
> >> looks like a typo, so guessing this wasn't your intention. Anyhow,
> >> with that small change, usbctrl_vendorreq reads into tmp, which is
> >> then passed to le32_to_cpu whose return value is stored via the
> >> deferenced data ptr (which now has its original address within and not
> >> inadvertently modified). Hope this helps, and I'd be happy to Ack the
> >> series if you want to resend this patch. Many thanks.
> > 
> > I think that another typo is having 'tmp', because that variable is unnecessary
> > and "*data = le32_to_cpu(tmp);" is wrong too.
> > 
> > Now I also see that also usb_read16() is wrong, while usb_read8() (the one that
> > I had read yesterday) is the only correct function of the three usb_read*().
> > 
> 
> Hi, guys!
> 
> 
> Sorry for breaking your system, Phillip. This code was part of "last 
> minute" changes and yes, it's broken :)
> 
> I get what Phillip said, because I _should_ read into tmp variable 
> instead of directly to data, but I don't get Fabio's idea, sorry.

Hi Pavel,

I (wrongly?) assumed from the prototype of usb_read32() that u32 *data is in native
endianness. So, I didn't see the necessity of using _le32 tmp and then convert that tmp
with le32_to_cpu().

I simply thought that data could be passed to usbctrl_vendorreq as it-is.

> Data from chip comes in little-endian, so we _should_ convert it to 
> cpu's endian. Temp variable is needed to make smatch and all other 
> static anylis tools happy about this code.

Now that you explained that "Data from chip comes in little-endian", obviously 
I must agree with you that the code needs tmp and that tmp must be 
swapped by le32_to_cpu(), ahead of assigning it to *data.

Just a curiosity... Since I was not able to see that *data is returned in little endian,
can you please point me where in the code you found out that it is? There must
be some place in the code that I'm unable to find and see that *data is LE. 

Thanks in advance,

Fabio 
> 
> If I am missing something, please, let me know :) v3 is on the way...
> 
> With regards,
> Pavel Skripkin
> 




