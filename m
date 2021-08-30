Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3783FC1
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 13:16:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id me10so31044446ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/eOxZaKGbxmQPslyu0PUS3U6D6ydLmM18aPAdUZtRfg=;
        b=sTIEy6k8cD913yMcDMqoAFe5WNTGIfMnlYr8X/PTgSqIj6c/tNIL6vrOU09WJKVswx
         1ZtBeifn8OwF8QhNY+xSrp8B4YTpqBsqNsRqbFyOUQcU4oMevQhf1qGmapsVIMmA4CKK
         RGmu4XGbSK7hKRdnE4JgdxTJY0XR3AsfAGANWDdSSIW0OWxt8OiUXQpgGxGQwZdSx70s
         V9HV7MrJ6thZPJ7sGk19T5tFJfLPwt8vHgWtY/Ov/r4thO/9y3MnUloDFB44g35YgTgW
         JPDkNLfk/NazLkV4R37H+7WzKvgQEhaoa1gztCgzOKW6ZaC+MVvvaWyq94DoxwKWbjkp
         cIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/eOxZaKGbxmQPslyu0PUS3U6D6ydLmM18aPAdUZtRfg=;
        b=LclKkUYMtT0ZeCdFan8UiPcqf4EtyY8rQVeDp5cM1vx1RDPL+YDOBwB4fhOAv/CFHB
         z4py67EK2csgsJLSRR+aLN4pFVfrSNTi4BKyY6wVeKfS8233rSPpgaWdO/FQKR8zEKeH
         Sj7M2ilGRbkDQXMIX6rKoh7UP3B9eaVp+pjn6c5eIwNnkpunHRe178bBhF2HWkrsMuDM
         JeoBK5cLRnbF/zlLr4RZEeXTUqQthQFIAGmSrMsZtOiuWt7EVLNb5g9tiP4+6YIzTeWr
         cOYzuhr5yHPqmzT5C5/pt/mTrNY6id2Cz0GMvsT+j17XhrSs4sA0RKoAt8TShSAAEiVk
         nULg==
X-Gm-Message-State: AOAM532KP8ZELlKqFI/XpOQ8N6M/ITiPXAO/cWjJZ78GhX5KvuIIn3vV
	gWVqAknMJRr2xTw+lDJ3JCk=
X-Google-Smtp-Source: ABdhPJytTcwVMr733sqiiEbX4zDzTCRG13Mvo74nIsaQQkLOzLbES03gpI0dRHwbWSC9rq4nGAOCTQ==
X-Received: by 2002:a17:906:84d0:: with SMTP id f16mr24621579ejy.6.1630329395850;
        Mon, 30 Aug 2021 06:16:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id am3sm6699130ejc.74.2021.08.30.06.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 06:16:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: greybus: Convert uart.c from IDR to XArray
Date: Mon, 30 Aug 2021 15:16:33 +0200
Message-ID: <8412914.CfCsZqXv9W@localhost.localdomain>
In-Reply-To: <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com> <YSzMB80NOkNvdjy1@casper.infradead.org> <YSzQAd0Rg5CF/eLe@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 30, 2021 2:33:05 PM CEST Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 01:16:07PM +0100, Matthew Wilcox wrote:
> > On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> > > Whether the API is better is debatable. As I said, almost no drivers use
> > > the new XArray interface, and perhaps partly because the new interface
> > > isn't as intuitive as has been claimed (e.g. xa_load() instead of
> > > ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> > > I know.
> > 
> > I can't just slap a 'deprecated' attribute on it.  That'll cause a
> > storm of warnings.  What would you suggest I do to warn people that
> > this interface is deprecated and I would like to remove it?
> 
> I'd at least expect a suggestion in the IDR documentation to consider
> using XArray instead.
> 
> > Why do you think that idr_find() is more intuitive than xa_load()?
> > The 'find' verb means that you search for something.  But it doesn't
> > search for anything; it just returns the pointer at that index.
> > 'find' should return the next non-NULL pointer at-or-above a given
> > index.
> 
> We're looking up a minor number which may or may not exist. "Find" (or
> "lookup" or "search") seems to describe this much better than "load"
> (even if that may better reflect the implementation of XArray).
> 
> And no, I would not expect a find implementation to return the next
> entry if the requested entry does not exist (and neither does idr_find()
> or radix_tree_lookup()).
> 
> Johan
> 
Dear Johan,

Since your are not interested to this changes there's no need to restore the
Mutexes that were in v1. Please drop the patch and sorry for the noise.

Regards,

Fabio




