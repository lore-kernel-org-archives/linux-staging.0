Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51133C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657538504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EA1fN116GiBeZpsIBZbEwfZ8hmNEURQAPP+h9KqfA64=;
	b=hYgLnbRGM+DSZxcZiXOJanzmRPxrs13zoRrVS1xd7bEml02HsPaI+k9FHidcyMaCYUwfZP
	UfRYRptUEt2Vd4wGjvy6fOwXgp91oEANXz1Fs4vRIgMXk4aJg56K3wXYEj2MVFcoRBDhF/
	ONBNV3hEFb7lMRsYH83xz+Eei9XEK6o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-rUc4gEl_MVeq7Qz3QJLj9A-1; Mon, 11 Jul 2022 07:21:43 -0400
X-MC-Unique: rUc4gEl_MVeq7Qz3QJLj9A-1
Received: by mail-wm1-f69.google.com with SMTP id t25-20020a7bc3d9000000b003a2ea772bd2so117114wmj.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EA1fN116GiBeZpsIBZbEwfZ8hmNEURQAPP+h9KqfA64=;
        b=fsPsp7zyrwWX7VQ/7+wlUeIzcUYakTT2wzvKE51CUROA2CvgdyM5JknEKlWcLuai09
         OzohXad4DeHsz0zKaWAegl0Egtl+Pl6dztz/468KvNwsF/DWB6a8eNKY3jevciD78qSV
         u1byNwV0foy1mq3LraFaNA53Q9usfio4QTfxTxU9dz2mfa+0qLNyUVf0tSP79KVqY8hx
         RlCzPYvMlk/deagFIgKL9+s1qtB9yg/BkiSp590XS+95bhbM3xUDs2NFhUYWUFvGNyWr
         ABW+jhJtkGm0HxNnct8Nso6otKCgmTdfsS8R7kdHhWxWWBCIzGiYhtJqbUiIneWM0xPK
         OAJg==
X-Gm-Message-State: AJIora/KnMnrKVadz1ZXF+QHnVxpkVLNi2B080XNZeekQWW6zARgeQ/K
	9KlDSJ1CloBw0OhCls8g0m2gR8c8irtujjC0T/Gyyf9lfOmGhXdV4BHozGNVxyW7smr9l3B0+bE
	8PoGA4mJv9ViJGOe1k+9rycZEqw==
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id m12-20020a5d64ac000000b0021d7832ecf9mr16718313wrp.86.1657538501996;
        Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vViTnrccYUQiM5dtYGiMoQe3XlJipDQ2tJJSnuKHUKFgjkwhFFyBuMGkA64X7e1vg9JvJxGg==
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id m12-20020a5d64ac000000b0021d7832ecf9mr16718296wrp.86.1657538501845;
        Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c2ca600b0039c63f4bce0sm9837768wmc.12.2022.07.11.04.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:21:41 -0700 (PDT)
Message-ID: <00efc10a-a033-02c0-d5b3-95a5a1494c5a@redhat.com>
Date: Mon, 11 Jul 2022 13:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/11] video: Provide constants for VGA I/O range
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-9-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Provide VGA_FB_ constants for the VGA framebuffer I/O range and convert
> fbdev code.
>

I would probably mention in the commit message to that you are renaming
s/VGA_FB_PHYS/VGA_FB_PHYS_BASE and s/VGA_FB_PHYS_LEN/VGA_FB_PHYS_SIZE.

I do agree with the rename and think that makes it much more readable,
but think that's worth to mention the rationale for that change too.
 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

