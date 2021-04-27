Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826002F82
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 12:41:39 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id g65so2584023wmg.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cZ21gZXRbDQCP1+gWLkdEChswiOAmqFQLs0NT28GXiA=;
        b=bfQbTzMsiGQbeF4gRMmfnfYhqnhq2VAiqm7zF9HzRs+RMIreFhBfdS8CSlbsRJpYsv
         HB+mZZCpcssIHSrrvfKuZuEQ4TZcRQ0OSaQtwwJl5RrzEnuLNpHVvgAqfpibqE1fu7sG
         D1uqj4Og22DtTmTRU6v2z/dCFfQ8exyFVbta3DtxImS+/R3Nm4/garPDtjasgTJDwgnX
         /mhXurr/RkFJv1hi3mwaEp4SRc8DP6piTuvN4xINJJ42iM8uD8W0oX5+LaJX7ehFtYNL
         sjB5j2KbBEYUA6IEQWC/e6v/f7cuC37a1Nld36dvKGEy0HYfQRVEOPRsc+KbSRvukYHA
         E6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cZ21gZXRbDQCP1+gWLkdEChswiOAmqFQLs0NT28GXiA=;
        b=r+TzHY7/jyXt7hqfB7xAO52HFKLNZ795pCP9IifsUvuU0bSqZNHSy9EwLr+I2wQBJB
         WnFWcuHVmc5mUDMcqxziM7xJbpg/SzC5wD+fDDZCbse0j9uLs4ite/3b00EDhhEHlEGi
         PtCdlS8wkN1t5oiSKFjcbgyQ6C6er1l8eytqQvKSFvdg18RtN8VU0o9j4WCVDhVTsPU3
         NHGN3Spcxgpw5HpJZrDAiGejxE/gaGHvY4v3CJrVf5sPNAlFGR7V5w2U4XM61YhKkxG3
         S/ICDzdiigCUK7yeyOXdCte0aolwIiMzTUjJbxN5xhmRuy4uTZcltT8vn0VvzcCfWO81
         0WAA==
X-Gm-Message-State: AOAM532E6IdDOUtMopG3hn2bpUmyedqJ9WABnfpQ+1ci4kvTA4fkKJXf
	4C4dKJQWsBxWJOgTnGtA2wk=
X-Google-Smtp-Source: ABdhPJwDcYYwCGKKEg3Fh/OqUBiIvHpEHOgYYu3EEbi5YFG/5oxLc78WjFgsF7eH9VGshV0Mk+dAPg==
X-Received: by 2002:a05:600c:3581:: with SMTP id p1mr24631290wmq.76.1619527298029;
        Tue, 27 Apr 2021 05:41:38 -0700 (PDT)
Received: from agape.jhs ([5.171.81.92])
        by smtp.gmail.com with ESMTPSA id t2sm2668228wmg.38.2021.04.27.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 05:41:37 -0700 (PDT)
Date: Tue, 27 Apr 2021 14:41:35 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 50/50] staging: rtl8723bs: macro DRIVER_PREFIX expands
 to lowercase driver name
Message-ID: <20210427124134.GA1399@agape.jhs>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
 <c986e9a3c9b2f73cb784bd5dc7c877eb9a669c89.1619254603.git.fabioaiuto83@gmail.com>
 <YIfvqU2bEpDSj/hK@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIfvqU2bEpDSj/hK@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 27, 2021 at 01:04:09PM +0200, Greg KH wrote:
> On Sat, Apr 24, 2021 at 11:02:33AM +0200, Fabio Aiuto wrote:
> > macro DRIVER_PREFIX expands to lowercase driver name.
> > 
> > Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/include/rtw_debug.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> > index 189f02a8300a..3a5b083e95a1 100644
> > --- a/drivers/staging/rtl8723bs/include/rtw_debug.h
> > +++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
> > @@ -7,7 +7,7 @@
> >  #ifndef __RTW_DEBUG_H__
> >  #define __RTW_DEBUG_H__
> >  
> > -#define DRIVER_PREFIX "RTL8723BS: "
> > +#define DRIVER_PREFIX "rtl8723bs: "
> 
> KBUILD_MODNAME should be used here, in the future.

ok, got it

> 
> But really, this shouldn't be needed at all, it's kind of pointless (if
> it is being used, then odds are the places it is being used is wrong...)
> 
> thanks,
> 
> greg k-h

fabio@agape:~/src/git/kernels/staging$ grep -r DRIVER_PREFIX drivers/staging/rtl8723bs/
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRsvdPageParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMediaStatusRptParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CMacIdConfigParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CRssiSettingParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPwrModeParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:	print_hex_dump_debug(DRIVER_PREFIX ": u1H2CPsTuneParm:", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/hal_com.c:	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): ", DUMP_PREFIX_NONE,
drivers/staging/rtl8723bs/hal/hal_com.c:	print_hex_dump_debug(DRIVER_PREFIX ": c2h_evt_read(): Command Content:\n",
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:	print_hex_dump_debug(DRIVER_PREFIX ": C2HPacketHandler_8723B(): Command Content:\n",
drivers/staging/rtl8723bs/include/rtw_debug.h:#define DRIVER_PREFIX "rtl8723bs: "

When I recently changed the old macro printing hex dump I
decided to keep DRIVER_PREFIX. But I can replace it by
KBUILD_MODNAME.

Thank you,

fabio
