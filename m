Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6305F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 15:41:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b16so6818302eds.7
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UcaHqKs98Hkc3NEid7wUy9JzMx3tu2jsJp3TMrBzIGs=;
        b=hxC/ZxQvSzMjxAEz/OyBMxdWsnrxcnMByPPKwm9APhuGELHj9BIdEx/aqeSy+EAAJ3
         s8xsKAINIyA/CRmWTp9xrPAgFov7m4JJeGbIujnJbbq6E37PcNMU1u3SUz3ayQWrE/Je
         sr4gc9ITdqRB0T99wh2FHlCtkuS8NuUXwIhtfNxFKr3MSQWgZZQeQoSiWvZVM3iYMXtq
         yfxpDle9LrNK/6sF08ISlhKngCNfPOW0UBC8ZKS8R9yyHzwsLdW/PvQmBPMZk8Dc6VAS
         zYTKfRopk1sJKXciGI3lP+HBbSxQKv29Ru7bVm5wBHdCEQM+/qa11CRm8Phu6QJrWFs4
         sDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UcaHqKs98Hkc3NEid7wUy9JzMx3tu2jsJp3TMrBzIGs=;
        b=r+6sYYspzcrW395oTasrQa/y832PTcayyPfRsRaLb9yQyPZAYbRltwYHwSTTVVgWCJ
         0tf1c5cagW/1B1vQPTrJX8azXRBoqCn9kWQAEWcjWaG2WAgggWMUAfbtC6YSXKbohUD9
         uBoGz91noy7ycXZXT3F/mX/PQS/84iV4lGukPcdkIZu3Sk9ZNxDqmBmtJelJj+xL86ui
         bZdDopMciS4tSRDvqGhXze4SRA9pl3eIIzAwjtaoMGaIb//c4UxysZVrpyHD9TVgAfLK
         NQjBqQiIR5UfWwPAMbIlCjpa+xKOz6ZymhIVu54ySLIvqYSgyAYHShpffONWgSYGr7bS
         VzTQ==
X-Gm-Message-State: AOAM533AtPLOVif310m8SPGrbhGo1TkpAQqw67CnleR1rvnydRLIIukw
	R/VjvCIjiWiEzfVCHPm1YAU=
X-Google-Smtp-Source: ABdhPJxaShpLwFOHJNelMHcQGu6tTR4wLlu804AUZ3Si9l2E0+H4VfWeLTDfD56Ryb9Sgkk3nIhT7A==
X-Received: by 2002:a05:6402:13ca:: with SMTP id a10mr15835635edx.320.1616773291387;
        Fri, 26 Mar 2021 08:41:31 -0700 (PDT)
Received: from cesati.gmail.com (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id q19sm3955985ejy.50.2021.03.26.08.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 08:41:31 -0700 (PDT)
Date: Fri, 26 Mar 2021 16:41:39 +0100
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Staging: rtl8723bs: remove useless macro and obsolete
 comment
Message-ID: <20210326154139.jo3kji2hz2lva53x@cesati.gmail.com>
References: <20210324193924.12536-1-marcocesati@gmail.com>
 <YF3qAfF0GstW4aOw@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YF3qAfF0GstW4aOw@kroah.com>

On Fri, Mar 26, 2021 at 03:04:49PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 24, 2021 at 08:39:24PM +0100, Marco Cesati wrote:
> > Remove two no-op macros, two related helper macrors, and one related
> > comment in the staging/rtl8723bs driver.
> > 
> > Signed-off-by: Marco Cesati <marcocesati@gmail.com>
> 
> Does not apply to my tree :(

Yeah, it was supposed to be applied on top of the patch set "remove
unreferenced enums" (alternative to the patch set "remove named
enums", which you applied)

Sorry again,

Marco


---- 
Marco Cesati, PhD
Dept. of Civil Engineering and Computer Science Engineering
Univ. of Rome Tor Vergata
via del Politecnico 1, I-00133 Rome, Italy
Tel. +39 06 7259 7389
