Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01515AA
	for <linux-staging@lists.linux.dev>; Fri, 18 Mar 2022 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647586058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I3lYvZeJcpFfGGlJYFnn0VDJIi283PypPxo2EohREtU=;
	b=KS4GE01m2ZrHxFfbSfgIyRqwStcicE1PHECKgoScfVYCQ7KnQLTV02FXOikqY3xdKVCMch
	AVeSu/PpP6ikkpFePbqtCWNEvP1YjiCT4im16xXJSX5M9E/qPF4nmpyw4PTtafCWLJn/ZS
	LOS/Ya0aT2RKp54Gz4D5YxfdWPTKxf0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-8hItwfwsNeGgBwvebqNARw-1; Fri, 18 Mar 2022 02:47:35 -0400
X-MC-Unique: 8hItwfwsNeGgBwvebqNARw-1
Received: by mail-lj1-f197.google.com with SMTP id 67-20020a2e0946000000b002493a3be913so3076703ljj.15
        for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 23:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I3lYvZeJcpFfGGlJYFnn0VDJIi283PypPxo2EohREtU=;
        b=zdJRfdY7JP4Ly/9l9Ijh7yFSvBW6iJWeMj7lfTzW9JvpX8Qgru3JOm28rtMTFv8He/
         I7rEFlnbpQZCtGPj78aopg6++PcPB8yshTwRN/Jk+CIi2L2aX680w+2aL91VoBWzZlSm
         tNtc/SdqUXiNcXKH0GVBeFPUImtklkCONVjz1kL8a3Cz6ndBDUAo2gJ017NtcaoUlDBY
         /nVh6f7MweTQad0X2mrd+TaJ5Pr4QDrXb84kzt0c1eeUAyxwJmQOC9Ojd7Ck0xKItf5j
         LEt2TFRG1E1yPxbIpJ13b+Yrauz+zAh/ZulBcg9g7h2gLYsnZsaw2p/FnzdHhY5O+vE8
         94yw==
X-Gm-Message-State: AOAM533xZkcEC15iLArWedrxAH1W3AUm13eMFhZqyFD3N9VQijH/SZrh
	1oW1BPeZrO/+KLfUpYnTqe30XW2/gvqq0DG08kC1RV0eqfR5ovcmS+rrPQz0lR2VWgS3DZgpCbN
	dwzONpiJsKJe5FuD73ltcRUpDAm+CfTnvBT9G54WYSg==
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id y2-20020a05651c154200b00246036c8d1fmr5344713ljp.311.1647586053352;
        Thu, 17 Mar 2022 23:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0I/xHSd8pqwSVkxR1iXkhf+tY1ZEwHylqHNX4opihknbprFolc447b2KSlP6xQEh9ImWdTxXmczEnwgkljXo=
X-Received: by 2002:a05:651c:1542:b0:246:36c:8d1f with SMTP id
 y2-20020a05651c154200b00246036c8d1fmr5344701ljp.311.1647586053120; Thu, 17
 Mar 2022 23:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220317075713.10633-1-hpa@redhat.com> <YjLxFuRXKzg3m9HH@paasikivi.fi.intel.com>
 <CAEth8oHqSS7EsPofmERRB=pmtS8YPP+MeM6fMG6tJT2z_qChxA@mail.gmail.com> <YjL6/wOVjSvZjSZ5@paasikivi.fi.intel.com>
In-Reply-To: <YjL6/wOVjSvZjSZ5@paasikivi.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 18 Mar 2022 14:47:22 +0800
Message-ID: <CAEth8oES8abPO4p7eFv43PwDXuxeOmg1661YtVvykBPrkagzKg@mail.gmail.com>
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

On Thu, Mar 17, 2022 at 5:10 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Mar 17, 2022 at 04:53:07PM +0800, Kate Hsuan wrote:
> > Hi Sakari,
> >
> > On Thu, Mar 17, 2022 at 4:28 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 17, 2022 at 03:57:13PM +0800, Kate Hsuan wrote:
> > > > For the AF configuration, if the rightmost stripe is used, the AF scene
> > > > will be at the incorrect location of the sensor.
> > > >
> > > > The AF coordinate may be set to the right part of the sensor. This
> > > > configuration would lead to x_start being greater than the
> > > > down_scaled_stripes offset and the leftmost stripe would be disabled
> > > > and only the rightmost stripe is used to control the AF coordinate. If
> > > > the x_start doesn't perform any adjustments, the AF coordinate will be
> > > > at the wrong place of the sensor since down_scaled_stripes offset
> > > > would be the new zero of the coordinate system.
> > > >
> > > > In this patch, if only the rightmost stripe is used, x_start should
> > > > minus down_scaled_stripes offset to maintain its correctness of AF
> > > > scene coordinate.
> > > >
> > > > Changes in v2:
> > > > 1. Remove the setting of the first stripe.
> > > >
> > > > Changes in v4:
> > > > 1. x_start is estimated based on the method for both stripes are enabled.
> > > > 2. x_end is estimated based on the width.
> > >
> > > Please put the changelog before '---' line. I've removed it from the commit
> > > message this time.
>
> I meant to say after. Then it won't be part of the commit message.

Thank you. I understand :)

>
> > >
> > > --
> > > Sakari Ailus
> > >
> >
> > Okay, I got it.
> >
> > Thank you.
> >
> > --
> > BR,
> > Kate
> >
>
> --
> Sakari Ailus
>


-- 
BR,
Kate

