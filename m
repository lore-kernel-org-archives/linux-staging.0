Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3EF1C02
	for <linux-staging@lists.linux.dev>; Tue,  5 Sep 2023 09:23:30 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1883604f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Sep 2023 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693905809; x=1694510609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SBahfcXaogv50Nn5DeDfJ3oNR58HGAjSmwpQpqZujZE=;
        b=jmoT2W1Dy9i2j6ZEb5Cga78uolZ6pQ0orjS02yn200Y7MX/GhYclRn++zSRc2+ShsO
         wOoBHfZCGzUJ67RkAfw7nHzgqBWuZDKKQO2tGKqhDsUh1uwiHMJ9wydfuHuG3RiSEZDV
         CV0X7aNtz+UXluz3psoSmfJsOO4DOG+G3LVh+WPG6hFkkemj3+kVceeZdmu3eNeHGCgR
         UnD1J5aPqxfZ+tkZpkT41JWvniXzmIHtyGukzCQnp1zzGrIRrl4UUf7/PxaXuMo07fMP
         8vNLeZHwzAFIGOjkLmUf5VFEIQ9pljPp/bM80Ih3gtbGI/t51olPCUGtKCy8eee2mN5V
         wVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693905809; x=1694510609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBahfcXaogv50Nn5DeDfJ3oNR58HGAjSmwpQpqZujZE=;
        b=ZGQbivTfg4gRthscfKPdb5gf2GxIcuX5fHp33/OCuQEBj9y9YcpAzxXKEXEf0wMPOo
         c7RJMY60lVT3QbqFK7+MWem/FsuqUCrvcxKwQ/Bsy6hldbGK+B58oIG0JIRxiYc8Iq7P
         SRb47vsr9y4egNscgJfQyd9IAEUAmWCySiWVf+kdMR67edj0mcRM1dw6AiMhLiD6xakl
         vUo1oo04c+HQ9zXCJguQ4oGoueI27AMIyqRv9G1/YFlwbEA0+mFo3RstDNV0uWxq1Zv/
         pPAq452xLtSYse1lwqSP2giI4tiNNiRXD35LtudD+udYacm3VRKNhDtDu3XhtOL8Qqd4
         NPwQ==
X-Gm-Message-State: AOJu0Yyse4uw9Hf8z/s00Ara0TM5Vv++L+AwT70iGQV0oK3n7IPA8+ZO
	gPHlbJ3ubBDyQQzxOExxLc/2kQ==
X-Google-Smtp-Source: AGHT+IH9nEMmiLCIFRhneY6xWsRBk+qFzsEKDGdSI2xP2TEJLDVPa0zaF0xPyCX8WGVwGIgz8Z1u2w==
X-Received: by 2002:a5d:4ac4:0:b0:319:7230:d76a with SMTP id y4-20020a5d4ac4000000b003197230d76amr9292354wrs.38.1693905808894;
        Tue, 05 Sep 2023 02:23:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d4bca000000b003180155493esm16867491wrt.67.2023.09.05.02.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 02:23:28 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:23:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
Message-ID: <b5fcb0cd-73f7-41dc-969e-ced84edd421a@kadam.mountain>
References: <20230805075114.15186-1-straube.linux@gmail.com>
 <2023080952-maroon-waviness-9621@gregkh>
 <b15bc777-b470-3c15-5ea7-8ef2f89622c3@gmail.com>
 <cbca3311-2d5d-4b87-8966-e2b57d74d6e1@kadam.mountain>
 <69226eca-d345-f6fa-59fe-3c55674cc534@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69226eca-d345-f6fa-59fe-3c55674cc534@gmail.com>

On Fri, Aug 25, 2023 at 07:13:42AM +0200, Michael Straube wrote:
> On 8/10/23 07:01, Dan Carpenter wrote:
> > On Wed, Aug 09, 2023 at 08:02:05PM +0200, Michael Straube wrote:
> > > On 8/9/23 14:21, Greg KH wrote:
> > > > On Sat, Aug 05, 2023 at 09:51:14AM +0200, Michael Straube wrote:
> > > > > Replace strncpy with strscpy in two places where the destination buffer
> > > > > should be NUL-terminated. Found by checkpatch.
> > > > > 
> > > > > WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90
> > > > 
> > > > If a global search/replace could be done, it would have happend a long
> > > > time ago.
> > > > 
> > > > How was this tested?  The functions work differently, are you sure there
> > > > is no change in functionality here?
> > > > 
> > > 
> > > It was only compile tested. To me it looked as it does not change
> > > functionality, but looking a bit deeper at it I'm not sure anymore.
> > > So, we should leave it as is.
> > 
> > So there are three main differences between strncpy() and strcpy().
> > 
> > 1) The return.
> > 2) strncpy() will always write net->hidden_ssid_len bytes.  If the
> >     string to copy is smaller than net->hidden_ssid_len bytes it will
> >     fill the rest with zeroes.  This can be important for preventing
> >     information leaks.
> > 3) strscpy() will always add a NUL terminator where strncpy() just
> >     truncates a too long string without adding a terminator.
> > 
> > We want #3.  We don't care about #1.  The only thing to check is #2.
> > 
> > regards,
> > dan carpenter
> > 
> 
> Thank you Dan,
> 
> so in this case we should/could replace strncpy with strscpy_pad,
> correct?

I'm pretty sure that strscpy() was correct.  It requires some analysis
in how this is initialized and/or used.

Don't just automatically use strscpy_pad() to try avoid doing the
analysis.  ;)

regards,
dan carpenter

