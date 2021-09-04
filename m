Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B646B3FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 22:11:33 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a25so5397938ejv.6
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pnO88SnYwL+lxhkaT9WWjyqqGtrBLDXuOHryPbPgt0I=;
        b=KSVwLRFmYD1meZv2Fl8QTFJhJd+OugYquC+jL68KYWRTnpq40a9SitOu1NM8LtWajW
         zmqRKGu3QjDkDn6/Ulb/RwyZQdDfTf1Lmz5x9Eq4UA/Y48MaTmuGYArI3DRNr9xXa9eG
         kIwX+OK42KjMtSuPeb/z5S1VuZqrYrhMT8YarGAW/KvMx2Gg/W+lJGvD0dVDHBZ5fuW3
         3xyG3BbLWBBEkDh21HlQWaC5XyxewmTL5NLTf/XTrEDLT+PDl9iKWKqc6FYTWYqrfK/U
         5b6vzw6PWrnfnPDTVI33jYlU4MA1pn6nXlVa44o50fNZfzL5sY641Q4o7mY0w92I+gzk
         iSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pnO88SnYwL+lxhkaT9WWjyqqGtrBLDXuOHryPbPgt0I=;
        b=iwoAiGK3MMlZz87Y8e9KHSCFyaQCZ6Yu732IY69AOVhcYMGHsrWPmzmbTOpCiWHky9
         DVs6GARBU1soX2O2wVvHI1ae524GznTBZNt4P232wNu2LCHBqBun2Jsg0pHt7LBNzVJd
         zUqtCEMFYJy21A/XsKsrqrXvs+cbOwor1ZqhOBi8d8rrG0ilPvuIw4dETo+rC0uHC+ls
         zjaMwp84OPzCHMSBi5mr8W8jcUKm15bD5E8Ml74G+N0IPugY9U2GpNRmcWedQOmxYnJs
         hOVnMw+tURqE5Pos0roJok4/Bo2v9gIyVgu986EdMD56ENqVKWD8LPPZUa55z0URZDCN
         uLQA==
X-Gm-Message-State: AOAM533ah0KClZugPfVwL7riNYNT5/KR9MDV+1igEeD6+iphLV+wf5gR
	l9cBrmH0fVMn9LoTJMMtKmQWb9YGNwA=
X-Google-Smtp-Source: ABdhPJxOA2KjnI+4V509sYDRR4A2+vFjmq9UU4wA+FCwMul/Bb/wcty9Lb/10f809Uo6+4YY4+4DHA==
X-Received: by 2002:a17:907:1b02:: with SMTP id mp2mr6006270ejc.196.1630793492157;
        Sat, 04 Sep 2021 15:11:32 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id j13sm1921761edt.72.2021.09.04.15.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 15:11:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: r8188eu: Shorten and simplify calls chain
Date: Sun, 05 Sep 2021 00:11:30 +0200
Message-ID: <1985180.urcR3nkfMq@localhost.localdomain>
In-Reply-To: <20210904212719.11426-1-fmdefrancesco@gmail.com>
References: <20210904212719.11426-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, September 4, 2021 11:27:16 PM CEST Fabio M. De Francesco wrote:
> io_ops abstraction is useless in this driver, since there is only one ops
> registration. Without io_ops we can get rid of indirect calls mess and
> shorten the calls chain.
> 
> Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
> For this purpose unify the three usb_read8/16/32 into the new
> usb_read(); make the latter parametrizable with 'size'; embed most of
> the code of usbctrl_vendorreq() into usb_read() and use in it the new
> usb_control_msg_recv() API of USB Core.
> 
> Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
> For this purpose unify the four usb_write8/16/32/N() into the new
> usb_write(); make the latter parametrizable with 'size'; embed most of
> the code of usbctrl_vendorreq() into usb_write() and use in it the new
> usb_control_msg_send() API of USB Core.
> 
> The code with the modifications was thoroughly tested by Pavel Skripkin 
> using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS]
> 
> Fabio M. De Francesco (2):
>   staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
>   staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()
> 
> Pavel Skripkin (1):
>   staging: r8188eu: remove _io_ops structure
> 
>  drivers/staging/r8188eu/core/rtw_io.c         | 241 +----------------
>  drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
>  drivers/staging/r8188eu/hal/usb_ops_linux.c   | 242 +++++++++++-------
>  drivers/staging/r8188eu/include/rtw_io.h      |  76 +-----
>  drivers/staging/r8188eu/include/usb_ops.h     |   2 -
>  .../staging/r8188eu/include/usb_ops_linux.h   |   8 -
>  drivers/staging/r8188eu/os_dep/usb_intf.c     |   2 +-
>  .../staging/r8188eu/os_dep/usb_ops_linux.c    |  40 +--
>  8 files changed, 174 insertions(+), 443 deletions(-)
> 
> -- 
> 2.33.0
> 
Dear Maintainers,

Stupid mistakes on mistakes... Please discard this revision of the series 
because patch 3/3 is missing the version number.

Thanks,

Fabio



