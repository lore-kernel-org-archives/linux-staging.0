Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F119B
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 08:35:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so3523100wmg.2
        for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 00:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZBJWsvuPM4N2XNgGuD0Fakzbbh9G5ci/DsGRyhIEdY=;
        b=bHGQfWHm3z3WfK33pmq9dlJOKNe03OeJp8opslres0KGRyyM4Da5kMG28KGUnBQdZC
         l9FVIn02fotJTFGEW2mp0UPJY0Dv22nW97wBkpIpwq/YTlrcrE4pTMWxw5Mn9XEsl//H
         tVot2J6vWtg2iBpIfPhruW8kaSBPK8jbKxDD0anU1IRwyhAoUpvO2s4jQIMRMjRVlutx
         g7qfLtgVN/iTTZCLePMtmadGA9ELPDI52fAfZWoKncymcDepeYnqU+3oM5p66eqMCvXy
         mxfQA4WVE9x0zlv8M619hy96MSUGohRBf9xHo5uUWp9nrXmObbgv8a2RpP97HybC/Awx
         bXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZBJWsvuPM4N2XNgGuD0Fakzbbh9G5ci/DsGRyhIEdY=;
        b=1GQHvXP2axnFf4tDFrTbmViQpQpUoOBz4oEpZbOY9fE43Usm+yWQ6QnB2UNN/CVAdK
         QOSBQSvDyouv16VsMSkJQP+kDmf+/GU/CyaV8cEUQOOt1wxD/YM8CxIyRCJjPPfXM56J
         XBkY4EVTeve6dm+eaKQJKp5hb2C/qvOIXenvIYHOc6GfHzMhSULpPb9tW81P0HhTLPc6
         F1KYm2fVYGTd9S9C+Wln714iH/uji9Yp7lVBTI2rC/qUA/kTOFijY/UsU3odMPxgZQT6
         oNosDHcacqiy8aIhgdX88Nfi3D7NJEIraInu8sf6hbSEBf1z5kiuU5gW/zsVcIbwMO8r
         1c1Q==
X-Gm-Message-State: ANoB5pmojqXFZzPjzhwm1yj99YWPF2MLH4MOtbWl0qDtfLVlFE2U7JOb
	0NWMBgtxLj/hxFFjeesyA7M=
X-Google-Smtp-Source: AA0mqf60YsmnRdTamyBcHrdL4qYmUzr0MzwnwfkljypGszjucXInCUwcNUvqDYFv+EfSlNtYYPr1rg==
X-Received: by 2002:a05:600c:4f12:b0:3cf:e7bd:303a with SMTP id l18-20020a05600c4f1200b003cfe7bd303amr7953544wmq.151.1668760556423;
        Fri, 18 Nov 2022 00:35:56 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003cf774c31a0sm7538328wmh.16.2022.11.18.00.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:35:55 -0800 (PST)
Date: Fri, 18 Nov 2022 11:35:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] Revert "staging: mmal-vchiq: Avoid use of bool in
 structures"
Message-ID: <Y3dD6Lg2L7CgkDFe@kadam>
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
 <20221117160015.344528-2-umang.jain@ideasonboard.com>
 <166870135963.50677.14827688186331561108@Monstersaurus>
 <c718624a-bb6f-5474-5cc3-4319b1fdb282@ideasonboard.com>
 <Y3Z3Is8u4wGZfKU5@kroah.com>
 <c5e03c65-2994-6518-c79d-f6ad1557c4e0@ideasonboard.com>
 <Y3bN8I7DlxRUZumH@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3bN8I7DlxRUZumH@lunn.ch>

On Fri, Nov 18, 2022 at 01:12:32AM +0100, Andrew Lunn wrote:
> 
> Does :1 really initialise the variable?

Obviously not.

> In "u32 enabled:1" it means
> this is a 1 bit wide bit field. It seems odd that bool is somehow
> special and :1 means something else.

If you have a bunch of consecutive bool a:1; bool b:1; then GCC will
squeeze them into the same byte.  But if you have bool a; bool b; then
they each take a byte with GCC.  I have specified GCC because the size
of bool types are a bit vague in the C standard.

regards,
dan carpenter
