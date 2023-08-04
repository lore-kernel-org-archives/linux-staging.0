Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A86BA4F
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:16:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bc9254a1baso1836544a34.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691158575; x=1691763375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/lLUU1T0uoHqGolc81tHD/pjmtqyTHJJRjElymsdnq4=;
        b=hvoLusLzwB/D+BqCeL/7hT02TY04C9T44wMDHJCADi5DvcEwFwu58OktRv7Ma9LqRY
         x9DvWPZ1XX3pC4O2oTSq3eHSk6RL8caGskIyY180XFzfM5hJe0u0EdS7AkfhUrSYnPCG
         AAwoWsv5YfcIW+R8SX8bMc5vudzrVXEvInh3PB+hCzdEMXOm0lM7phBvWVt2qWX7hgpy
         c5+SZd4uWH/NwCPYh+xWg92evtVGNAs6YaQT043AA0i5IwzqA+bNH+y0Uof932HUI0ws
         07AIgvah4eppoYsBm4I4v4ImsVdt5kHVL+nN/lxgWIAliur/3A9wB6KNWo6Vix9o4jPW
         hzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158575; x=1691763375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lLUU1T0uoHqGolc81tHD/pjmtqyTHJJRjElymsdnq4=;
        b=V5Tx1Kg3LaIJAijhbyUMhnDuPy8s99wNvgFhnbPafoCu5DARLqljAOdJviCqhL3Ppv
         EIwfJxObce7ss0RY7VoF1i0IicEkun1TYHqhfGlsmHwdBl6a5DHwiVoGq8yiiVDNtjMK
         7SZxDRpl3AjG11UrzDAGahrIHuZXQp12SGDFfu6a1jKIw/Ekf/QUCd/sW0zf5+QvcbDl
         Pzb4PKdHo8TUBBf+v9UK+BOZft5Urb012gTJzAV6chrCnI6cvR3Q4kCjXoL00A61NSHp
         7NUFpInpk2DQ1ZDxtLtqnG4GftaicyvGahUhSg7dQUfFmCHq2JeUhBClLFFaWnuDRqNM
         US4Q==
X-Gm-Message-State: AOJu0YwuDLOb9eVFtWx5N+q15Az5JtoWNVQE4RNyKczx5VuQTJUjSF6Y
	11opEDKbEHKa2QMZkyYzSik=
X-Google-Smtp-Source: AGHT+IHOiCQogIUGea1ukDtrwuTqbyGTDjFI5cGcI/JC5bWPTPcmbdc6XB1qkeCZw+OgA51NRsYRfg==
X-Received: by 2002:a05:6830:1e86:b0:6b1:604f:3f22 with SMTP id n6-20020a0568301e8600b006b1604f3f22mr2522112otr.2.1691158574778;
        Fri, 04 Aug 2023 07:16:14 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id c18-20020a9d6852000000b006b8a2cd44adsm1129724oto.72.2023.08.04.07.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:16:14 -0700 (PDT)
Date: Fri, 4 Aug 2023 11:16:09 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <ZM0IKe4S/awAI1Jk@alolivei-thinkpadt480s.gru.csb>
References: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>
 <2023080424-mantra-stagnant-a912@gregkh>
 <ZM0GKETT/sQjN3GH@alolivei-thinkpadt480s.gru.csb>
 <b051dc81-c863-4a82-bb60-2fe022d116cf@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b051dc81-c863-4a82-bb60-2fe022d116cf@kadam.mountain>

On Fri, Aug 04, 2023 at 05:11:29PM +0300, Dan Carpenter wrote:
> On Fri, Aug 04, 2023 at 11:07:36AM -0300, Alexon Oliveira wrote:
> > On Fri, Aug 04, 2023 at 03:23:17PM +0200, Greg KH wrote:
> > > On Tue, Aug 01, 2023 at 01:17:07PM -0300, Alexon Oliveira wrote:
> > > > First patch was intended to fix all "CHECK: Alignment should match open parenthesis",
> > > > but added new warnings in the process. This patch is intended to fixed them all,
> > > > on lines 133, 142, 144, 145 and 173.
> > > 
> > > Patches are stand-alone, we have no idea what "First patch" is.
> > >
> > 
> > That was just me being verbose and given more details related to the
> > v1 of this patch. I apologize. Nevermind that. What is worth is below
> > the ---
> > 
> > > Please look at the commit log for this file, or for all of
> > > drivers/staging:
> > > 	git log drivers/staging/
> > > and get an idea of what changelog text should look like.
> > > 
> > 
> > ACK. So the correct changelog should be:
> > 
> > staging: vme_user: fix check alignment should match open parenthesis
> > 
> > Fixed the following as reported by checkpatch to adhere to the
> > Linux kernel coding-style guidelines.
> > 
> > Changes in v2:
> > - Fixed CHECK: line length exceeds 100 columns, noted by Greg KH and Dan Carpenter
> > - Fixed CHECK: Alignment should match open parenthesis
> > - Fixed CHECK: Lines should not end with a '('
> 
> This v2 changelogs go under the --- cut off line under the Signed-off-by
> section.
> 
> > 
> > Changes in v1:
> > - Fixed CHECK: Alignment should match open parenthesis
> 
> No one is going to NAK your patch for saying this but to talk about
> changes in v1 doesn't make sense.
> 
> The new patch will be v3.
> 

ACK. Thank you for the heads up. Writing the v3 now.

> regards,
> dan carpenter
> 

Thank you.

Alexon Oliveira
