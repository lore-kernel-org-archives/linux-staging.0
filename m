Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CA79C9
	for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 15:00:38 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so15277947wms.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEpR1Oghu5jEh+XHJUeeAWnEqFA8sGLzT1Q2gGhmDfc=;
        b=kQ63ArvEjzXqRck7zKZEwAyh5nGwRANCnuIVm8WrAdRY8tMo44S4wS/RYukWQlYZbd
         w8rEzqK5GlM3IcUlsH21acsBij842Z9DoNE1nHdehTZfcPDDrxF1oDT5q1/Prc9hoRxl
         7bE3PjjzggefIaBl4Mnl+ecOD7+5lUXuZgJgAYK1dWal7VkTl0v70kDluCGMiGnH+Oo5
         XfO1KVJtE2pyptoFW9xbLPWc0fSy/z7AEUAjTAv8+X3VfN+D0xdWMCmkmaQHh3UAjKpI
         AYsx3g+FtJddVDZllZlTYo2UtI3+l47u/VuVhB4hWhgXBsG30mnNDGUeTGrV/usiX5hq
         ctLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEpR1Oghu5jEh+XHJUeeAWnEqFA8sGLzT1Q2gGhmDfc=;
        b=bJGBURozTL2GmA7h44xsjctc8jmTs+4yfZLs1Jj0VFy15fKAOjiCecrLcDvGuFWkvn
         RvjdR/Dn1m1GCoPJIEjuErrA5QinrL8zrtUyU+/fLYNEzxcDuBs791BWsUz8ywbsixZ6
         5FAH9kbJT5AYPBxf/qzSV7MFQ0k6lPCvWKDzffPkNuTHsGd3hCpwD90UEehO4a+pQ9Ph
         5RkY+sfPvOLQsZY/MHALkd9rb5JzVM0Ub7AOR2OVlOg8iMzS0HWZhkMtHcsrCs6ECQr8
         0tOBxsnMIyxztNp4NStiieKFwDV5Csl9jZPe4qeKzMDDYJWpPeuL/qVV8nW3yhEnFT9L
         6mbA==
X-Gm-Message-State: AFqh2kqWuuS1YGWs9/B8Y9J03obdLJrw/t8z4Q8gNgtiTUtfWv6gQl8D
	1bidWw8gEufW5r1WiDyljho=
X-Google-Smtp-Source: AMrXdXuGLkT3WZD2pYqv1rvVwoetthcfUn6ngawoGge0A/6oW0jjMXW61GolUhC9dFk9o4yNWMSfww==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id m41-20020a05600c3b2900b003cfd18e528bmr56615779wms.39.1673535636697;
        Thu, 12 Jan 2023 07:00:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003d9fba3c7a4sm8832671wmg.16.2023.01.12.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:00:35 -0800 (PST)
Date: Thu, 12 Jan 2023 18:00:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel-domain <kernel@collabora.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 04/12] staging: media: rkvdec: Block start streaming
 until both queues run
Message-ID: <Y8AgkQ8WehS4PfX7@kadam>
References: <20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com>
 <20230101-patch-series-v2-6-2-rc1-v2-4-fa1897efac14@collabora.com>
 <CAAEAJfBuA=gTpyeKs5mj0_1z+x5sZhse2OGPP5nmb5E6XNjBKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfBuA=gTpyeKs5mj0_1z+x5sZhse2OGPP5nmb5E6XNjBKw@mail.gmail.com>

On Thu, Jan 12, 2023 at 11:55:07AM -0300, Ezequiel Garcia wrote:
> Hi Sebastian,
> 
> On Thu, Jan 12, 2023 at 9:56 AM Sebastian Fricke
> <sebastian.fricke@collabora.com> wrote:
> >
> > Ensure that both the CAPTURE and the OUTPUT queue are running (e.g. busy
> > -> have buffers allocated) before starting the actual streaming process.
> >
> 
> Usually, you want to write the "why" in the commit description,
> instead of the "what",
> which is (hopefully) more or less clear by reading the commit change.
> 
> The commit description should have enough information to understand
> what is the impact of merging the commit (or what is the bug without
> the merging the commit).
> 
> If you are fixing a spec violation, adding a reference to the spec is important,
> if you are fixing a v4l2-compliance, pasting the error, etc.
> 

Yeah, and if it's a bug fix then add a Fixes tag as well.  Even if the
bug was added when the driver was first merged, that's still useful
information.

regards,
dan carpenter

