Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEC72
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 11:54:54 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id m11so7321804pfc.11
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jj39pWnpe68QjHt1F0v3GC/JaiqRPmwqsSayHN84pLc=;
        b=dTU5duck9yoxb9EsoiJ3eUPCeP+4rusRpUsqcIvaLGglYmC7TOwycIg5NiX3fdQRU4
         wV0zKmdK1fvnvu6cFOv71E7ireN9om7saabEZQf1TnTdX2B5K29ExP73/N2S/lSfzA7H
         QZJ4/UUQoyWQT9K6sCZeazNAu55qrU+Vz2vbhYu0kn02K54tqOXxGH7QsyFzMYis19kW
         C/mqJcjCHw1nyL4GcwD4+fWnyDYveiFVxTH7n6hnOXHai685o7izne6kpOhD+k9hllaA
         tn4AaWT8SGCbeA7JMTI7MqWMr6p76PaBdZ0OhuyjKkOIXEBJRCygtaZMQ3HawW4P0Acq
         JjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jj39pWnpe68QjHt1F0v3GC/JaiqRPmwqsSayHN84pLc=;
        b=kqSxe3V65/9Shij/4DL4k5GL9BuHE21ievISuyGOd2aXXYU05lTBlLNNSs5xEYRkmh
         WcQbIea8bnU5jIaquGqh16uhhxueV4jTQlKe7PnEBZmr259SvF3LUnCSRCCwG0gW4V2b
         Uf/Q8r2yalwNyYH4xycuEBsIWGDDueOFIgGzrGk63clDj/0UAXSwy6RlzgoVgSSxVXX2
         GcaB72Hvubllr1grUjjg/h0lRsV6QX8XcMdyM6Fx9Al9rJCzqBGKo6uVudTQ91S5I0wq
         khGS/rEHvuK1OydGH8Sq2OAZVucCMn7abDM4BB/JBIHdwFoOP5AmTNZvDfr4lyYgIFcZ
         eudQ==
X-Gm-Message-State: AOAM5313fBbgz4RN29HGBxIcb+zY7Rc+nYr9il2l+cy7/cDis4oL1W8k
	ZCPsI7Eo6nwgPDwqSs0oiKA=
X-Google-Smtp-Source: ABdhPJzIWFyM1++dQEypZ2pz5+I/U/VXxqjUM0en9/a181BJpTN3wmk1LQFapXd64VlPMy7fdWTVuQ==
X-Received: by 2002:a62:7992:0:b029:249:9dfb:426d with SMTP id u140-20020a6279920000b02902499dfb426dmr6089863pfc.68.1618142093744;
        Sun, 11 Apr 2021 04:54:53 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id y194sm7230272pfb.90.2021.04.11.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:54:53 -0700 (PDT)
Date: Sun, 11 Apr 2021 17:24:43 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [PATCH] staging: media: zoran: reduce length of a line
Message-ID: <YHLjg3U1M358bBxh@kali>
References: <YG9zvMnYlZVbJhQn@kali>
 <003b2d17-2fe4-c3f3-6b1e-60d0301a1413@xs4all.nl>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003b2d17-2fe4-c3f3-6b1e-60d0301a1413@xs4all.nl>

On Fri, Apr 09, 2021 at 09:26:48AM +0200, Hans Verkuil wrote:
> Hi Mitali,
> 
> Something to improve:
> 
> On 08/04/2021 23:21, Mitali Borkar wrote:
> > Reduced length of a line which exceed the 100 columns limit by splitting
> > the line into two statements and commenting it with '*'
> > Reported by checkpatch.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/zoran/zr36060.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
> > index 4f9eb9ff2c42..035634fc1c6d 100644
> > --- a/drivers/staging/media/zoran/zr36060.c
> > +++ b/drivers/staging/media/zoran/zr36060.c
> > @@ -249,7 +249,9 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
> >  static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
> >  static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
> >  
> > -/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
> > +/* SOF (start of frame) segment depends on width,
> > + * height and sampling ratio of each color component
> > + */
> 
> See the coding style guidelines: the preferred style for long comments is:
> 
> /*
>  * text
>  * text
>  */
>
I have sent v2 patch two days ago and I have not got reply till now,
Should I resend this?

> Regards,
> 
> 	Hans
> 
> >  static int zr36060_set_sof(struct zr36060 *ptr)
> >  {
> >  	char sof_data[34];	// max. size of register set
> > 
> 
