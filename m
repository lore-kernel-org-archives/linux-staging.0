Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E497E
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 17:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648143249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q+tZCzVkHI1lWHeqsejJ8HFCo9e3pbw5CAKPMA1Q5wk=;
	b=WddxyyUan36EdOemLRuseEGGprjFLkzcNDIruzmW2X2/xTx0iLL0hHRzwi4aL+uO/EeAMZ
	LcjYGwGxWxZwIql5w6AK1l9H3WdpYb/1Autf31jzdrnyTC5skkyjpcHB7eIsxtpNgpuPdo
	lHG3SEOL9/qM61x4sfkmYOf8UhsxGh0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173--hIasJ27OnSpQnMTe7OOkA-1; Thu, 24 Mar 2022 13:34:08 -0400
X-MC-Unique: -hIasJ27OnSpQnMTe7OOkA-1
Received: by mail-qt1-f197.google.com with SMTP id t19-20020ac86a13000000b002e1fd2c4ce5so4214010qtr.5
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 10:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q+tZCzVkHI1lWHeqsejJ8HFCo9e3pbw5CAKPMA1Q5wk=;
        b=HpEL5XjOjDOBRx8pAJ8B5QxPH5heYUpioXkq1LWj9MnzLlmMVo8XSEw23VQ3iPy071
         X+vPecbanPv10Wfs47gqVp/kZImOiS/LKV9mc0nSGY3muc5bDK3ZIs2d/yYeeCZSi6BP
         7xg+dPTjQXLCDLGs3ffcYfUcI8+s64hYK2lWxOqy19RQ1y9mczVLdb96Xlj3X64VdBI1
         XwM2W2qxUxqWfI9+M/KvfGTJkBmTi/VFMROrboCKjr87rP9w4qXxFVFUY53UNlk27Gvp
         kbos1WfGJCd6uE83m/skI86cnvxWz4hNxUVznODiWjZTlJ0xl4xQlSDDSPba5+EwtvOk
         qjSA==
X-Gm-Message-State: AOAM531/FUkgkhuFMaVWRCU0VO63HGgDj/RPzokMfBBKhuV9gKGJAxI5
	G77frfFk9hKvY+giJOX6vhxYZi583J2WHRtrX1j8QAbu9DTim6tHiDbtU+ObyTJ68q8Ksv8kf5I
	sWi0GPtiGdnqfIOfjhwxX05/21g==
X-Received: by 2002:a05:6214:5010:b0:440:ec82:3d1 with SMTP id jo16-20020a056214501000b00440ec8203d1mr5414199qvb.3.1648143248195;
        Thu, 24 Mar 2022 10:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1c7saTzRhez2nyqWBlDRqgtmNx/Secoc+3AdHUlhTu+bP36hmtkPIo48+YvJm3+Xxi40f0Q==
X-Received: by 2002:a05:6214:5010:b0:440:ec82:3d1 with SMTP id jo16-20020a056214501000b00440ec8203d1mr5414174qvb.3.1648143248027;
        Thu, 24 Mar 2022 10:34:08 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id b202-20020ae9ebd3000000b0067b11d53365sm1830857qkg.47.2022.03.24.10.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 10:34:07 -0700 (PDT)
Date: Thu, 24 Mar 2022 13:34:05 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: soc: bcm: bcm2835-vchiq: Add support
 for bcm2711
Message-ID: <YjyrjWgUQ8UeLM/r@fedora>
References: <20220315200929.74952-1-athierry@redhat.com>
 <20220315200929.74952-2-athierry@redhat.com>
 <YjtqnktIHajn8skP@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjtqnktIHajn8skP@robh.at.kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> Why do you have the same compatible twice?

Sorry, I misunderstood the yaml doc fields. I submitted a v2 that fixes
this.

Thanks,
Adrien

