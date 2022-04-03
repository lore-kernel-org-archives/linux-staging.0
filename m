Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB31B1FC8;
	Sun,  3 Apr 2022 13:50:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id b21so2218858lfb.5;
        Sun, 03 Apr 2022 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rH+nD+w/YAEr4Mpti0uLenxNEyIksOqvfR5bkd8T8k8=;
        b=HJnZ2bnWwobk856WqtLSSDhke48sE9iRsOb7r9XO4eD2yYUNJx81OuYzYsUYyb2npK
         qvf/6YYvlFP4GkV28Hcz9tCPBVXIPM/OohUl+gtdXYsqELGcrDSfcmCN+FfDb/HiJ4w8
         tVsjYZ4JW8RTymUt3dc9QOGn685aMYFSr2pNQB4l3GJIWZMF+SvsrMLHJDCF07Tjg74t
         cHVJkcFgjrq4haSPS3tsUspBseH2OwFnONqQFGpk6qdiRzWDW6dsojuKqluD/RafWZfw
         oqe6m63DesbITmx7ED64WnYcRhxVVqxd1Es88K5llqFj/l0B4P+6dfFp78Pka/ch8+gu
         /Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rH+nD+w/YAEr4Mpti0uLenxNEyIksOqvfR5bkd8T8k8=;
        b=AQxbSgDLx+1R++7dn6yop8EJ9TSpx7+PgLuKZtdegEo5DI77X+SuQ+hIsiWPqNESCW
         KfWJVl+65csBijBy2pVVMvuUP/cl9kWpuhb+3Tm5DwPNFd1T4fh/5JwGA8hDungxz3ls
         nxXHwhJ4oltAo6AaEGrFMJHYFut5bFf1KyjUtbkD418MUrFp3wHCDpuU39tIar8bdHK1
         AQOh6vkG3n1uznN59Himz1UrBE5JtFQI8GOIU4G4/UC4otWEswiwbfcHWRcnby5RP7Jy
         hgfRuJd1sq53N0gxKFH+wLlWemf6INK7yTFJrXVvjZW4cTK04F5+htauHhf25Uav0Diz
         R3WQ==
X-Gm-Message-State: AOAM5316Fg5MhA/yNnHGOhFwcrQ48OADaORAYSCiGFQ8jOob8ftaOtLS
	6WU2mrD0YkzChJR0qBOPhmAjSR+z6HK6SF/PAj4=
X-Google-Smtp-Source: ABdhPJxuBZeu9WHR7ugNIX/VHjhJH161cvXJSa5sMBesGNqIU6sQah7GDaBBbHMgYHZpTrzJVLOX/N5gHX49nSrKKjY=
X-Received: by 2002:a05:6512:3c93:b0:44b:4ba:c334 with SMTP id
 h19-20020a0565123c9300b0044b04bac334mr740681lfv.27.1648993841812; Sun, 03 Apr
 2022 06:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220401114635.GA567659@euclid> <YkdvzIyz/WGlm2uy@iweiny-desk3>
 <20220401224619.GA71483@euclid> <YkgTpS+pzhWPgVIh@kroah.com>
In-Reply-To: <YkgTpS+pzhWPgVIh@kroah.com>
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Date: Sun, 3 Apr 2022 09:50:30 -0400
Message-ID: <CAMWRUK4A2DKTaJFhT6b93OjKii=51A9eVKdD3Oov1uTqug9Ttw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: simplify control flow
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ira Weiny <ira.weiny@intel.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 2, 2022 at 5:13 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 01, 2022 at 06:46:19PM -0400, Sevinj Aghayeva wrote:
> > On Fri, Apr 01, 2022 at 02:34:04PM -0700, Ira Weiny wrote:
> > > On Fri, Apr 01, 2022 at 07:46:35AM -0400, Sevinj Aghayeva wrote:
> > > > The function iterates an index from 0 to NUM_PMKID_CACHE and returns
> > > > the first index for which the condition is true. If no such index is
> > > > found, the function returns -1. Current code has a complex control
> > > > flow that obfuscates this simple task. Replace it with a loop.
> > > >
> > > > Also, given the shortened function body, replace the long variable
> > > > name psecuritypriv with a short variable name p.
> > > >
> > > > Reported by checkpatch:
> > > >
> > > > WARNING: else is not generally useful after a break or return
> > > >
> > > > Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> > >
> > > Wow!  Nice find!  This is a huge clean up.  Extra kudos recognizing that it is
> > > not just the else statement which is broken here!
> >
> > Thanks! It took me a while to realize what this loop is doing.
> >
> > > The only issue for the patch is that I don't see any maintainer emailed?
> > > However, I don't see a maintainer listed in the MAINTAINERS file so ...
> > >
> > > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> >
> > Thanks for the review!
> >
> > Greg, please do not apply this yet. After I sent out the patch, I
> > noticed the comment at the top of the function:
> >
> > /*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
> >
> > So I did a git grep to find the original function and fix it as well,
> > and it looks like there are three copies of the same function in
> > different files:
> >
> > $ git grep IsInPreAuthKeyList
> > r8188eu/core/rtw_mlme.c:/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
> > rtl8712/rtl871x_mlme.c: * Ported from 8185: IsInPreAuthKeyList().
> > rtl8723bs/core/rtw_mlme.c:/*  Ported from 8185: IsInPreAuthKeyList(). (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.) */
> >
> > I will later send a v2 patch that replaces all of them.
>
> No, please do one patch per driver.  These are all different drivers
> (cut/pasted from some original source), so this patch is fine as-is.
> You can make 2 other patches as well for the other drivers.

Sure, will send two more patches.

Thanks

>
> thanks,
>
> greg k-h



-- 

Sevinj.Aghayeva
