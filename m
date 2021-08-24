Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055472
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 09:46:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id h9so43056077ejs.4
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GrvCsUcjOz7dr6yABmwTuSZ2PSKxdeNbsF0RweGK1nA=;
        b=SfrMyhqSjfQbmPAWlBf7A8NR1eYktlZG2/doJX1lPcFWXKrUqHC20co4Rqt2090JZf
         l7dPmSiswukViMZ3kJt24xlHREf2prZjK4R+NndnlrJ4aEaW9C8ontAlSyakwd/k2X+o
         2rnqqGQ3Yso7ZCgMdU+OC5WfLNEepewf+SA28tx/1M24yYgZJkGri8LXnF/1rAGg2YlI
         BouxtR/pHMsFVaTyRrpKB7Bp4DZ6WnbrwHfuiD6PbSzuoK2ESbwWFGk8IIpm5iH9vU4B
         VgvCy4QbR0PTRYSmFXU/UPURFFIBZPQARujNioRHj6W9AB/1H2v+KiCOAtp7T2AwwOmk
         +jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GrvCsUcjOz7dr6yABmwTuSZ2PSKxdeNbsF0RweGK1nA=;
        b=e8li0lE11jCBq4Gura1ajim/8M8ULDvVkDB0t6+jatbmpYxnjKWxYwTcJ3DaWlBB+n
         Xz+4g+qtkX+1d3Nc+sybU1Hk0Nb6tt9yVKiagodfXixoRdMxzq3gJehfJnIqGHIcHze1
         7FwEywQYTAjG5VaLfqPS4QVr8BAKUzGEqWJCoHah8MuFhx0wQUwZCFZy7OPmpA9NE8iE
         OOuR65VklOH1HYPoRrFNgB5fxK6M57Rp7esfhvHPz5WhQ56nynBJOSBTefQl4+GUQGM5
         W8L7DRU0Oqn4Ibf8Qcs4XO+MGn7Pet3VdD89nP9mD4nt7mIOCzAFaFl80BPMTGDhSZxn
         U64w==
X-Gm-Message-State: AOAM5328Ivs8PUv2k7EPzT7ksNWkLOp/cx4ps0W1bIwcsC4Nm7GZCtTV
	YPQ/NFHSWbSJE1jTHtZQmiY=
X-Google-Smtp-Source: ABdhPJys7aXWCtp4RAyhTul41UcH3nZpR9j313wpdENzXAAZFuZ7ldTClOl+ysxSqrzr7WO5rwzUWQ==
X-Received: by 2002:a17:906:38c8:: with SMTP id r8mr40555690ejd.172.1629798365221;
        Tue, 24 Aug 2021 02:46:05 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id qh2sm8839076ejb.75.2021.08.24.02.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 02:46:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC v2 5/6] staging: r8188eu: add error handling of rtw_read32
Date: Tue, 24 Aug 2021 11:46:03 +0200
Message-ID: <1970955.u25yFflyLQ@localhost.localdomain>
In-Reply-To: <96e3703e-a5e2-3c6d-ea3c-b5d3892849b2@gmail.com>
References: <cover.1629642658.git.paskripkin@gmail.com> <77da7c63-a5b1-a09d-39ec-32c5485b8eac@gmail.com> <96e3703e-a5e2-3c6d-ea3c-b5d3892849b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 10:53:35 AM CEST Pavel Skripkin wrote:
> On 8/24/21 11:47 AM, Pavel Skripkin wrote:
> > On 8/24/21 11:38 AM, Fabio M. De Francesco wrote:
> > 
> > Hi, Fabio!
> > 
> > previous usb_read16() realization, which is 100% right:
> > 
> > 
> > static u16 usb_read16(struct intf_hdl *pintfhdl, u32 addr)
> > {
> > 	u8 requesttype;
> > 	u16 wvalue;
> > 	u16 len;
> > 	__le32 data;

Ah, it was in plain sight! How didn't I notice it? :(

> > 
> > 	requesttype = 0x01;/* read_in */
> > 	wvalue = (u16)(addr & 0x0000ffff);
> > 	len = 2;
> > 	usbctrl_vendorreq(pintfhdl, wvalue, &data, len, requesttype);
> > 
> > 	return (u16)(le32_to_cpu(data) & 0xffff);
> > }
> > 
> > 
> > Bases on this code, I think, it's oblivious, that data comes in
> > little-endian. That's why I leaved temp variable for casting le32 to
> > cpu's endianess.

Yes you did well (if we trust the old code :)), anyway I guess it
was correct because I've just seen that data is __le32 also in other Realtek
drivers.

> > 
> > I could just read into u{16,32} * and then make smth like
> > 
> > *data = le32_to_cpu(*data)
> > 
> > but static analysis tools will complain about wrong data type passed to
> >    le32_to_cpu()

Obviously the (not broken) tools should catch that and complain.

> > + Phillip tested fixed v2 version and it worked well for him. I guess,
> > Phillip was able to spot weird driver behavior, if this cast is wrong.
> > 
> 		^^^^^&
> 
> I am wrong with this statement, I guess. Most likely, Phillip is testing 
> on smth like x64 and this arch is le, so...
> 
> With regards,
> Pavel Skripkin
> 
Thanks,

Fabio


