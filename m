Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D692564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649337473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Xg006do2juJkqTWAxGfwqxVTFvDtf8Ouv8ifluSAu0=;
	b=GXz3RdQi6O2Rf4KRNuP0qwtKUKoqvW0o0w30DH9tttGzfko1zVn8V1XlpJxrUWAFrJoKZE
	7TuYpK/Lx4BUAfRgpr2m7J73qYBhUw89SuQIVd/x9ZWhKWKYX9Hjm+1tIZFB/Yb+NRXOB1
	9DlFJoqw7f6Apvn3svF0wDDNemUEXpE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-JgxOuLBrPh6_jyajb2voRA-1; Thu, 07 Apr 2022 09:17:52 -0400
X-MC-Unique: JgxOuLBrPh6_jyajb2voRA-1
Received: by mail-lj1-f199.google.com with SMTP id n9-20020a2e82c9000000b002435af2e8b9so2118570ljh.20
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 06:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Xg006do2juJkqTWAxGfwqxVTFvDtf8Ouv8ifluSAu0=;
        b=NEZeqlbrXAKDaiqGUi/JV1/vql29ZEcukswxFWnuE/fxI1UiQXWOVHpQRc8IRuw12I
         rQjPys9J0+b7Ypcf63BJ4hudWTSb4vxczEFnb4g9FiOcdZ+Um1FDVXCHWXknSWqxGziQ
         FAwdM4gcTKoykQ+qAoG8JhXzkGoZcv0R+J8SsWFQ7GJ1SkkqkK1b/9dK+1dxQjqi3RZA
         Op0aP0N7gcCOheKSbEUwwkHA02LECxN4yWM1FxKPzg85ozzKXpEHokHuvfKegey/KEp2
         iHgaqH6he+hcD6y2VDwR7gx1SfCbRztLqvQnOWJhfxVP+bF7//Kb7AeBZjgUGh8HF5eH
         jpZg==
X-Gm-Message-State: AOAM532a8AuSzGuKnLix5G9xvnVveizU6sIs9KLFcZsAJrm2R12q5/1z
	vBZJBp9bK9VjnOXHSwW2QnGlWu11IKRdSrEhtEd7j9+priXCag5Qo58W0OJbpapfCZ8gtAhe/ds
	or7DzEdY8hQ77EOpiaVYb1fiW6yOG5QPFX8jsWXIXoA==
X-Received: by 2002:a2e:9ad7:0:b0:24b:fa3:6a8d with SMTP id p23-20020a2e9ad7000000b0024b0fa36a8dmr8750732ljj.363.1649337470354;
        Thu, 07 Apr 2022 06:17:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOH3NMQzvLRuhgYGmMuiioeRpPbM3obm6q7/YkChssQxnH4v5W6zhC8c8fZS+DA2TNFh36USctJCoGkt+xtXA=
X-Received: by 2002:a2e:9ad7:0:b0:24b:fa3:6a8d with SMTP id
 p23-20020a2e9ad7000000b0024b0fa36a8dmr8750702ljj.363.1649337469936; Thu, 07
 Apr 2022 06:17:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220407105724.308930-1-hpa@redhat.com> <20220407115133.GL3293@kadam>
In-Reply-To: <20220407115133.GL3293@kadam>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 7 Apr 2022 21:17:38 +0800
Message-ID: <CAEth8oG_GAuammtSqKzyj+Vq6ZsQJJOEeFhgxYhxXHViDYvkow@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: ipu3: Fix AWB x_start position when
 rightmost stripe is used
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans De Goede <hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Thu, Apr 7, 2022 at 7:52 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Apr 07, 2022 at 06:57:24PM +0800, Kate Hsuan wrote:
> > A not calibrated x_start setting would result in an incorrect AWB location
> > configuration on a sensor when only the rightmost stripe is used. x_start
> > should be calibrated by subtracting the stripe offset to set the coordinate
> > to the correct position on the second stripe.
> >

>
> I wish the commit description said more about what the bug looks like to
> the user.  This is the front facing camera, right?  Is part of the video
> blank or what's the deal?

This is IPU3 image processor. I tried to fix the configuration issues
on stripe 1 coordinate settings.

>
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> > Correct the patch. The correction should be awb, not awb_fr.
>
> I tried to review the original patch and it was impossible.  I saw
> you're from an @redhat.com email address so I decided it must be right.
>
> I kind of get that you need to be a domain expert to review these
> patches but this function is such a mess...

Sorry for the misunderstanding in my comments.
Since I made some mistakes on my v1 patch, so I had corrected this
part and quickly sent the v2 patch. You are welcome to pinpoint the
errors for my v2 patch. I could fix them.

Thank you.

>
> regards,
> dan carpenter
>


-- 
BR,
Kate

