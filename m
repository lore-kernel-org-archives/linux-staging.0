Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40996D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:27:06 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id w23so15596333ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ENoaVUYqcoflF8xWOIWULroGO6u264X9NRgbkfRf5wI=;
        b=F8sRkgXyBy638AVKUfcQGHQvtUeVt4DOeps/NhbhqPWwPXiCtEmYAZVpuwrm/5l/JZ
         U5qTGgXQpFc2/gczGUGroXph8hQcYwR9WZajmdQe2EWyifb/ArmEP0Aw53gTdAoX3qMs
         tNcxkOQq63t25zMocVzm458Tj63pmUvsoIdX0iHvvkl/S96VpW+CuyyC10tl/n09Ci2a
         F0Bebag7Q7MXDIV1SkTj8PwvT2eWv4nx4l6ISsG6AE8ZK/+t/2mkH7m87OVKCjdQ7iyr
         HOysRtCyzdBmNa+RJHlt5Mp88QCfAKU1u03LPq1r44+wCZzoQfiXarz6mGn7AGaCafL8
         NPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ENoaVUYqcoflF8xWOIWULroGO6u264X9NRgbkfRf5wI=;
        b=OqGtTT+9kOTRUO0HpoAD3a9no5rxb2ugwpK3xOyA0G95vC91bKuawkc58H0qvt863E
         5/Zm4G7qrCa2vsUPZQxt/n3zi95HmTJTmwlEE17Kh17BzD+MmfMvkVYJihj9tk0LrWN4
         8Oog4B4NgkEnSgb4RrgIyWelD8TCGNtU3hRIuZyi9zaE6aHu/q8b2IA5UVXMrysDBs/o
         I7bscKhp4vYItGuxP/FMhdTX/TfE8KhePrOyRJ1bhFKoHu0yrnl3PJ4gTnki7r6l15X8
         vR4eOviQ4Q1udoDFmCt/nCwI4EN+C6FGH2vQmiKKYAXDdOeACSVarQw0/EbkpsRzjORs
         rX4Q==
X-Gm-Message-State: AOAM532xL8TuZ0iajA70gkqt3FlnJsgiYi/3DzBC/W54Xpkht8BP8jB1
	kKpdH+Wuls/2r6xEO1Bc1y8=
X-Google-Smtp-Source: ABdhPJxax/Bq6nQ2WuC3iZhGyolTTsuKDanQIdpR1zpcwIV33FRjGP+S6tyWmsGI9K8Ikw1sRnKJTw==
X-Received: by 2002:a17:906:37c9:: with SMTP id o9mr19026672ejc.285.1618406825395;
        Wed, 14 Apr 2021 06:27:05 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id u4sm7999489ejf.11.2021.04.14.06.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:27:04 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Julia Lawall <julia.lawall@inria.fr>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8723bs: Remove useless led_blink_hdl()
Date: Wed, 14 Apr 2021 15:27:03 +0200
Message-ID: <2135425.qiX1NcrmH6@linux.local>
In-Reply-To: <YHbdhT8z11rd6okI@kroah.com>
References: <20210414115243.32716-1-fmdefrancesco@gmail.com> <YHbdhT8z11rd6okI@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, April 14, 2021 2:18:13 PM CEST Greg Kroah-Hartman wrote:
> On Wed, Apr 14, 2021 at 01:52:43PM +0200, Fabio M. De Francesco wrote:
> > Removed the led_blink_hdl() function (declaration and definition).
> > Declared dummy_function() in include/rtw_mlme_ext.h and defined it in
> > core/rtw_cmd.c. Changed the second parameter of GEN_MLME_EXT_HANDLER
> > macro to make use of dummy_function().
> 
> No no no.
> 
> If you want to remove is function declaration and use, then do it
> properly.
> 
> The code is crazy, I agree, but it should not be difficult to just
> remove this correctly instead of papering over this mess.
> 
> Also note that no one actually calls this function if you look at the
> logic here.  
>
> It might take some good knowledge of C to unwind this crud,
> but once done, you should be able to "prove" it's not called
>
Proving that no one actually calls it it's beyond my 
current knowledge of programming with C.

Matthew W., who is for sure more experienced than I am , 
wrote that that function pointer in the array is used somewhere else. 

Copied and pasted here from his message:

"Here's where the driver calls that function:
$ git grep wlancmds drivers/staging/rtl8723bs/
drivers/staging/rtl8723bs/core/rtw_cmd.c:static struct cmd_hdl wlancmds[] = {
drivers/staging/rtl8723bs/core/rtw_cmd.c:               if (pcmd->cmdcode < ARRAY_SIZE(wlancmds)) {
drivers/staging/rtl8723bs/core/rtw_cmd.c:                       cmd_hdl = wlancmds[pcmd->cmdcode].h2cfuns;
>
> and how to
> remove it correctly.
>
I think that doing it correctly depends on the "prove" which you requested.
Doesn't it?
> 
> And no, I'm not going to say how to do it, that's an exercise best left
> for the reader.
>
It sounds perfectly reasonable and I agree in full.
>
> But I will hint that this was done in the past, in
> 2014, in another driver in the tree with a codebase much like this one,
> so it shouldn't be hard to find an example of it.  Only took me a few
> minutes...
>
I'm sure it took you only a few minutes. If this can be accomplished by using grep 
on git log output I need some time to read this command manual again. I suppose 
that the search should be made by combining "remove", "function", "drivers/staging",
and "2014". At the moment I don't know how to do that.

Notwithstanding I have said all that you read above, you can be sure that I won't give
up so easily even if it will take days :) 
> 
> good luck!
>
Thanks, 

Fabio
> 
> greg k-h



