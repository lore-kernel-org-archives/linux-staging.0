Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965E42E7BD6
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945513; cv=none; b=ZrGbelsgVcUYS3Fj0a0ocZwisyxxPR1o9RVRxdUzOS3/4a3uj9JZKaRNz/Y4fQ2f0w5o1g78vh/L0u8QDYVMpS0ECLvBsyKLLtlGDsWOIqwTqJGdZ8sZXWb8AIXrUkpfAFeCt9d/11QXl3Glz0TmYjMsBPaG61yedoFWRiyLpmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945513; c=relaxed/simple;
	bh=53D/5/B2wvX6dN+ASmuNpK0/77E27Hvucfz5GPvSt78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I8cm80N+7Kz+thbzJJo9Mqk8Fzzu8DYKXnFZg2y4J/SY8JszxDHJltq9SeS05HNtQCMtE9NJJ8x4MHKDSDg+GQ6OGfd0gAaEih/epoflDqvVZOH74Utj/1CmATzuXBZ1nvr22Jv4DrZsCOLZW+4gXDoGmGxawtphpaE7Ln2MgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKUWijwd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKUWijwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
	b=NKUWijwdtmBEY0EO2kOhsrTiSBTQPOAPS1Fhc7O+waTVf1Augc8k8kCDuMOa/jxzsRF3De
	V7J+lBmv66Bz8A2lNiLEqhCnLHmSUG1g0w2dBR8PrRBNMz4psgikCsXP3BQfmRG7xNgmxU
	p0pMHwpryR0K9yFY4VoJVa17eAidTKw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-9nnK04qRP8GPd6mYrUnvcQ-1; Fri, 02 Oct 2026 08:51:50 -0400
X-MC-Unique: 9nnK04qRP8GPd6mYrUnvcQ-1
X-Mimecast-MFC-AGG-ID: 9nnK04qRP8GPd6mYrUnvcQ_1790945509
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48aef5cfe43so2845472f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945509; x=1791550309;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2xT9hRgPB5QRriD8h5Z5tNs8Qaw44VoG/fyOaMAKs4=;
        b=tBi6oA33q2PgAS4S/dZX0+A5q2j8qa9hR+Sf8ZgB1YHsL+xtfJ/aJreIk8QxTuB+Fv
         I7rtgGey26VM/NFtCCwWWGWJCM2Ji1ERJhNkEdaIaoEyJ6Fc6JKT/ZxfJSodfM/APJRz
         RgYLO71yLyTxPiYm7w+m+dxi6hZ/XMviNq5YiNnC2bxJYz2bPR76e4AQuhlcXwQ9E5Vu
         rtOym1shZDyjQVVH9C088Z4+K/uMFEljAdjl1k5i2LF6LyAxlFW/nGAG8MGxJScqk1mt
         t3N+Vna2EbPgiFVyJx5fJ9TnB7E9DyGfpKP7kI8Rn0UWL4rSecUvC5mktGak245kY43p
         KXLg==
X-Forwarded-Encrypted: i=1; AKwUvBwOShbgds54WE5Gh/cBZr1Kh7xh0SYvrLYxmdkGjJ30S6uPlj0Q5QOeixmqzgZ+u0fsy7HBgBX705VxHXqH@lists.linux.dev
X-Gm-Message-State: AFq9FYLGIIJcmRZDtrI+4EtGNZqbo6SeCwVm+e90vSCC1ZIRiVHhJ3j1
	uwF4dW66eCQoaKHCDfp+zG6BBrIWTbEd9kticy0eyMYct7/xnHmAVF7iZz/vm1/ZfQV79V5kQ8G
	gcYu9GrSUbX/mY8//IrkjDBdPbnEkEdCC/wWP9SunL2qTacX+d6koEH5JzoQEmtmz14I=
X-Gm-Gg: AYBFou3JdIX134PSwvlQ/sjosH1ExN53R28BZ4bOKfMwvkqNpPKI4xBO+ePPEr9e6sK
	jKV43QHtzXvWfZ9fvRgBO+e7ou/Hj0FpxQDq05bh79Cam3nhi8FN+mBNYX83tXOvEek56NFTocj
	1SVHJWmvVZI25u6qig9S+pHjLAVd07SyD/zEE+ar7U1G5bh9yJHxppnOkPxxCiJpWq83vG9HC+3
	Jb8zcvs9CVQYgD7d6mROXw6FTFQhxh/u172AFkhfF0snj3lZ32PeAxPcQaqkxjCF8yqBBokLBwj
	exYPst9DYombmM4DWxp3A9bNnJMU3keFl/bbmBkpqG2V2LGeC4jQ5CQ+CiIxoIw8uxuyZDSFQ6W
	9Rc/sYKnCt1bg79l4QNA1/h1/9I2OqA5nOiNMFdCv5vc7GRphW8AGjozRMSx/ItJfaQ==
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263165f8f.17.1790945508859;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
X-Received: by 2002:a5d:5f53:0:b0:48b:74b:4ce8 with SMTP id ffacd0b85a97d-48b12754475mr6263100f8f.17.1790945508338;
        Fri, 02 Oct 2026 05:51:48 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm5711527f8f.37.2026.10.02.05.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 6/7] drm/verisilicon: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-7-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-7-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:45 +0200
Message-ID: <xlv18q4g6za6.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TKQFJOIjYsS5QK8z5lOMia5tZZfkQpWKnZxdFPU6AGQ_1790945509
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The verisilicon driver does not require anything from the simple-kms
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

