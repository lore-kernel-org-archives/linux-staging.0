Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C82A3955F0
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865537; cv=none; b=sC0jEzP4Db8hGXrS8CL1Ftl+xQfjzbz3fMEOTPCZk/aoL92uoaPtZjaQnbWKeOBtTISGvngt97cT8QTJVmZ8cO0szGMR7uspxpxivxalaga77dL3gNaUVk4ZvCMBy3p1/uE0NX/tokTf9oQW+wlsFFsZD5fDdvl/cMUDoYrQLRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865537; c=relaxed/simple;
	bh=TP4jI+wG6PBqBKAosooF+4rrhoc5hNQtPHbUvJ/nxic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sRUVpueNP56iNB2CCxB6azvvHThmwXyjtZF9tFbEdV6fEnKui+a3/e/BLsvfWbgXbPilCA7DTS6ZUIDBbZ9jJU8Z3eeCcuLWauk784OD17DuLwkMuRdzUxxdSIzSBseF+Eaizq5zSgMOzOEEar2162sEAGi6MWtlQe7kyVE8gGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5TPUfqt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5TPUfqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790865529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
	b=J5TPUfqtrtqpeS8SlQLjzv3vhrZQdFt09DaMBP94eK/YbQB2f0TRRn7Uw/OTIzX1pxI5r3
	ZLumVB0WwfmL9B+zV394FspL1wqlVAwXGDUJ75ujzTrNlSTUh3cY+APEITL89jeovZUJKY
	piixZs0h17ThkR5Mm/lqlJhsvUjvd6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-beKRtGmzPkWdowg6wdM11w-1; Thu, 01 Oct 2026 10:38:47 -0400
X-MC-Unique: beKRtGmzPkWdowg6wdM11w-1
X-Mimecast-MFC-AGG-ID: beKRtGmzPkWdowg6wdM11w_1790865526
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso58573595e9.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865526; x=1791470326;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4xhRQFt/bWT6UALcOITRzeSEDfb1ACELZHI8/ear74=;
        b=MUTo3hrayYl0ZyEjh6hlibvA2Sb7v2roa9l8aZWMWzRuCv5qteKSgUd9h/YhlVesxI
         fO9RXTrGbcLsGfBxIwk/gf5j8n3VMP7SRsx8SxkfwoL0AchLLXxh10MvafGgEB8yU0t3
         Q8o9ssH9MguyWwEXFDcE5XX0LWabJjcyj6O2BbMtXd2gOQuBMnXm4qnSD3vg+zQKrQbJ
         ymXqQ9/WyOCTykLPczulv0zabMTG7nr26YKw9aM8ui8aTYKZgx0+j79P8pEPzYT+jS7V
         820ShQqSguZJzwUs3ApELghjbKfNpLuRZILFk39BBhY4Mgi6oMrrBTQi7RsNmiRGTBwk
         u/BA==
X-Forwarded-Encrypted: i=1; AKwUvByNqJzGmWW3l1FuuqVBeYPTgFmB/xzpicRk+dSvoHdj7rf+SNmrTg40lTujZFwpihb3v81Fk3OLlIU+5xSK@lists.linux.dev
X-Gm-Message-State: AFuF++nZ6/w0V62Ged8u/ds2IKtDQL/C/Z/7cHHgFvSmR5w4ewQrQNkO
	kzDCV9t0Q4zUe29acxo6+zCej+GaybPT8pjcDx+KxiK69YrQNAZLmh9U3obI+UIO067YSkbma4w
	pUjLOQY5Qr5f9udBQoW/nbl+LMljnZgMbsgE3iu+8NfkM0AhwCIjic6+JVrMRZd17C58=
X-Gm-Gg: AYBFou3WYsgTSfwDWr5MxSduU0//QRILQ2yWGj3rkDq3DVuDWpqMImJ9Fja/YG1F129
	iIAaBWsCB6V4vW/xMotnxidwbC2BNj+kHJ+TYeu4hDhde7mFZtASGRMsEVkRZ31bNw2AtUUEwrT
	VoGA2HG8U4K/UtBzBOkoDr/rFGECAD6+h1g2Yq648tLDjxr3kGuyUcQYliqMFweOUHE0ltSLSL3
	jwcD4oFc9idcy7iq1acw8c7kDhzBQEubpERsaNsqsLJcuHvKCh1Y0Oh+z/tQSOcYdznDI1cPQvL
	ZwOnkxL92K8k5b3OhlADkeCg1IP/ewyxbKCrYiEgXaJe0Z6uYEaMRuCAQJoOu8DKxX/3lR/qZPl
	+nsOtmL/UgUu30tmF73IlW1rF0fN8zr6wABgGmrZ2WHeo2acfAF8Rnp27WKgz4+Gv8g==
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506895e9.35.1790865526383;
        Thu, 01 Oct 2026 07:38:46 -0700 (PDT)
X-Received: by 2002:a05:600c:1f86:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01b135eccmr80506425e9.35.1790865525833;
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a023ebe694sm51117505e9.10.2026.10.01.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:38:45 -0700 (PDT)
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
Date: Thu, 01 Oct 2026 16:38:44 +0200
Message-ID: <xlv1mrsxfpu3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dHd0ikRQ5PdSffBePuLU_zYF2b4cmbUTmN9VxTcHT60_1790865526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

