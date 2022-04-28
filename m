Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C597EDC
	for <linux-staging@lists.linux.dev>; Thu, 28 Apr 2022 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651151779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRPdSokHoes2nKz8ut6Ka8cDht5BCp3IPjnMMamZWzY=;
	b=ZeIoNxncXcVbOmfcWsM6JIL4gei4KljBDGh30Kjw+IlOZF5zuqOhUQ805fSLp0St/lxWM5
	Kmn/NhixlGajHsCH3JSZX29I+9lJgm3khG6Loa2oN8Qz2ntSHWLCgIWLtmvdFv8K2kUIJT
	vd0Mv8G0w61VpdLC7y7MgjJPNWo4O58=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-uyD6mfvNPKispNZYt9lthA-1; Thu, 28 Apr 2022 09:16:18 -0400
X-MC-Unique: uyD6mfvNPKispNZYt9lthA-1
Received: by mail-qk1-f200.google.com with SMTP id o79-20020a374152000000b0069ee7515f53so3164097qka.14
        for <linux-staging@lists.linux.dev>; Thu, 28 Apr 2022 06:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRPdSokHoes2nKz8ut6Ka8cDht5BCp3IPjnMMamZWzY=;
        b=6TQmdc4yz2uJNUXDAvBm2UCn72oiT6QHfi+7OMYbOa316mCZbWNh6WKQRX6YRA+2Fb
         DAhXBWKpUFfkKuADKRdUtLFpu3UDi1SqmmMTKNTbbuoy8maB93I9QYnCpnaudS5RNL5l
         xtmhM6kf3SiG5EYigdRGcfPwWQkOE15+n4aWcWkYVefB1O3RtHq4Xevpm+RotLVTRfeB
         DZM8FAN5QsFY1Yo99OpmuPtOU0otEv01n68lQJUDavwmVHKm+G/tWvXocMU3dRpJ949z
         QoxYWNf15GXUtkJmP/2JgAVrTzXRug43sxUI0K0vb1Ffy9cM+VnNZ19jWbQ2rGXrLBFj
         AsQA==
X-Gm-Message-State: AOAM530m7TvtuwSS40AjglG21J9XwzJ5ty9C11N5CI/6zOeR3qUCzBPK
	bja+OdfhJhaTYIUYOzEMI0PhEk86QiNpbFEEzlna8Gfjl+EBijzVka+iBFUvRu7WeOX3/awkQGa
	+aMQyg3Hfpso0pX51H8Zb8qsQQA==
X-Received: by 2002:ac8:7e89:0:b0:2f3:6ae3:338a with SMTP id w9-20020ac87e89000000b002f36ae3338amr12897244qtj.559.1651151777689;
        Thu, 28 Apr 2022 06:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9/6WIEvG9trtpR5c38666xWxMtS3pgU8Uku5RvhPr66YCsL7aqqkeRkNWBbvsJo2hSozEZw==
X-Received: by 2002:ac8:7e89:0:b0:2f3:6ae3:338a with SMTP id w9-20020ac87e89000000b002f36ae3338amr12897211qtj.559.1651151777358;
        Thu, 28 Apr 2022 06:16:17 -0700 (PDT)
Received: from fedora (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h18-20020ac85e12000000b002f341c6d20esm11748102qtx.80.2022.04.28.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:16:17 -0700 (PDT)
Date: Thu, 28 Apr 2022 09:16:15 -0400
From: Adrien Thierry <athierry@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: use standard print helpers
Message-ID: <YmqTnzoNVmU7PC88@fedora>
References: <20220427182439.424963-1-athierry@redhat.com>
 <Ymon2OgJhbwaH2H8@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Ymon2OgJhbwaH2H8@kroah.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

> As dev_dbg() provides the output of the function name, there's no need
> to keep it in here when you convert to using it.  Can you fix this up
> and resend?

Sure, I'll do that today

Thanks,

Adrien

