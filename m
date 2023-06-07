Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300096AB9
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686128451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
	b=IDJpD5gQeZiVhhfAYknJ+UrCFMA9z/Bm07Oy9OEyKLXQc77SaCVrm/yxVW6idrlHgIjn3C
	PgoUXFAxHm2UVNhSMLAol/62sf2PMzTIKXE0Nysq5CzKgtq3o6l3l3jkvh+f8u59XzrI30
	9mjLBHpmpOpeLx7S8Jr6KkHrOUBN+IM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-_le6N377OjKqdf07lHMZQw-1; Wed, 07 Jun 2023 05:00:49 -0400
X-MC-Unique: _le6N377OjKqdf07lHMZQw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so35411015e9.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 02:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128448; x=1688720448;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rVTR4IxyLBLXJW/X4J1N4pKhPGAjKCq/t5JfKIVV29U=;
        b=XlKNef/ceRCfuXvaDa0anHsJnC1/Pq84ZlYONZcrQUyaFSPl61E6hFGXFI3RkWciJK
         brzanBL6gDY1apt98HOZMYESFLyrwahjOjGM9EVGtaLmOP9du8fBB9ZHu09iavAC0lNA
         ibDSqIq5v7Uxk1bNCkiLmNwlMrK9FaObDzg6wjqJ0RMvXQKy2NOkSyGAryZLXdkqXtA+
         eNUUWDcETzHRWRU3WNDwbLMFExey2ODbjYaci3VG3kIIoq3vLYvAZToobwTF/xqvd8kq
         Fn+lAVL6RothHj2uXWGuMgnDFZ7QWKp8IX4x8WNJ2Xtuc7wsQo4+KbAIOwjoUVg1gMMa
         rOkQ==
X-Gm-Message-State: AC+VfDxgfqeUSPD6TZEinlurj09j9u36eKLMa9Fla+gYYqcus+i4Pb2Q
	70nqSiGNlRpwlJo1bIV+bJyEyhUJKVazdml1HeHCy1BqjVpP5+KIx+eOrBM5NeZiSQHnJUP9Flj
	aPdaRk9Zctb7C9QweAZaseSoHcw==
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id 2-20020a05600c020200b003f735759e28mr4341994wmi.41.1686128448792;
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DpfZRaNzsiu/uAACD5Q0ndg8v93wxyuv2x48c658BhjUxR/uhCQIbScZ6GMWBCIsDezZdiQ==
X-Received: by 2002:a05:600c:202:b0:3f7:3575:9e28 with SMTP id 2-20020a05600c020200b003f735759e28mr4341976wmi.41.1686128448503;
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003f7ba52eeccsm1449794wmd.7.2023.06.07.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:00:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/30] fbdev/mb862xxfb: Output messages with fb_dbg()
 and fb_err()
In-Reply-To: <20230605144812.15241-13-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-13-tzimmermann@suse.de>
Date: Wed, 07 Jun 2023 11:00:47 +0200
Message-ID: <87fs73fxz4.fsf@minerva.mail-host-address-is-not-set>
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

> Fix cases were output helpers are called with struct fb_info.dev.
> Use fb_dbg() and fb_err() instead. Prepares fbdev for making struct
> fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

