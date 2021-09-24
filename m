Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E6B3FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 21:12:22 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x7so26242944edd.6
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fln/GmzM5DcyRx7UwX874sUGXeT/rIbA9LYWk0Uly7s=;
        b=Tz5laGboS2hQTVSuQZSQjRHkiVrCRzF837aWkMY2kE3Ijyoe494iuXfPDCcX8bho4p
         cUPamznVW0ev+K+mE1b0/xLP2MMbngsmO5TOeIiPOcWxrXR/s3pTYYMblqVN2/1i27Ao
         nQ+GqDY1at7vfhx8+0+e35ImaDIJeLTIHYvzH1zP+R9hSynhB7jn52M1bCEQTGyGus+R
         e45MsyaFuR/6ZcuTEOeqZB8BXWCUpfnSFax1kOOx7KlbRV1dVG0Lbx1Mi78pfr272yhs
         3M0oCCxpeYo0WIAAqnNiry6XQ24wLSV0CfeJoEEsREmIQNSjGVbNEJ6k4bVM5qrHNDCH
         h3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fln/GmzM5DcyRx7UwX874sUGXeT/rIbA9LYWk0Uly7s=;
        b=YbTtdqMewGRs595rXQ0cAaE7uQ4oovKUWEIHrmeuozZL8DVunA2YQ3WdE4uXUzEi3M
         j1Xr75tfJ+GpfvWe4yFXeCoo7Qvaba/xlMFL5qbA7y3X2XT/N8Sed1aNh42rKBEdSDX0
         lvGS5K+J5WleV0BEN7AFX4+15QgFSWiKQWBpGMlRO4vjw50RgEl9cxJpbjPostlFwTbW
         /sZ8m++Pj2J96DawOK63ypinNuhh+Hw3t0CQdIh+6JOGOp/AJblE3dPbCvosFbPaYB3w
         zHpgC8a1wIk1iBeuiHpJEQEkUFI3ImkCQVbrgsFxALPdzA4PXIdDRCfVTEUREtFfyf2S
         JnzQ==
X-Gm-Message-State: AOAM533dLX+gCu5AL619v+g/AveIq1UxmwF/KAVkol2j48KluQVRy+fw
	Bz4heJj8lCvMMq0sxie/Pw8=
X-Google-Smtp-Source: ABdhPJwhWCtAI9yRPrnORDj5ikTTLnZOAUjz0nP5i3BAGeMcZDOyzLfM4iEHZ9cQecZKSiaEnZWq1A==
X-Received: by 2002:a17:906:19d8:: with SMTP id h24mr14009510ejd.490.1632517940373;
        Fri, 24 Sep 2021 14:12:20 -0700 (PDT)
Received: from tom-desktop (net-93-71-218-228.cust.vodafonedsl.it. [93.71.218.228])
        by smtp.gmail.com with ESMTPSA id e13sm5589833eje.95.2021.09.24.14.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 14:12:19 -0700 (PDT)
Date: Fri, 24 Sep 2021 23:12:17 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: vt6655: Replace camel case variable name
Message-ID: <20210924211217.GC10906@tom-desktop>
References: <20210922220802.584952-1-tomm.merciai@gmail.com>
 <4972337.8pBPQsAWaL@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4972337.8pBPQsAWaL@localhost.localdomain>

On Thu, Sep 23, 2021 at 09:54:12PM +0200, Fabio M. De Francesco wrote:
> On Thursday, September 23, 2021 12:07:49 AM CEST Tommaso Merciai wrote:
> > Work in progress: replace camel case variables
> > 
> > PortOffset -> port_off_set
> > 
> > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > ---
> >  drivers/staging/vt6655/baseband.c    |   6 +-
> >  drivers/staging/vt6655/card.c        |  88 ++++++++--------
> >  drivers/staging/vt6655/channel.c     |  10 +-
> >  drivers/staging/vt6655/device.h      |   2 +-
> >  drivers/staging/vt6655/device_main.c | 144 +++++++++++++--------------
> >  drivers/staging/vt6655/mac.c         |  46 ++++-----
> >  drivers/staging/vt6655/power.c       |  24 ++---
> >  drivers/staging/vt6655/rf.c          |  12 +--
> >  drivers/staging/vt6655/rxtx.c        |  12 +--
> >  9 files changed, 172 insertions(+), 172 deletions(-)
> 
> If you split "Offset" into "Off set", you convey the message that something 
> is "Off the set". Probably that's not what you want to express.
> 
> Regards,
> 
> Fabio
  
  Thanks, you're right. Resend V2.

  Tommaso
> 
> 
