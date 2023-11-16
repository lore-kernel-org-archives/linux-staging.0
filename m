Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3814A2EAF9
	for <linux-staging@lists.linux.dev>; Thu, 16 Nov 2023 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPeXZBy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700135085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RWBdAfvMBvXM91oAEjKzolXCmdPgAd5lIYD+DF4PVIY=;
	b=DPeXZBy3jdy7y/Nbqrfy7iqnsMF4pXs8R0MH+L9RjtqxZgWr/8bW8owUBxqx6BHRG2q4CY
	bXUWZ58XshFTds/WP0n3+yLl2mkikXa7y6Vqe+3tnaOUiCMc5EnJazJwpUd4gqqKvXn7Jh
	JNsfiXuMEYP4t01UPVQ3H/GJbT8qhH8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-emXPfiVaMu2rXcSgqehB4g-1; Thu, 16 Nov 2023 06:44:44 -0500
X-MC-Unique: emXPfiVaMu2rXcSgqehB4g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40a48806258so3934365e9.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Nov 2023 03:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135083; x=1700739883;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWBdAfvMBvXM91oAEjKzolXCmdPgAd5lIYD+DF4PVIY=;
        b=ka264kzOpy/Ti9uzs52x3ZXf0Ahw7RDQOnT3yLlow2OQItoMxxW8AEoach0oYdRWNi
         x7Wv0cGvpTADCa0CEGwISqN4YIo9zoZYl+hdO/eWrYl7uDySnpJWNuUpHmsLUaqoeFXY
         C1IdtG65g8KJFxqzG08IWqwixqidtv98kn1mRTPEA3r1YD6dsDO9DmVm7TrRdrOgA9q0
         IBQSyuxr9V4T3uPU6vdndU+6Wr9mXFPR5Ldl28MwhnepryYrTjBo1zUonQlXUa5Oz9bx
         iIYZcbFuyrFdXCaQ40H+xL5ntBwS4h3xtfTwtwL2wLF5Br+HEwPEtS0W6kqWDrZo3W8S
         Vhhw==
X-Gm-Message-State: AOJu0YywGAUXmE0M3HlDoIqzLqZmrT2COVImFvD6nIHgTQrGdILX8JMs
	62kdwADM5IpgYms2ypdTROp8DPbkMh/i2iFpn4uIqKxuYTYv3M0ii9V8wDF9wkc/jCwL3D5abmR
	K7JjibFAmHieBmeNPdU9lcsAVFQ==
X-Received: by 2002:a05:600c:350a:b0:405:359a:c950 with SMTP id h10-20020a05600c350a00b00405359ac950mr13330097wmq.19.1700135083501;
        Thu, 16 Nov 2023 03:44:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAB7R6TX3y7IW/ozo4VrNr9YJdex4yJeaGhFiIclSVMpfZrs4uKUq3O6rvSXhk8OPjiKhQqQ==
X-Received: by 2002:a05:600c:350a:b0:405:359a:c950 with SMTP id h10-20020a05600c350a00b00405359ac950mr13330084wmq.19.1700135083231;
        Thu, 16 Nov 2023 03:44:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b0040644e699a0sm3203052wme.45.2023.11.16.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 03:44:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH 25/32] staging/sm750fb: Declare fb_ops as constant
In-Reply-To: <20231115102954.7102-26-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-26-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:44:42 +0100
Message-ID: <87jzqh3ot1.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Split up lynxfb_ops and declare each as constant. The fb_ops
> instance used to be modified while initializing the driver. It is
> now constant and the driver picks the correct instance, depending
> on the settings for acceleration and cursor support.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> ---
>  drivers/staging/sm750fb/sm750.c | 59 +++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 10 deletions(-)
>

Same than patch patch #6, the change is less trivial and would be great if
someone with the hardware can test/review. But the patch looks good to me:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

