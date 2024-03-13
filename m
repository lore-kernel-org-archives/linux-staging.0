Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107225A109
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710348593; cv=none; b=k6tPEauFMd9XWIIXySq79n+84U0WYrUY32n/hgxXH6NV0M5F+UPSAiHJsP7LHZoTX4hu/1+qNvTl/duyylcGb7dPZFgb7iV3BQZ5XGmMe+hgFd3PjqzAOhw9q3wT2ba4ZWrYYciCJVG/RkdzrKFCClBuVqGbcqo6Qa7Rldmll2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710348593; c=relaxed/simple;
	bh=VzkYuJhJxHAlsoBEWu8SsfwFLEo1Gz2XkJeX8uCY6dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyWMRdGYonrMfUJRgk8EtpMBdH1LO1v7HoOrJrguHsoYMOvEPNSdlu6hKOFvKgvG6mqrf0BUhtrXKNJGuZJ6g7hAuZAAlVrszqs58bVDwJX7etRHL0QzpSj41CyVQ8QHxx3lSdObCBSjDBrWTSrRnUGDZ10IjdPjcUbD9DRuKkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHlNvK9O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHlNvK9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710348590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q2G67iTaaE7P6XAuMXpD/jw+pGFtD3L7nLatsyiWBEw=;
	b=AHlNvK9OJDtYiZZOqn6oY88nRZCUoG9u2dPi8aAvIiImXVH//Gte51kEfaPDkfAyx/PWxg
	ERnuuq0rgUbZWV6/P2q+rzhGBEe/CAdKqOPIqUSL2EiFd3CP7iLby0cIZ4OhXWd/c/DeIc
	+ZFMEjeBlUt1HW0oMEW6tja5j3t+gzk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-40219TfZM3qv6s4R-TBAwQ-1; Wed, 13 Mar 2024 12:49:49 -0400
X-MC-Unique: 40219TfZM3qv6s4R-TBAwQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-513b2e92c19so55424e87.3
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 09:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710348586; x=1710953386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2G67iTaaE7P6XAuMXpD/jw+pGFtD3L7nLatsyiWBEw=;
        b=nkX2lAhbhaGopCD//Wc7aAGkrW7l04aGxtrkVPhuKcfuDPK99iVDCzbaz6bQwDY+bw
         Pizq4CGsWfJP2Azx27uy2ol+VKISHMOnYax+6vlwj4i9fy9vh6gfYLnBtxWpD+VIUlwF
         RwZuv3Dk7YScEOyyMGLt1qi8SqbHbe5X7FZDMv8CGwTbX59f9r18WBa99gvBvqRnHomP
         1BdEhHxOoj0cdIHIpBS9+gh6hMF2Q70zViZgH0EI+TQmpQPbsZz++e60ngdlBg/HRmfo
         9IzeKYi8K5zXEgd4RwlWpAtrwP8ySCSBJn9aHdnEVyfktHsmw+M+kWE20t9+QQjHoNQE
         1FAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoWj7N8cRoKN6tH7WtCa/Iu1xwyBVlTeP8Z10ZAOryz1wnLbtlzISmx1AIxzC9tQSaDCEHTClaKyiiS9XwFzyobNRkSVkEDepinVdUjA==
X-Gm-Message-State: AOJu0YzJyAyuf16zVtUoiJI1zMqG3bSbTHbZqfxmXcUilnVo9LhBMIb/
	HH2HTn14a+l8OvL2BBi+96FWsz3VVMBXtM64hN3uYTwFv71sk1ybFP1EvBFBYMOQRA/y8bKRJRf
	3rQV82qZ0Z7SL1s7lzXV9KgwZSXZvjRKUkZlo9/qtAQ38+qVOnTCY3dqFl/UijzfDUKlNjbr498
	8JNb+dgPh0pBFu+3UO4fPZlWZPQFRRo+a5xxUrbw==
X-Received: by 2002:a05:6512:48cf:b0:513:c25b:8fe with SMTP id er15-20020a05651248cf00b00513c25b08femr3633376lfb.58.1710348586399;
        Wed, 13 Mar 2024 09:49:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFecCVULiWKXEpUHHmxzAFehkHi4UGzzQMhebCu4KpJosY3gPTZT5VnVDgEMzok8/FmGbE0MAM+WicaEPuoM8s=
X-Received: by 2002:a05:6512:48cf:b0:513:c25b:8fe with SMTP id
 er15-20020a05651248cf00b00513c25b08femr3633356lfb.58.1710348586028; Wed, 13
 Mar 2024 09:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313091259.1413854-1-ppandit@redhat.com> <0a1aa580-50b2-4657-8308-94bffb194aea@moroto.mountain>
 <CAE8KmOzcD+__7xdC7tegbHO9HEP48s7=reA4j-tvqVDwzHr+8Q@mail.gmail.com> <3fcb3702-5af2-4b9f-a362-4f08ee626b14@moroto.mountain>
In-Reply-To: <3fcb3702-5af2-4b9f-a362-4f08ee626b14@moroto.mountain>
From: Prasad Pandit <ppandit@redhat.com>
Date: Wed, 13 Mar 2024 22:19:29 +0530
Message-ID: <CAE8KmOxEyCHbCt=7PZi_xAnCdc2H3mFYYxBJ9YAq6imGmH6aJw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: bcm2835-audio: add terminating new line to Kconifg
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, 
	rjui@broadcom.com, sbranden@broadcom.com, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Prasad Pandit <pjp@fedoraproject.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello Dan,

On Wed, 13 Mar 2024 at 17:24, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> I wasn't able to get it to enable the CONFIG_NO_HZ_FULL.

* CONFIG_ prefix is not required.

> ~/config-kernel/configk -e NO_HZ_FULL  -c .config  .

* This command works. It writes informatory logs to stderr. It helps
to redirect stderr to a log file.
Enable option:
  NO_HZ_FULL
    NO_HZ_COMMON
      TICK_ONESHOT
    RCU_NOCB_CPU
    VIRT_CPU_ACCOUNTING_GEN
      VIRT_CPU_ACCOUNTING
      CONTEXT_TRACKING_USER
        CONTEXT_TRACKING
    IRQ_WORK
    CPU_ISOLATION

* To see enable/disable/toggle options in action, a command below
(without -c .config) could make it easier perhaps.

    $ ~/config-kernel/configk -e NO_HZ_FULL=[y/n/m]  <linux-directory>
 | less -r

> I'm going Ack your patch because adding a newline is the correct thing
> but you should probably also change configk to handle that.

* ie. Handle files not terminating with a newline? There are not as
many such files. Besides I agree having files terminate with a newline
is good. It makes all lines/records of consistent format, otherwise
the very last line/record becomes a special case.

Thank you.
---
  - Prasad

