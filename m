Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2D3C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657536715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uFWZvmNxeUCUG4J10cXTXSlmZcaIHVpBO/oH3cNaHQ=;
	b=bGgJyGaEg80f7jYqbghgBK3ZkCj1swZcwewQroh4zBsmV5mmZ2AEOv/97P9tsRQw5uTGbn
	i1kxSe2ZaGmPK1Oss7OqZJP7wHVJOB38niPByB0g6l2MFSNKAL4Sexpdbb9cEUyHz3ayKB
	0iR0miXHtlL+LEARzR3qg+tsPK1Gamo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-6hgyyzGqOAOEtKp9-BOVJg-1; Mon, 11 Jul 2022 06:51:51 -0400
X-MC-Unique: 6hgyyzGqOAOEtKp9-BOVJg-1
Received: by mail-wm1-f71.google.com with SMTP id t4-20020a1c7704000000b003a2cfaeca37so2508047wmi.5
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 03:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8uFWZvmNxeUCUG4J10cXTXSlmZcaIHVpBO/oH3cNaHQ=;
        b=0Pv8SnbwcwxW+8O9n6v17Bdy9XHx6zvJa+CcBz8w8RUaZ9GKXLZ6bOULQx6Aw0dNcF
         8oTqLZ5BqlFlSsvYlgj6+mUpjEBKXnxi0hzern2gPyXimv7HRboj2f8DKgxgnfzqJfOB
         SLKycFFAFJkGZCr9HtzmzLuw4cdnH0aZSahOCqywgLSm8ojmQcBgNU4lfCb2BgkKDUo8
         6SLlB3tlPhkDwb7rX9mpDkwFp9SJSoBZHkJlN7XJGM73Cu29VMVHEotJ+oiY4R6YOsZQ
         WdjkpaD6V8o2d65VMcq6VzLxW0JEp8ie2CUHQjAD0HcVwFbJcFfoIhXxSKn4TIXRu2VD
         EmLA==
X-Gm-Message-State: AJIora9IC/H8x/9SbQEvCsdhiTprgZsPhgMKfBvmSUWoVxVEbE5t+1pa
	9Y/r0Yo8sSQKjIbd3YY2l2Q0HAQCeTUd5ZPS8+6MlZMnu//l9TXuKYTSMrYRTbhuiOn+AYCY5d3
	grTQfCTe0YbqqcZRz0rf0QsZHuw==
X-Received: by 2002:a5d:4283:0:b0:21d:7ae3:71a3 with SMTP id k3-20020a5d4283000000b0021d7ae371a3mr16383204wrq.233.1657536710798;
        Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu6LqD2qjjUVCTi9EWsA19dI4u6WP0tL9irr+0IwqQ8S9FDd2rjpYTsgldXuCbUfGofCXuzQ==
X-Received: by 2002:a5d:4283:0:b0:21d:7ae3:71a3 with SMTP id k3-20020a5d4283000000b0021d7ae371a3mr16383189wrq.233.1657536710638;
        Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c3b0800b003a2ead2c884sm71463wms.13.2022.07.11.03.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 03:51:50 -0700 (PDT)
Message-ID: <fc704026-df50-76df-8d55-b16ea1378119@redhat.com>
Date: Mon, 11 Jul 2022 12:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/11] fbdev/core: Remove
 remove_conflicting_pci_framebuffers()
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-5-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove remove_conflicting_pci_framebuffers() and implement similar
> functionality in aperture_remove_conflicting_pci_device(), which was
> the only caller. Removes an otherwise unused interface and streamlines
> the aperture helper. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

