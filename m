Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3D1FBB
	for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 10:52:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id m2so39904954ejb.8
        for <linux-staging@lists.linux.dev>; Tue, 31 Jan 2023 02:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KhUZfqh0Q/iWc9htZg8OXKvcQcvRzJU1LeWYoo+Oko=;
        b=PYV3KB0bA0wwYFO9x2MYLCx6qG5CnpBz1LdwAO561O5HMaUiI3hQ7Ga6ov5KbXquq2
         jPO4XIM+gjyy2PuwR0BrCF4IoBYbcv/msz8aTol+h3MRHIqKj9E0wT8zcPZ4AuUC0wiW
         32ooImV/yReV4smrIG0nRX9ToDFDvKBuitq/uPircitnG9KOlkiXtUDN8U32HoHxYWfB
         hzkRFHe0V+5AZL8p3LyWit69ylqG+CStqlk1Egk54W4mr743JjElgyMJSBPSFIXXYnzL
         b6m9cdICDAz3YsVzLtNhur9m1k5Hl6Yw5C2pAuqC7iKi8B5fRjoAuU9X1PvHLkvKZNdG
         ReOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KhUZfqh0Q/iWc9htZg8OXKvcQcvRzJU1LeWYoo+Oko=;
        b=QEAw72jzBzyLrz1JkEOBj573nTDoEW9XJeqpVY/ApdcEkOUrhYWuaT/IhcIA7g+wcW
         6ORn8oa9+OjsGfAder+wjC6OBINboKMg7JKsFRJ2KSLqg+aSf9O0Jp1YSc1hfsSyH+Wt
         KpKpl8guNjgehrQvZzIj/jX0HSRMgU3cxG3PObvr2kqPrqmodJ0tA6K0z+9toGeoozv7
         IUK6NduOJekhSa3t9/vwoehx8xvH9LuBd8SP5mIBZu5yQ58acW3PbHixuHrBEzgxSSbb
         jYKDsEQewwzOo0UOOGO4K+SW7td+ZAVakdAJJsUvDTlusZB//Gc+P6LiIAhNeG/oC4mp
         ey0A==
X-Gm-Message-State: AO0yUKWwhbzHPx7iyelkQrwruFFDaw872k1zjdYMxDV8I8deyYNdC3pD
	Kububle47kkRNgAvZUtebBt9fmGgmSw=
X-Google-Smtp-Source: AK7set+EBH2d69wkGVuKd4l9AZ9vtw5Rt93u8W36589glgNWFIjk6fjbjUJf7mIRaQW5X+3DbqE7Ig==
X-Received: by 2002:a17:906:eca1:b0:87e:a34b:9e2b with SMTP id qh1-20020a170906eca100b0087ea34b9e2bmr15318939ejb.28.1675162363436;
        Tue, 31 Jan 2023 02:52:43 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id m16-20020a1709062b9000b0084d4b8f5889sm8214955ejg.102.2023.01.31.02.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 02:52:43 -0800 (PST)
Date: Tue, 31 Jan 2023 11:52:41 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Message-ID: <Y9jy+f5JpD1NrbZn@combine-ThinkPad-S1-Yoga>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com>
 <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <Y9jwcdYcFQ9f8+mR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9jwcdYcFQ9f8+mR@kroah.com>

On Tue, Jan 31, 2023 at 11:41:53AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 31, 2023 at 11:19:36AM +0100, Guru Mehar Rachaputi wrote:
> > On Tue, Jan 31, 2023 at 06:22:23AM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Jan 31, 2023 at 03:11:38AM +0100, Guru Mehar Rachaputi wrote:
> > > > (struct pi433_tx_cfg)->bit_rate is modified from u16 to u32 to
> > > > support bit rates up to 300kbps per the spec
> > > 
> > > What spec?
> > > 
> > > And how can changing the size of a variable that crosses the user/kernel
> > > boundry like this change the bit rate max?
> > >
> > Honestly, I followed the TODO file suggestion.
> 
> Do you have this hardware to test with?
>
Unfortunately, No.

> > > > Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> > > > ---
> > > >  drivers/staging/pi433/pi433_if.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
> > > > index 25ee0b77a32c..1f8ffaf02d99 100644
> > > > --- a/drivers/staging/pi433/pi433_if.h
> > > > +++ b/drivers/staging/pi433/pi433_if.h
> > > > @@ -51,7 +51,7 @@ enum option_on_off {
> > > >  #define PI433_TX_CFG_IOCTL_NR	0
> > > >  struct pi433_tx_cfg {
> > > >  	__u32			frequency;
> > > > -	__u16			bit_rate;
> > > > +	__u32			bit_rate;
> > > >  	__u32			dev_frequency;
> > > >  	enum modulation		modulation;
> > > >  	enum mod_shaping	mod_shaping;
> > > 
> > > And didn't you just break existing userspace code?  If not, how?  If so,
> > > how did you test this?
> > >
> > My apologies, I did not study code. While testing, the probe function of
> > pi433 driver didn't appear in the lsmod operation. I suspected my
> > testing was wrong.
> 
> You have to test the existing applications that talk to the device to
> ensure that this works properly.  This change just breaks the
> user/kernel api and doesn't actually change anything to work different
> than that :(
>
I understand. Since I do not have hardware I couldn't test it. I think I
will have to choose my patches wisely.

I would like to know, if it is mentioned in the TODO, why is it
so?

Thanks for the explaination and appreciate taking time for
helping. This was my first patch and I am already learning.

> thanks,
> 
> greg k-h

-- 
Thanks & Regards,
Guru
