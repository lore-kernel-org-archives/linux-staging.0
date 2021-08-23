Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E573FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:23:40 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q2so17934003pgt.6
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1W+36Qe3I+Zp/NI9r7n+8Xm3W8eBvWeztJ9wzJAYno=;
        b=lqQy/nFYAWJ2nHw5eYylGrErEh9yrufxrnuHFFH6+4+4OZKQra0rpfT20g56/cR5RL
         ieqT4T3VPU6XEKOIJr1PmossE0Il5B7XfNpBqK3NMQ9Ikd74FcQbdHKJVX4tgR7QUKQH
         lEZGTjy/ZbqwNVhjfE8FxNeKxExePa0/iHQFR8MHKGArfmRxhvu9ZbqaFFp537TL5G9E
         vpcgcwAdpbQafEzogw+x3xtQt8ixebdhLKE6EkfeWdrzphRLL9e4Ym3/iko0ywB4sq+H
         UEQlzKPIQ9qvEAibHW351wjj18LAv+uoLi1p23jb4PLw84W/Ach9qCK+kODMxfOa1wB2
         y/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1W+36Qe3I+Zp/NI9r7n+8Xm3W8eBvWeztJ9wzJAYno=;
        b=jt0bB7LItQcCfzAmTyR8K9R+y5J62qWAGspBl6SArdqpMn4OUd924akO0Y4V4Diqua
         GCsWsYrObLJ9GBTNXZ074xAy8YmQaTWmJAL6lJ8GCoYcYbYIkVwFIyzwiYGZC64llB1i
         +58rkRjNmAsjDp/hz+B8d0dVSJfFZpcPn+pPVR/k81ib8exbqRwAjA242Hh+fyHVSV9X
         /TApVDBs0hnRWIfQnzghnaZtaoliJZVggu0L14E7AwJrpz7s9ZuIs45LA/qwJcm8y/g+
         fUcbz2a1CbgAXsIs/cv9rXVm+4nt4zvY+fwVEaiQVq1WzeHOv1C2OT69NIUs7Rel4P4G
         FALw==
X-Gm-Message-State: AOAM533CRqCDh66wRTATS73/hl+69t0OW/iCD44/FllgdkYyo5IZ1pV6
	WGxDF3tCxMiaVb0e10bpY+2xYLuux5e32zMu4CbZ1g==
X-Google-Smtp-Source: ABdhPJwto+nl0syuCMr0fAKFQeJ6rtX2kAqUHL1ydhcfdfJ982CiP7Q1+5MdAMUn63g8W+8YcBEAiS0lWqCKb8HcjbA=
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr34151460pgu.82.1629757419847;
 Mon, 23 Aug 2021 15:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210823184059.19742-1-paskripkin@gmail.com> <CAA=Fs0mW_4aVNYuLkZMS9ov0CPNKfPB7C=FS2z67Ui+hEvtaRA@mail.gmail.com>
 <262ccda0-0aed-26e9-0585-e5376db86596@gmail.com>
In-Reply-To: <262ccda0-0aed-26e9-0585-e5376db86596@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 23 Aug 2021 23:23:29 +0100
Message-ID: <CAA=Fs0nVOfqX3+++wvsajUUy0qdfFKT4XZvOZPvdoaa2FAsNQg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Aug 2021 at 22:29, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 8/24/21 12:20 AM, Phillip Potter wrote:
> > On Mon, 23 Aug 2021 at 19:41, Pavel Skripkin <paskripkin@gmail.com> wrote:
> >>
> >> rtw_deinit_intf_priv() always return success, so there is no need in
> >> return value
> >>
> >> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> >> ---
> >>  drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
> >>  1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> >> index e002070f7fba..37694aa96d13 100644
> >> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> >> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> >> @@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
> >>         return rst;
> >>  }
> >>
> >> -static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
> >> +static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
> >>  {
> >> -       u8 rst = _SUCCESS;
> >> -
> >>         kfree(dvobj->usb_alloc_vendor_req_buf);
> >>         _rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
> >> -       return rst;
> >>  }
> >>
> >>  static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
> >> --
> >> 2.32.0
> >>
> >
> > Dear Pavel,
> >
> > Looks good - going to test your RFC series now btw.
> >
>
> Thank you, Phillip!
>
>
> Testing this RFC is very important. If it's all ok with it, I am going
> to add proper error handling all across the driver code, based on read()
> errors :)
>
> Btw, we also can add error handling for write() operations, but I think
> it's not _very_ important, since driver won't misbehave in case of write
> failures
>
>
>
> With regards,
> Pavel Skripkin

Dear Pavel,

Happy to help :-)

Sorry to report, but your RFC series generates an OOPS on boot for me,
in usb_read32. Just doing a stack trace decode to figure out where
failure is and I will report back.

Regards,
Phil
