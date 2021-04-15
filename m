Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E4C6D32
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 08:33:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u17so35616899ejk.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ta4DOoQfotI6/6OYzxK4iRgaCenuWMEwER+QwKb27qA=;
        b=F83TF5UgmXH8ivsdcLN2gbs3xtBscWEMTQCnizq3HWS6u9a9X5wRqabTv2sr5uyuo8
         aJmAYtq1T9GF/Cbi933SJ8Y1Z3h3SGaSjqeU1mIBqcSu3tgaL9I7fR1Sd5Rg32a4j0ob
         ukKyF/gAFhHDGY55WYrGn17n46t0WVfj5Fw6/4xElg+PCkoBo0SUgrrzRCzhUm39E2fL
         a5avRb+ysVoVNUhn50tWzZvfzRjNU6ymEVd5JiAuUyozuy+DfqXoab8MPqyrGkai1VEY
         Dk8KKBsii2E6jCTcX1urvtWoK28zVBXB+rqzOk9XqshTdIHUPmTLceBBz1hCIQY2WGfV
         KSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ta4DOoQfotI6/6OYzxK4iRgaCenuWMEwER+QwKb27qA=;
        b=KY3RybYF22XdoSThiMek7wzPUmZhhWRUA3ZktlF/dd+TPRs+34FPfZvxwb4rB70Tje
         pi4BhHX/Xt4dNzEvnfyDSK6q5600fuY/+mQtriZ8lFusv4sDG9+beZ70dHzBMpBFANxQ
         eyGJGHUK/rlbOqvfWL4UGI4FvlLdFwH3FHLwJ+lRpsDdYAyLSP1P7CdG4NModCRayPuS
         PfNFlB7hInNpH0odrR/XYEmtROXZFDTxUYaJDDwN2YnHB4DlG9tjfPB63UbXMcorcWUt
         wHYQunnsdbs3tZuqbMU/+buO+4m3IxlcnlumxAqbRMU4+fY/FDYa+cqJxWcOKVA63BsE
         +xRQ==
X-Gm-Message-State: AOAM533azGi7zLKVE4svtOfUuQRNEDl9fVT8JVW9cVlA+ZxHjMAmGi2J
	2FV4YmWu9YtzPjqiJTFN8ySB9Q==
X-Google-Smtp-Source: ABdhPJxY/zx/kTydsS38v9oJRlLcTDz7PLq/ACTkPxUT9u7QhsMMiJi2oheRDyCOuzA3Xwbg/5XIHg==
X-Received: by 2002:a17:906:37da:: with SMTP id o26mr2323866ejc.413.1618475582234;
        Thu, 15 Apr 2021 01:33:02 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id cz2sm1802839edb.13.2021.04.15.01.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 01:33:01 -0700 (PDT)
Date: Thu, 15 Apr 2021 09:32:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 37/57] staging: rtl8188eu: os_dep: ioctl_linux: Move 2
 large data buffers into the heap
Message-ID: <20210415083259.GU4869@dell>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210414181129.1628598-38-lee.jones@linaro.org>
 <20210415051835.GY6021@kadam>
 <20210415055325.GB6021@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210415055325.GB6021@kadam>

On Thu, 15 Apr 2021, Dan Carpenter wrote:

> I screwed up my last email and dropped Lee and Arnd from the To: headers.
> Resending.
> 
> On Thu, Apr 15, 2021 at 08:20:16AM +0300, Dan Carpenter wrote:
> > On Wed, Apr 14, 2021 at 07:11:09PM +0100, Lee Jones wrote:
> > > ---
> > >  drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > index c95ae4d6a3b6b..cc14f00947781 100644
> > > --- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > +++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
> > > @@ -224,7 +224,7 @@ static char *translate_scan(struct adapter *padapter,
> > >  	/* parsing WPA/WPA2 IE */
> > >  	{
> > >  		u8 *buf;
> > > -		u8 wpa_ie[255], rsn_ie[255];
> > > +		u8 *wpa_ie, *rsn_ie;
> > >  		u16 wpa_len = 0, rsn_len = 0;
> > >  		u8 *p;
> > >  
> > > @@ -232,6 +232,14 @@ static char *translate_scan(struct adapter *padapter,
> > >  		if (!buf)
> > >  			return start;
> 
> Arnd added this return.  I think it should be -ENOMEM, though?

Will fix, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
