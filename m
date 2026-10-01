Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9E51EE18
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865987; cv=none; b=YKpwP/HfYKwSt5iij4t8hTGwJu7kSHzvwT5N7CJ9Jr4cjlN/qAEUbKYFkD4rpqhYzks/IBWEGD7HTXnAP2dfwEJT+3jDl5xyOC4lCV/2p0TTW033wiHlzkvIBhN2r27DvoZXHdCdxx1kspl9W5kParvIStfe0lsK5/qbojUnoRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865987; c=relaxed/simple;
	bh=y592cWDD7sh9JPJn4KeHW+g6gg94dBAe9nlpopS5a+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WXXo5vq13jn1eJiimNsk+jEzSawcv0fcsAATkcd6hUskNm8hTC3i4n5I/b/6OF+kVoEF1tOHiOMp9+MZhcQNHSRbbG7bqDMODsunf2KedCcg15VwFsZpaBCN6LzKgrX1CUDLGEsNt78vpeDZV20Ds+pRc6ln++7iw94O6V28sWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnu0cgts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnu0cgts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790865984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuGmcOB5B7OU7vPcQ5Kxs9sP8F6GWHF+e8A0rz6DPVU=;
	b=bnu0cgtsDC7TTD+g9P2qdakhJ4ghf9AvIsR9zUYcPjpjlwY2dDe0IKvPlsR5FUZhmJ63hv
	DnN8QkTzQSCNKun2TwM0RzXrbKx+rwLmDAWpM61ah0Ycp5UdIHfHsRZ9UkSOsjVebobEQo
	2D+cBp6+Ec2871uYcMyi0tfZOeuzeqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-rOnzwxHPPP2BbxsTGgjTrw-1; Thu, 01 Oct 2026 10:46:22 -0400
X-MC-Unique: rOnzwxHPPP2BbxsTGgjTrw-1
X-Mimecast-MFC-AGG-ID: rOnzwxHPPP2BbxsTGgjTrw_1790865982
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a020cf06c3so5071705e9.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865982; x=1791470782;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuGmcOB5B7OU7vPcQ5Kxs9sP8F6GWHF+e8A0rz6DPVU=;
        b=n1hZ1QvgzRfom9XpHcNGfM0sZRxFviLqxO8w4g075P/mlzfd+9WzoMtdF5GldPSvr5
         JcSw0Q6wYPufcmauxLbEpQ7Co3vT1BSxbKEJmavZ/5ULsDpyZPsnWa2NJ4hsZBog/pUx
         nQIC6m8/wow1REFCezuA7npY80xC05GLI2dZyyt2KaI0ed1b9V2TG/pQWQFco6HJJ04g
         OaRFsS8xbJb3DltqHW6H+JqSCo0Yc02+tnvVaFBnejiajDDS19vjE+xJXdo+k/320+4C
         mEa0xoUW5VH6eC0s8Op1U03Snt/ia4s5Z/DZUX/nQGSo+b1e3lWqZCYuLjKawv6/yhWT
         WVUA==
X-Forwarded-Encrypted: i=1; AKwUvBxvEqtNg66MpJMZMm2HGXgZZFlSP8QwJ4kdNtOUXBpqVhrwvqfiIY9N7wDRQTH7xzXcV6Xb0il+ZKDb0WtI@lists.linux.dev
X-Gm-Message-State: AFuF++lvJtOWyyyJJ/vBGtww/G3d2s6T+ov01hA9tlnwkGHjyyI8BHkd
	ZrVmegGJl+a4lWUV/16Fk/FYHzESU2fZGHVWuI+tS1ehAxiWwogInwAhsOhwvLIph9UL9hJZ5mY
	RR4e35+WOTwJ8EwDtP2n+cjq1skVoe/2eVykoHg1l/DjXOVUIXZaVvrQ4l3nV4op+ww8=
X-Gm-Gg: AYBFou2VP3anz5chLhScLRewhU/osONC6HELzF3dosf618r14ju29TM2OIg+8h4UWEg
	Rz893JiBuUTiSMnO0Y1M+Nev/WuEJB366ZxCAns8qcRubqYgdDqzuzHFY5zYZ0QG2QJoAaKn7ez
	1kf2yB055YmFm+3njOik0OAfy+ZEmKQz4I74h+pwdJrOwcZq83Z9D6mf6zSPaS5knOp0gGrIKls
	MPop2Kz55oPWw/LHCXuPergtxa6vgtcikp02qvorK90+teD5Sy7Gsxd1IDq9MaxOB8sIicUwfpq
	m4457yExzm4OwlOScBE3K0+jnXS6Wxnz1cbu77QMc80+D/EeFilo5FXM/3X6xFYFEpTIlaUdCsG
	7ydtODM1OXusmfCP+HN3x1Q8qjlm8IEnPP565EADwd5H4adFzLbdkBLLKX5Dw6SDaYg==
X-Received: by 2002:a05:600c:4e41:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a01ad9e5d2mr78126205e9.2.1790865981668;
        Thu, 01 Oct 2026 07:46:21 -0700 (PDT)
X-Received: by 2002:a05:600c:4e41:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a01ad9e5d2mr78125495e9.2.1790865981098;
        Thu, 01 Oct 2026 07:46:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm59955425e9.6.2026.10.01.07.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:46:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, longli@microsoft.com,
 ssengar@linux.microsoft.com, andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/kms-helper: Remove struct
 drm_simple_display_pipe and helpers
In-Reply-To: <20261001133736.802604-3-tzimmermann@suse.de>
References: <20261001133736.802604-1-tzimmermann@suse.de>
 <20261001133736.802604-3-tzimmermann@suse.de>
Date: Thu, 01 Oct 2026 16:46:19 +0200
Message-ID: <xlv1jyo1fphg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 56evHEO0CLRhhHfN7e6FC94M4L0Uye7aHwWKu_HT3Cc_1790865982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> There are no drivers using struct drm_simple_display_pipe. Remove
> the data type and all related helpers.
>
> The idea behind struct drm_simple_display_pipe was to provide an
> easier way for writing DRM drivers besides regular atomic helpers.
> It turned out to be more complicated. With all drivers being updated
> to use atomic helpers, it's time to remove simple-pipe. Also clean
> up the related TODO items.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  Documentation/gpu/todo.rst              |  17 --
>  drivers/gpu/drm/drm_gem_atomic_helper.c |  92 -------
>  drivers/gpu/drm/drm_simple_kms_helper.c | 328 ------------------------
>  drivers/staging/fbtft/TODO              |   6 +-
>  include/drm/drm_gem_atomic_helper.h     |  28 --
>  include/drm/drm_simple_kms_helper.h     |  56 +---

There are no more users of struct drm_simple_display_pipe but still some
drivers include the drm_simple_kms_helper.h header. Latest drm-misc-next: 

git grep "drm_simple_kms_helper.h" -- drivers/gpu/drm/*/ | wc -l
21

So it seems you need more  preparatory patches. For this patch though:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

