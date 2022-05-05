Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ED729AA
	for <linux-staging@lists.linux.dev>; Thu,  5 May 2022 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651774274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kLRudaiszTccdqB1Vd77KpaI2iWJChA3O1GYOzzQuoc=;
	b=VFIs+if8/Jo09Ye/qt8En1bHfTLtyA3UW6kcMVDzIY21J9rucG6cBg3m1kpSAT0xg5tL1d
	I9JXF8I1MIK/uuNO/4QGsYtsPkKJLrSfbViFkxGOUHsmtwmVXZ31D6sWsYaO4d2QH5vbgc
	HGLpb/uClCHYmncYDX/eZflD+ZLYrJ4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-Fk5B15pjO-KojuwyTGd7eQ-1; Thu, 05 May 2022 14:11:13 -0400
X-MC-Unique: Fk5B15pjO-KojuwyTGd7eQ-1
Received: by mail-qv1-f71.google.com with SMTP id kj4-20020a056214528400b0044399a9bb4cso3828645qvb.15
        for <linux-staging@lists.linux.dev>; Thu, 05 May 2022 11:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kLRudaiszTccdqB1Vd77KpaI2iWJChA3O1GYOzzQuoc=;
        b=L5UYpkWzt4o32ibpf2CDvYWx+lc+bEuAIES4Z4ArVv3bJgGfQU0HTJta0to7Lvvjfs
         I+CDC6z7CXTY/S0Eb/9oeWYkttppcL7F6k8smijnX069SWN+h/8Ub7LRW1GOareAoLj3
         QIbvd1+u5e93YPXTMQypFIxe9DkFEBnb9oxDYFBWtBsra1cbf9qpyJeszFxoued6qnEa
         kiAhK6qEiAI2Ngb+BXpLlWENf3o92/1tLuZHrREy2QhX63v3V5xZr6rCGr8vAKxNZc8R
         2zHfVZh/lEq8yA7OJm54Yf/oWUBe7/Vk4mYQucoysM+BjwbPDnVbTqDAbK5JwHO9N0wv
         bP2A==
X-Gm-Message-State: AOAM532MXQIQDys9W0MOiNvyzW9l6MeZvIqVritBkub2G4WT5xk613C6
	JVTL23GN1NKHGSczHfW7VewqLULMBiSAoEGGuFxeO3Jbfw5Mp4KlsHFEPnHvsanpz5GsbIv+GTr
	QOEKyYLNSEB2ifUMs77QxJVZlhw==
X-Received: by 2002:a05:622a:20f:b0:2f3:4e5c:3271 with SMTP id b15-20020a05622a020f00b002f34e5c3271mr25103845qtx.44.1651774272660;
        Thu, 05 May 2022 11:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwODdZVXSmIrr3XKHkaq4AMOb8tfd+YHR41zI+HxWst1xMd12GMM8tAoRhnMZaQTl0FAyFWCg==
X-Received: by 2002:a05:622a:20f:b0:2f3:4e5c:3271 with SMTP id b15-20020a05622a020f00b002f34e5c3271mr25103826qtx.44.1651774272473;
        Thu, 05 May 2022 11:11:12 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id d9-20020ac85349000000b002f39b99f68bsm1167214qto.37.2022.05.05.11.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 11:11:12 -0700 (PDT)
Date: Thu, 5 May 2022 14:11:10 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: vchiq_arm: get rid of global device
 structure
Message-ID: <YnQTPmNAvpbQl5Ws@fedora>
References: <20220502183045.206519-1-athierry@redhat.com>
 <20220502183045.206519-3-athierry@redhat.com>
 <8483a250-da97-1875-4ea3-598f46ae96ce@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8483a250-da97-1875-4ea3-598f46ae96ce@i2se.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

Thanks for your feedback.

> i understand the motivation, but could you please explain more in detail
> why you decided to add vchiq_instance instead of device reference? I
> think vchiq_instance is a more internal structure which should be
> avoided in kernel consumers like bcm2835-audio or mmal.

I used the vchiq_instance instead of the device reference because in order
to get rid of the vchiq_states array (patch 3/3 [1]), I needed another way
to access the vchiq_state in the 'handle_to_service' function. So I passed
the vchiq_instance to it (I could also have passed the state directly
instead of the instance), and this propagated in the caller chain all the
way up to 'vchiq_bulk_transmit' and friends which are used in the
bcm2835-audio consumer.  Please let me know if you see a better way of
doing this :)

Thanks,

Adrien

[1] https://lore.kernel.org/all/20220502183045.206519-4-athierry@redhat.com/

