Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE57A23A6
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 17:39:05 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so17278643pjk.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 09:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FewUGfwlqHezBHoPwf2mHwQ0EayB8faeO/yThfQKWxU=;
        b=gVZ0ywJbTfHO4hawi9/d3gPWN9Pt1XReVv+iDogfrBwC9SMLfyHg2DJpH5zD66bC8o
         55dfbO+V6PQhhwvzQNeYCsXSzJ2GYrsN9P83LneBfmnwAo4PgtTgjlAgqn1fJzYVGhSG
         xaPhlpxinipjNv4eeI/fGyaf4vF7IuqdsOcgfRi3AjI2eOK3dlOhDvZqyhQHMzUPq4+H
         fBYW8XXmAaJcRblRWmmyXrbHJ44GCAdJnHAi7RamvuFotgXNcnQkQ/tN7/rk0gXtz/Qs
         GYe9GPBzu24ofszeI5uS5nZyENk8JVwWn9DPVq6XWr1jBt3WeFXYVG3pid5r7bX0dEwP
         ASaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FewUGfwlqHezBHoPwf2mHwQ0EayB8faeO/yThfQKWxU=;
        b=zbEwvcxiBS6wXD5SrhQMT8tp8fM3sAxqXOwOop/z3H/J6qW4k6C+eD6ZBGnbioZuUQ
         fNGBzGdRpeo+2mprbun/YnLtfokHjPpGlzlDHRd2c3E1RPhbfVO/PKy0QMICmDixJrW0
         x12BdB2Q9PfA9QMxJfogR31gEGRXtxZZFnmew0o/vHDZ7o/3OKe6t23gj0k7UNNID9PS
         DkAAJny9ZMjlQhkD51zxpbUzdvnVE6yfABRawIu4uBqNAIBmw939I2TOTK7+4CD/nUZl
         324GitWbwBB+OzeGVZXpyFTwsyg8KbQf75Uf0mU49bh0jITyo4dkXzTk6eWh/EkycSf2
         1g/w==
X-Gm-Message-State: AFqh2ko7asBW9yvKwsmwDcw+VD7H0L1tYMObWuOMmLUtkkxI1IInBXmf
	XfjihDZgVaUG0rnamyqzPAU=
X-Google-Smtp-Source: AMrXdXthTtH0jbxxJmfohjB3ame/C74Wnl0nArpJRKNKRcot0p268UiRiQiovxXSBAfRPjUG9dYuEg==
X-Received: by 2002:a17:90a:62c1:b0:226:d7e8:e11f with SMTP id k1-20020a17090a62c100b00226d7e8e11fmr18452948pjs.12.1673372344965;
        Tue, 10 Jan 2023 09:39:04 -0800 (PST)
Received: from gaurav-pc.bbrouter ([2402:e280:217b:6d8:bf67:b774:ee50:1dc5])
        by smtp.gmail.com with ESMTPSA id nm21-20020a17090b19d500b00227252ce57fsm2716639pjb.21.2023.01.10.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:04 -0800 (PST)
Date: Tue, 10 Jan 2023 23:08:55 +0530
From: Gaurav Pathak <gauravpathak129@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Dan Carpenter <error27@gmail.com>, paskripkin@gmail.com,
	phil@philpotter.co.uk, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: Used u16 instead of __le16 in
 rtl8188e_set_FwMediaStatus_cmd()
Message-ID: <Y72ir/dZtUa6tIX2@gaurav-pc.bbrouter>
References: <20230110135058.21364-1-gauravpathak129@gmail.com>
 <Y71zhnbfIWqAPM4i@kadam>
 <9e3e0f34-8a6c-72ca-d86e-de63f87fd7fa@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e3e0f34-8a6c-72ca-d86e-de63f87fd7fa@lwfinger.net>

Thanks Dan and Larry for looking into it.
I also don't have much understanding of the underlying hardware, please do let me know
of your tests on big-endin machine.

> On little-endian systems, both are no-ops, thus it does not matter
Does it mean that the patch is not required and the original implementation
is okay?

On Tue, Jan 10, 2023 at 11:00:35AM -0600, Larry Finger wrote:
> On 1/10/23 08:17, Dan Carpenter wrote:
> > On Tue, Jan 10, 2023 at 07:20:58PM +0530, Gaurav Pathak wrote:
> > > - Changed 2nd argument from __le16 to u16 to fix sparse warning
> > >    "warning: incorrect type in argument 2 (different base types)"
> > > - Removed le16_to_cpu() in staging/r8188eu/hal/rtl8188e_cmd.c
> > > 
> > > Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
> > > ---
> > >   drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
> > >   drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> > > index 8310d7f53982..a055e71d30ae 100644
> > > --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> > > +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> > > @@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
> > >   }
> > > -void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
> > > +void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
> > >   {
> > > -	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
> > > +	u16 mst_rpt = mstatus_rpt;
> > 
> > You are changing the behavior of the code here for big endian systems.
> > Either the change is good or bad.  TLDR; I suspect the change is bad but
> > I don't know.
> > 
> > The mstatus_rpt is CPU endian.  It is the one of two things for connect
> > or disconnect:
> > 
> >     connect: (psta->mac_id << 8) | 1
> > disconnect: (psta->mac_id << 8) | 0
> > 
> > So the question is in FillH2CCmd_88E() should the connect/disconnect
> > come before the mac_id as it currently does or should it only work that
> > way on little endian systems and be reversed on big endian systems?
> > My feeling is that the second option makes no sense so this patch is not
> > correct.
> > 
> > Instead what should happen is:
> > 
> > -void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
> > +void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
> >   {
> > -	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
> > +	__le16 mst_rpt = cpu_to_le16(mstatus_rpt);
> > 
> > But this is just my intuition and I don't know this hardware.
> 
> I agree with Dan. This patch was attacking the symptom, not the cause. The
> original Realtek driver confuses cpu_to_le16() with le16_to_cpu() in many
> places. Apparently, I missed this one. On little-endian systems, both are
> no-ops, thus it does not matter.
> 
> I have a big-endian system (PowerBook G4) and will test later today.
> 
> Larry
> 
> 
