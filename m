Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371F7C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 11:42:52 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id m84so13216089vke.1
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q9JAIiZystlqDHnsIruZg9DSbtqMdv6zP+X46BkhVvM=;
        b=ZkIJZGn9StXLui9Lz1TFK/CDvkJEw1tedIW+BqRnzG74AmNZmaUwWVg/FPy/pI6DOy
         dlPvO+6izAhJ2TmROCN3utIeKaJcbUOwbhXo/TwrV/DWW8qV5v02dSUEEH9jOBa5x+YA
         rxiWx3hx89lnL9/G8SxPnH7hBPwZUXQl7JyJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9JAIiZystlqDHnsIruZg9DSbtqMdv6zP+X46BkhVvM=;
        b=TJAPIEh+tloKm1w15R9kw1TFKjOmKufRjAk3wbTTbrETQHRXuLoDo4xQ/sl51v3Yb6
         Ymt6vT3yfci6y9i/TAl1BZU1Z3cpLUCwdCaoxaGmew9Or5Yki06Y7U43idXMKK28t4xx
         IPfVwiFax4/pC69MGcKiOTpBFR1ApTer7cOKy6HzuS1ryJOfxQcV/sMPDwpbpVUMmgYU
         apfvhjh5N+/6ZH+7tKZLBcG9XkP3mqhmdjK6tq40tcjayEe4oIZ7/vjZ/B8dfi00nZxj
         buhl+g5dq4wd3ZV33pO3BoTkDRZzNslr6P0+N/78Ps7Zopq6wU/0cU7R678GJ7Zoc2QW
         JqHg==
X-Gm-Message-State: AOAM53087wD3fObFkHdqFsWWuG9zS49/BJiCsHbDuXgKWiZ3/5RnRiGq
	fZhpSzwlkgu9WoRbPT287OqMd39kQ2AIlyDWfYAoZw==
X-Google-Smtp-Source: ABdhPJyHv+JRYWR+69lE+O9Ro6H6M/++dU9nRCMqSlPZKVrx7IFNDSy2/ShFmYiSYt6MZSObYhloGA4u+csov29YbY8=
X-Received: by 2002:a05:6122:9a6:b0:33f:f23e:bdee with SMTP id
 g38-20020a05612209a600b0033ff23ebdeemr1995153vkd.6.1648726971209; Thu, 31 Mar
 2022 04:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com>
In-Reply-To: <YkWRN4ac0ivRn4aB@kroah.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 31 Mar 2022 20:42:40 +0900
Message-ID: <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] staging: media: wave5: Add TODO file
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com" <kernel@collabora.com>, 
	"dafna3@gmail.com" <dafna3@gmail.com>, "bob.beckett@collabora.com" <bob.beckett@collabora.com>, 
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>, 
	Scott Woo <scott.woo@chipsnmedia.com>, 
	"olivier.crete@collabora.com" <olivier.crete@collabora.com>, 
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 31 Mar 2022 at 20:32, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> > +  Until we can test and resolve any issues on final silicon (due 2H 2021)
> > +  this driver should remain in staging.
>
> Then why not just wait?  Why merge this now?  What is the benifit of us
> taking this code at this point in time for hardware that is no one has
> as it is not even created?

FWIW there is an SoC that is supported (if console from initramfs on
uart counts..) in mainline, Sigmastar ssd202d, that has this IP so it
exists in the wild.
I have tried to get this driver running on it and it did something but
didn't get far enough to actually decode video.

Cheers,

Daniel
