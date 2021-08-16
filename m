Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1086D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 10:16:00 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i6so25612257edu.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UVW6kIMO+vANMX1HgjohnPiDWRD88704SfiqfsvGvrY=;
        b=DKz7kaaWh76EEz1NKm98fpj3E8kOJxDG5IeUBcDQLsm2STIJvj735JLGQS2y3G/e0V
         rEAcZt9v/mcJJi0DVLXvYQmpWrSBl/OqG6/nj1yG66Wfjtz1yjMa5iPlfFH1zRfdZYFm
         p7PekcV43teXYUHSNw+mp2j1bMbSV2ppHYzycFloWd145F95/J8ic3mDq0Ct3J9E9/vE
         CB914QCPyZYZG5JKPxcYvUTAcpCQHNjWIGZtbbRJASUlmX8ULCvy/Y6RwCroAPTbFAd2
         3rEpc8f7gIg1i5i77RSWR3L/OcvZc9XM1NV75/mIyc+T0jUeIix5AfmGqduMFD7Hjgiw
         VVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVW6kIMO+vANMX1HgjohnPiDWRD88704SfiqfsvGvrY=;
        b=byj4ddE2ZXNOtDSj/EWKQDUTXnBi5UqnC7D7ZeQ9EO85J/sTIuLBIURa42grDTlpY0
         yMHKIZDFASqig6cfk3LeV8Zi56UVpxVISTYv/a8rA5NuqEQAAhj1UFGJyVBbZPLfQa3E
         gDGkybTzkUpg/VNUgpxphgcKgrs6GE47VSDW6bLR/gzgMe6X8Kip0bMbGXG2WaB+Rq7v
         4y+8A4L9P6qCZgB31dcB7P0O7kxQILVFy4GJ0hhjcWpwmpi5fS6RImlrOPy/J6yqRkgV
         vjMncA2ujJKjUatsHfNi90QMOdEPqGzdh4ABycPhVDDVzGgNBexhjqrnuRrhS17jRzZQ
         wX/Q==
X-Gm-Message-State: AOAM53228iamdtE26ED9866VAFgpaMnESU3A/cb2IIPUatY9tKftemyr
	6EOf6efildbIYgLuVlfaxzc=
X-Google-Smtp-Source: ABdhPJwfnPxjfAlAZQiaFxupJ1zR+gDxTOptzvKSjgISupqccAu/LHyFh0HidZe5RxxVkcfKu3CCGA==
X-Received: by 2002:a05:6402:3485:: with SMTP id v5mr2683605edc.205.1629108958744;
        Mon, 16 Aug 2021 03:15:58 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id be23sm4602202edb.68.2021.08.16.03.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 03:15:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: Remove unnecessary ret variable in rtw_drv_init()
Date: Mon, 16 Aug 2021 12:15:56 +0200
Message-ID: <2121129.EM0CHCvl88@localhost.localdomain>
In-Reply-To: <20210816090500.GG1931@kadam>
References: <20210813201418.4018631-1-nathan@kernel.org> <20210816090500.GG1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 11:05:00 AM CEST Dan Carpenter wrote:
> To be honest, I prefered the original.
> 
> 	foo = alloc();
> 	if (!foo) {
> 		ret = -EWHATEVER;
> 		goto free_last_thing;
> 	}
> 
> I like this style of error handling because all the information is
> there.  You don't need to scroll down.
> 
Thinking deeper about this style of error handling, I find that Dan is quite 
right in preferring readability over removal of (technically unnecessary) 
temporary variables. Perhaps the trade-off between brevity and readability 
should (in general) favor the latter. 

Furthermore, those temporary variables make the code easily adaptable/
extensible in cases where, in future revisions of the code, there will be more 
different errors to handle.

However, it's mainly a matter of style, so...
>
> I don't really care about this specific patch at all.  It's a small
> thing.  But we had someone come through who was sort of obsessed with
> removing these sorts of variables.  Just because you can remove a
> variable doesn't necessarily make the code more readable.
> 
> If you're doing the work and maintaining the driver you get to choose
> your own style to some extent.
>
I agree: choose your own style (to some extent).

Thanks,

Fabio
>
> But I don't want to encourage people to
> start sending these sort of patches more generally.
> 
> regards,
> dan carpenter




