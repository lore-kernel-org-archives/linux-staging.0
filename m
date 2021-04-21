Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98D71
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 10:19:48 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id i190so28322149pfc.12
        for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ylladbiTopcCyoXO4jOFp9Ii8KfnOOHraMMblBLFicM=;
        b=OWDsWwBDAuF4SIvUrvFW4ufmity0sndjZWQGhx5mx6GCYXWfZ4Lcff8XElWixG4GgE
         QP2uWUk8pHXCPXc3xwXUGbErmvvz+QdYd877e7oz0ZAuj7qIVWtVDrA3PYWD1xvxqww7
         lfgQ7T32Q/H4adFj/cNihWU1ThFj0WiD2VBwBapW7h4ugEwNiVb9R11l2FuwEaFODTt5
         OIOuw/gR+5UYGlTZlmoIpD77tjfJ/Btfnzlw4logMWCDbz8PLn4UkFSZfRO/8RTXTETk
         w3F0CrUdKPi/7Fx6fxlkYZYYQzFiJFtpxSLzHR2wBpmq/O7ehw/cks2M/q1JNCbr0kmJ
         +etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ylladbiTopcCyoXO4jOFp9Ii8KfnOOHraMMblBLFicM=;
        b=AaYIPaK/QDGhT6dSZ59F8mbs/Eu2rpDV2CgwqYawIJcvjZg4HCAgfa/JMqTWAvWt7t
         Dx75UVctbOJ13SP7kPHpFQXz2dnwEKAtKR1K8iEyeeCfgfc4PJwwTzIPFx6cnxEkUAzE
         isC6jXBmKn9SQ2GcivqAxHi9gMcdEfW2AHThBw2ziSRlWOhRYObE2JEOPGkLnAd6KaaY
         8fJKUagH4RH5ohZUMmILgo58RK6UVi4fPv4iEIEhGE0U89cNwYiv8jIckAfVwgkT9v6c
         FzZBsse4Cw6YgWueLBKwuGviz/maa9NeGTZodQJIBS+rFB7LnW4NvCchTj1XEaFuvQ/G
         tM/Q==
X-Gm-Message-State: AOAM532irZuJf5BH8d6LNWLpPeeLgZbw3rP5P71IfIIgn4i61cPgqJS4
	2Wz8uHYmg+FyFDPr48ddbNY=
X-Google-Smtp-Source: ABdhPJw4ERkZzW1Qx0BYp+QfkfKbY1lNtKYZRzKP4OPU+utmZIW7QnMojPCClgnRp4iv6m/7G4j6Tg==
X-Received: by 2002:a17:90a:8548:: with SMTP id a8mr10210512pjw.48.1619000388351;
        Wed, 21 Apr 2021 03:19:48 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id y193sm1488278pfc.72.2021.04.21.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 03:19:48 -0700 (PDT)
Date: Wed, 21 Apr 2021 15:49:42 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] staging: media: atomisp: improve function argument
 alignment
Message-ID: <20210421101942.GB216321@localhost>
References: <cover.1618859059.git.drv@mailo.com>
 <9b517e04d1a9b56dc14494a246d70915d51b1839.1618859059.git.drv@mailo.com>
 <401d7d5a-70b7-3443-8612-eb4812e22af1@xs4all.nl>
 <20210420171943.GC193332@localhost>
 <2b4bffc8-7851-45aa-eb64-8f8d2d5928eb@xs4all.nl>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b4bffc8-7851-45aa-eb64-8f8d2d5928eb@xs4all.nl>

On Tue, Apr 20, 2021 at 10:59:16PM +0200, Hans Verkuil wrote:
> On 20/04/2021 19:19, Deepak R Varma wrote:
> > On Tue, Apr 20, 2021 at 03:24:32PM +0200, Hans Verkuil wrote:
> >> On 19/04/2021 21:12, Deepak R Varma wrote:
> >>> Improve multi-line function argument alignment according to the code style
> >>> guidelines. Resolves checkpatch feedback: "Alignment should match
> >>> open parenthesis".
> >>>
> >>> Signed-off-by: Deepak R Varma <drv@mailo.com>
> >>
> >> WARNING: From:/Signed-off-by: email address mismatch: 'From: Deepak R Varma <mh12gx2825@gmail.com>' != 'Signed-off-by: Deepak R Varma
> >> <drv@mailo.com>'
> >>
> >> Which email should I use? Ideally you should post from the same email
> >> as the Signed-off-by.
> > 
> > I am really sorry for this. I was trying to set up mutt to handle both
> > my accounts and guess that led to this issue. I will resubmit the patch
> > set with the appropriate email match. Will that be okay?
> 
> It is sufficient to just let me know which email I should use. I can edit
> it so it shows the correct author email.

Hello Hans,
You can use drv@mailo.com as the signed off email id.

I have received feedback on other patches of this set, so I am going to
resubmit the patch set v1 from the correct email ID.

Thank you,
deepak.


> 
> Regards,
> 
> 	Hans
> 
> > 
> > Thank you,
> > deepak.
> > 
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> ---
> >>>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
> >>>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
> >>>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
> >>>  3 files changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> >>> index 2b71de722ec3..6be3ee1d93a5 100644
> >>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> >>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> >>> @@ -192,8 +192,8 @@ static int __gc0310_buf_reg_array(struct i2c_client *client,
> >>>  }
> >>>  
> >>>  static int __gc0310_write_reg_is_consecutive(struct i2c_client *client,
> >>> -	struct gc0310_write_ctrl *ctrl,
> >>> -	const struct gc0310_reg *next)
> >>> +					     struct gc0310_write_ctrl *ctrl,
> >>> +					     const struct gc0310_reg *next)
> >>>  {
> >>>  	if (ctrl->index == 0)
> >>>  		return 1;
> >>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> >>> index 78147ffb6099..6ba4a8adff7c 100644
> >>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> >>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> >>> @@ -171,8 +171,8 @@ static int __gc2235_buf_reg_array(struct i2c_client *client,
> >>>  }
> >>>  
> >>>  static int __gc2235_write_reg_is_consecutive(struct i2c_client *client,
> >>> -	struct gc2235_write_ctrl *ctrl,
> >>> -	const struct gc2235_reg *next)
> >>> +					     struct gc2235_write_ctrl *ctrl,
> >>> +					     const struct gc2235_reg *next)
> >>>  {
> >>>  	if (ctrl->index == 0)
> >>>  		return 1;
> >>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> >>> index eecefcd734d0..aec7392fd1de 100644
> >>> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> >>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> >>> @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
> >>>  }
> >>>  
> >>>  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
> >>> -	struct ov2722_write_ctrl *ctrl,
> >>> -	const struct ov2722_reg *next)
> >>> +					     struct ov2722_write_ctrl *ctrl,
> >>> +					     const struct ov2722_reg *next)
> >>>  {
> >>>  	if (ctrl->index == 0)
> >>>  		return 1;
> >>>
> >>
> 
