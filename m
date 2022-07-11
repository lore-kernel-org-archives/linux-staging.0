Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833C3C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657536641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJygbU8DB1FiBG5kEv9BqrgeJXrXPjMOQW0TEO91yo8=;
	b=Yj+cMo35D63G1JmRSAe1fR1auPcJ15wSeexwiWCp7S3tG2EX0DCWilAmyEdX0j/LWKMNJd
	n+ZWzpGW9S6/VnUuIJt/zVxld6LdRJrjlrzlzxHkNMyfUMa8n+mWY8B6ZoM5yZBr0xRqJo
	cKgytzKe1fz1SowDVJAPmfDGH/v4hIU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-mFGSbB_fNUyDKpffLxSBgA-1; Mon, 11 Jul 2022 06:50:38 -0400
X-MC-Unique: mFGSbB_fNUyDKpffLxSBgA-1
Received: by mail-wr1-f69.google.com with SMTP id k26-20020adfb35a000000b0021d6c3b9363so520300wrd.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 03:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fJygbU8DB1FiBG5kEv9BqrgeJXrXPjMOQW0TEO91yo8=;
        b=1w77cwzNTufLJ6/Rl0iYVcisCjOVEJ4zRTjKzdpMA1nKmE45ytf/aEPI8n9/X2/rQg
         cWdtrit91Y5v2doXyLSpy9KEVl/z5PzI0SSQRAFWSqyYsTQspqkZDndju9YxiO7lpsDN
         l4fGlvjDCaLRMutC+BtBMENTuqu0l46FQtjMtxAxazsd/HFmrRoPcyQAlgKtRGYM1CQq
         YeL+18YF1iMFgCt3fXVLANbSekK+0o6gZmXFIvnS9VHMFZvuAL4AJK5kr16BuxeLtLNC
         dIeTc5FJ9jqq3CmGprhScxnXbxoVa7meAlpqGhwVDZwtfsqKLKZR/kC8MqJ00a42JfwB
         Rv/g==
X-Gm-Message-State: AJIora9V9p24p8iX40QcXqoyUtnxfLmb5+59rsK4kZnSBLWCAf240Omu
	e1EQev3S2NKFstCVZuRdNRGNo/xRysqWK3eZU+woXF+dQrV7VDSDHprU1+Z3hdaacpdYQYKpaXq
	j0N0gpE4aPT5hcGvdj/pBnxBFOg==
X-Received: by 2002:a5d:6e03:0:b0:20f:ca43:badc with SMTP id h3-20020a5d6e03000000b0020fca43badcmr15688989wrz.547.1657536637585;
        Mon, 11 Jul 2022 03:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqrhuJBI2xK3PCG7LV6zpLGuGhwp9soZtin6v+gEj3U32QOjYtCPeSaN3ySxWPQEOj9vpEqQ==
X-Received: by 2002:a5d:6e03:0:b0:20f:ca43:badc with SMTP id h3-20020a5d6e03000000b0020fca43badcmr15688976wrz.547.1657536637359;
        Mon, 11 Jul 2022 03:50:37 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c1c8500b003a047f64496sm6509025wms.7.2022.07.11.03.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 03:50:36 -0700 (PDT)
Message-ID: <b499ad15-e681-1f2c-dc11-2d94c1066ecd@redhat.com>
Date: Mon, 11 Jul 2022 12:50:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
 <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
 <253d0bea-f197-4208-b5e6-39c22ab91833@redhat.com>
 <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fafde6fb-17ee-1c18-9e5f-96e60a08d98e@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/22 12:42, Thomas Zimmermann wrote:
> Hi Javier

[...]

>> That's why I think that "vga-framebuffer" as driver name would be misleading.
>> Specially since it would also bind to the "ega-framebuffer" platform device.
> 
> I messed up device and driver name, such that misunderstood your remark.
> 
> As we use the id_table field for matching devices, the driver name 
> doesn't matter. [1] So let's keep the driver name as vga16fb. The change 
> above must have been left over from an earlier prototype patch, I guess.
> 

Agreed. The driver name is used as the last resort to match a device
only if there isn't any device ID table (ACPI, OF, platform, etc) but
that's discouraged. Specially when the same driver supports different
devices as it's the case for this driver.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

