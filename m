Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C29E3C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657538648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXcH7XPyiqXQf/YCraM2DsGXqmeqYbmlOyORvpQYVqY=;
	b=WlG+F+qpVD/SVbuOlPgPoJb66DgZtDwNLIj34iKQuFzpNbcaWTFhkPrwB59oanI7VMPIIc
	Ybj95IRHDpLcdwD62hgNL8d9rtJqNg2l0qYtaTNwhIzgmIMI93fgexGL5l09CPtXi4Ij/Q
	5mZWyYRfDo+lpZhxoxXlm8TsOKVoZGY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-zV6gjwK6NCu4lpYlZk3brQ-1; Mon, 11 Jul 2022 07:24:06 -0400
X-MC-Unique: zV6gjwK6NCu4lpYlZk3brQ-1
Received: by mail-wm1-f69.google.com with SMTP id c187-20020a1c35c4000000b003a19b3b9e6cso5082036wma.5
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PXcH7XPyiqXQf/YCraM2DsGXqmeqYbmlOyORvpQYVqY=;
        b=4Z0/RZsMu3naSIEM9ILzV9iRmfBlETHZbsELPYaWHyESF8Hn9gCytcvofUr/KVGFlC
         8hzJyvyiIA7p6AhGK2dlwiwv6tN5LXz7m+Os4p0ZaTHKgTZRCDT4yh2Elm2pX3XG1syH
         0xbhyma9op92/Xf7VVSaM1pReCPviybhg/4DYmQTKHP/0o1H3J4fzClq+GDMMDDWQ/m7
         VO9cnToCzy5mhHYj/MdcDQVjGJMBzUn6pwYeY092sL1Wj4ySrxsdbQGynXV8/6xbtC9+
         7FIR3H5oBBqy0rPK+HfQDsWZvawWtherllg++CcA+O6/CECtLw352YgH/yDmuMnonWg7
         cIQg==
X-Gm-Message-State: AJIora8SYiZdIvAikSrMr2ceXr+M28i4HTqlHabU7hFjk/N6Ajn1xVY7
	nbqkBA7DxJrLTG2rxwkfon6D+p/WhGChuDcpmsn17SGI1YzvZIuN/BP61KZggiECDlCyaEmMqfS
	630winEjwXac7WlvtiTjbjxaHOA==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id y9-20020a5d6149000000b0021d6ba76095mr16111656wrt.680.1657538645788;
        Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t+UhotmR2eivMrEaSMsPtL4oXAPCvxQ5CRcLHZzaRlgXGZLXCBF4emHYXNPE71YvR1EZ7rjw==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id y9-20020a5d6149000000b0021d6ba76095mr16111641wrt.680.1657538645616;
        Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a056000136100b00210320d9fbfsm6783085wrz.18.2022.07.11.04.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:24:05 -0700 (PDT)
Message-ID: <b0f5479c-1880-65f5-3870-191603468828@redhat.com>
Date: Mon, 11 Jul 2022 13:24:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/11] video/aperture: Remove conflicting VGA devices, if
 any
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-10-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> On the primary graphics adapter, a driver might conflict with a VGA
> driver that controls the VGA framebuffer I/O range. Remove the VGA
> driver from the aperture helpers. Until now, this case has been
> hendled by fbdev, but it should work even with fbdev disabled.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

