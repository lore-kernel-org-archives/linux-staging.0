Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9473C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657539209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+eRpdrxBgQt0p6K0v1wmxFNTfVvVH/tFOB6mgp15MI=;
	b=HroZbq1QyZqpHBInLeeg7Mwu8BJBfiTZdU8ZVCHrN61KTHzhflE6vFGWBEZNHNKzTMSGFm
	enDq3ZM9LIZx6yCBj+9h/8ixHXD58D9de3HqYMGIHP6sEueu7pa66tMXagYgTh0bxsN5nS
	KldMr+vOlk3H0QgH4TxtHGK/FNbl/YI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-917gWzlMNI-ab0TTFGR4kg-1; Mon, 11 Jul 2022 07:33:28 -0400
X-MC-Unique: 917gWzlMNI-ab0TTFGR4kg-1
Received: by mail-wm1-f72.google.com with SMTP id y14-20020a7bcd8e000000b003a2ea282944so182925wmj.0
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C+eRpdrxBgQt0p6K0v1wmxFNTfVvVH/tFOB6mgp15MI=;
        b=2TfpK7uIao575+M6FzC/mNXBqzAbL0vVV0eRX5lo8S5a1ZK5ujikZ1Gp7t8v8CS/oZ
         3uBSNcJK6Sdi44vsoV3ABA53Mj2UDcgul629DVQEq/rA4+Tq9sbn2zyLnsemnYJSHjf5
         h0bCnSTz9eK7B03KTOmyI+/cS5reCvxDKZeZkzB/m6Xan5edeTqF5ZWvHBy4jQQWetoz
         OgBgiZZAGaRML6lHtjRhsOlNH6x08kUE8X5aBCSA2q0LYDmOTVtIat7u7tJEWD1n5GJ8
         J2/Lmuvhz4/8+Gn47w8AvkI4h58P4kpAAGvJXPzgjJNElF+BL2Pvpuu2eHOt3uUwYNk+
         TjIg==
X-Gm-Message-State: AJIora+1uVve5ncmdm/0VfP5TqPUnJG3wQLodMY1svoMWyUN932FJ+Lu
	Aq+4PR51ntucmGnuWhRwbaMOSBnUsT8JWuUtkkX/z65qpGKrRVVndUNb4Zf5OjmFwKuBDaMHCsj
	cD0nB+bOOwMkA6Pt+uB/qbPirLA==
X-Received: by 2002:a05:6000:1846:b0:21d:90e9:eb38 with SMTP id c6-20020a056000184600b0021d90e9eb38mr15874533wri.264.1657539206839;
        Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukVj1igcMMa9SefXsYyz4JKT4jyMTF7lkAOL7ByBHf0PskNwLBAgeRnDAzuL41/lTsk2X9tQ==
X-Received: by 2002:a05:6000:1846:b0:21d:90e9:eb38 with SMTP id c6-20020a056000184600b0021d90e9eb38mr15874520wri.264.1657539206675;
        Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q6-20020a1cf306000000b003a033177655sm9811923wmq.29.2022.07.11.04.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:33:26 -0700 (PDT)
Message-ID: <93fd9fd9-eb43-49b2-4322-95952626895b@redhat.com>
Date: Mon, 11 Jul 2022 13:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/11] fbdev: Remove conflict-handling code
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-12-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-12-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Remove the call to do_remove_conflicting_framebuffers() from the
> framebuffer registration. Aperture helpers take care of removing
> conflicting devices. With all ownership information stored in the
> aperture datastrcutures, remove remove_conflicting_framebuffers()

data structures.

> entirely.
> 
> This change also rectifies DRM generic-framebuffer registration, which
> tried to unregister conflicting framebuffers, even though it's entirely
> build on top of DRM.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Amazing patch! The whole series really. Thanks a lot for working on this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

