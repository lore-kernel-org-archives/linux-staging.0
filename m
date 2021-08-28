Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7744672
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 10:18:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bt14so19528415ejb.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ufnHtNbrqJITLW1O1XY2r37rNsuwUTovBEX/kbd4pw8=;
        b=JIQdNctE7m3CdWbbAXZNEThDl3hx2mmwVhfwPFIVcoFFXmiW08dFS4G+T+5f/v7etV
         fKf0biP29eXfRr7/kz98g6IJoJpbbduuYDyTsvzDaRBnoTq0BfU3Hi6QLCG6QGgAYL/x
         6Wiln33YawD0ge2Em2bfUJBDb2Yx31LURtkvV/yV1t79mjUAxf9EbfjOeFPjInTuXJup
         Xnxf21np+s01uPrDK/+9OCF2KQNPd5RtkL7AHtlWGF/M6tAvfGnBwEYrTIiUQlshn9hM
         7VFkEjJa05s/RsCgFXn/P37yn+4I0qEUnvpOCdqHHBkbw/iA+VvyY8dwwkKXFnr34K78
         sb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ufnHtNbrqJITLW1O1XY2r37rNsuwUTovBEX/kbd4pw8=;
        b=ZNjOXpWMyfyzdD6+qlhd08nGYh4WaPkPaF6prgUSNNlAFQes4FbAia+37RKpcZgaDG
         v1qM/jAXWRAGZxxIzOLmdEKObQ3SHtBT6rA4ZXbqu7deIR2D5fvfbrOsthuKsXszk2gH
         OYRpCzVawuZ4KWD/k7ytGtY2P1LFcz4cjn+yVpVxhhwCPMgvpSPcJRKwlMnZl+fwS13J
         ev1eLePJCN82O0+9nGWWCLHZvUvduinCI3VG0R9JTtyxH1ZHjAafhnUYn8puKdEs9L6O
         eQSSs6O0fvUYaxKwwN83qBkyv1w+vDxmnuuMDtMNTvJR8GjIv/3kGh/D4iaYZqMJgZUr
         4inA==
X-Gm-Message-State: AOAM530zFg1Avw6hZkOc4enWpsXL4fVjHd9HG7QsAINH4B+CMbXf36KH
	szOXyyjERtndjBRY8AQcoRw=
X-Google-Smtp-Source: ABdhPJx39cs05Co7SsOUxUHwlyG/4dLqxxVdTtPN0XVTrF3a4l9uq6Ac7U+BrGKDylg9YK11mRV9sQ==
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr14832346eji.177.1630145911893;
        Sat, 28 Aug 2021 03:18:31 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id y10sm4579786eda.47.2021.08.28.03.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 03:18:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH v3] staging: r8188eu: Remove _enter/_exit_critical_mutex()
Date: Sat, 28 Aug 2021 12:18:29 +0200
Message-ID: <3027220.c38WcS0Ceb@localhost.localdomain>
In-Reply-To: <03d5fd25-7694-18ee-9e2f-7b4057117197@gmail.com>
References: <20210819221241.31987-1-fmdefrancesco@gmail.com> <03d5fd25-7694-18ee-9e2f-7b4057117197@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, August 27, 2021 4:32:22 PM CEST Pavel Skripkin wrote:
> On 8/20/21 1:12 AM, Fabio M. De Francesco wrote:
> > Remove _enter_critical_mutex() and _exit_critical_mutex(). They are
> > unnecessary wrappers, respectively to mutex_lock_interruptible() and
> > to mutex_unlock(). They also have an odd interface that takes an unused
> > argument named pirqL of type unsigned long.
> > The original code enters the critical section if the mutex API is
> > interrupted while waiting to acquire the lock; therefore it could lead
> > to a race condition. Use mutex_lock() because it is uninterruptible and
> > so avoid that above-mentioned potential race condition.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Tested-by: Pavel Skripkin <paskripkin@gmail.com>
> Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Thanks!
> 
> 
> With regards,
> Pavel Skripkin
> 
Hi Pavel,

Thanks very much for testing and reviewing my patch. As you know, Greg wanted
it tested but I couldn't do that. I'll add your tags and send a v4 and I guess that now
Greg will easily apply.

Great help from you, thanks again :)

Regards,

Fabio




