Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376B29CA
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:39:51 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id u8so15543662qtq.12
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2B1LMPTBMBAU8JXDhbFQ2mBUnwK8BELBWD2+5f+8D7U=;
        b=FiLrkyTDp6GJ98Bu7H48INTpDWgOiffBp7x8jMPGeRWaKcfr6Wjy9rIxsWrwBT1grG
         4CJmyGp3XeYv1b9pjxXkPE7U86VFDyfKu0eYDXEK8nUkwG99ccg3pa99IH9wWhkyb+O/
         Y32m9Gh3xdf3GYS0QFrqzlzN6nnGns0ggN2ZGryzQOaaCFFfFA/6AsgMZpkamHaeubTh
         pF4g2J8zoeLFSuKrLMSAkIaXO7wVtM0h88tfIYoe+4tRKcuBnENHX3lbPSd2UiZ7Rab8
         WQ7NNhX0qo8vhuUxpgVbirIuKT8sdSmBRshkAQG6mLNHzEI1rhPbxCet4CNlEpPdg+79
         uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2B1LMPTBMBAU8JXDhbFQ2mBUnwK8BELBWD2+5f+8D7U=;
        b=iSD7rdZj+Q/KEz066YZNTWWZjTyRvvqUHiL//Qwi5MfPj/vfqmUdOqCDSZ8PvqcsNY
         mFvV5jRkBuAd0rJaIIcZbjxxyLtaaLA6rpRByHcYI5O7qmyiXFSn+G6qezEWAapSDL9v
         1+zmc0+wXcZSg04uFCj8GtwNbUlYmDp9k1lL7AbGfVyUstodp4+Yg3iBQiXOA1S3As6E
         eMXk8n/uo6kMqa0q84BJ3Fb0SNsw6qGuk+GPyZ0ilYOyrqOvG1qDnNvDdHhUnIkbUA/Y
         AtG+slJ7aJszt3IAdEo4jPzMAGm5G91hUtyMUjbikAn0oZtg3Tkg6gdDna5xyKOkpnxL
         4l3Q==
X-Gm-Message-State: AOAM531+GjQi7cds4CjVwPYeyqHfXhXWKQYNoBmTijh8Dij9g3O8Rj2S
	zOF5xmNjaGzeoHjJkQcUsb4=
X-Google-Smtp-Source: ABdhPJyCfw2axk8SsI63eBuL3QAMPnt5uxawiDA1dOramrBp7UVAaRcUl0Ur1gXGZ/AboH4Hiff+Yw==
X-Received: by 2002:a05:622a:30f:: with SMTP id q15mr4076305qtw.4.1618411190499;
        Wed, 14 Apr 2021 07:39:50 -0700 (PDT)
Received: from ?IPv6:2001:1284:f016:a037:7038:c088:ae60:452d? ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id l24sm3425807qtp.18.2021.04.14.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:39:50 -0700 (PDT)
Message-ID: <45412a2374f2fb324973796105d7bf0ef2bfd36d.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: pci: Correct identation in
 block of conditional statements in file atomisp_v4l2.c
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Wed, 14 Apr 2021 11:39:46 -0300
In-Reply-To: <20210414143011.GV6021@kadam>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com>
	 <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com>
	 <20210414143011.GV6021@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em qua, 2021-04-14 às 17:30 +0300, Dan Carpenter escreveu:
> On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro
> wrote:
> > Correct identation in block of conditional statements.
> > The function "v4l2_device_unregister_subdev()" depends on
> > the results of the macro function "list_for_each_entry_safe()".
> > 
> > Signed-off-by: Aline Santana Cordeiro <
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > index 0295e2e..6d853f4 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > @@ -1178,7 +1178,7 @@ static void
> > atomisp_unregister_entities(struct atomisp_device *isp)
> >                 atomisp_mipi_csi2_unregister_entities(&isp-
> > >csi2_port[i]);
> >  
> >         list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs,
> > list)
> > -       v4l2_device_unregister_subdev(sd);
> > +               v4l2_device_unregister_subdev(sd);
> >  
> 
> It's really more common to use curly braces for list_for_each() one
> liners.
> 
>         list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs,
> list) {
>                 v4l2_device_unregister_subdev(sd);
>         }
> 
> regards,
> dan carpenter
> 
Thank you for warning me.
I'm going to send a v2 adding the curly braces.

regards,
Aline

