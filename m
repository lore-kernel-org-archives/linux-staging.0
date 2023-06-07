Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BFC6AAE
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686123740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
	b=gZ231ichOXO2PsDCf8N78v1GZF4IuEVoChlFzGhTho8vPdadPGv6BCU3+HNWnxwld7AnSZ
	b37cO1SM9r8OtfjqLmTYk4i8qErdpRr888h3ytpxr8QKrQPgKDU41i/QcWZsNvW3/IteJH
	awYL3CHNBeBASGhvcg0DRLFpJKnOZSA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-IsQ1HgrvPXypdXaOUThIjg-1; Wed, 07 Jun 2023 03:42:19 -0400
X-MC-Unique: IsQ1HgrvPXypdXaOUThIjg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30c5d31b567so2492983f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 00:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123738; x=1688715738;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpM3n9uxiNBqWYphesbEdJfBdCBdNVjlNpr9KooViE=;
        b=X+5THs0yWY/WSFFpIg509Mv4Ae5pUDCdmKeZycePL3VNaK7PmD8YJlLpCQvVtUrHki
         s+8tsob6j4kh+IH5Pz5wDhqMvt2HL6Hj1euRuboe92Yfa2nL/RDq3IpkWLxfEzzmmJw/
         RlMlSSN/XJU7eefgfOQnuhvSIfF2OkwId3bF+KD1Aj8OmG0YV5vI0w2HVV3t1w9ys8k/
         uVbE5ecVSkXwO9D0RYna1QUATC4f6K1EITe+qi7KjLjG19iSjuAknGnUu5lr+Y1+MkrV
         Vaj5eOQY0R+l/CVtrzRCZV8WMi0hwFfdLGY2tkd+akUVnCCuilQrex+8Tu+rDivGW8Zc
         aVnQ==
X-Gm-Message-State: AC+VfDxQ1qbjZ7QWe9Z4gAS1Xuw3AGL7/sYtpL2zm9zqxD7L1NDTzpFk
	bKKhMsLIRGIfInn/v97mOycaUDVIfxIXV7bGbERwnWHyGGwL8gH+16WuONIktfTYAklzyxUzgIr
	NiubQVYOKbedjwptckGtfu3e7Sg==
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id t8-20020adfeb88000000b0030e45ac810emr3734965wrn.36.1686123738653;
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5KZwfGmENtFpHBv/PbHt1rJPnSSY7XTJGSBoIFHGMz6zbW+M0/3e5qcpQ+OgRWGlPIuGCuTA==
X-Received: by 2002:adf:eb88:0:b0:30e:45ac:810e with SMTP id t8-20020adfeb88000000b0030e45ac810emr3734950wrn.36.1686123738508;
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z13-20020a056000110d00b003047dc162f7sm14752394wrw.67.2023.06.07.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:42:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/30] fbdev/aty128fb: Reorder backlight and framebuffer
 init/cleanup
In-Reply-To: <20230605144812.15241-7-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-7-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 09:42:17 +0200
Message-ID: <87wn0fg1ly.fsf@minerva.mail-host-address-is-not-set>
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

> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the init and cleanup calls for
> both data structures.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

