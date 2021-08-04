Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC170
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 15:12:14 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id hw6so4224234ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 04 Aug 2021 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Vo9KH/MhVz7kXBD6l2im9RgAeC2wAwSck49Hn8SWjc=;
        b=PaVIRT7vozP4R+oBv6QR8L8XGHClC2ZebRx/A1tLBc8n5ru4ZdjlSxGDK2J3+cTFcY
         bxZ8OaNKlomp7AU/hnwR3Ee7RkZ3MAoW++Q/HvyDMTArIeZaVz1Ou6zDlLfu1RzQGA+1
         KQuCygKrdaCRdZrlo1l6XBAsclWm3mWdxrZ9scXcYvK6ixhhSsnmQZ51iEOqj3kRwg36
         FWFONcAT2PJWaCnv/KjSgQWImdNksnwPMDcTLy4Ie3aBxN6ZRS2SEVooaIyIvfQs5t1c
         karWD8Xz/sSllhTNua8aU8b2e0VrW6ggfpdcPMNcUvAfZSsAx5GQf2H3fk3T8V4nBcKL
         UNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Vo9KH/MhVz7kXBD6l2im9RgAeC2wAwSck49Hn8SWjc=;
        b=LvgWmWDAb7DVYykNsTVj9p2QDU4te1YC8zyFM3ociKInExgp0kgyjT6Qwo1hTctr3x
         8WLN/Kuq0Nr/+vu5RkGAffhw2Ne68RCNVEo0uazMZFlNOr5of7a9QZDCQlukHht+Ddc5
         SVmyCmMMM4L8s0XQRinRYuw5bHnk8hCzzzhgU9+NHyJ5zoxkEOKsWHXbwAj49fKOl+vy
         o9UT0kmFjPBaOQNYkqL8IHqP7zjgWbPlvjW5XK8TTp1caTvnK4Yc+UnTDgWL9ceFGI4n
         T0e9Kfwaq53/9mS2ug94QiaHu/ylEiOB8fvYZwfBKQKapKSgAA5kXWm9gZAV4s8hZ1dY
         XjCg==
X-Gm-Message-State: AOAM533bRhFi3ac8ZIG8Il+miyu4xHJGIk/OGPyty25aMlegJnK6TqIv
	5Ua0aG1RXRZJAYmEDsUxS7c=
X-Google-Smtp-Source: ABdhPJyjy5+mIOt6o4mj0inLDL55SGhwPIqkE0njS3o7l1bM/Kc/Zsgvt1x8uJFT9jmMszzaDj/8DQ==
X-Received: by 2002:a17:906:9450:: with SMTP id z16mr26100237ejx.52.1628089932827;
        Wed, 04 Aug 2021 08:12:12 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id r27sm1064548edb.66.2021.08.04.08.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 08:12:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: core: Remove rtw_mfree_all_stainfo()
Date: Wed, 04 Aug 2021 17:12:11 +0200
Message-ID: <5755579.ylQvOfxgKt@localhost.localdomain>
In-Reply-To: <20210804130136.GJ1931@kadam>
References: <20210802005517.12815-1-fmdefrancesco@gmail.com> <20210804130136.GJ1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, August 4, 2021 3:01:36 PM CEST Dan Carpenter wrote:
> On Mon, Aug 02, 2021 at 02:55:17AM +0200, Fabio M. De Francesco wrote:
> > Remove rtw_mfree_all_stainfo() and the only line of code that calls
> > it. This function simply takes a spinlock and iterates over a list
> > with no purpose. That iteration has no side effects.
> 
> I mean, it's pretty clearly supposed to free all the items on the list.
> 
Sorry, I'm not sure to understand what you required:
since rtw_mfree_all_stainfo() is supposed to free all the nodes on the list, 
should a better patch *really* delete those items (instead than simply get rid 
of the function itself)? 

Thanks,

Fabio
> 
> regards,
> dan carpenter




