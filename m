Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA332CA4
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:37 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id i5so9345360uaq.10
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PdULxgeJgX8+A1cdZ258MGjOqiluPf6EFrTzZ37jHOw=;
        b=LZcA3nUGjgfyqBPNVe0WTr7yH6LtHr4pPbD6WPCs7D6agcc5rs++0wOJESRnlBFv/p
         NtHPUripp1I5QlVhAXEX2NH7tSQc5LaqB+DxNuOEgwW6+/XOe24UshOh33xNVDcRfOwK
         06p9PwvzCYyx9PXFPZUyNF8G7IhlC3l1oVaEJM/NDhCqfwY5tGJddN3eDKyGzFuTpHha
         Q+Ox0C/2oUww9ydD0R9PTsghV9q9pVECsMlVXYBpmfoUWuPJsf7EN7XBRef4vqN31Vpx
         9KG2LKj8kYXJ3pQlPIUhLMT897M27KJ1VNV072Wzw/npE/6CdivNqXnd+igCJWPeC/5r
         SHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PdULxgeJgX8+A1cdZ258MGjOqiluPf6EFrTzZ37jHOw=;
        b=juidKya1HydXN4P6epp4jMJvr03sy0YoeDxZxYFKD9B8koNX/GvPZrLcBfDAo+gHDN
         kA9/k2LX17OYjOBJ2Xm6YJd4FPf2ZR7G9V5yjjSCmo6UOc+SM++XDKscXIzKij6KMPrC
         AGoYlDQ0hL53Huc6r2joO1hSuf7LM0pYnjhQSmcTQC1Z1r60KB1rslkrixhIpUwhF2Ed
         fQ8PblUQEzjbPtb9mxgxUQiJj79VpBi/tE855MM1UnFI+9fdQ1D9GL6hhoC0tvr0zOio
         v36bFF6VspCSQgxqNL8WrTWE5d8GMaFUjQqUbvV3Rk9qH98aTSaZkbYCiyV1yU9sgT1l
         uD5w==
X-Gm-Message-State: AOAM5316cMcI3H5NQTXmRI/tA9kJGoy4WmDCc8ZzttSi+QDYE7GuONB9
	q/pjm919VThlPwgxuptxFRE=
X-Google-Smtp-Source: ABdhPJzeQinVyWPndd+8G2FDbxw+Vw/Uya4GsMOkBH0gI97jL36HuA3gU7z3alG7jx8vTazqddpWXQ==
X-Received: by 2002:a05:6102:736:: with SMTP id u22mr21042957vsg.60.1641551796284;
        Fri, 07 Jan 2022 02:36:36 -0800 (PST)
Received: from localhost.localdomain ([181.23.70.139])
        by smtp.gmail.com with ESMTPSA id g4sm2803896vkd.46.2022.01.07.02.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:35 -0800 (PST)
Date: Fri, 7 Jan 2022 07:36:20 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, nsaenz@kernel.org, f.fainelli@gmail.com,
	rjui@broadcom.com, sbranden@broadcom.com,
	juerg.haefliger@canonical.com, rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com, stefan.wahren@i2se.com,
	unixbhaskar@gmail.com, mitaliborkar810@gmail.com,
	phil@raspberrypi.com, len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: Re: [PATCH 5/6] staging: vc04_services: rename macros
 BM2835_MMAL_VERSION and BM2835_MMAL_MODULE_NAME
Message-ID: <YdgXpPS51cWgQY3a@localhost.localdomain>
References: <cover.1641414449.git.gascoar@gmail.com>
 <d450b9e22e5ab335a61591dbf0d2104031c9fc46.1641414449.git.gascoar@gmail.com>
 <YdbzKaKQW7N04QgA@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdbzKaKQW7N04QgA@kroah.com>

On Thu, Jan 06, 2022 at 02:48:25PM +0100, Greg KH wrote:
> On Wed, Jan 05, 2022 at 05:35:47PM -0300, Gaston Gonzalez wrote:
> > In the kernel, all names related to the chip BCM2835 are always named
> > bcm2835_*. To avoid confusion, and to make things more consistent,
> > rename the macros BM2835_MMAL_VERSION and BM2835_MMAL_MODULE_NAME
> > accordingly.
> > 
> > While at it, some realignments were made to improve readability.
> > 
> > Suggested-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> >  .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > index aaf529f2186c..c729b1b7de71 100644
> > --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
> > @@ -33,8 +33,8 @@
> >  #include "mmal-parameters.h"
> >  #include "bcm2835-camera.h"
> >  
> > -#define BM2835_MMAL_VERSION "0.0.2"
> > -#define BM2835_MMAL_MODULE_NAME "bcm2835-v4l2"
> > +#define BCM2835_MMAL_VERSION "0.0.2"
> 
> MODULE_VERSION means nothing when the code is in the kernel tree, this
> shold just be removed entirely.
> 
> > +#define BCM2835_MMAL_MODULE_NAME "bcm2835-v4l2"
> 
> KBUILD_MODULE_NAME provides this, please delete this and just use that
> instead.
> 
> This can be 2 different commits because of this.
> 
> thanks,
> 
> greg k-h
> 

Hi Greg,

Thanks for reviewing.

Ok, will do.

Gaston
