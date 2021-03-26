Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B9B70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 13:57:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id x7so5718028wrw.10
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aqH3oaZeAGr404pxyOo2DTDa7+fuxAZlONQ6s8AyNrU=;
        b=jb8daXRrGteUJsTZAc0qDqWV/6S8DaVROs7HTnHxyTwCdp6O80FpNkY/ULTMQlkrQd
         ZypW6xT8b0oIw7K9RNfxGUz9YMjjrAeTpQv9xYbTf+Re8VGUK3zVkdDJiSmi8qKlr1/0
         aV7QXN7N14Jky2+0dmtg/LgrMfABWWSn90FHvNqLrp6teCeZM1Um3UMMh1UupFW3Ntrl
         S7jBslgLlTO67QY+tF8n29Sfu2NOSDQwz202Y9gusCcgkmwYHoqAYvuIYqnAYpDA+sxn
         YQD9QPUzfQ37tYOE87vw8llYP2tjwVSE7vYyNw1pad346bDvR0+fK/SevDDOPhrrky6I
         xiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aqH3oaZeAGr404pxyOo2DTDa7+fuxAZlONQ6s8AyNrU=;
        b=HSxJIRyzH8QLoH/xkFyu/uD7dpHPDONwAiaI49DIN5mxwtasuzVe/ydrZCvaY4+ZSQ
         L8wU2MzYTLcRAIs8HBTbdMaDbmAGc6TH9z8SoZ+glkPyKe9TaiOaDfqCM5EjEjWW1K3u
         o1R7inTUwzpk4G37D43jZsiO+TZaGAAiR8dyueU8pZ3JVpZD5XZwTjyjkcXO32XxX+Km
         09XP66r99E17xXmPqbGLWp0Z82VFR5S77AC0B/sWv7sCEsUZmEM9D50ZI/CwQP2hQh/O
         IOugJN/6ji11bCfh5ZiK1uzCtABwGfB7LHsQVcQRzyunZpwjeImC8Cou+gqu1SpLZn46
         5s1g==
X-Gm-Message-State: AOAM530cjN1T6fSor3vnQ8pCFBEGz4MJqpwgauk8yjcmg/cjFNThIqxR
	wGLpJTkXLfb1pqAUaJmANoQ=
X-Google-Smtp-Source: ABdhPJx8Ij0ksb5Cr/wM3EQMhF+TpPMYT6UJNCGKUdatrLdkzGQ6Nzo/1x1xxq8tjTQRkIkdQz+7wg==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr14838952wrs.395.1616767024460;
        Fri, 26 Mar 2021 06:57:04 -0700 (PDT)
Received: from agape.jhs ([5.171.80.141])
        by smtp.gmail.com with ESMTPSA id q4sm10868910wma.20.2021.03.26.06.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 06:57:04 -0700 (PDT)
Date: Fri, 26 Mar 2021 14:57:01 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/15] staging: rtl8723bs:  put parentheses on macros
 with complex values in include/sta_info.h
Message-ID: <20210326135700.GA1952@agape.jhs>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
 <24e684c1eff8911dacff1b61957ce25bafc46631.1616748885.git.fabioaiuto83@gmail.com>
 <0466586ada4d4804bca4e84aa5908c01@AcuMS.aculab.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0466586ada4d4804bca4e84aa5908c01@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Mar 26, 2021 at 01:39:24PM +0000, David Laight wrote:
> From: Fabio Aiuto 
> > Sent: 26 March 2021 09:09
> > 
> > fix the following checkpatch warnings:
> > 
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 284: FILE: drivers/staging/rtl8723bs/include/sta_info.h:284:
> > +#define STA_RX_PKTS_ARG(sta) \
> > --
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 289: FILE: drivers/staging/rtl8723bs/include/sta_info.h:289:
> > +#define STA_LAST_RX_PKTS_ARG(sta) \
> > --
> > ERROR: Macros with complex values should be enclosed in parentheses
> > 294: FILE: drivers/staging/rtl8723bs/include/sta_info.h:294:
> > +#define STA_RX_PKTS_DIFF_ARG(sta) \
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/include/sta_info.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h
> > b/drivers/staging/rtl8723bs/include/sta_info.h
> > index abde3e3df988..1cdf93ec3b66 100644
> > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > @@ -282,19 +282,19 @@ struct sta_info {
> >  	} while (0)
> > 
> >  #define STA_RX_PKTS_ARG(sta) \
> > -	sta->sta_stats.rx_mgnt_pkts \
> > +	(sta->sta_stats.rx_mgnt_pkts \
> >  	, sta->sta_stats.rx_ctrl_pkts \
> > -	, sta->sta_stats.rx_data_pkts
> > +	, sta->sta_stats.rx_data_pkts)
> 
> That doesn't look right at all.
> You've changed what is (probably) a list of arguments to a function
> into a comma operator list.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

ops, you're right David, thank you and sorry to all
for noise.

fabio
