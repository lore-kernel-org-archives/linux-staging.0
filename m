Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A96D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 18:09:59 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id c6so18880620qtc.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Z8o2eF8WW0GN2VLTkAq3OumygwjQqYyVi3fNlIvWwiI=;
        b=Duv85+DYznnAFwi/q+Zxi2c5YnmcJKrf+XUB68Byd2A15FYncD2i+j5jJxy6U6EdSF
         lfwKRbEJ0dZC67j0WWswopaUjbvqC7Z7C1Fx6a5BoertXUsnykzmeClaU+kyhp9CBYs8
         1I5ftmCsHx35smzynbGEP5c2TBhIrNzYR8VFsta3vGLDyTeVTay4e1QXgUHFAScGzOM8
         XHJtBYHevxCfyAhrHF4ianLU1OyetPIO50/IUupmE6i9MH6vK8d0h1GqnsCdF8l9oF4W
         ql1kY2WbAm2G6eJGeQGt39vHbfzivZIe6HY8tbe9jywU/r7ykmzmzQYh8jEIjdQGEI8V
         N14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z8o2eF8WW0GN2VLTkAq3OumygwjQqYyVi3fNlIvWwiI=;
        b=LpxBBldY6FsEgTVA9FGbWIncP3XE5yuSBhrs7guhv73rmeVGVrxYcc2df48kT8DIqt
         S3MF8+N/QEI2vqh02jdmGKyDVSOYpvWR9awTkD5iaCISeaCou45xOEftbZYaDvKPOWSe
         PGCwI/O5b9vvDHPNwvIwSDc96VCZSw/Q8v7kErc9eRK4/6ldQ2VEgz7b34Z7vGh5OCdS
         yIxyDSycf0hSSitvab6DNYm/pMMsmxLsrlB5Xf56k5A2BswILBGST5L7aqacy7dqKRDI
         WvL+vtUxRZQQ94SWc3ugmQFQApZkb4aOofamXPzVVXiPM9POMW5LZYB8nKGPbDMgSzOG
         4CHw==
X-Gm-Message-State: AOAM530hYORFKdaXQbvsLbba1jrwQeWFUiwah1ItDyyyoll5Q6CQ0jFv
	0eovI3TaWm8dp1MXeXZBfdw=
X-Google-Smtp-Source: ABdhPJy+SV3+lHg4xIpApam1jIImVhMJPVyBAuCeN8GIR+uE6lNYBWEYSLKqqbWVwZthy43uopci0g==
X-Received: by 2002:ac8:7d03:: with SMTP id g3mr4391644qtb.330.1618510198723;
        Thu, 15 Apr 2021 11:09:58 -0700 (PDT)
Received: from [192.168.100.7] ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id p21sm405918qkp.95.2021.04.15.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:09:58 -0700 (PDT)
Message-ID: <74c59fd225b7b107662ce045086cdd8560e3e08f.camel@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
From: ascordeiro <alinesantanacordeiro@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Thu, 15 Apr 2021 15:09:54 -0300
In-Reply-To: <20210415171409.GC2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
	 <20210415171409.GC2531743@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Em qui, 2021-04-15 às 18:14 +0100, Matthew Wilcox escreveu:
> On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro
> wrote:
> > -const struct atomisp_format_bridge
> > *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge*
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> No, this does not match coding style.  Probably best to break the
> 80-column guideline in this instance.  Best would be to have a
> function
> and/or struct name that isn't so ridiculously long, but that would
> require some in-depth thinking.
> 

I left the type of function and its name with the parameters in
different lines, following up some examples of other files, such as
atomisp_acc.c.

But I didn't pay attention and left the pointer with the function name
instead of left it with the type of the function in v1, so Hans
suggested it to a v2, as I did.

What should I do in this case?

Thank you in advance,
Aline

> > -void atomisp_apply_css_parameters(
> > -    struct atomisp_sub_device *asd,
> > -    struct atomisp_css_params *css_param);
> > +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> > +                                 struct atomisp_css_params
> > *css_param);
> > +
> 
> Good.
> 


