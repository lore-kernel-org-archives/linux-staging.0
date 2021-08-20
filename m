Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE183FC2
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 15:10:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bt14so20916786ejb.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xvm/oerTrpAMDku03UYvg3STSZAJwJc9XZtIR55cbJk=;
        b=nirra9EgH/7fZqGFvWXkZ2gMuTvty6zBdowb2x8g9KCknPk/mHlmRqm0mDc6GGRzYm
         1ZbtQN7tJG6CHUIGnwNw/6EVPNQqiFFcXsqeSjzcwQOmb2BzfZ7HIYPaHByRlseQTpqj
         Av8VpOdM4eoUReqZNskQtDRx1hIY+OI5nt/BcjjK5eYol715eyFgvM/gcjR66frrSSyP
         jrk3k29lUvK2oqjn/EBRtHGS5vNEMuSgsMkz3k43cfdDSMGWaxEKGbDIMtmIIjQuwskO
         PCfAPrPvLHOs6nvdF7XOxIRdipBG3/8uJ5iiPZ1c8xagtaSbThmMQfoI/KGgtl5KUgki
         rRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xvm/oerTrpAMDku03UYvg3STSZAJwJc9XZtIR55cbJk=;
        b=nsztDfE8UaDFtBl6UrEgFxavNwz4eUzRbTs53K2xOgAGI/coJLKE54N6G/TrIeacgr
         Ym5F0M5j3kDD0ynvgM4iMHH2ol7q74BKol5dI9QcrEDnoL878Hh00aRBvM3AgWWe8Ueu
         aTfyUShoXvlKmsF1QDcesYUbR5TqRjB3UkC37sMyYlomHIWDkWBrCYmpRuAEGUfCMf+q
         TwQ06OSaCjCGsDG2byuNh7fVjxzPNNb8PuRRXyK7B4oNKHLECzpGYqE0poNLrsQwyPh3
         ccWO2U8YoAem6kpzPLe97H+EM/C2bsgPNZ7X1GWJeobUjf7b6XWYvSRN2A+jj/JGDqrk
         nqjA==
X-Gm-Message-State: AOAM533QH5Da0Uswmtnh/YHdmjNsAjENbe63RvdqNmoraeoB00skde1j
	tk0IfTgdNz8ssdMscbeKxx8=
X-Google-Smtp-Source: ABdhPJxkt+bMvAfCpIoXP0K2D+mTpjHL9tkU0tYl/gzJcQVAfllHN58XQqUSPpWY8vp3YTwdD6Htfg==
X-Received: by 2002:a17:906:6b8b:: with SMTP id l11mr110387ejr.508.1629472232121;
        Fri, 20 Aug 2021 08:10:32 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id de12sm3769728edb.37.2021.08.20.08.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:10:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] staging: r8188eu: restricted __be16 degrades to int
Date: Fri, 20 Aug 2021 17:10:30 +0200
Message-ID: <1777630.LqDDHREl4S@localhost.localdomain>
In-Reply-To: <YR6S7MfxpXpQFl9d@kroah.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com> <bd63137c645ecc20dc446a6cfa7f7d3461a642d7.1629360917.git.aakashhemadri123@gmail.com> <YR6S7MfxpXpQFl9d@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 7:20:44 PM CEST Greg Kroah-Hartman wrote:
> On Thu, Aug 19, 2021 at 01:47:56PM +0530, Aakash Hemadri wrote:
> > Fix sparse warning:
> > > rtw_br_ext.c:839:70: warning: restricted __be16 degrades to integer
> > > rtw_br_ext.c:845:70: warning: invalid assignment: |=
> > > rtw_br_ext.c:845:70:    left side has type unsigned short
> > > rtw_br_ext.c:845:70:    right side has type restricted __be16
> > 
> > dhcp->flag is u16, remove htons() as __be16 degrades.
> 
> Um, are you sure?
> 
> > 
> > Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > index d4acf02ca64f..14b2935cab98 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -674,13 +674,13 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
> >  					u32 cookie = dhcph->cookie;
> >  
> >  					if (cookie == DHCP_MAGIC) { /*  match magic word */
> > -						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> > +						if (!(dhcph->flags & BROADCAST_FLAG)) {
> 
> So you now just ignore the fact that the code used to properly check
> BROADCAST_FLAG being in big endian mode, and now you assume it is native
> endian?
> 
> Why is this ok?  Did you test this?
> 
> thanks,
> 
> greg k-h
> 
Aakash,

Building on the objections you had from Greg I suggest that, before attempting 
anew to address problems like these, you get a better understanding of the topics of 
native and network endianness and of the API that (conditionally) swap bytes 
in a variable between little endian and big endian representation.

To start with, please note that the following code leads to tests for "v.vub[0] == 0xDD" 
which is true on little endian architectures while "v.vub[0] == 0xAA" is true on big 
endian ones...

union {
        u32 vud;
        u8 vub[4];
} v;

v.vud = 0xAABBCCDD;

Also note that API like cpu_to_be32(), htonl(), be32_to_cpu(), ntohl, and the likes are 
used to (conditionally) swap bytes (i.e., change the arrangement of the bytes in a 
multi-bytes variable).

Casts have very different purposes and usage patterns and, above all, they cannot 
magically change the endianness of a variable.

Regards,

Fabio


