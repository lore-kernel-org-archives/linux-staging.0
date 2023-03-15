Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460494431;
	Wed, 15 Mar 2023 12:33:00 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id cn21so44687140edb.0;
        Wed, 15 Mar 2023 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678883578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZjdpphXUkCIeOsAshqqMccwRvEJmRQmkPCnHCBSLVY=;
        b=mN6vTQffkA2oxTCVIyKNb3P7G+VZT3pF6mrlw/VKjz1MiJRrai6M/kWQI4IMOXfyaM
         Vdzsbeoj1aWdTRLI01Gp6XeClUICCJqHQOY69ElR5vo/PxdcWEr17oOiH+XD69pZEiVP
         69kI59clgZFjkJvwj3PeLWjeSIohiFDybI3zSBxjfWuKmlFZhct2KC5EjShq25Mrvo6w
         dpmggolBuhJAj3vEkl0DsvAoCoS9zp8zrqm7BDelGfhUHAo/7r9K614Smp77wH+M1bs7
         d5QXHRTSL3Z+8KdPkcJfmY7q6EqkB9fh+rucSkEKYuuJpptvJuP67KdGkHymlb0aW2en
         Q7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678883578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZjdpphXUkCIeOsAshqqMccwRvEJmRQmkPCnHCBSLVY=;
        b=EFpWf9KORE5Osi6/G5ncFpGQSoQHCWieHIAYBy/JJuEonOR0qNqbyS1jPys/SRFd0h
         tgyl5tes7gThli0gy1SMdnHHJE3/4LEUWotemcRONOBwKeHCqvgSgCO/GJe9MTeQy0H1
         t/um2lMaqwvRrv4N8sMkFAm9Zf20+k7EVHH7Nfnf56oNAwr+P6XoFaKskfYKFa3uIjPD
         ZQuxa9pgo/zuWcOcNOQxJ7LS0FbNhb344Xr6BErWZ8D8zmp+oMfY12/HNDk9eq2SyK+8
         J3q1p6fZs+JNpgUBhQ3ydsSNibJ5mJDhuFZDyJ/3ceY/pM/eldqR0DmUh1osCT3rSkxM
         7j8Q==
X-Gm-Message-State: AO0yUKXizxGg4QzBaqyFbdTPpUlLTHCqxR8mrS7SWM7MQ/J1YOlUJD01
	eB8qpEeeqkeA89WzrQ8uf7I=
X-Google-Smtp-Source: AK7set+JL6cT7QO2X4VH6wWpLr26eoixZuY2wbd1Ws3ljy2d52tkQGrNrsfNnlcLEKnmd9jSzZKdig==
X-Received: by 2002:a17:907:9882:b0:91f:5845:4e31 with SMTP id ja2-20020a170907988200b0091f58454e31mr6633204ejc.26.1678883578321;
        Wed, 15 Mar 2023 05:32:58 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id p2-20020a170906140200b0092be5f60dd5sm2434136ejc.150.2023.03.15.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:32:58 -0700 (PDT)
Date: Wed, 15 Mar 2023 17:32:55 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBG699SriXWy1I2K@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBDcfNOXmGeN2tlb@aschofie-mobl2>
 <3376017.mWHT0XuiSF@suse>
 <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBEJ+8DbhADSBTLr@aschofie-mobl2>

On Tue, Mar 14, 2023 at 04:57:47PM -0700, Alison Schofield wrote:
> On Tue, Mar 14, 2023 at 10:31:21PM +0100, Fabio wrote:
> > On martedì 14 marzo 2023 21:43:40 CET Alison Schofield wrote:
> > > On Mon, Mar 13, 2023 at 11:07:10PM +0500, Khadija Kamran wrote:
> > > > Module parameter, read_timeout, can only be set at the loading time. As
> > > > it can only be modified once, initialize read_timeout once in the probe
> > > > function.
> > > > As a result, only use read_timeout as the last argument in
> > > > wait_event_interruptible_timeout() call.
> > > > 
> > > > Same goes for write_timeout.
> > > > 
> > > > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > 
> > > Looks like this is [PATCH v5] and needs a changelog.
> > >
> > Alison,
> > 
> > In fact, this is only the second patch that addresses Greg's suggested 
> > refactoring. 
> > 
> > Khadija moved from v3 of "staging: axis-fifo: remove tabs to align arguments" 
> > to v4 of this completely independent patch. And then back to v1, because (at 
> > the time of v4) I pointed out to her that she had started working on a project 
> > that has a completely different purpose than the previous one.
> > 
> > The best course of action would have been to ask Greg to drop the previous 
> > patches and then reset the numbering of the new job to v1. Unfortunately I did 
> > not pay attention to how she then managed the numbering following my 
> > observation.
> > 
> > What would be the best course of action at this point?
> 
> My guess is that this patch gets ignored because it has a lower version
> number than a previous patch.
> 
> Take the feedback given here, and rev to
> [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
> 
> Be sure the Changelog, below the --- explains the journey.
> 
> Changes in v5:
> 
> Changes in v4:
> 
> Changes in v3:
> 
> Changes in v2:
> 

Hey Alison!
Based on Nathan's feedback I am trying to recompile and send a patch
without any warnings.
As suggested by Fabio, I am running "make w=1 -jX" command to see if I
get any warnings. But it is taking a lot of time, is there any way of
speeding it up?
If this doesn't work then I have to follow the steps to reproduce in lkp
mail as you said before. 
After dealing with these warnings I will send a [PATCH v5], following
your instructions above.
Kindly, let me know if I am on the wrong track.
Thank you!

Regards,
Khadija

> 
> > 
> > Fabio
> > 
> > 
