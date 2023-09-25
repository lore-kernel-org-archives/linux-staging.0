Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505531B278
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 12:18:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-313e742a787so4246772f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695644333; x=1696249133; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHP0gjZZ+jc1OAptTHEyzuPC8yYPxjo1qi8MGdPaIY=;
        b=GBRUoTeSSWiv8JE0+KJhQPeOx6diMjxfb+6D96NivbgCjLHiDw0ftkEwAFPEgnLPV2
         JFqc+ytOv3gB2g4Xnm0PPIwJdh6Ml3QvQT9m/7PWKgIyBDuAWldVjNMisjhiQ+3NXYn7
         0MmWhzwUR6YyQk4kPnYyMzHI+i0d+KmyWoPMz5oJV7wwUQXoQh1sJv6f2iXkcNpNKDU9
         iv6qmiAltMC4FCiX+6oOWR95RRX6VuHVNHb0DiTNSmNiMRTjvktSF96w/nLcFtGiPnI+
         XucfQaG4quz41zQ9NE5t77lSwEyLuHjtATRjXF0ZiR+bdz9aHI3DqnXWKN3RREqLuw+n
         xkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695644333; x=1696249133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpHP0gjZZ+jc1OAptTHEyzuPC8yYPxjo1qi8MGdPaIY=;
        b=r3ygYuYKlBCiEogH9oRdUtBQloYEvM81GfOxXXeS6W4SuXRFbKnHe/A5EyHIBSaaZT
         4Bs8nO1uYdI28xSWOq1CibOnmuywDSpWSw3OfIQ8/1t5p4+vgpdkAGcUNFT/YCgYUQV6
         9PQPKQsf91xVZLVLpUQPFE62qHWEOzqFawR6uLL7bPr41730KOaDwiHvEud2dfIzwrVQ
         q4Pas4eRFhHRwAlAw1Pf6eeMyMqt9955aKcz9qKVS7kZSjSsk/PHsm1uPr+efA1yVuMb
         rENrhvmEMhH8zQ6cH0wLH4ArdwH6Vfp4oEwbZ1E+0+KMFKeYaoxueADw5vVq3M3ooBiv
         KMDQ==
X-Gm-Message-State: AOJu0YzQ1bY+PZ1t/LUugXKQHkUvNeaVKJg5/eZpnFqtJOwWq9KdbUQV
	U6dg9bytkmmLPlCtCoOlRVLopw==
X-Google-Smtp-Source: AGHT+IHrPi2LM0A+JOTQ15e6//++oAczdtZHV4J+jHAxcEA4WLivxDqwPJrKvih9F9TC8lgmR2L8pQ==
X-Received: by 2002:a05:6000:1e18:b0:323:2288:40ef with SMTP id bj24-20020a0560001e1800b00323228840efmr3530120wrb.14.1695644333441;
        Mon, 25 Sep 2023 05:18:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b004053a6b8c41sm10408693wms.12.2023.09.25.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:18:53 -0700 (PDT)
Date: Mon, 25 Sep 2023 15:18:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dan Carpenter <error27@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 1/5] staging: vc04_services: vchiq_arm: Add new bus
 type and device type
Message-ID: <62363da5-39c4-40f2-bfca-fed182845eb8@kadam.mountain>
References: <20230913195354.835884-1-umang.jain@ideasonboard.com>
 <20230913195354.835884-2-umang.jain@ideasonboard.com>
 <e815e9d6-450c-4dcf-b562-f302dd9e22e5@kadam.mountain>
 <700e11e4-057d-78ed-8b52-dd2df97198bf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700e11e4-057d-78ed-8b52-dd2df97198bf@ideasonboard.com>

On Sat, Sep 23, 2023 at 07:57:51PM +0530, Umang Jain wrote:
> Hi Dan,
> 
> On 9/14/23 12:25 PM, Dan Carpenter wrote:
> > On Thu, Sep 14, 2023 at 01:23:50AM +0530, Umang Jain wrote:
> > > +static int vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> > > +{
> > > +	if (dev->bus == &vchiq_bus_type &&
> > > +	    strcmp(dev_name(dev), drv->name) == 0)
> > > +		return 1;
> > > +
> > > +	return 0;
> > > +}
> > I was not going to comment on this, because it's unfair to nitpick a
> > v11 patch...  But since you're going to have to redo it anyway, could
> > you make this function bool and change it to return true/false.
> > 
> > static bool vchiq_bus_type_match(struct device *dev, struct device_driver *drv)
> 
> Perhaps the return value can be true/false, but return type should always be
> 'int'
> 

Oh.  Sorry, I didn't look carefully.

Btw, you don't need to tip toe around telling me I'm wrong.  Just say
"That won't compile, dummy."  I'm a big boy, and I can admit when I make
mistakes.  ;)

regards,
dan carpenter

