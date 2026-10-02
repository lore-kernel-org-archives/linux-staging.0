Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645E1F5825
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945445; cv=none; b=pXVHIeeRkvoY0AduQYiHiV0EAVJ99Lg+uL6jX5HvNfuru03ivhRjevfsVWQ1Zt+G+wK/Z1T+hBOcueZ04kloOLpUNq+SEHH1ZOjjR2nEUqJPjRWquK3Vx8Q/DVEiI+ZQ1TLz/yBtzs2BCM6g2ozSUoqupOddh/gmakpUUqn4rtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945445; c=relaxed/simple;
	bh=8LkjODUjCX5ThUzoqVO6sm9iNDH6/CxQcTpugXdKuOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qcYUswOtW0Xc8KBzUTcqfKbWCBOb9q3kwrdJF2esneUTnZ1AjGFT3hXFJ4Zh5P1dDy9gKhxot9yax62Po1Mwkj479rhtDt3nF125N+k9SspSy/axKVn/oz6ArFcff9UUfubKbArxbX4fEGqyB1U+uYr3GLHDlrZM+aGxMFnofzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ejmaCF5J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ejmaCF5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
	b=ejmaCF5JNKIrKh55w5oXP7Ty09YvgzkDFQScpdsgCv2ZW7dYk6dXca1ZZuAcXgHn2/GbAg
	YCOQQEv7trOsLUrir0OjcPb7IddJPZR4U1W/om6GZc1TYbvoO+J6E8jR+xu0fIJrU5/X/r
	gWYwLq9OhNMFi3Ewd09bCNJ3Q7xbThk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-A9xn2vnbNvSTrhtpLuXixA-1; Fri, 02 Oct 2026 08:50:42 -0400
X-MC-Unique: A9xn2vnbNvSTrhtpLuXixA-1
X-Mimecast-MFC-AGG-ID: A9xn2vnbNvSTrhtpLuXixA_1790945441
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so74675e9.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945441; x=1791550241;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bgkxJeBOF/HSWVBaDgnuL2peb+Evry2VYAsjv931SDI=;
        b=hqUYzgRYX8tJR945G8BsOWd1RscTQwOsWwJR/kOtmCkC59sRdXR2WVF4HzLrhGqxSr
         4UgEJss0xWto2ZmlfRzXY5Jg+0YeTi0silUgIDPM6jSFmHqjhFgrD52HDDiGXnHdvDAb
         9Wr5lpxC4Aorc0mF1IiwRSSfilwRfOBBl1c7hodXIRUiTPfk2Mu0kkcDBTt0+LzHLDFj
         cUt7kHzY2hNO3gisNPGBksyXGGXvUKdFnF7++5P/HAGkzXOqR1mf0ZDWrSk7dsCqSs65
         /QXVIspmwi0bxXgV1+C/2kpvpynAspTtBHs1VyE7U0rIEfXS4+oSdCTM7lulcYdffmwS
         H2CA==
X-Forwarded-Encrypted: i=1; AKwUvByyKWYEUTvEheXe8h0JmUFa4b2tJalwwjIDeXkNkuw6T67fEFJtG33VjTxaz1W0oTx+aijewd4AN1aryA1Z@lists.linux.dev
X-Gm-Message-State: AFuF++kVcZ7CvtomxONDp8pTLRQromjoi/sY7RLOzz4T1meljJ2RAlJa
	tyFSGDgw2YOdH7EcLmd8F7303YSszBAUFd6SXpX49IA2zvGwt1fTxVq3ePBAtIDVxO6UqTnysPZ
	mUGIifOFN6CStdB9PlkbHOp73RuPz6kdPqM94jnSFpMiCGa9T/eGpscgco9VvHV/ZM49Ayac2NN
	E=
X-Gm-Gg: AYBFou2etW8Pi2szbjPk7XdIUl5ei3DcTub4D/cB3UIyHx+ziU1uQQqN2Vb9VqLS1oU
	xPWUzVzb5NH6Tfq/CrOQifbV53qct7oXawtomhLYbqgUF5+ShxqmxGjfu9BNOxPXuuQLAbDJmnV
	gQWFJB3vubYQEygN8NI+cwnch+kG7Zjj/YQPZ3Jve9j2XaLPRYfHjJKesfxt/oc2uoSM27J4Hkr
	0sgWo5Tx1tXJ4NIIMEo7mSCd2I4xhIAkGFwnU38yg4BvyP2FEl2J+6nC89eF19gUKHyqNy9KvAs
	1J9lT4caRw9l0XPIM+45JD+OtziVaE5OirIt/+wKJD/O/wW61lu5d3FOQT7bcBO+4xegADuciuf
	k0+WNkKhw3dvcifg/eyQuddrdsT9l135uYAGX5gfPB66xFZJbxobJWfJUHXq87OcC7w==
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922505e9.2.1790945440675;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr48922205e9.2.1790945440249;
        Fri, 02 Oct 2026 05:50:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm30310575e9.15.2026.10.02.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:50:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/7] drm/hyperv: Add missing include statements
In-Reply-To: <20261002124456.741011-2-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-2-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:50:38 +0200
Message-ID: <xlv1jyo06zc1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ggWZswcY76RWbDRIlHH0XLf8X5153wS4hOvnHrssHe8_1790945441
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hyperv-drm gets a number of headers via <drm/drm_simple_kms_helper.h>.
> Include the files directly so that the simple-kms header doesn't have
> to.
>
> v2:
> - remove simple-kms include statements (Javier)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

