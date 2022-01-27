Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B952CA1
	for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 08:57:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id s18so3384092wrv.7
        for <linux-staging@lists.linux.dev>; Thu, 27 Jan 2022 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eOvZPOI7RXFam/ItocxZZVe1bSa9SKQ8eYJgocnt9iw=;
        b=CjCNS1FGFXhJiRwBqKvDeBDBoQKi7s4iefVlGkgV/JlyDZhcXKwPRHlX1sZFEtGimM
         sVJOCWip25O6xTsTZd+dcO5gMdbN9GoiNDYcG0PstSeWM+i9FFCsDEZxifJGWcAl4QgB
         cYPGzqYuizHQaPseEqCSwyDZS0wBj1foMit6V8WN0nShT5gpJKBPxLn3vo0BFdWJbyUJ
         h1PtYlVnVeBoqglrG8pyVweAGbbGwV6cxB9+h5UKhV87e8MxGS/gzI8FwAVDo7Fctp4X
         XKkt8/DXjpo4OqvrmvJDN1JWRiU3QUP3p/qwZ355ZgiYKrda/xDQgvr/yOXQSC4a+4SA
         m3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eOvZPOI7RXFam/ItocxZZVe1bSa9SKQ8eYJgocnt9iw=;
        b=kdIPQnLDm5bkOstX8vG2CCK/jUi/FMR40Gykl7hhbKeXmIPMhccVrU55R5NlNE9wO6
         Sygke8DO7q2OQewovGpaPP3TtpmXe7hNBVARIB6X2h2hWhw0F3Dl0TRmPN9OZ6znA65Z
         yP0CYJP/lGbxUMrf7KyGeXjK04SE1tR+C6fOaKn+/DXkK4JW1OBf/kJESTEWNu3APcik
         Rk7PKhYSAf6DDn4KYy+vP4BizqaKLHuxUsBrYL+VAUDpoTkyfncco8oy7o4Pz5UFecyy
         0WIOGrTZ/6dI5SEaALjKu2g8OhhzWJJNZKISG8TckIo+i/RAaeaOEsn/E2NGPXKWIKRA
         CR8A==
X-Gm-Message-State: AOAM531MIRNYusyyvy62KYJvGzb4U30PzGCPYz1kMMjr6NnjSFrwRLdk
	CcQnNY0vcjBSBBgZa1np+NFaZA==
X-Google-Smtp-Source: ABdhPJwZvxc5A1fW5LuddhyJb0yw8xCGeU8LyE6qh01sDxOX/VKiruuawOrJ0+uN1TuPEj4AdS9LDA==
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr2200999wrm.389.1643273851356;
        Thu, 27 Jan 2022 00:57:31 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id a6sm1554842wrx.101.2022.01.27.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 00:57:30 -0800 (PST)
Date: Thu, 27 Jan 2022 08:57:29 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: Re: [PATCH 10/10] staging: r8188eu: remove GlobalDebugLevel flag
Message-ID: <YfJeebt2/4E6KWhr@equinox>
References: <20220124225032.860-1-phil@philpotter.co.uk>
 <20220124225950.784-1-phil@philpotter.co.uk>
 <20220124225950.784-3-phil@philpotter.co.uk>
 <e63e7a5c-68a8-8160-bc84-b5ecbca6e5cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e63e7a5c-68a8-8160-bc84-b5ecbca6e5cc@gmail.com>

On Wed, Jan 26, 2022 at 11:33:46AM +0100, Michael Straube wrote:
> On 1/24/22 23:59, Phillip Potter wrote:
> > Remove hal/odm_debug.c, to get rid of the GlobalDebugLevel flag,
> > and remove the two other lines that reference GlobalDebugLevel, as
> > the last remaining user (DBG_88E) is now gone. Also modify Makefile
> > to no longer build hal/odm_debug.c.
> > 
> > Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> > ---
> >   drivers/staging/r8188eu/Makefile            | 1 -
> >   drivers/staging/r8188eu/hal/odm_debug.c     | 6 ------
> >   drivers/staging/r8188eu/include/rtw_debug.h | 2 --
> >   drivers/staging/r8188eu/os_dep/os_intfs.c   | 1 -
> >   4 files changed, 10 deletions(-)
> >   delete mode 100644 drivers/staging/r8188eu/hal/odm_debug.c
> > 
> > diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> > index a7a486cc16dd..ecd6fe5bd94c 100644
> > --- a/drivers/staging/r8188eu/Makefile
> > +++ b/drivers/staging/r8188eu/Makefile
> > @@ -10,7 +10,6 @@ r8188eu-y = \
> >   		hal/hal_intf.o \
> >   		hal/hal_com.o \
> >   		hal/odm.o \
> > -		hal/odm_debug.o \
> >   		hal/odm_HWConfig.o \
> >   		hal/odm_RegConfig8188E.o \
> >   		hal/odm_RTL8188E.o \
> > diff --git a/drivers/staging/r8188eu/hal/odm_debug.c b/drivers/staging/r8188eu/hal/odm_debug.c
> > deleted file mode 100644
> > index 7a134229fe39..000000000000
> > --- a/drivers/staging/r8188eu/hal/odm_debug.c
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > -/* Copyright(c) 2007 - 2011 Realtek Corporation. */
> > -
> > -#include "../include/rtw_debug.h"
> > -
> > -u32 GlobalDebugLevel;
> > diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
> > index 959fb6bd25ca..01a7d987d6cc 100644
> > --- a/drivers/staging/r8188eu/include/rtw_debug.h
> > +++ b/drivers/staging/r8188eu/include/rtw_debug.h
> > @@ -52,6 +52,4 @@
> >   #define DRIVER_PREFIX	"R8188EU: "
> > -extern u32 GlobalDebugLevel;
> > -
> >   #endif	/* __RTW_DEBUG_H__ */
> > diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> > index 17249b4fb7ad..8589de487289 100644
> > --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> > +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> > @@ -155,7 +155,6 @@ static uint loadparam(struct adapter *padapter)
> >   {
> >   	struct registry_priv  *registry_par = &padapter->registrypriv;
> > -	GlobalDebugLevel = rtw_debug;
> >   	registry_par->chip_version = (u8)rtw_chip_version;
> >   	registry_par->rfintfs = (u8)rtw_rfintfs;
> >   	registry_par->lbkmode = (u8)rtw_lbkmode;
> 
> Hi Phillip,
> 
> so rtw_debug is unused now. Should we remove the 'debug' module
> parameter and rtw_debug as well?
> 
> Regards,
> Michael

Good point, might as well. Will add this into v2. Thanks for the
suggestion.

Regards,
Phil
