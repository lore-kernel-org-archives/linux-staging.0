Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980B7B
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 00:14:15 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ud5so25025503ejc.4
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 16:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjRTcAwvizSrldTVDXNqkh4xAee6ddjrgFnaGK7k4GY=;
        b=KrAaGzHg5ZVNEIUHq4Lv46fQi3zcGcV7z3QnuHIG32zrrcnmr8hxxio3idmnLnjXEQ
         n2SeqHrlx4qCgVek88ckBUZjMrJMPPhe5bjH4xvk0JThjqKpw3MOCu6R/KVue3V/Dhpq
         CS12/KjPRxLFIpxn7H1saK2j8mfdsp2YbfjpOUDqeiYeRcIRcoKlQuTZMcthkCVS1KZI
         IqcILwygUjWjtjDxFkWwaKmk8zzIJ1V3wgkhXrRtOb0KzrPdJimIinAaSJh2TydOdWBu
         GBC/e4s3jwaDohzx7YjwjJ4V09IMWDg3ZG8bPTZmvz031gAcaaAk4a4ekxh+RnqPv5XP
         YVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjRTcAwvizSrldTVDXNqkh4xAee6ddjrgFnaGK7k4GY=;
        b=GvRtDxWO5cet1G/JRuHTtiq8zkSJRghff0vM46YamjYEWju3pNN11XIOxDXZggxemQ
         zHC6PcxTlRXvnz1MQkqu5/UIUsKYS02KK8rSWhbwCHzXZmSdHFIOHj4ge2gTjw/mNhpU
         /mC7QRcTOdQuGNH2YwWO40uccaAyU9Ue+GF3tibpwxqNV1Rf36U1/xlCKl9PF8KStPzl
         GgbyXjd5uw79RskPXxrLDBMwjnKsBWADQ4MpyBZgtXw1Nqs+khEBGBe9jVwMpo5AfSvn
         JLUFxiLpRdtxDuWAtZLNZ8jLD7HXJm0GJ47e3Y4JEJuPVpoP5ftzogxm3xB3ppNVOv1x
         JiSg==
X-Gm-Message-State: AO0yUKU28LNvFDCrsSH3tdR2SCPUYpdF6steXDUyDM/1cl7Da8v+72AF
	1TkoG+wtklFUoxTYgKXDV5OG2EF1aAw=
X-Google-Smtp-Source: AK7set8WLerYJAW6HtJNzL8h3IJvLOEfyASOfPRDAUgw5uJlouaoingiW1zQSkTTic0z1rW0b4vf3A==
X-Received: by 2002:a17:906:1810:b0:885:5682:7e52 with SMTP id v16-20020a170906181000b0088556827e52mr13801398eje.13.1675556053917;
        Sat, 04 Feb 2023 16:14:13 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id f21-20020a056402195500b0049be07c9ff5sm3144294edz.4.2023.02.04.16.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 16:14:13 -0800 (PST)
Date: Sun, 5 Feb 2023 01:14:11 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Add braces to macro parameter 'iobase'
Message-ID: <Y97006iBeoRV7I8b@combine-ThinkPad-S1-Yoga>
References: <Y93WEZGlT5Vmeb50@combine-ThinkPad-S1-Yoga>
 <Y94PXceerdFTBg5e@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y94PXceerdFTBg5e@kroah.com>

On Sat, Feb 04, 2023 at 08:55:09AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Feb 04, 2023 at 04:50:41AM +0100, Guru Mehar Rachaputi wrote:
> > This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> > as '(iobase)' to avoid precedence issues.
> > 
> > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> > ---
> >  drivers/staging/vt6655/mac.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
> > index acf931c3f5fd..a33af2852227 100644
> > --- a/drivers/staging/vt6655/mac.h
> > +++ b/drivers/staging/vt6655/mac.h
> > @@ -537,9 +537,9 @@
> >  
> >  /*---------------------  Export Macros ------------------------------*/
> >  
> > -#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
> > +#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
> 
> This change really doesn't make much sense, right?  How about turning
> these into an inline function instead?  That would be the correct thing
> to do overall, right?
> 
> thanks,
> 
> greg k-h

Thanks for the reply and advice.
I have modified accordingly and sending in as a v2 patch for the above.

--
Thanks & Regards,
Guru
