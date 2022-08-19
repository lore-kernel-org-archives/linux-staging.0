Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BC5CB0
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660902111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QK3tGbhgg9Wc4LaimALsSpNV614pnfrrnLDCexVqWss=;
	b=Y+P3NC2C91KQyokc+CckqPwn6BoEdlI/vcZKxx5PP7OXtmJgbiE8omx/a+TMG+G0P1yFua
	fBXFx0tDRvC66Sy0mAmIhsO+jAtzJiWNQBMU8M6RBbc9bPNnhPGl5+paJvh3R5VM38Muf8
	WvOYYRilSFccOzRa84+1vSvE6jqKUQg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-vPOIWXNVPyaO8lnG_5a2qg-1; Fri, 19 Aug 2022 05:41:50 -0400
X-MC-Unique: vPOIWXNVPyaO8lnG_5a2qg-1
Received: by mail-ed1-f71.google.com with SMTP id h8-20020a05640250c800b0044642d29d35so720036edb.18
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 02:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QK3tGbhgg9Wc4LaimALsSpNV614pnfrrnLDCexVqWss=;
        b=o9eBEKP+4zpV1bCoC11V7JRLHmkB9oLoghVHsqkREzD9DS6xF1SJJy+sRoCPbUSA6q
         kYRSKONZxxUM4j838/NQOTMgjPqkh0gYhiFWffi7Lrv39p3UkLJoGTtN/QEHphaKYG6w
         sXvcA+GnMVRq39pNgqJ6F6IyvJ/kzwKvee0WWDpeHuzwd8LFKXwx3euz0OixylyQvJPB
         Q9hLxSD6n4ZV0tPly30Fo4xz1n5ATb86YqWSOi7pNHv7O0rnccTFYjt2suh5vpOs0/07
         iZt/JTLlWxzEPLktvvKfIQhseOu4io+UO10vuLvt7Ms6iA7txBKwRSe5ODnjigzsM4VT
         /M7g==
X-Gm-Message-State: ACgBeo0cJVucWm43NGqghyKEs163WUZyD0dGvoY/+KV4F2PUFvvctCwj
	Vkw99pwjDeejLD8gMweGTkbWyhbWmBxwkw7VSYrS0w07lC0nhfYqEtGXMp7r2uEtpp4fKSlJES4
	gT+4oLylt/I4e+07jYUDWr/wYDA==
X-Received: by 2002:a05:6402:14c7:b0:445:bb86:3f15 with SMTP id f7-20020a05640214c700b00445bb863f15mr5546112edx.68.1660902109040;
        Fri, 19 Aug 2022 02:41:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5pkXmoWgzYRI0p/MWqkQVQuvYeIE0y/URefg1UTLL6L6RUHk9durJLYXgAFLxmuXHJDELjSQ==
X-Received: by 2002:a05:6402:14c7:b0:445:bb86:3f15 with SMTP id f7-20020a05640214c700b00445bb863f15mr5546101edx.68.1660902108849;
        Fri, 19 Aug 2022 02:41:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n22-20020a170906701600b007262a5e2204sm2050079ejj.153.2022.08.19.02.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:41:48 -0700 (PDT)
Message-ID: <4f280f1f-7fa1-6e35-657d-6e68c41d9b1b@redhat.com>
Date: Fri, 19 Aug 2022 11:41:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/3] staging: rtl8723bs: remove useless files
To: Nam Cao <namcaov@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Larry.Finger@lwfinger.net
References: <cover.1660901124.git.namcaov@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1660901124.git.namcaov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/19/22 11:35, Nam Cao wrote:
> Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
> useless. The first 2 commits are preparation, and the final commit is
> actual removal.
> 
> Nam Cao (3):
>   staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
>   staging: rtl8723bs: remove member noise_level from struct dm_odm_t
>   staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
> 
>  drivers/staging/rtl8723bs/hal/odm.h           |   2 -
>  .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 130 ------------------
>  .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |  39 ------
>  drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
>  4 files changed, 172 deletions(-)
>  delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
>  delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

