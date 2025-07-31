Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D723ABB4
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753985595; cv=none; b=YInJcYNcb0TY0LEojX9JRlHumTQK9nqrgy37oih/PwB/ILxxCC4JqqsVYRInSValwLtcaz5F4HPKu+xOiplLkakana78f+2ILKLjz9H6cccQpINSDlwn/N6Kpn6h53nsUc6JrbFArqSti5Tufyk388odwuIOm2P+Gq2E4HotF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753985595; c=relaxed/simple;
	bh=wFLSG1Ulab6iKXiKYb5seOCv5xy4H4N4O+mXSaEOb0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDrkj/L5SxEeVXN2llWmqaS2diZCOplywMk8gKb18SXi9FS5f0mVMYvUU4RKuceUMthINf0UDQMh8w13ia4tY6kk+gFnpUZ+DjWbwWLS9S+ecdjRs2qHyoG3GH1ODIh+FLtBTyRmnWq1V2S/j01/ZeFvwvoxktQeVKJ83e8N3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZblhiJw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZblhiJw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso6451415e9.2
        for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753985591; x=1754590391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khPC5CAFWL6Dx66QS31uBvJHhzcyJG/ZzOS5ZJNRudU=;
        b=FZblhiJw0tHFQGnOIVUPeojrDm9LydhszGznV+LBV4MfWDWt7WqnQegRDbeukpLBhG
         kQct6RaiyZtSP05zynWKygfGmZhxikGkgiWklhsUgpgvNU9CoF77E0/DPD9GC1KDVN0+
         adiMCHHuU+aIERw6lmp0XWdPmC0q/DiB41LEB7KZ26OSJZBIoWMZn6/IKrSorcfNccws
         QkyFLrflHDnOB6bLxXntrbkKPC3n8Skd8apuCCQde/+rC7nk9DtUfqbmAXmvp3wi9zKR
         P5pg++nRPXkuIfvb3P6NsKmppKV83LfoJcp6QD2uZ8WVK3pM7YhekTfsPWqlV1g7GWLC
         KsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753985591; x=1754590391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khPC5CAFWL6Dx66QS31uBvJHhzcyJG/ZzOS5ZJNRudU=;
        b=mbqmpeq8RTgGO0m6rhqurs5CWd7MA+owUCqMqMx++PncZ1cfRH3tStmUEHJD3Yzw5A
         p+QaJvU5+hRlLryAElsofCOn/x0BAxuEJfIuDxW+w2VHHyp2eY9TfOzDyPFY2XFKa8j0
         tko5+ZAikLKUk4YiNtNaM9gO3XYh9G2YzVtQRlm0Gsihvv4O/NRS08cVAfAilLCqETHk
         AiBrIyzwoarpcuJP3dge+gMDA/58ITMIy5v8CsH/nx/ferVTHFU90gCXSB4EFQpisXCh
         NUdCGdkQgBGAcrSb4iePjYMmxxLmLKKc5t44hcIpx1EtLvQCqOkmPKnISCX2gJEzW5XA
         46NA==
X-Forwarded-Encrypted: i=1; AJvYcCXKmk3YcdBAGIPbzpkDHiGKKT0/lVhv5ETJTShgyFh/FeYNCg/f8E3y1YjNw6mY3Snpfqm/oRAT8f/MMQxB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+YQdt9lABCJrL6H146RnOZtZomVp0UlZcMw8leoUhXVdOFsBt
	okZpE7+CHc6gWRbPss3fFntbyvhvLVp67F6qhtZG6ptiW5Qum8rYVH4zsEwAO4rCsBo=
