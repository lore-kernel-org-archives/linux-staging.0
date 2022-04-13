Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700F23CA;
	Wed, 13 Apr 2022 04:50:36 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 75so569049qkk.8;
        Tue, 12 Apr 2022 21:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SNrcfRE6HdOzXoCUILYeyPwHz9qMy++4j1/0BHKP8XY=;
        b=htaaJoxot6ne7hAx0KnKCHkv0Tt49PTBd51CvrGc25fVyx5e+psJvSzVG5wQqAbor/
         ozVzCwO0wYk6RXfyoQA/Mt5BFTE3nXmLA5elPH8HZknUI9qImFUSyEbEzV6swo1OZINo
         USA3K8Cp/U76hy4gG3zPDtKHqLQI9wTznS97kP9NDoaytbAxOg2jCitTSVGk80nVzA4n
         tik3993mg+mqHes2MLCyPLij0K+TL3XFMcS6o1adn09+HkIuGXeAIaPgwCvQ1UX5PcUo
         /Pcs9QrDZs+JXYGj/rFMdr95X/nhT+PirYHCajM07guCwC+OE+9oYow8UF7N7f5+6DEh
         4diQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SNrcfRE6HdOzXoCUILYeyPwHz9qMy++4j1/0BHKP8XY=;
        b=RqS0wK5Ucbm2dAvf9hhHgtdg3dUU6bSbMJxyeG+boCPP+q6iWWijz+bpMjI2WgVbsR
         mbK8RQF5f300C0NQX5b2U1BxLW81Dk2xyEBOj5IOPpVhdum6F6CnGOaaSZseMpnyqQeH
         lvBLLgOVJL6oxIhEoKB195OsYLJ5EWy4VNqRh7Er3aJeklG2wmNCZ3XWXyWA0g6T2lfz
         S6jUP6SBXjuE4TnbZrr38oEA5qNZg8iPqRaB00Oi292Vy/Mq3zyDmB+oWgoFp7B32ht8
         eHCtTvI3lPLQ24gXIILaTdJgTE0ZlrIuexh349gIOwGmPtYfj13us6cOzFef6fxTC/gC
         UfLA==
X-Gm-Message-State: AOAM530UHENryKOO5JXFeSB9X5912OOomICDzf61Ntk/FDe/MVSZUAre
	t7XYPvLJrjVZU6EnKto6NEs=
X-Google-Smtp-Source: ABdhPJzyciJssltn87XV2LoiVnxXmK1S0Q5FBlOrU/I3Ug0eVbn1LbT0yp9Ff7ISrLfXctXxBOOfwQ==
X-Received: by 2002:a37:9243:0:b0:699:9012:df43 with SMTP id u64-20020a379243000000b006999012df43mr5528039qkd.424.1649825435188;
        Tue, 12 Apr 2022 21:50:35 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id p16-20020a05622a13d000b002e227782e9asm28287014qtk.14.2022.04.12.21.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:50:34 -0700 (PDT)
Date: Wed, 13 Apr 2022 00:50:31 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace zero-element array with
 flexible-array
Message-ID: <20220413045031.GC3357359@jaehee-ThinkPad-X1-Extreme>
References: <20220411211411.GA2796005@jaehee-ThinkPad-X1-Extreme>
 <YlUGbFs8oNikJCcv@kroah.com>
 <YlUGp+/BzMSm3oDC@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlUGp+/BzMSm3oDC@kroah.com>

On Tue, Apr 12, 2022 at 06:57:11AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 12, 2022 at 06:56:12AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 11, 2022 at 05:14:11PM -0400, Jaehee Park wrote:
> > > Zero-length and one-element arrays are deprecated. Flexible-array
> > > members should be used instead. Flexible-array members are
> > > recommended because this is the way the kernel expects dynamically
> > > sized trailing elements to be declared.
> > > Refer to Documentation/process/deprecated.rst.
> > > 
> > > Change the zero-length array, buf, in the struct 
> > > gb_usb_hub_control_response to a flexible array. And add wLength as a 
> > > member of the struct so that the struct is not a zero-sized struct.
> > > 
> > > Issue found by flexible_array coccinelle script.
> > > 
> > > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > > ---
> > > 
> > > I have a question for the authors: 
> > > I saw a fixme comment in the hub_control function in usb.c:
> > > / FIXME: handle unspecified lengths /
> > > 
> > > I was wondering why this comment was left there?
> > > 
> > > In this patch, I'm using this struct:
> > > 
> > > struct gb_usb_hub_control_response {
> > >     __le16 wLength;
> > >     u8 buf[];
> > > };
> > > 
> > > And instead of using response_size, I'm doing this:
> > > 
> > > struct gb_usb_hub_control_response *response;
> > > And using sizeof(*response) as the input to gb_operation_create.
> > > 
> > > Would the flexible array address the handling of unspecified lengths 
> > > issue (in the fixme comment)?
> > 
> > No, you can not change the format of the data on the bus without also
> > changing the firmware in the device and usually the specification as
> > well.
> > 
> > >  drivers/staging/greybus/usb.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> > > index 8e9d9d59a357..d0b2422401df 100644
> > > --- a/drivers/staging/greybus/usb.c
> > > +++ b/drivers/staging/greybus/usb.c
> > > @@ -27,7 +27,8 @@ struct gb_usb_hub_control_request {
> > >  };
> > >  
> > >  struct gb_usb_hub_control_response {
> > > -	u8 buf[0];
> > > +	__le16 wLength;
> > > +	u8 buf[];
> > 
> > What is wrong with buf[0] here?
> > 
> > You can fix this in other ways if you really understand the difference
> > between [0] and [] in C.  Please look at many of the other conversions
> > if you wish to do this.
> 
> And I would not recommend this as an "outreachy introduction task"
> unless you understand this.  There are much easier first patch tasks you
> can accomplish instead.
> 

Hi Greg, 
I should've made this into a question for the maintainers instead of a
patch. Sorry about that. Dan's and your comments are well noted. 
Thank you,
Jaehee

> good luck!
> 
> greg k-h
