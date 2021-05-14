Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853FD72
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 13:48:44 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id h7so16204610plt.1
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aBsJCV7Cr8ObpfZHI0HCqMDG4XMDO17H2qjX06UEXfE=;
        b=uiHFyMAp5nPz9+TqKF3F/XpDDZzrleMWO+lOHAbyrparjXQBcWtF1gxg06ddLKOBg5
         Wnub3G524S4A9Vkqgtf1JXFY8IIrWZh5hOYriCc7EAsd6QumhVP/pLLdxIaFQCAbhZXC
         cKmIZ1d6Yp/Uicbp1AxtAORa5lZq2T5JK0vwFTRdtpPYkO14vTgnYMMWXAJ2O7FAW046
         duWtpoAlu66NaQnlTYuX5CZQpAvq2vg7HW5hLBz83J1ejyVSbdI1FWLFNBVMR8gU1dNG
         jsKh2zruzpwhLc6MhM+uEldAKY8cKkOn7E3eQxStqRIyexrHvtDjyDMI7SqS3uRF/xU7
         xt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aBsJCV7Cr8ObpfZHI0HCqMDG4XMDO17H2qjX06UEXfE=;
        b=KkkJz+jGhw5czm86qxJYIBJNWJ9OpTp09GsYQS5xbDClBsKYULD9Ox908Y9EK2ToFi
         f8I+TObCjBUaD8fn7wqztLIDy88RhALpNVCVejrRnDHjeViM7PWy8xI3jiDwcIa8f7+r
         VWcEVlAX5fMyWH0Cffmy7HonU/fc3hF0dsd9VmfGqwNLSWoVwZY5+mc/y1YOppYUiH+u
         hA+w3tawYQeDvyFGjs02Q0XH8F8Oh/w/F0+8AfbfvRjqdEPDfcQGEBFSzbSZhOxgfNRf
         WBWDFF0nzlYN4S8+dZf/3Ibrp32MxoPCsIpI6t4vlQdwGaCLZFFht+yBv/Xaitp60YU/
         5h+Q==
X-Gm-Message-State: AOAM533EuKf4cSE4DHJi3+5IvDxEdKAwiegArsUk1YcYj3CWONEPzebW
	9jyBnqUiY8zIEW1LdVchGw4=
X-Google-Smtp-Source: ABdhPJwwsdqxFN33bVHXa97UG3m9ytH0gmGrYB4jrD+zCf17fBVleBgmewPH5HdK0WHrJLMNvNdb4A==
X-Received: by 2002:a17:90b:360f:: with SMTP id ml15mr11164792pjb.26.1621000123937;
        Fri, 14 May 2021 06:48:43 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.gmail.com with ESMTPSA id x19sm1269004pfp.153.2021.05.14.06.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:48:43 -0700 (PDT)
Date: Fri, 14 May 2021 19:18:38 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Message-ID: <YJ5/tqFfcjxOLsF0@fedora>
References: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
 <YJ582f3O9K9YD3QA@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ582f3O9K9YD3QA@kroah.com>

On Fri, May 14, 2021 at 03:36:25PM +0200, Greg KH wrote:
> On Fri, May 14, 2021 at 07:00:39PM +0530, Shreyansh Chouhan wrote:
> > The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
> > multiline macro whose statements were not enclosed in a do while
> > loop.
> > 
> > This patch adds a do while loop around the statements of the said
> > macro.
> > 
> > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > ---
> >  drivers/staging/greybus/loopback.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > index 2471448ba42a..c88ef3e894fa 100644
> > --- a/drivers/staging/greybus/loopback.c
> > +++ b/drivers/staging/greybus/loopback.c
> > @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
> >  }									\
> >  static DEVICE_ATTR_RO(name##_avg)
> >  
> > -#define gb_loopback_stats_attrs(field)				\
> > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > -	gb_loopback_ro_avg_attr(field)
> > +#define gb_loopback_stats_attrs(field)					\
> > +	do {								\
> > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > +		gb_loopback_ro_avg_attr(field);				\
> > +	} while (0)
> >  
> >  #define gb_loopback_attr(field, type)					\
> >  static ssize_t field##_show(struct device *dev,				\
> > -- 
> > 2.31.1
> > 
> > 
> 
> Did you test build this change?

I built the module using make -C . M=drivers/staging/greybus to test
build it. I didn't get any errors.

Regards,
Shreyansh Chouhan
