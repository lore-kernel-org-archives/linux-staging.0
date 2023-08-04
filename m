Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1ACA45
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 14:11:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so20808105e9.3
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691158292; x=1691763092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X1UhfyzqErwyARy3ZjxeZMXBE+O3bFg49PiyTBLXTwM=;
        b=Kx7miEAt8gm9FawwLxEOOBc56ziZ68HltOiXkWyPjxbWNSxDfr7S5Z3pgjHIuhW8Nm
         yx4RKIg30GWdTw9iNDw9LdRAUc6BHUQh5Cw75kO8aX/kVlTf9nfdmxTNkbsodTlMxnco
         hDz+BDAv1HeA0vuR+IfxEqJOtfRk1EKmh5/J+0atqtktUMO8NnOjbfG75sfhJTj+Jxjk
         sYZ7jbALvR00MW1UoL/q+e29WrVlh5h1bI+20KYzXsqGLZQitIXttYlKXXQIH58nyGCO
         flCCBIopVEgoCU4Q3CuLyzGXPhrJIKwab77tBt4AcEscytZgEAqjlIokt4tqYFfFOdNW
         MLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158292; x=1691763092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1UhfyzqErwyARy3ZjxeZMXBE+O3bFg49PiyTBLXTwM=;
        b=LBzEJCtfsYWj2S+pHi+ClLixA0yOCVHDQFI0rNlqmgKdbQgpahj3YMjs2HFG0j32rf
         o5mqCzEjU8pB7ekqAy6N75IVg8C5qELjpEoiQCPcrKBEWqu+yTw2FZbt3UezuceI2D2Q
         DQxRh/+V3UE0zkvBD1UulTJ6K6ufSSXT8CA6s1TKPy+Fp2b7YSQHY6LDuo3akGbUagw7
         ZXziPBJM16+EHvfSlxvjW7zIEuUvqD74RuyYELqVvHgE9c7FfnV+Jmfp7Amxvx0mY1pQ
         Klebf/cZiBBbWuExD9tAgHZV0kiyZs7Uv/3ewKL1tcjkQmeeCAWy7sI9ypN/nZL+IO3q
         lp9A==
X-Gm-Message-State: AOJu0YyI5n+TQPtR3B79upBswNp6wNyWLuZlk9JmG1nHAf+FTWi+P0IZ
	kpBSGt6Hy3TB3+gW7px8ecXf3Q==
X-Google-Smtp-Source: AGHT+IF3fRFhZpyu4dlAPamPT3WzVNrF3/XaynEFnkTut7pG66RAATJh94SMi92NKjec8QdzWVAr/g==
X-Received: by 2002:a7b:c453:0:b0:3fe:22a9:900 with SMTP id l19-20020a7bc453000000b003fe22a90900mr1687241wmi.3.1691158292165;
        Fri, 04 Aug 2023 07:11:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z22-20020a1c4c16000000b003fbb25da65bsm2467374wmf.30.2023.08.04.07.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:11:31 -0700 (PDT)
Date: Fri, 4 Aug 2023 17:11:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexon Oliveira <alexondunkan@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, martyn@welchs.me.uk,
	manohar.vanga@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vme_user: fix check alignment should match
 open parenthesis
Message-ID: <b051dc81-c863-4a82-bb60-2fe022d116cf@kadam.mountain>
References: <ZMkwA8TnMBAgPRgR@alolivei-thinkpadt480s.gru.csb>
 <2023080424-mantra-stagnant-a912@gregkh>
 <ZM0GKETT/sQjN3GH@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZM0GKETT/sQjN3GH@alolivei-thinkpadt480s.gru.csb>

On Fri, Aug 04, 2023 at 11:07:36AM -0300, Alexon Oliveira wrote:
> On Fri, Aug 04, 2023 at 03:23:17PM +0200, Greg KH wrote:
> > On Tue, Aug 01, 2023 at 01:17:07PM -0300, Alexon Oliveira wrote:
> > > First patch was intended to fix all "CHECK: Alignment should match open parenthesis",
> > > but added new warnings in the process. This patch is intended to fixed them all,
> > > on lines 133, 142, 144, 145 and 173.
> > 
> > Patches are stand-alone, we have no idea what "First patch" is.
> >
> 
> That was just me being verbose and given more details related to the
> v1 of this patch. I apologize. Nevermind that. What is worth is below
> the ---
> 
> > Please look at the commit log for this file, or for all of
> > drivers/staging:
> > 	git log drivers/staging/
> > and get an idea of what changelog text should look like.
> > 
> 
> ACK. So the correct changelog should be:
> 
> staging: vme_user: fix check alignment should match open parenthesis
> 
> Fixed the following as reported by checkpatch to adhere to the
> Linux kernel coding-style guidelines.
> 
> Changes in v2:
> - Fixed CHECK: line length exceeds 100 columns, noted by Greg KH and Dan Carpenter
> - Fixed CHECK: Alignment should match open parenthesis
> - Fixed CHECK: Lines should not end with a '('

This v2 changelogs go under the --- cut off line under the Signed-off-by
section.

> 
> Changes in v1:
> - Fixed CHECK: Alignment should match open parenthesis

No one is going to NAK your patch for saying this but to talk about
changes in v1 doesn't make sense.

The new patch will be v3.

regards,
dan carpenter

