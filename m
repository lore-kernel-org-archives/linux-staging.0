Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0027701;
	Thu, 12 Oct 2023 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRoyrJag"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-694f75deb1aso1639937b3a.0;
        Thu, 12 Oct 2023 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697115827; x=1697720627; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIDdHfachdzSYdbMoayfgG9KGaQkVwpYZ7M9Wz17QLI=;
        b=kRoyrJagZPxbCSQNbajPIXEIgmGqK3uXZvHQODj3LvsItvpP6zTPeA89h1MKBsHkup
         iI/IdrktpYqj1GEEAZeNsPA98UfMdf9ltFNkiJowebDbYWMuBiWYmO8sW83+nANeAx0g
         dmeXQZbXWSYDWVrzKXMTrzTefGQ1y0jBKEm7o2Ec3VLl20XvfKduehq6KpU0h1RRic15
         RrNLYPZxKz0Vk7BvJCH1XWVZqgrwqp7aFI6trf5ZmTcXV26vRcQkvMsjLoS9heZGiruJ
         /RXExoAFnRu5HpngCSVagPGUzlCxVEC2J/P0cRDWSXcd1JCbc83NJ462Y133fe/0bKiA
         bksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697115827; x=1697720627;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIDdHfachdzSYdbMoayfgG9KGaQkVwpYZ7M9Wz17QLI=;
        b=n2mh/6Q7FnIHAIB0soR5S56tbt+viLwBKBe0DJyeM8dkZYXBHqWz5kd7qkdeE7x9+3
         NSsU4MwaX27Du32qBtIogOPQU/+JiezXRpZnhlD5G1rxApU6gFFBEPnik0lC/cZpd94u
         gWSJxWPOfb0bhih588atIl4N7KM79YxCJw3DcJZg/k4gYIqdX3MHd5dww6sG+EujcvS7
         pmiHvisoEB3QtoCPx6EusNL/rOmMGUnj74cgb/02lHjESOkG7kFZ5A2P79+pWgGGaWyq
         8UByFjqa29BQDj3wxWNgp7yPEMuLgPMAVsuriAqT6qIy2Hc5PP8QlEMpDZNwwtjnFJRa
         pTtA==
X-Gm-Message-State: AOJu0Yy00np7F0WBlVEovaEf2l7Zufy9GR5VKG3f6/oDWSqATL77A5Mr
	1pob7GBi9yUiy1AKC7Myz7s=
X-Google-Smtp-Source: AGHT+IEUgLYHpBlq28D59kLvKyvlLaVPZA/uM46REBEA+C2L29sl0PSXTZXGTdkya46UNec+FfsCbg==
X-Received: by 2002:a05:6a20:1456:b0:134:73f6:5832 with SMTP id a22-20020a056a20145600b0013473f65832mr34363741pzi.16.1697115826088;
        Thu, 12 Oct 2023 06:03:46 -0700 (PDT)
Received: from Negi (2603-8000-b93d-20a0-2184-6fa4-0d39-1c6b.res6.spectrum.com. [2603:8000:b93d:20a0:2184:6fa4:d39:1c6b])
        by smtp.gmail.com with ESMTPSA id y18-20020a637d12000000b0059d219cb359sm1606244pgc.9.2023.10.12.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:03:45 -0700 (PDT)
Date: Thu, 12 Oct 2023 06:03:44 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: Parenthesize macro arguments
Message-ID: <20231012130344.GB7107@Negi>
References: <20231012050240.20378-1-soumya.negi97@gmail.com>
 <81d6e283-fd87-4fd6-964f-22cbf420cdaa@kadam.mountain>
 <20231012074837.GE16374@Negi>
 <a1556f74-83ef-d32-103d-6b0b0233473@inria.fr>
 <20231012124920.GA7107@Negi>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012124920.GA7107@Negi>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hi,

On Thu, Oct 12, 2023 at 05:49:20AM -0700, Soumya Negi wrote:
> Hi Julia,
> 
> On Thu, Oct 12, 2023 at 09:51:27AM +0200, Julia Lawall wrote:
> > 
> > 
> > On Thu, 12 Oct 2023, Soumya Negi wrote:
> > 
> > > Hi Dan,
> > > > For these ones, the name is too generic.  probably the right thing is
> > > > to just get rid of them completely and call spin_lock/unlock_irq()
> > > > directly.
> > >
> > > I understand that there should be 2 different patches, one for the
> > > macro-to-function rewrites & one for replacing the scsi lock/unlock macros with
> > > direct spinlock calls. But, should these be in a patchset(they are vaguely
> > > related since the patches together would get rid of the checkpatch warnings)?
> > > I'm not sure.
> > 
> > Patch set, since they affect the same file.  Otherwise, Greg doesn't know
> > in what order to apply them.
> 
> Thank you for explaining each point. I'm sending over the patch set for
> review in a new email thread.

My last patch in the set didn't go through. THe error message is "multiple In-Reply-To
headers. To reduce the amount of spam sent to Gmail, this message has
been blocked." I used the --thread=shallow flag with git format-patch.

Should I try resend the entire patch set again without the flag? Or is
there any way to send the remaining patch by itself?

Thanks,
Soumya
> - Soumya


