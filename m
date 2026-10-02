Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E651F424679
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945483; cv=none; b=a9iKU4d37NEz0mxqDod6+wlVnYWoNQD4V9ZL0TMt36Slfjapd4R+8z/56IKwsKnUKIVGmK2533TUaZHGpNKwdXtL7fCKDMoJBE1UCF9rASVh00vKe8f8iBBk0Kxklzz5AjDDXcNivLZnADMKMbEO23HdaYSXSnMdKezT/nf11wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945483; c=relaxed/simple;
	bh=Eea0KEkQbSlRaY4fITFghJeqNRMhlnUIBzIPKXj0Z20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KE4Nfwknp+zhrDRPViq+pJsS3MZCpK1trfKlRkM69geNAmwOMo3+HRghZ8UfNkY1plS91UYM/M4iFNP3WG4yITgzM2dJCP+TY9kTp9a14NkMBJSjN46GemfI6Vre7DrxCIJ0FWmcSqoMtIfk6gwwoprAbC7RDY0C8kluy9cfq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDwndKSz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDwndKSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
	b=HDwndKSzx3BU0Y0OBRP6c8C3RCAKxNJ9du7njUUkR85Xbgfi8xohajmmrh+dvh+JNXAgm4
	LtBSlj3zOm/K5Sdq1lRyuCFEs/0WaEJ/IU/ND7XMf5MztgkTF99k5CVUZZGTnRHjnFwXVE
	kRkPSh4DtZOe/DGdgWITTGiP+GjLLT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-nTwYhwPbPjCg4rY8fSiCYg-1; Fri, 02 Oct 2026 08:51:17 -0400
X-MC-Unique: nTwYhwPbPjCg4rY8fSiCYg-1
X-Mimecast-MFC-AGG-ID: nTwYhwPbPjCg4rY8fSiCYg_1790945477
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so13376465e9.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945476; x=1791550276;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXxRsRzuT/lLVwUTudBZrzfm5MyaTiR0eopkV7RSLVU=;
        b=OM7ZQEtRn9qNLXy995U0lQevwCrGjN3Jqhj2wfD1Fy7Bu8wjXaB7T5Jrd54Z7Eh+TB
         chpDxABJ4I5wme9BS6PEwcMiO5JQJJWxFUMbIWIRPLsS7sJZbttV369lyimMrYlf43v7
         Hytd00jhjIbMhsXuXz40OUkTR5LX3yTrqNtmsn/9Bejlx8pEXDU2bXk3ITGnvCHZp4xs
         90/SCAgE8CFnObYQHKbtrjUke9hm7dwpTv1jrwFVKBqYJ5q4kSBQE+TqhUVtMQ9/LIBF
         SKWgeBvizh/WKZXgB56VCJOt/w/fQ/OPmWoWjlCRyGzfCLFQl/pv+X4/65oqc5sCSflS
         0P2g==
X-Forwarded-Encrypted: i=1; AKwUvByYoMbVfgCqY65HNXXxDzIQN2dvs4OyiFI0SGVk+etWAiH+WrhlYq3UomjAbgELtFpSuH1DOeS78sXdEfMk@lists.linux.dev
X-Gm-Message-State: AFuF++n/csYlcpi5D+HAN+y4L3Jhd3NTwSsRVxSPIDGX+FSsCtBISNGN
	zwh1XpnDlF3DTLZqFw2gAmZvJtJQrJXyQN0m9Uf0/vEDWgy1pXDi/OwYZRHYoXaeAnNHMkixRib
	EK+AEeue3SrSlYIRAYWXi3CZlnFVFswENYgy7QQH3trtSomvgg+nykPX//Ag2uRHOQZo=
X-Gm-Gg: AYBFou3FSzLgK+PlsQIn81xASUKLs01BqM1SJQ8uqf6ahPXDlbe6h4yffSJeUEGzQZE
	tHmZj/MQ5HWR0fwM9Px2sqK9Ddi8wXQ8wFUEU9/iF9c0rCoSOWSW0zif6ZnyIM4AGQIpsDLjaTC
	znVKO1QeebEjXBSfztuqYVeaLhGeffLTXEo9SApo6RqvzKt+6r1V8MLVQZtJk2PI7xs7kSwi/Zd
	/IVl359yf1e0Vh25VhoP3fCA2iaNNaPm99BfDjDHZG9O7DxhVgnNz3uD5vvehL5Nc6MaRNt0dV8
	vrrHK8znALVOHZKZO8Z5zNUX73/HcTWaDq7KJuhW5QfDP5ah1HO+NBKkIT8WrhvJ+BoIp9/KKHL
	KWHfJFXRZOFxUr2cl6IakNPce4Q0a2WlvqksT9uGafVpGuyY1pfTUWAZiS/VLaURjvQ==
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216655e9.1.1790945476455;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
X-Received: by 2002:a05:600c:6098:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a0274e9d3dmr46216415e9.1.1790945476056;
        Fri, 02 Oct 2026 05:51:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm88527965e9.6.2026.10.02.05.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/7] drm/hisilicon/hibmc: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-5-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-5-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:14 +0200
Message-ID: <xlv1ece86zb1.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C1x1D6cNwYFVXODjKtC1EnV3d62BXnwE3sUw1QJgVeU_1790945477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The hibmc driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

