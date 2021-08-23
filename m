Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80F43FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:26:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id n5so12915796pjt.4
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZNGdMlG+N2F/IFNczPVZ4FDm0Rsfwtl+ur4Eoayiuw=;
        b=Xv6FCGkkowBVANvt56d+uvTNVcdQhDVlnio7+/Ibl3pc0kRCPs+kN9gzVgcEJswYs/
         nI3uJOZshij44VgS2lSW6WyVL9zP9s4E2E8nuRV3BCsb2+pbpFmIk151uwoxMhJz3eid
         n2dz9bZVML2CyFdu4lKWS1fiS+J/c9Q4t7SDRsQOLNKqnTuZl2siH3jfWmtZlU5TMNl5
         P85tUDqRTNxq9wS9QJXAevOmj//FTh2L2KzARLPzwpfi1loFsDFfCWcA9V3LdObA0RT6
         H7OwbiXaSvurIxf/RmQZvSzIFa9shPeGeC2KxBhOjkOOynaAuze/lOlAdv3n3Hr/9a+T
         HqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZNGdMlG+N2F/IFNczPVZ4FDm0Rsfwtl+ur4Eoayiuw=;
        b=QJvdoIo41XWUXqVTM8lUmY3UyGCuG29ewTia4tqkb+rlHVXHOQ+IXKvIEqPDziKE1C
         uF01OWs7zjQCLWvR7obLa727r34Jn5j1lfWqV/hMeOp+oGmvaZmcFByRITSZ0CB1PKkM
         fLGRT6l+4vOcgB9oLwUUeNRc5hvmgWA4FCMIefHqt+P7UL3LReYjmZCWCqy2K6soL8BK
         S6thGmDIVn5ksk0Dzeq6XCVDbNA8kDt2DTIVbV3oq5Ovec3CHCTMKMAh7CK7TQU8YCR+
         I6DU5XLSVpwKquY+qyrSxqHMN7kHz3t7wSlpq4+5ZDwKHuTtIRSJxDwrZ5wE1Vxe1wnr
         LjVA==
X-Gm-Message-State: AOAM532umYKr7p/JWmi0ovpzY9+R5J+B0BM5cLBJX+xL2tlbltpaBVFw
	cjqisSIjWW6/3jUjdxh5uVkKnVX1kTT/G9djWl0q5A==
X-Google-Smtp-Source: ABdhPJxFLxUqiUkg839eVAbTxEMd4XC+Uh2NRtHSkFsIt/cX3EZyjx2J5BrEy94Qu3jrjQBmADWbEqvXk+huv3ji7kQ=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr30538437plo.37.1629757582266; Mon, 23
 Aug 2021 15:26:22 -0700 (PDT)
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
Date: Mon, 23 Aug 2021 23:26:11 +0100
Message-ID: <CAA=Fs0=wWdTXgxg9dOm-UBG7VEtmiTOZXfboK5bt0pZvTVVG5w@mail.gmail.com>
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

Sorry, it also occurred to me after sending it would be better to have
mentioned this as a reply to that patch series rather than to this
e-mail. Apologies if I've confused anyone. Anyhow, I shall report my
findings on that e-mail thread.

Regards,
Phil
