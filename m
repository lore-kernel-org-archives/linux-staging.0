Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA92564
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649340242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8dmlhw2gM3dighZKD1hw4c9m67LEmQRFc8UEGhxCeHA=;
	b=SS0/Iim/AIbxK+D+j3nHnK8pPSYMrhdZwQd7IZLYGOsjVNHRWKK3veK9zpPxPZWOmpNjxZ
	h/8GC+UpA4GaOvK7/BeFcH2OqzU8saB35VU81+bOCtrDnkEXhJezkK7JVe1sM/APyhth9E
	Sq2lhCDa/BRcyHZPpkRK77t5wAi5ToM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-maRkon0mNmWY9Ms9S_YP9Q-1; Thu, 07 Apr 2022 10:03:59 -0400
X-MC-Unique: maRkon0mNmWY9Ms9S_YP9Q-1
Received: by mail-qt1-f198.google.com with SMTP id t19-20020ac86a13000000b002e1fd2c4ce5so5577345qtr.5
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 07:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8dmlhw2gM3dighZKD1hw4c9m67LEmQRFc8UEGhxCeHA=;
        b=jCdj8gn5Qrfu90PbIGsdOTf51Qdcwbso4/9tJUyIVyMx4QyF60gdaRRVvWdAKAUXrr
         X1fRF3Kby4QUwQopfmppqDuwrVx3QHxC/bX0l9hUMq1umaK2rg1S5bxm+4IJuu33F/oR
         fuwbDkzEZ0tNjgSj/ZQHgQyru+efkBSMnfw2X5ATxkG2xkdk7x9U9pFaFEdSf/vuhTVz
         qBceLcjSYUsYPvfy61XomCgZMAL7a4UXX00kIPrI2axFEIzK09adK7FDmcJwtMaBWKS0
         mUx5kj9qeCnTKUyc7VzTs0PJBtLgHDm+S4wWXfptSP65o7ULMtxCo/OOIo0Wk0tqnGSo
         VA+Q==
X-Gm-Message-State: AOAM533y7rss3SFwfkCXZbPh3DF+KsxxuEdAhCeLuWElDt1seR6T5z4B
	IEBLzmcF1upzD7cNu6iWkw9YF1eK5M10bGwyehHmCpiZc6UyXYk2wl1DOf5MqEiY34ht8sQugEq
	n8z0DPa417MD3xPFHG6c7uRxmoA==
X-Received: by 2002:a05:620a:424e:b0:67e:4c1b:c214 with SMTP id w14-20020a05620a424e00b0067e4c1bc214mr9398819qko.651.1649340238619;
        Thu, 07 Apr 2022 07:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeuhfUl7E5olUFie0FR1INlu5Q2ZTtT17yGQlnofo6l7qsijU3A/ijXWkDpwqeMJySvpGrYQ==
X-Received: by 2002:a05:620a:424e:b0:67e:4c1b:c214 with SMTP id w14-20020a05620a424e00b0067e4c1bc214mr9398784qko.651.1649340238357;
        Thu, 07 Apr 2022 07:03:58 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h6-20020ac85e06000000b002e1e8a98abbsm16006501qtx.41.2022.04.07.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:03:57 -0700 (PDT)
Date: Thu, 7 Apr 2022 10:03:55 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>, linux-staging@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for bcm2711 in vchiq_arm
Message-ID: <Yk7vSzk2XD+55EK4@fedora>
References: <20220324172647.167617-1-athierry@redhat.com>
 <d20fd8f2-c47a-2f3e-4efa-be705f1517b9@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <d20fd8f2-c47a-2f3e-4efa-be705f1517b9@i2se.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stefan,

Thanks for your feedback.

> Could you please explain your approach, especially leaving out 36 bit
> DMA support?

I realize I overlooked this 36 bit DMA support issue, I need to think it
through a little bit more.

> This is a really bad idea and caused a lot of trouble in the past. A lot
> of the issues in the Fedora or Arch Linux forums or mailing lists
> results from this idea. It wastes the time of the kernel developer since
> these DT files has never been reviewed by the devicetree maintainers.

I understand, thanks! I find the downstream dtbs convenient because of the
overlay system that allows you to easily enable certain drivers, but I get
your point.

Best regards,

Adrien

