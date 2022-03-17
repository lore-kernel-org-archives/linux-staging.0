Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6323D79
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647507203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uFfTJdqSsa1NG+Ra/FukB6NKy0iv2m8HqzphlwyuIMY=;
	b=DPlgVW23lXQVMskELDbtDXSKJEtmm7P/BinS0dTQ/yk6BOSozxKotIe+uvk3Q/Y9Rz/qFP
	WEUO6YNogMd6qc/I04fjKun1HMLSHHDhloa7dWLM+aZDCrAETTjR1p+cXuMi94g0GS8/Mf
	HnLTuVi/jRMg0tp+gEndre/7LpAoGmo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-WUpKQXNcOLiFNula2JeiXg-1; Thu, 17 Mar 2022 04:53:20 -0400
X-MC-Unique: WUpKQXNcOLiFNula2JeiXg-1
Received: by mail-lj1-f199.google.com with SMTP id 185-20020a2e05c2000000b002463aff775aso1827574ljf.17
        for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uFfTJdqSsa1NG+Ra/FukB6NKy0iv2m8HqzphlwyuIMY=;
        b=cJo6NOzsQErHL+1UP/qvoFVBcDMyT5dE42DuOK8wJ/chQDgE+jpnPzt2Nf8RCjYHDV
         GtOENDhw+n7/dSysxO18RSSs7jsnyKbl5YPLM5lH+Mrn7q2O7TQc3WuIulRcK0JPMq/p
         KWtMdI9kAVYKa8c8rkNezWNRI1a/03g2/GmML8I4T9QLBr6eazltZjtcZbnm74R9l2/g
         B4v0DVN7wzONLdrYEXC0X60WQMMp+NE214NVHNjZMOCjMsuVytguM+cvFPubZOME+vN4
         eEfqdTNIns7J/593RrwhhVCgB6AKOVtIoxvaUBCV+TlNvncDhw6TLqvmTA76c3wDvjco
         Cobw==
X-Gm-Message-State: AOAM5314COk/HqeDt52fGZMIeg/gFyGQS4L4wmkRLLCLPfLDjR61wt9Q
	j56yEKnuY+XN4Dm76PYeJjeHtukd31qbSCYeBKk+pyKg2MWtFb0KL1clkQevsAyeDHiaqh6eXzC
	IF5owacWM01lN5dmUbpiS4Q7/Yla1AS7WEd1saXyDHg==
X-Received: by 2002:a2e:9dcf:0:b0:247:f8eb:90d5 with SMTP id x15-20020a2e9dcf000000b00247f8eb90d5mr2171003ljj.23.1647507198400;
        Thu, 17 Mar 2022 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNbwp6tqy+HcMHGRBfqOz/Srxy4fE5I30SgISlwUiwMSrU46WrhElns8Rx+/WjzuJGzZtPGGRI1b5zx3gbtI0=
X-Received: by 2002:a2e:9dcf:0:b0:247:f8eb:90d5 with SMTP id
 x15-20020a2e9dcf000000b00247f8eb90d5mr2170987ljj.23.1647507198111; Thu, 17
 Mar 2022 01:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220317075713.10633-1-hpa@redhat.com> <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
In-Reply-To: <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 17 Mar 2022 16:53:07 +0800
Message-ID: <CAEth8oHqSS7EsPofmERRB=pmtS8YPP+MeM6fMG6tJT2z_qChxA@mail.gmail.com>
Subject: Re: [PATCH v4] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans De Goede <hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hpa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Thu, Mar 17, 2022 at 4:28 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 03:57:13PM +0800, Kate Hsuan wrote:
> > For the AF configuration, if the rightmost stripe is used, the AF scene
> > will be at the incorrect location of the sensor.
> >
> > The AF coordinate may be set to the right part of the sensor. This
> > configuration would lead to x_start being greater than the
> > down_scaled_stripes offset and the leftmost stripe would be disabled
> > and only the rightmost stripe is used to control the AF coordinate. If
> > the x_start doesn't perform any adjustments, the AF coordinate will be
> > at the wrong place of the sensor since down_scaled_stripes offset
> > would be the new zero of the coordinate system.
> >
> > In this patch, if only the rightmost stripe is used, x_start should
> > minus down_scaled_stripes offset to maintain its correctness of AF
> > scene coordinate.
> >
> > Changes in v2:
> > 1. Remove the setting of the first stripe.
> >
> > Changes in v4:
> > 1. x_start is estimated based on the method for both stripes are enabled.
> > 2. x_end is estimated based on the width.
>
> Please put the changelog before '---' line. I've removed it from the commit
> message this time.
>
> --
> Sakari Ailus
>

Okay, I got it.

Thank you.

-- 
BR,
Kate

