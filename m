Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3972E7BD6
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945467; cv=none; b=Z+Bc4namf8LD8tkWAS9lNdAA8v63tUyOvRT663ATLu21aZeK2+GfMOXAAp6jwcOLO/Kc3DDV+g3UFxsjgQ7EadWFes6GAOLsKjBqVEQP0WkH3TG/Tn3UdjLpxKx33/fsWUEKnsnSxTvgbK1m+URbIvjLRi4f1tFvqS9dkZa/FaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945467; c=relaxed/simple;
	bh=OmxZCWplAWwOsu5V/M1uyWdSkiEaQLSRhrieiV1vD1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YzDMEDrV68Y9V17NrOs7AwLYzCzAZU0CmQ6vqbbznDppBtnhEFgKTzjcD6DVJH8jkRsWG88ypKgO4mhm2o05W79IfkZf0VGuAu/BAvt7aIQNmLKAXU4xpZJuAB+otrFVyergqs1E4VX4nLVMh/7GUzsHMdw3jS/H+tdSTWFewRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjaP78s2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjaP78s2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
	b=IjaP78s2zYtq5ZRLduP3gSoVUAV6s0jFAkTpOPueiHzIQKylJ05Wif3BRFwibWSwgchzMu
	IAdIPStuPoGXEtBOkSfGNemsto2YpDHHCilpfcIGmabqm3ieJTQAIc7OAhsif/9Em6Rncg
	x3ROL1sYZaIdkFzocK16ZDh9iPTxudE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-Ai1dnrpIMH2bXoMM8a1x6A-1; Fri, 02 Oct 2026 08:51:03 -0400
X-MC-Unique: Ai1dnrpIMH2bXoMM8a1x6A-1
X-Mimecast-MFC-AGG-ID: Ai1dnrpIMH2bXoMM8a1x6A_1790945462
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso21755685e9.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945462; x=1791550262;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
        b=y9OJEGYmhqAUVIO5CcjCYOf+VfGKUcYQStIvveUbVsLPF22S0ockVlVeyDkkxZblEg
         Hd4XGsg/zro13e0m+3anKCZANEyR+y6LxaodhZlHmhjYIhH0WqMXUapLQc3Pm2pa5Q7A
         k+Hs1Pu34nfKuHojNNnAJ3rruGIKpXAoj77RAQsWqhg2xBoOKgH9099ETFTepYk3OSaG
         NUbIg4LbEXYVqJUKa+ogPhAQgfpfbDfHb1l29CERfiC7gL3BdD+L79QKkpEze9f9s07T
         IbOjzg3+j9VnVfl1UY92qZtcuxTCQoBoAB9KE17gS2TefFGNnSl4s1Qia09ZVN6iKgo2
         nPvg==
X-Forwarded-Encrypted: i=1; AKwUvBxglGTreRCAUrsW8rqII4Cfk4cpj4ZuUvcz3VWDoqyjLl9VWn0kshn0adVwjWqBjrZ1kvnTGb6qETDHxQo2@lists.linux.dev
X-Gm-Message-State: AFuF++nZkz2NOh7VxLro5ZL6A1AvL4aZGsl9YDrnn6FQ/IE+PBS3xEQ7
	/forJEcguL+Al8n7AeMQzQSY6KdN6RK377SVdS0Q1oLWpBMqjex2IeGVYGcz4CXz5dP1mawQ7ca
	lkuKgOzlKYB0o5/A1Cc/McqCgpQqJpt7IgzW9/GQyi7kyfqfkEHmVmlwOgZbIuoozqXk=
X-Gm-Gg: AYBFou3Fm5mmg22vLdSc31CtKmmh2swOvXKSd5ASitsxxVJiReXou+zyPfCx8jrKUXk
	qoKGYslkNxJagkPszR0CkgGJAijVVt5R8X0sD1Tt3Y8PPzzAJOGzG+m3gLxqDT1/y2IK9j1CqIy
	q60BM/foUlsqXq5ft8uvdQwXNiigNFCBNCaPOFWmsYGoZanTqIcrpioZQlsV0Hxik7+cMMwGe9C
	lBlYgkkZgY7LlXGo2XZtD3MPpnKD1auI7Oafg91paYpgxpQz0HbxG8hIhQtyhCYigY1SQxXu+k0
	WhY9tuPcjQ55hIa9b+6F2nxfp9JL+u2bqySxtkBWVs8w+sJ+yE64PLDar60MdFE1C2GpFuxA4Jq
	UEay1E41gdu5lk9kqC4oPOULLGAkBgAqzC+5D6Gsn7+x0qoZUhQM3pQWpzpVBCc6ROg==
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975875e9.30.1790945462124;
        Fri, 02 Oct 2026 05:51:02 -0700 (PDT)
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975435e9.30.1790945461642;
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm82137655e9.8.2026.10.02.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/7] drm/bridge: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-4-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-4-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:00 +0200
Message-ID: <xlv1h5j46zbf.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RwCPirKhXCcy6XWEeQpzkeJqQejjt8uJnU6ivNxtuqo_1790945462
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The bridge code does not require anything from the simple-kms
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

