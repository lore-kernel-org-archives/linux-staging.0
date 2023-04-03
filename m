Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A87E;
	Mon,  3 Apr 2023 01:18:50 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ew6so111041531edb.7;
        Sun, 02 Apr 2023 18:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680484729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCe8S/ZbFd32iadHpAz74xiVMxjzJpl0e1TXToqxByE=;
        b=dLHXvYgHmYqyccRY2uuFhwOgBFDIo3F86iRmdDZTyn3rMWnUpbyXL2IekVDNFxr2oy
         u6TuP7SrkKFnHxfVHdJZ7ALGLUsx29yYq5vrB6Y6kSkBz/YEk5gicWb9Gm7yZm7oWao6
         2C/tyOTc8OStItqLrr4KgiRt4/sxgNsjUTWrYwnPvLOAmcVHHqp4p8fdIsIHuApgsmNE
         MRoC9BcsDspMkS+B5N5+rLj8VATdwg1do9oqvOmC5AZmx7z1hMaAJ53ERkxk1HqAv1p0
         j9kaXJIY1Jp/mHR3rM3vR3BVCtDU1t9VrDxT/4jwVHjNC501+b8Gs+4sPOSKoCnYg0bk
         pUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680484729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCe8S/ZbFd32iadHpAz74xiVMxjzJpl0e1TXToqxByE=;
        b=U8dPXi4u6QL0b8ixGvnpJkWMY6OeJKeVaBSeusp2OF/UXECU5l17xRzLhVUnvFt3dq
         7NOFPv42Xx2l5r88rbBM2yTU1QUaBaZUgi737LUGvBsyNN69pE7zqmW9TZDs5QRuaMGU
         gfjwvKZX9z4uM4OIHRmOKtW6CxQvQnnLxS1kbh+GxjwW0yLKqCRYbltEfKTAuoESFPIS
         vYFnKgfYcmO9zbsYUGaJspsfZ8wdUESJoBwkUfGzFvYR3VpkKnwqVXw09ueT8prPiEk1
         VWS+XXkqhP9rnohZpTEVTZTMcTcklIqZWXTWcknvGnbs9ac1WJzvjYVnIfoTsPN/t2iT
         GEuQ==
X-Gm-Message-State: AAQBX9cdcsC2BrG9ytfHc0K6pyvR3K1JjjLyU+pAAovqLM6vTYaViwC3
	jqBYvSFQHUOZUxgl5BscPo4=
X-Google-Smtp-Source: AKy350YWt3CDxWTeY0hg8BwCbo95PeMJlu9paedE93oDJkKi6SgsUSRjo0xEjz8VrWMiCMbDvVsWgg==
X-Received: by 2002:a17:906:7193:b0:931:7adf:547e with SMTP id h19-20020a170906719300b009317adf547emr35949132ejk.70.1680484728696;
        Sun, 02 Apr 2023 18:18:48 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id dx1-20020a170906a84100b0093048a8bd31sm3792039ejb.68.2023.04.02.18.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 18:18:48 -0700 (PDT)
Date: Mon, 3 Apr 2023 06:18:45 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] improve arche_platform_wd_irq() function
Message-ID: <ZCopdYy7wMGEVx5P@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1f88bd232_394c38294a5@iweiny-mobl.notmuch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <642a1f88bd232_394c38294a5@iweiny-mobl.notmuch>

On Sun, Apr 02, 2023 at 05:36:24PM -0700, Ira Weiny wrote:
> Khadija Kamran wrote:
> > Improve arche_platform_wd_irq() function to minimize indentation and fix
> > checkpatch issues.
> 
> Minor point but the cover should have
> 
> 'staging: greybus: ...'
> 
> ... for the subject.
>

Hey Ira,

Sorry, my bad! I missed it by mistake.

Regards,
Khadija

> The function name is nice but it is a pain to look in the code to know
> what part of the kernel this series is for.
> 
> Ira
> 
> > 
> > Khadija Kamran (2):
> >   staging: greybus: add a single exit path to arche_platform_wd_irq()
> >   staging: greybus: refactor arche_platform_wd_irq()
> > 
> >  drivers/staging/greybus/arche-platform.c | 84 ++++++++++++------------
> >  1 file changed, 43 insertions(+), 41 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
