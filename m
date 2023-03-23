Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B070A93A;
	Thu, 23 Mar 2023 15:33:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p34so8799776wms.3;
        Thu, 23 Mar 2023 08:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679585589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWzV0wqw+QUny4vBuf5noKBzVlSQvYul3BLsErs4wPs=;
        b=nE70CcOnpzRtcFP13268W5ddUTDmrfyKgTYgcKyXf4G0CbtV++YOUP/KCwFhdfmP5R
         4ZziXvOQgb/4PUV+pXLiYcrP6yg1rIj31gP/ubaSTHC4Lv4mn8HMh4RXvLrVIxXYz0Jg
         UbaYTGWVi54ue1d8oJ01pvlXV5ZZYw5VufHkCFVl57ZRtImHEeTjKycnYAFZqmxmhIZf
         Fxcr/gncrhWrtRXORHBg/By6zWUecEYw9xfJ0qLn7Uc26lR6n+maSmMFXxrmyq6VPIFf
         ichPFeaEVTZHGgirQIOZ1lvUDZcr8NMDcjYNkCw7csmyNAg1TNRdizftmuCmzoqLbP4u
         8Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzV0wqw+QUny4vBuf5noKBzVlSQvYul3BLsErs4wPs=;
        b=n2Y6NK8HaVKI6hsqsodGEhDKk/carXimXZ/3UeaTt9/UIr743zgYU0HUk2f6gzX/6t
         CaoAV/uojwusy+wjll52EhcpcmnUeo1vjHhjKonMQaTQ8xVvhfH5kk90dlBhuIm0jyIh
         5xmcmdcOK8W9p6RjWtbwBzhZpcao2Auzc0xTM4ZxMguGcMnG9BfVesOcxZZQl0w+GuAI
         p0cf/Mr2RBsOXSPfzSQkfNTEFIrOMe1f98iFUJzbZRdtj0FYVMDUE1XBScJWjGHwyw+S
         kH5V4SPTZPfq92Y44jvRnO7kxNEsY31YDmbx3pDQvhauWbyKG/Cl8D029d29JDrXGPu1
         DRNA==
X-Gm-Message-State: AO0yUKWwrQay3pH4qFV9a0xfx/YjHkebA7otsvmN6ewT/Bg/3EaOE14u
	R+rF4WCwELPmyQIy5B7vWV4=
X-Google-Smtp-Source: AK7set89KBo8ssPJsdn4bRr4WqiRqjZ4Kh/DGgxbByNflaFDjX3IHnAB/41lzTxcVsOZJMZOMPe8oQ==
X-Received: by 2002:a7b:cb95:0:b0:3d0:6a57:66a5 with SMTP id m21-20020a7bcb95000000b003d06a5766a5mr112087wmi.0.1679585589075;
        Thu, 23 Mar 2023 08:33:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j20-20020a5d6e54000000b002cea8664304sm16292368wrz.91.2023.03.23.08.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:33:08 -0700 (PDT)
Date: Thu, 23 Mar 2023 18:32:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
Message-ID: <1973548d-e76e-4512-bed4-792c95b59c12@kili.mountain>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
 <alpine.DEB.2.22.394.2303231408000.2866@hadrien>
 <alpine.DEB.2.22.394.2303231408410.2866@hadrien>
 <090ee842-46d0-4f35-bf00-68a3e1393b72@kili.mountain>
 <ZBxu5RBG9kCRlwRB@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxu5RBG9kCRlwRB@khadija-virtual-machine>

On Thu, Mar 23, 2023 at 08:23:17PM +0500, Khadija Kamran wrote:
> On Thu, Mar 23, 2023 at 04:34:43PM +0300, Dan Carpenter wrote:
> > On Thu, Mar 23, 2023 at 02:08:58PM +0100, Julia Lawall wrote:
> > > 
> > > 
> > > On Thu, 23 Mar 2023, Julia Lawall wrote:
> > > 
> > > >
> > > >
> > > > On Thu, 23 Mar 2023, Khadija Kamran wrote:
> > > >
> > > > > Fix several cleanup issues reported by checkpatch.pl in module
> > > > > staging/rtl8192e in file rtllib_rx.c
> > > >
> > > > Why is it resent?
> > > 
> > > OK, I see, sorry for the noise.
> > 
> > I'm still confused...  :P
> >
> 
> Hey Dan!
> 
> Sorry about the confusion. I sent the last patch with the wrong email
> mistakenly. It was causing following warning as reported by Philipp,
> Checkpatch:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Khadija
> Kamran <kkamran.bese16seecs@seecs.edu.pk>' != 'Signed-off-by: Khadija
> Kamran <kamrankhadijadj@gmail.com>
> 
> I resent this patch with the correct email address. I hope I did not do
> this wrong.

It needs to be v2: resend from the correct email address.

When you send a patch a second time that always needs to be explained
because we don't remember all the email we get.  The v2 information is
really interesting as a reviewer.  Maybe I am wondering, "Did I respond
to the original email and is my complaint fixed?"

For RESEND patches it means that the first patch was perfect but
something broke down in the process.  Maybe a maintainer was on vacation
and accidentally ignored the patch.  If Greg asks you to resend
everything that's a kind of breakdown in the process as well, but just
add that information in the patch "Resending all the most/ patches
because it was confusing which one were supposed to be applied".

That information is super interesting because it shows we are all on the
same page about how to go forward.

regards,
dan carpenter
