Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C302F34
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657886201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGkIOwyvFmzhbCUYm5+8xL8ziiXjaFbbfd3qqafzd8M=;
	b=cYHECUjajMdBZmPoCitYyFl6DCqz6BJweZrJerOEshcxaR59QkitA0IUP4VKNPYe/zXg8B
	+QaOVjcN2t+n8cCQow/yLOiJsUmB02Efo4F2tUtmJOyPUXhjdxbh1J55Uo6OtrkhxXOfBR
	nRDOr/G+Sgw/jHHllpLl3U2rAUWR0hw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-2T9amMGFP0etnrZlRGr98g-1; Fri, 15 Jul 2022 07:56:40 -0400
X-MC-Unique: 2T9amMGFP0etnrZlRGr98g-1
Received: by mail-wm1-f69.google.com with SMTP id z11-20020a05600c0a0b00b003a043991610so1788563wmp.8
        for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 04:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZGkIOwyvFmzhbCUYm5+8xL8ziiXjaFbbfd3qqafzd8M=;
        b=fq4KHj9TgfQhIUH4sAS1kGKIVHgP4+T/9AAX+f/y6aj93tiYZ1lkEpa4fgayTGPqi0
         yWDfe2HpOF8MJU4KdRLgff6veLkYk9imvKj+YXPeUh/gTwgHARoa6qV3+gNc00JTBlRc
         RSs1wFwbDtmKj9zp4XlDO7StU438C6TqBRa+KdO954sk8ZkwePjujSY2RnuEUJkxcicZ
         O/83ux1SYOmIGxQG3z2XmxqnsYpUY6vcfvRF0zsxBjASmGXxXt4ER2UIP3gLiwzTJ3Z1
         qktjnn6kN6bDtrTzeO5D9VDJdUCVgYJ6ZGN/N6CoEgdC9TFaoA1oB65AqI8GXY2aW5Xj
         2HMg==
X-Gm-Message-State: AJIora93Nr9YouJJaN0e/YqT89tPqfj5tBiU4nqrbHgietQcU9JWBTg6
	2R2pfiqRoKddmCw/IbdYD4nra+QNwqGCqjiUl0iK2KtluYFNvGZzlplq99Xfza9FNegFwr3YohS
	nqqvJMQa/CLDVkVQzi3DBpy5Nqw==
X-Received: by 2002:a5d:56d1:0:b0:21d:78ad:c8bf with SMTP id m17-20020a5d56d1000000b0021d78adc8bfmr12518035wrw.175.1657886199194;
        Fri, 15 Jul 2022 04:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smSq19q7Fkw60FMFkswIMOeyBLouoE4txw/9cp+WjMYOqudNHfchdpbzC3yv2/xNNoXTjqGA==
X-Received: by 2002:a5d:56d1:0:b0:21d:78ad:c8bf with SMTP id m17-20020a5d56d1000000b0021d78adc8bfmr12518016wrw.175.1657886198959;
        Fri, 15 Jul 2022 04:56:38 -0700 (PDT)
Received: from [172.20.10.7] ([84.78.249.231])
        by smtp.gmail.com with ESMTPSA id e39-20020a5d5967000000b0021badf3cb26sm4476823wri.63.2022.07.15.04.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 04:56:38 -0700 (PDT)
Message-ID: <3b707e5f-ce33-b08d-371b-701b3a84f549@redhat.com>
Date: Fri, 15 Jul 2022 13:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/11] fbdev: Convert drivers to aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-6-tzimmermann@suse.de>
 <8ebc1f33-f654-6b93-8a41-1aa66ab1901c@redhat.com>
 <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <558097f5-95bc-fa3c-d08e-1ca0a4d6eec2@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Thomas,

On 7/15/22 13:48, Thomas Zimmermann wrote:

[...]

>>> +
>>> +	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");
>>
>> Do you know why this can't just use aperture_remove_conflicting_pci_devices() ?
> 
> I simply don't want change too much at once, because there was this 
> problem with the PCI helper on ast.
>

Makes sense. Feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

> At some point we can make a push to really fix this throughout the code 
> base. And that would include an update to fb_is_primary_device(), [1] 
> which doesn't fill well into the new interfaces.
>

Agreed.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

