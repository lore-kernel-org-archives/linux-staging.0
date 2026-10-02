Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF242F7F12
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945497; cv=none; b=hYJvGRa3bqlRPcUOSUAeU8LOomlGZsXy5OBQnYpLu/EvbNWZYmlWBbwQ7WSIzAd937OTVOXzCs6XiQdxmShexynjvJXbHpZkzE4HkDlnLZ7D4EN9OqFhwdb7/J5op2BOifg3icwZfLfJejaU4YnrNF7yQ/qfCfMVn5dVclC6iRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945497; c=relaxed/simple;
	bh=uogOlJYX4gd2XJKCKqbyiAtKsfJrF2ZNwa7lsSTywSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4BIH3UmPsup8Hm10Q7y2lJtFiVPNKr5A6SzWBmL/f+e2/3AoqE+UNnp/EK10K9XxzknRQwjNDHP6p9fngxW2R7sJs86c9HdRGiYFQwOigvEK63ogWT2e7+Wmx9gfaB9IZpUGfHfflVfe8izRUF5Ndn5sBpUxV00gVwtZ7CfTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MYWyZQKJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MYWyZQKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
	b=MYWyZQKJN8rVfvmaIZbXcsB4kS2cPAEIT5Yn886Cc0JC74Crz2tYCkgEfWdb5N4lWtAsuh
	Z8oBixrPfhbn8b3TfMeJ1hkNgmxyxcRWA+9LNE31xYSXuLuJ5rVglRkin9BMj8eF8CO0WM
	dEv3uH05l0ga422nQefrOtdV+383u+Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-fbiq9Ex6ODKnFsycO-Ttpw-1; Fri, 02 Oct 2026 08:51:33 -0400
X-MC-Unique: fbiq9Ex6ODKnFsycO-Ttpw-1
X-Mimecast-MFC-AGG-ID: fbiq9Ex6ODKnFsycO-Ttpw_1790945492
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b02e93a1eso2515710f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945492; x=1791550292;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
        b=0x8km6tdIkC0tBCJH+SXhVWGuZuG8vmKrUikZNYooouH0uEQUEan/mfP+bOU3ZneYY
         mfVj7n5NdCz4vy08bJ0tWP8vbPZirObPC+720khDMblWCPNSK4LA1D+E/8vuIB/og0Uz
         r6MPcvdpJZ4+aLxu0JbAy23ontYrvW2X0pYbQ88ZrRy9Ijd4vZzthLAkxwtBuUJ1+8k8
         AiR6rMgF7T2YADek6tljiF6ISO7Uw2ExUctzSxAxqwpOajcAreX9HpEFuMf9LjEbNSaT
         Mqqslpd5nlLXF/yaxuB7CYA4cV1+CwkST4wDlHnS1D8BJXJlxR8gOv405QdHBGeVNGzp
         6o5g==
X-Forwarded-Encrypted: i=1; AKwUvBw2O7BzlXgppXl+n4V7av0azx/ymoQIOJ3TIgzcAbnf5BbTAsTLLlp+/MP50ei/clkCswEiWfeHbaQieN0Q@lists.linux.dev
X-Gm-Message-State: AFq9FYIbwQWp27W7Fvr4xOqiTYkRz8ppS+Qn5h3SeM2yQ16hbukgWA7+
	HNqZyzonrWc1nIvDXoDgo+t8mLWXgv/eEMXaWiPeP/TR1v2X/l18jrTJ3SP8T+p9PDQSVdvvGQc
	uaitem3uPFvwhv8qHxXzpFlzXf+ao7OZXFek9NFyh3tF9LCNI/IlE41wLAXtb6fd41u8=
X-Gm-Gg: AYBFou0PJd9VMmOK6Raf803YeU334bcT3oaYuMr4SK4AMfqTPTXRfYuofJHpP2tfpDx
	aA03TQPLnXDYBn7T767SjII5asUBhUG0fT7+hVcJqCWdKbAMFTE6zCkZfvT7I5/kP7Yue7/eBQY
	AarY+Ga6mwYpcUhVohSCwHmaM7HIKETni+by/DJRZxTV+1PqPLzZKepLhOhoiTuT+4UfoxmW2I1
	IjQ9Ih4pTnSYXMmPOYnJXmhhvtyeu0xPbKBENUhYys+5o0Tvp3CocqwWObiN6GfwitWfS9v4vDd
	dvQgeAtWXJrhNm2XVjq9o9j4bZADX+C+VzHjW3l+ufv5NqF0BsFoc2ayFePjzp46nsdOAB9FHcB
	GIKF2McwhdeF7pw2F6nmlzyhPPhAjp1yUUANPEb+LwpnjnGmwTOC48kibEloEbf7i5Q==
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218120f8f.11.1790945491955;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218095f8f.11.1790945491489;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm4879135f8f.2.2026.10.02.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/7] drm/tegra: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-6-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-6-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:29 +0200
Message-ID: <xlv1bj9c6zam.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kBfQM8a8YDnTd8tZSvHAY8mxn_xHHLsDQnKb-TPkmIc_1790945492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The tegra driver does not require anything from the simple-kms
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

