Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422729AA
	for <linux-staging@lists.linux.dev>; Thu,  5 May 2022 18:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651774416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vIQ6rERKH4luifLFHwoZPkiKhXSs2wHfoxIuk8Um0/k=;
	b=MUkgau/iPIGmR5T8wR9kJQlezpmo1KenFRWZQbltq7uC5dIhFIrsjAtH3DNSKBzjOb3gJt
	SyUz3P8JcdvU6F+63KGcn/XJrKXpyupTCMHh6UAMqzZ4Cv6McsGVUWN+xgQV070J/r6DR+
	N8Au6MymMYyPbOC0ALNXAtDBYkoz6Jw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-JkWjf9_qMOGpOLWv4H09Tg-1; Thu, 05 May 2022 14:13:32 -0400
X-MC-Unique: JkWjf9_qMOGpOLWv4H09Tg-1
Received: by mail-qv1-f70.google.com with SMTP id d13-20020a05621421cd00b0045a99874ae5so3842979qvh.14
        for <linux-staging@lists.linux.dev>; Thu, 05 May 2022 11:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vIQ6rERKH4luifLFHwoZPkiKhXSs2wHfoxIuk8Um0/k=;
        b=kJWZCJTfcQPQ3dVa0wSQEq/eiHZDQWzR6beR5Bl7hD640bH/RYWVGvrcim5rZgCHIh
         cXZt9Fvn5VpM08gWuxwV88GW9ve5KlUdGmPB/icBnpIRJTUlBkwmY7sbKbImrzRyezo7
         rzI+cbD3/8cpKyDCRdUc4wh3AJ18eueIk8cN4HcY3w6mEwjwB5JJvzUMUymtUB6WOOpS
         NV8J/89dYXASiwI5K+/Z51pJQ4VxlEXJCzm7Y5cU9gW+pi9y5MAG31WsR0QWav755CPV
         EGipCZnz0+NSrHd3es1QBikhMSES4bQQuYK0knrL3aJG/0FhJMXGlQFjKD+RA+JIXom+
         ArYQ==
X-Gm-Message-State: AOAM531oKkee8uf5ms33B8GCrezin9QmmfbfjLawHp6FyNvGVFN77nyB
	MZEnFYNEiD4zL3DTsidqDWn2TWhxyrJCSt5ZY1oV9DqNiLGCe7uzL7hvpaWz4SFwIxmbM5fy3rk
	9zPrXfv+2QvOtO7ws5g74KAW50g==
X-Received: by 2002:a37:9342:0:b0:69f:b0b9:b60d with SMTP id v63-20020a379342000000b0069fb0b9b60dmr21180457qkd.728.1651774412135;
        Thu, 05 May 2022 11:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZDVSrYF0/IHka2CQ1470+9YJmZLCgwnZ+Aoo3cSeAePgqRTe09cEGUHwjWj3klSG0nnBjLg==
X-Received: by 2002:a37:9342:0:b0:69f:b0b9:b60d with SMTP id v63-20020a379342000000b0069fb0b9b60dmr21180443qkd.728.1651774411955;
        Thu, 05 May 2022 11:13:31 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id i22-20020ac871d6000000b002f3ad89629dsm1230752qtp.2.2022.05.05.11.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 11:13:31 -0700 (PDT)
Date: Thu, 5 May 2022 14:13:29 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] staging: vchiq_arm: add reference to vchiq device in
 vchiq_state
Message-ID: <YnQTyS+37rTkvQ4/@fedora>
References: <20220502183045.206519-1-athierry@redhat.com>
 <20220502183045.206519-2-athierry@redhat.com>
 <60a0ad1e-92d5-5032-7672-3da9ea606348@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <60a0ad1e-92d5-5032-7672-3da9ea606348@i2se.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

> the patch looks good to me. It would be nice to mention that with adding
> the device reference it would possible to introduce common kernel logging.

Sure, I can mention this in the next version.

Thanks,

Adrien

