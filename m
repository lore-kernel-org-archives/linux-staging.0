Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66B23AE
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 05:11:05 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r9so710736wrw.4
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 21:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Tjbpu1SxuTEzHSu4hfhiQLazDPHI+RGvql9dhrL0NQ=;
        b=BZHdfb3xC+QUE9x42xdBIAVgRdnD+oADJ+j2t4Lg6k78gutt71TMP9p8T+msJiZLIW
         68FHTJK0KLA+8x8xskBC/94eRIK+woqo4c+qzMJ9LmNyJ4u3pMllBanunBPvsFnpuFeD
         oZuY10iqQwhG5MKy8hFDgr1RjYdNSskxz4NMVGMsHKZ9Ki5TQOmf5zfnMvDcyW+Hrxbt
         a0ddXCwV2bS+CxdnI6AooGaamiMFE/oji8rb7DFd8OIQYcJQTuRqMYenigUzUaWCeI7X
         /VmWlrYtGA+JyOGyj3ms51Ccgq0EmxO3R6QTOBot5p6pFTLf1E/K0yXLEuZDhKnyd/1W
         Ce8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tjbpu1SxuTEzHSu4hfhiQLazDPHI+RGvql9dhrL0NQ=;
        b=2wUqgQENm0kLlHM2htWUcm9h7grFGXqbU/2uQ8qfY01JNyGbXtbkel1SZqgyLaCFQa
         yvXE3TCnMn43dJo4FgaBRLYVX1sCCYFGGdLfNsZUwZVrR5dzEagyTVd6ZaEf7ai5ZKhO
         aneRkLQwhm8jxZJnMk2Hwiqhh19WqQoebCVFSU8aNT57p3wsi0XDn3dlBRZ4nrh5xiLM
         mig6rpjDLFT4mSA6OV0qDmPZgVxbwmW/XXs5nSxM3txroj5moT5y0Lr/se9PA9asdlCw
         OsO5L7IfGpGmTQBwvNlh5BJZC7f9w720fGQJ1dh6fM8Sg799W07BjIJeSV+c2ENMDA1X
         fdMA==
X-Gm-Message-State: AFqh2krRV0zoPXuYHn239LPY6mqRj7l0bAas4KkE7NTyY1gYmkLobgT7
	WMPP7s6QvL2QxgyCHpN9sRU=
X-Google-Smtp-Source: AMrXdXtJite6JKf4pGTxLI2ygDKj1sCVv+/+7k0s80+bC+EzVSmIycwrf+SCCakYVITW5cqgnqALEQ==
X-Received: by 2002:adf:f085:0:b0:2bd:d4bd:581d with SMTP id n5-20020adff085000000b002bdd4bd581dmr4037847wro.53.1674105063778;
        Wed, 18 Jan 2023 21:11:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002b6bcc0b64dsm20494305wrz.4.2023.01.18.21.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:11:03 -0800 (PST)
Date: Thu, 19 Jan 2023 08:11:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] Drop custom logging
Message-ID: <Y8jQ5M1p5AN4LAMQ@kadam>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
 <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1a26368-3753-0d32-434b-e220dd9c06b4@i2se.com>

On Wed, Jan 18, 2023 at 06:54:56PM +0100, Stefan Wahren wrote:
> Hi Umang,
> 
> [add Phil]
> 
> Am 18.01.23 um 12:58 schrieb Umang Jain:
> > Drop custom logging from the vchiq interface.
> > Mostly of them are replaced with dev_dbg and friends
> > and/or pr_info and friends.
> > 
> > The debugfs log levels (in 4/4) are mapped to kernel
> > logs levels (coming from include/linux/kern_levels.h)
> > Would like some thoughts on it as I am not sure (hence
> > marking this is RFC)
> > 
> >  From drivers/staging/vc04_services/interface/TODO:
> > 
> > """
> > * Cleanup logging mechanism
> > 
> > The driver should probably be using the standard kernel logging mechanisms
> > such as dev_info, dev_dbg, and friends.
> 
> i don't have any experience with vchiq logging/debug. So i'm not sure if
> it's acceptable to lose the second log level dimension (like
> vchiq_arm_log_level) completely. Complex drivers like brcmfmac have a debug
> mask to avoid log spamming [1]. Maybe this is a compromise.
> 
> Btw some loglevel locations has already been messed up during refactoring
> :-(
> 
> [1] - drivers/net/wireless/broadcom/brcm80211/brcmfmac/debug.h
> 

Kernel logging is actually has a bunch of features.  You can turn them
on for just a module or function or enable a specific message.  See
Documentation/admin-guide/dynamic-debug-howto.rst
for more info.

This vchiq logging is a re-implementation of a subset of the features
that normal kernel logging infrastructure provides.  Moving to normal
logging will make it cleaner but also more flexible and powerful.  It's
better in every way.

The broadcom stuff is different and more complicated than what this
module is trying to do.  They are sorting out their logging according to
various components.  I understand the motivation, but they would
probably have been better just use standard logging like everyone else.

regards,
dan carpenter

