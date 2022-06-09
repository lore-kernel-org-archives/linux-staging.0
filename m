Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A67A
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654796326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6TtggULp7/GiOA6VvEvNpW/MHPOaym0FBcYUcuSeZU=;
	b=gqchbWB21jJ5BTEQ1/Qf8XR9XVozNPSEc8YO8ssu0y2MFB3KPGQb+8jp15+Aw1C9fpF3HE
	BDlm5gm2z+OEuoSSxDY/WzCq0joKsGJteXDgyofeTGbz03rENBuJEAg1qb92/hBzn+LqM5
	q2ccnmYRS8nol89Md4e0WdJk92flmik=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-qwojRFpoNTuAipTVbsA1Lg-1; Thu, 09 Jun 2022 13:38:43 -0400
X-MC-Unique: qwojRFpoNTuAipTVbsA1Lg-1
Received: by mail-wm1-f69.google.com with SMTP id c187-20020a1c35c4000000b003970013833aso8499278wma.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 10:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k6TtggULp7/GiOA6VvEvNpW/MHPOaym0FBcYUcuSeZU=;
        b=8NrKsg8qDjXAHzosnozVgMGvfoKB7zUnZ4ZpHRFWXdKhX2r1oWoHn1QQBEmKWjqjX1
         Q6PTIB0XA7dzJheTFnCYn0F1wvT9cM6n8p//rLk/Sab4O4eVACdYaZjN3Ua2bG1aRMSm
         EFX0r+OMLXVepkS8HJ299BRni6m9j9dW4hp1hQ8gywx6kzuPGxAjS9iWLlWHKo+6wQeP
         nslOjz/V8QXBE8Fm+G1Xf5K6yec3cVII63qBKGlYkEkFMw2pkYkg960VV/MSR5a9ao08
         x343S3Tp/ME8jBbtzdXB60+oq+K8X95WmJcl5JP6OIYqaMPRr/dwUv1CkV6vgg+O/BWE
         ZhUg==
X-Gm-Message-State: AOAM5315YhtGPrcNLEKGZSNkME4sHtdrTWXxncaxH+9aMZasxhqkpYy3
	DyXMrrmxPARE17OJpuMCgMwf3D8gMjwI+FnAqrJdk1qbelWDm9dUmPg3wYqm0AfrUYbfbkyAT98
	PQHe6ruC23s3Ah43RduZIwNKIDA==
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id k3-20020a5d6283000000b00213b939826dmr35332042wru.543.1654796322051;
        Thu, 09 Jun 2022 10:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycbjbAoqYi/Z38MH7gotfLoia/Ifcg797dUpu4eGDAE74k+ABciK+rkA2pggXKQtSvmd1fZw==
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id k3-20020a5d6283000000b00213b939826dmr35332021wru.543.1654796321841;
        Thu, 09 Jun 2022 10:38:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z2-20020adff1c2000000b0020c5253d8dcsm23897952wro.40.2022.06.09.10.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 10:38:41 -0700 (PDT)
Message-ID: <0bdbec1f-196b-b82e-9d64-06029e250983@redhat.com>
Date: Thu, 9 Jun 2022 19:38:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Mark olpc_dcon BROKEN [Was: [PATCH v6 5/5] fbdev: Make
 registered_fb[] private to fbmem.c]
To: Sam Ravnborg <sam@ravnborg.org>, Jerry Lin <wahahab11@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laszlo Ersek <lersek@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, kernel test robot <lkp@intel.com>,
 Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, linux-staging@lists.linux.dev,
 Daniel Vetter <daniel.vetter@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Matthew Wilcox <willy@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, linux-fbdev@vger.kernel.org,
 Zheyu Ma <zheyuma97@gmail.com>, Guenter Roeck <linux@roeck-us.net>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-6-javierm@redhat.com>
 <3ebac271-1276-8132-6175-ca95a26cfcbb@suse.de>
 <69d8ad0e-efc6-f37d-9aa7-d06f8de16a6a@redhat.com>
 <YqIskEjUvJo4y4cb@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YqIskEjUvJo4y4cb@ravnborg.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Sam,

On 6/9/22 19:23, Sam Ravnborg wrote:

[snip]

> 
> To repeat myself from irc.
> olpc_dcon is a staging driver and we should avoid inventing anything in
> core code for to make staging drivers works.
> Geert suggested EXPORT_SYMPBOL_NS_GPL() that could work and narrow it
> down to olpc_dcon.
> The better approach is to mark said driver BROKEN and then someone can
> fix it it there is anyone who cares.
> Last commit to olpc_dcon was in 2019: e40219d5e4b2177bfd4d885e7b64e3b236af40ac
> and maybe Jerry Lin cares enough to fix it.
> 
> Added Jerry and Greg to the mail.
> 
> 	Sam
> 

That does sound like the best approach indeed. And if the driver is kept
BROKEN for a few releases then it can just remove it from the kernel. If
someone still uses/cares about the driver, they can fix it as you said,
and it could even be ported to DRM if is something that's still useful.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