X-Gm-Gg: ASbGncv7Tkz+JNh0G6jWNdRz2Z6wfEI+UMcBSBCsir5GZbzy+QesJ8GSwl3EpLdarPn
	JRpLEgT9sPBo8bJiP8zHdUGZFt3eLTk6LKLYLFH0Rs22/PLWQqlixtcdvsH15KIiufFfRfzHTk8
	nuISIFSlaWtfBty+66DPwSjrfemAKvaa0KPZyKCxgWwThXSxMYv4d5uGtGYq2lo/Wgi1RLUBPFW
	+QUj+3QuvpKyDCEBaWoYkkErRKu+RVlO6zy0UqxJwA0FL12zWR/XUZ6PBBWF3lR426mPUw9Bjx7
	zy8zEuXes9x3mQMowE5C+GMqx3+rLmq1Z6n4WnlYnGA9i9h7FiArnR3W7pevuZ+w2doKvdRsisU
	JpoxAjZhE54S89w7UID4Z6rj2TtY=
X-Google-Smtp-Source: AGHT+IHEqCFNhgCLiwP/29jshYubmNscmwnmSCzs+vaDOgyXEAUaqK75fKy7u401XjtvRY2P9tl/Jw==
X-Received: by 2002:a05:600c:6304:b0:456:191b:9e8d with SMTP id 5b1f17b1804b1-45892b9d0bdmr68568855e9.11.1753985590948;
        Thu, 31 Jul 2025 11:13:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536bc34sm73465595e9.2.2025.07.31.11.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 11:13:10 -0700 (PDT)
Date: Thu, 31 Jul 2025 21:13:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [External] : Re: [bug report] staging: sm750fb: Fix polarity
 assignment for vertical and horizontal mode
Message-ID: <ed4c5bce-d252-4d86-9358-65a48214d3b0@suswa.mountain>
References: <20250723192528.77109-1-alok.a.tiwari@oracle.com>
 <dbd2df69-27cc-4fd8-8e5b-78b6872d5d16@suswa.mountain>
 <25636f64-7b15-41d4-9ea6-216c22d84be4@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25636f64-7b15-41d4-9ea6-216c22d84be4@oracle.com>

On Thu, Jul 31, 2025 at 10:03:46PM +0530, ALOK TIWARI wrote:
> 
> 
> On 7/31/2025 9:41 PM, Dan Carpenter wrote:
> > On Wed, Jul 23, 2025 at 12:24:31PM -0700, Alok Tiwari wrote:
> > > In drivers/staging/sm750fb/sm750_hw.c,
> > > the vertical and horizontal sync polarity assignments were incorrectly
> > > ordered.
> > > The assignment for modparm.vertical_sync_polarity was mistakenly using
> > > the FB_SYNC_HOR_HIGH_ACT bit instead of FB_SYNC_VERT_HIGH_ACT,
> > > and the horizontal polarity line was commented out or missing.
> > > 
> > > This patch corrects the logic by properly assigning:
> > > 
> > > vertical_sync_polarity -> from FB_SYNC_VERT_HIGH_ACT
> > > horizontal_sync_polarity -> from FB_SYNC_HOR_HIGH_ACT
> > > 
> > > Please let me know your feedback.
> > > Thanks,
> > > Alok
> > > ---
> > > Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> > > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > > ---
> > 
> > Did you find this copy and paste bug by testing or reviewing the code?
> > How does this bug look like to a user?  Please put that in your commit
> > message.
> > 
> > This looks reasonable to me, but the patch is badly formatted.
> > 
> > 1) It should say [PATCH] in the subject.
> > 2) The body of the email should be the commit message.
> > 3) the --- should only come after the Signed-off-by line.
> > 
> > Try applying your patch with `git am` and review the log to see what I
> > mean.
> > 
> > regards,
> > dan carpenter
> > 
> 
> 
> Thanks Dan. By reviewing the code, I noticed some awkward assignment.
> However, I was not sure about this code, so instead of sending a formal
> patch, I just removed my SB and marked it as a [bug report].
> I will send formal patch with proper SB.
> 

Good eye.  Put "I noticed this in review and haven't tested under the
--- cut off line".  If we apply it and it breaks then we've been
properly warned.  Something needs to be changed, if it's only to rename
the variables or add a comment.  But I think your patch is correct.

regards,
dan carpenter

