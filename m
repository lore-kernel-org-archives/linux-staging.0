Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370D1FA0
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 20:47:45 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id u15so14683445ejf.11
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 13:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7rcQgXVLFD1ifPCsM+7YOC0F9LP50mMo3rYRPx/Wds=;
        b=EYTOceKt4E9wwgZ/PUoaf35jBIuAzmAY78mR+w0auBLFDLctcJyV+sgTKL3LImFqZC
         TrFSJZVvGJwPzlyaWNxaS5VntdBEmlz6KcR4qXmaFoQ+UTqG6e/FP/KgqMJzD2N7GK/6
         iFEUfD8yaLgtaH6+pfHox4h5mgmWNm5t8StV/c+bkbZIfWZ5GGsDuCvxlaIiY++eYgkP
         Ur0wq/kyb7js7EN4QwlVrQsjAikS2tCxAJC6Dj1+TAZ2PnWdrP6wGfz1ufxkImrjmotL
         gIndnYlEPqAOtQSz7/oViarWt1p1QYp5KlQSdP8b3PE4Kj7Rrh3qI68Ms/l56Ca6mFD5
         kANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7rcQgXVLFD1ifPCsM+7YOC0F9LP50mMo3rYRPx/Wds=;
        b=F+VVtoeYP8pB7pDnY0T5Zqswt12JfgJRO7hFo1vHdx72ITL2XAMZOhlweB2GoYNXXK
         xKGavleYU66fAwBlCCJvIrzB8d+CcB4OgTvyEvrHimdr8uCFk0QXYeIvQULHErZMVQEq
         n/TRycjY7LTpErPz43Ccz7DDsDfzCgtyYfFo5chsgd4UWohsjC4Ue6IfrtdiSlQRq/cC
         CkRE28XiIF/KqCUcXC5bEytnTH46Ji8zw6tJsKtXtMidIRxrFL4DJ9UsXzHw4wXNp8OC
         tGAZG54NPmSEs9YSqltl3IMoP5pPfh+WgGO8iFPgqv3w3CrvmceAQJzsYOUSyE3jJzvF
         qXbg==
X-Gm-Message-State: AOAM533cYcaAHtGV+MsMh2Ll2gxZhsIlL7fiScGbYL6DMNJDwtn3K2dU
	w5c30ju256U+cCRacWwE7FM=
X-Google-Smtp-Source: ABdhPJw2BxtjsVH10kfIVX8oSWB83nTHqOfw96Ed2NBGbvoA+nRCiNCekZq61vfWMFuKxgaP6J8NrA==
X-Received: by 2002:a17:906:a046:b0:6b9:20c:47c1 with SMTP id bg6-20020a170906a04600b006b9020c47c1mr31410731ejb.615.1649710063865;
        Mon, 11 Apr 2022 13:47:43 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id e9-20020a50e009000000b0041cd2e38a3bsm12031094edl.81.2022.04.11.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 13:47:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Liu Junqi <liujunqi@pku.edu.cn>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, Leonardo Araujo <leonardo.aa88@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove D. Kershner from Unisys S-PAR maintainers
Date: Mon, 11 Apr 2022 22:47:38 +0200
Message-ID: <1946842.PIDvDuAF1L@leap>
In-Reply-To: <YlJ3ot74ZwfGx53i@kroah.com>
References: <20220409205857.32083-1-fmdefrancesco@gmail.com> <YlJ3ot74ZwfGx53i@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 10 aprile 2022 08:22:26 CEST Greg Kroah-Hartman wrote:
> On Sat, Apr 09, 2022 at 10:58:57PM +0200, Fabio M. De Francesco wrote:
> > The email address of David Kershner is no more reachable. Remove his
> > entry from the MAINTAINERS file for UNISYS S-PAR DRIVERS.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ba405f6ec31a..3b7497359c2b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20188,7 +20188,6 @@ F:	include/linux/cdrom.h
> >  F:	include/uapi/linux/cdrom.h
> >  
> >  UNISYS S-PAR DRIVERS
> > -M:	David Kershner <david.kershner@unisys.com>
> >  L:	sparmaintainer@unisys.com (Unisys internal)
> >  S:	Supported
> 
> If so, then that means this list needs to be dropped and the entry
> changed to orphaned :(

Sorry, you're right: the "S:" line of the entry must be changed to 
"S: Orphan". 

However,I'm not sure why you also want to drop the "L:" line. I see 
that many "orphaned" entries have their "L:" line still there. 

A couple of examples:

CONEXANT ACCESSRUNNER USB DRIVER
L:      accessrunner-general@lists.sourceforge.net
S:      Orphan
W:      http://accessrunner.sourceforge.net/
F:      drivers/usb/atm/cxacru.c

DENALI NAND DRIVER
L:      linux-mtd@lists.infradead.org
S:      Orphan
F:      drivers/mtd/nand/raw/denali*

I'll send a v2 patch. Can you please confirm that you want me to drop
also the "L:" line?

Thanks,

Fabio M. De Francesco


