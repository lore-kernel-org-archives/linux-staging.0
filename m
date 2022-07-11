Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AC3C1D
	for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657538179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdUttr5ZKebDNfRRwhSduk+8HDPwZtCqmZ3OBESQeoQ=;
	b=EMa/d5rH4uSlAPC/gwoMGQiQNx7JOqWwqlD+6lTo3KKpUU3vt8T4V+RW6cw0qebSXq3abZ
	1Dd7qO62pSkI7H4tR9V/ehDLJo6dX0GEKEH7kzAR1QoB9oCx97Qjmu1bhPfsTvvkm8g1NV
	TeFCEglXz53rp9IsSfXgHs/DuYDUMzo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-BYmSsiWpNqSw4Mzd9_DKdQ-1; Mon, 11 Jul 2022 07:16:16 -0400
X-MC-Unique: BYmSsiWpNqSw4Mzd9_DKdQ-1
Received: by mail-wr1-f71.google.com with SMTP id g10-20020adfa58a000000b0021d419f7751so543957wrc.23
        for <linux-staging@lists.linux.dev>; Mon, 11 Jul 2022 04:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JdUttr5ZKebDNfRRwhSduk+8HDPwZtCqmZ3OBESQeoQ=;
        b=VTu2QXQnQZ5cx774dq1lHlbhD4QwyxJnBtE3IOznNe93pfSpUtVX/+AjrG1+u61YAj
         lTa741IU0myhdMDX8utRK4fYmxr3kDg6k0vSPyyd1i4q8YmSaPn3XOcviWcb9ftW7ZR9
         w/6JTWhhPuvx1Y6GFTrmDokmvVF6QCZIP29igBfi/P3DhCCcKzX9rK84eRAS2zfbro4/
         rrTVd+PoeZn1n8h7vMShLWhLKzHqtYq2iF23Ky7CvQDTxzeqNtUR9fFmJiWzMbQZVdko
         wHqXrKmfz0MhRWsZ62USoSyO8yDK6SiDo8d54uA3vxLLJCH5I/gM8uereCFhtty5lF8y
         Tivg==
X-Gm-Message-State: AJIora9neVJ+ZQAq7vVgVfamIReqwHqum8bj9Td2VtekyJEFaJ5/NtKI
	P3nb69zsbJyyu2kYeBZ60/UlN2Nr+OMdVIexRy16LxauuJfkvVDQP1NdV7gvibLlzXQr/y4/bCU
	ixHnOz4WmsEdXx6E+QTFJZPLImg==
X-Received: by 2002:a05:600c:3849:b0:3a2:e7fd:e084 with SMTP id s9-20020a05600c384900b003a2e7fde084mr5031455wmr.15.1657538175195;
        Mon, 11 Jul 2022 04:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEx9XRLsglHmWCwo72ASF8BSSzK4h0vkHDnN9UU6eO0DlvvXvfi0JFZ5WgX9TcLEpuLZadOQ==
X-Received: by 2002:a05:600c:3849:b0:3a2:e7fd:e084 with SMTP id s9-20020a05600c384900b003a2e7fde084mr5031444wmr.15.1657538175040;
        Mon, 11 Jul 2022 04:16:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b0039ee51fda45sm6673199wmq.2.2022.07.11.04.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:16:14 -0700 (PDT)
Message-ID: <7b6cf5dc-eeef-96c2-947d-a09d29bd0db8@redhat.com>
Date: Mon, 11 Jul 2022 13:16:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] video/aperture: Disable and unregister sysfb
 devices via aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-8-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220707153952.32264-8-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/7/22 17:39, Thomas Zimmermann wrote:
> Call sysfb_disable() before removing conflicting devices in aperture
> helpers. Fixes sysfb state if fbdev has been disabled.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: fb84efa28a48 ("drm/aperture: Run fbdev removal before internal helpers")
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Changcheng Deng <deng.changcheng@zte.com.cn>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

