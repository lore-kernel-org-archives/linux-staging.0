Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23413C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657538011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgrB0b1hGhY+Hu6lpXdXevvlkiE7V1d2yqtg5tmfmtA=;
	b=deqcrmHHYjOSwTYBixOb1KrikdqX3Pcdi70XUE7vduP8jH1lINNvJaumaRpCTH2RcfJNwc
	7CGTA+O0XiI20lbfgbdd7bnWwgS8vjiOPIKJbpPM4VNlu9kiCLiE8aFAqcXF+EVVg15gEl
	qGzQFxq3Gc6QmaZ8cs27hY6xc6D92Ns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-SSJqcx-2Nb-bolvFYnwj0w-1; Mon, 11 Jul 2022 07:13:30 -0400
X-MC-Unique: SSJqcx-2Nb-bolvFYnwj0w-1
Received: by mail-wm1-f70.google.com with SMTP id i184-20020a1c3bc1000000b003a026f48333so2593993wma.4
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NgrB0b1hGhY+Hu6lpXdXevvlkiE7V1d2yqtg5tmfmtA=;
        b=oWsTd3EkQC+9rM0QDUR8jmGpeAk4/NKvOkYnGy8fOUjhgqC2h9txi+SRpR3tEQSQad
         s3Y5seef8Kx2sS+F+ORrJxmfnBDt+0BCWFTyq6mONiSMtI8SBxuQdRxrJ3uQJp6cZCe4
         uA9E5B5h5RIq6gFxjdj3n390w1db3+ZwBqYnlOv8wrTVV45rk3FZviUhZB6rHdAA0d50
         iJnkUXe3XyQPR0PU4RgSq2iG6qfEqiEzc/t9O7nedyNM04DOPzWBXmxXlVaYlgtMVjjO
         foHsj+DGMsYt2PvPr6lkbO1TMX5hweReL5aj7CO2U/7YAT0cTdWX0vR0AEvR8gtW2Z3O
         VOPA==
X-Gm-Message-State: AJIora8shH5RDftIxtk46l/zoxeFITgT5GDO+NKJclR+kzqu0gkIggFU
	31Cy+CTwpv0m3DU1HufVrMP9CLtW6nGx2XsQjMWFATSnWB7bBAes784a53KJ6ISQ5SlidO6Y1Bs
	oaqzrvWuR70YT9BW/x3BCpPumPA==
X-Received: by 2002:a05:6000:1446:b0:21d:27ea:5a01 with SMTP id v6-20020a056000144600b0021d27ea5a01mr16485645wrx.314.1657538009257;
        Mon, 11 Jul 2022 04:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcs0nWJiY8DtaMjFckjPBveM2LCwxXVkUAHZMUUjNEZSyGr2GAAEWa2YiuJ4Zpzd1flJ5Yfg==
X-Received: by 2002:a05:6000:1446:b0:21d:27ea:5a01 with SMTP id v6-20020a056000144600b0021d27ea5a01mr16485626wrx.314.1657538009047;
        Mon, 11 Jul 2022 04:13:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g10-20020adfe40a000000b0021d6d18a9f8sm5562294wrm.76.2022.07.11.04.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:13:28 -0700 (PDT)
Message-ID: <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>
Date: Mon, 11 Jul 2022 13:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/11] fbdev: Remove conflicting devices on PCI bus
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-7-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove firmware devices on the PCI bus, by calling
> aperture_remove_conflicting_pci_devices() in the probe function of
> each related fbdev driver. iSo far, most of these drivers did not
> remove conflicting VESA or EFI devices, or outride failed for
> resource conflicts (i.e., matroxfb.) This must have been broken
> for quite some time.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -949,6 +950,10 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	int rc;
>  	u8 regval;
>  
> +	rc = aperture_remove_conflicting_pci_devices(dev, "arkfb");
> +	if (rc < 0)
> +		return rc;
> +

I wonder if we could think of a trick to avoid open coding the same check in
all drivers. Maybe a combination of using KBUILD_MODNAME for the name and
a probe callback wrapper or something ?

But probably not worth to invest more in the fbdev drivers and could be done
as a follow-up anyways if someone feels like it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

