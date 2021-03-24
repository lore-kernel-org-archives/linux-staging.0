Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC95F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 15:02:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so2857128wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SVkcJMB0s3pTNtMi3yHoH0Cy2axHByaQUWY+T2s5irQ=;
        b=UsRSJxu7AvOgmvlMl8VFLZI2u/J20PYc8Smir0UlWqL02wYFQpORE9tLaDBeaaA4RT
         ke+XtvH0HADtYsVAelQFXBkAPDHfVQfs1UDch4ir3Dl/QQ7AT5JcRWn653QLcJ8LG/kS
         CHE7LymqMfFaBmwNUg6SIHdm/9vXYrNjeyYvrqzcjDeRAWw67OViGvCgmVEp8dQQdoxb
         iOGnHhA0wWVnlcvCIQmhaVkDizlIEXOf2IuTeguuX2YF80OD7ZH4dxV8M+Xrf9bAveVF
         iALbyCQzAI0Fo7DNKdWDd+jcZE9tho5JkkHOFFU7sK0L4VAju+l46RtrJZhAtcbJTlVI
         z8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SVkcJMB0s3pTNtMi3yHoH0Cy2axHByaQUWY+T2s5irQ=;
        b=POzJDdf1xbE+tMEyJb0zW92EUayicQ7EBQtrHMBCwse4byBYIqGwvQ+NQh4Yk8q2NB
         25lij5Bu3uC6iuGKzXgIGox90utI8UHv9mpFutBPWbdhhzJSCpU1HlgB1Yrx2r1zPy29
         OpQlXken6UBokazRTYiwiQ9VoR6715fpG+Nh6WDDxxY5Z+Aek01hI6eL6w7jTxViJEJm
         gi9Y0IsY24l6U8ffJxZmJIv327FUPI+AoW0s01aQ9LUgYf8G7tsMqMfzdBjUv4abBU1L
         AtO3RwhjM/tniICIrH+kSJ4+mhj2hMfrMcjo794/wPjWJjRGO+6lkSHEGknVWzI2JqiK
         JeIA==
X-Gm-Message-State: AOAM531igdAs2ZKIho1x6B5SNsFdnVnuJE4xpTjOFNWDWx/ov+kL9EEc
	ENVrn87Hml84VqcGeoqIWKI=
X-Google-Smtp-Source: ABdhPJz7qzOAnzdi5X1pvJltdsEdv1A89qc/Y88+vPFkWWfn6nyx9rDF+9dES38fn6HExjX2bMMRXQ==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr3399424wmc.61.1616598120830;
        Wed, 24 Mar 2021 08:02:00 -0700 (PDT)
Received: from cesati.gmail.com (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id j13sm3558809wrt.29.2021.03.24.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:01:59 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:01:51 +0100
From: Marco Cesati <marcocesati@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/33] Staging: rtl8723bs: remove named enums in
 rtw_mlme.h
Message-ID: <20210324150151.uzti23apuisztgfm@cesati.gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
 <20210324124456.25221-2-marcocesati@gmail.com>
 <20210324134245.GN1717@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324134245.GN1717@kadam>

On Wed, Mar 24, 2021 at 04:42:45PM +0300, Dan Carpenter wrote:
> On Wed, Mar 24, 2021 at 01:44:24PM +0100, Marco Cesati wrote:
> > Remove the following unnecessary enum names or definitions in
> > include/rtw_mlme.h:
> > 
> > 	enum dot11AuthAlgrthmNum	[name]
> > 	enum  _band			[name]
> 
> Sorry, I was unclear.  I liked the names fine, it just that _band was a
> bad name.  It's too vague and what's with the underscore character?

So, just to be sure, beside the singular case "_band", are you objecting
to remove the names of the enums that are never referenced in the code?
That is, to transform "enum XXX { ... };" into "enum { ... };", as long
as "XXX" is not used elsewhere.

> 
> > 	enum DriverInterface		[definition]
> > 	enum scan_result_type		[definition]
> 
> These are good to delete.  And it wouldn't surprise me if you found a
> bunch of these enums were duplicates of more standard global enums.

OK. Thank you,

Marco

> 
> regards,
> dan carpenter
> 
> 

-- 

---- 
Marco Cesati, PhD
Dept. of Civil Engineering and Computer Science Engineering
Univ. of Rome Tor Vergata
via del Politecnico 1, I-00133 Rome, Italy
Tel. +39 06 7259 7389
