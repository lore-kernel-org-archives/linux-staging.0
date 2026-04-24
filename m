Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC6438AC7C
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023749; cv=none; b=e6hMExFfj19wP8KdP8qSZv8vf5kYo0N66EnYw319egmSPcYAylFOm4qg26qoQe0o+JNnGnG+V51nuHYo8ADgiN6rxmHopd9FndembPGnZqGGFVmCqtGe+EaAn27Ytrj08nLGElPZzBVy4kXdDZa03Gs8+cOC+K3sYaqOJZXFYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023749; c=relaxed/simple;
	bh=hDYc1MW6S1MSpliI1TbPg+1F6w7TIPay6jp2YVrMVdc=;
	h=Message-ID:Content-Type:MIME-Version:Subject:From:To:Cc:Date:
	 In-Reply-To:References; b=UJjH7/9RflHYAVitrbLbz+gjvMS06jS9riNDwItbLQt8EmrFb58XESwLRa/CVu4WQD6fmzsH0yjU0RZO3NajKzBz/G4xNl6aNDaI5cBNq46CfDnP5RQn6W3JYAj2IBSJG7cbDdD274k6QC9sRY+0w39ed+IASfgpZJMgrl06jsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B47jp+Gu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B47jp+Gu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d77f60944so5934187f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777023746; x=1777628546; darn=lists.linux.dev;
        h=references:in-reply-to:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDYc1MW6S1MSpliI1TbPg+1F6w7TIPay6jp2YVrMVdc=;
        b=B47jp+GurLj/bdczgGYZaxOJpIb8jxwtOYXS/XmlYGjqnoaWRNh++Ok7shD/jbjwL5
         8X+I0TMqTzmmEG2z5GeN+NK/pWjol7w5cD/mync5tAzM8luA+qRo+rPDKjDpIFqtjmVr
         FMv2J4dePYMvaz3bcOrAWT2rzGZNAqxeLae1miFGzd7rac4LU68Rdw550NxUxwxkqGrq
         5LjrgVjQTh/NUeXjpt6Y/W7+x0coU+Tx6q3v8DvUVwxaQkZXUAEcUb86i9MEOmlr5v50
         jEvNMA90s1a8QqcOjWHTRp5NEeqX73yRTPI6uCpcjWTlwROjbH+gJg6VjYoR1DkihOQB
         3mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023746; x=1777628546;
        h=references:in-reply-to:date:cc:to:from:subject
         :content-transfer-encoding:mime-version:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDYc1MW6S1MSpliI1TbPg+1F6w7TIPay6jp2YVrMVdc=;
        b=hk+q0vRm0+2MJvFut8yXuoj2bmRCA4flBpuj0ssZsEx2cuWdmWq0cmZmHkVsq04B33
         XJmTSz2UtdibCUQKpJV9P7JdMqzPsKO04vMhBkHm8rPwDilDUE+HR+LMmbJrANfsWahS
         2SYiGBdaQP7aBn/XdKUMN0n95RhenXuP9ePPAagdJRic5NUFO9tz1u5HFBBUXlY8LZm0
         nBuLUDPSPXMY65aFgac75jcj/93xBJBCOLfxaVNxgrMaPFTdX5uU+S7kR/la1HrVzBom
         D+HFZ+rXfwBTN5cadeEgiFD59oJXY5QSqJyHDa4RDT+vej3Md8ThGskNGIOk4XJPy34o
         3UfA==
X-Forwarded-Encrypted: i=1; AFNElJ/aNi0k8fzDnr8CPjn8tDsZk0mex1cCej/EpwI6NVM/Dh5gYnQxwpE/rD8UU38E2sqhS/xRN6s/lrN6gpIm@lists.linux.dev
X-Gm-Message-State: AOJu0YzjXScmDV4y+uBglNgHdBuXfe60nV57GBb2Hi6+J6dPOZbpnjTN
	/zjHJ9BODcv4sDDpbCn9I3GJ8EQ1DSveBWL6NdYZr71r+VKahV85MZwe
X-Gm-Gg: AeBDietYfhUrce6bLRd3paEdSeKsuWxpJPnE7QlXDy+btYRrWR3EWvmiN18bV3NrNZb
	V9dZick2L0prgyaLeTS4Bsi4LoP/AMLDmHPoLjIEwWdGDX8zMfbA9hDF7wa7lNEwzmPHWLsmbUA
	RsFpc/SKlbf+CeguU9nDucTkJrAxFKV+iOLOvsI1XfhSLe5l13SY+5mmF1nLikKvr4VRZ1kJQ8E
	VJAeLPPRPIlu79fhdptcl/PBYZE3ccJnT5wYP8ouXHFz9TlqJTCb3aPIuBj10S2yD+sJwl9D4te
	RazK14KdqIqYIj36oyPSBnncaBy01nbPxwIM9hXKt9HiqwTuQdiuJTmzfTk/mtGnFY7+CrO/haG
	cP02pNnRrRqU3SKQjkIr5a5K1gvToXSVw/ULfArBBiCwKvj4qAJXy1AoHT8kaPDnZeB4KKfHMtI
	mrkDaguQS+UOgpM50wryqVp/SBQ/cTVwMvkgSwpj9BRdhEkCeWjcHhbtv8fizHQwuOyYynXeH62
	Ulcg61ppPeJiUIIWRx8n60/aLMOFMIdQnE9o2J5YiN1muL2ONfygi2TCCAHs936xFiY
X-Received: by 2002:a05:6000:2303:b0:43e:b020:f8a2 with SMTP id ffacd0b85a97d-43fe3dd5208mr45925335f8f.19.1777023746069;
        Fri, 24 Apr 2026 02:42:26 -0700 (PDT)
Received: from ahossu.localdomain ([5.14.131.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44123d23e0bsm19540453f8f.15.2026.04.24.02.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:42:25 -0700 (PDT)
Message-ID: <69eb3b01.5d0a0220.3c3ebd.f35b@mx.google.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] staging: fbtft: fbtft-bus: replace function-defining macro with concrete functions
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 24 Apr 2026 09:40:48 -0000
In-Reply-To: <aes6JY3Ht6p1VpFa@ashevche-desk.local>
References: <20260424092818.3322248-1-hossu.alexandru@gmail.com> <aes6JY3Ht6p1VpFa@ashevche-desk.local>

On Fri, Apr 24, 2026 at 12:38:45PM +0300, Andy Shevchenko wrote:
> I'm not sure this patch improves the code. What I see it's harder to follow.
> NAK.

Fair point. Three near-identical functions hide the pattern the macro
makes explicit. I'll drop this approach.

If there's appetite for a minimal fix, I can send a v2 that moves
EXPORT_SYMBOL() outside the macro body only, leaving the function
definition untouched. Otherwise I'll leave it as-is and wait for
Greg's take.

Thanks for the quick review.

Alexandru
