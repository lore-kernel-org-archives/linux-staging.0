Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76F70
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 00:54:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k4so2572798wms.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XSg1KClhpY6agnGkYpv/G7LfJe7Hmjfoc58jUe7Kj58=;
        b=TsvSZ7v9WmHKhOgAONXj0WaM3Jej78yWnLkYYP4G16tw9RhDBmHz6PAIFry9fGA9xQ
         03WjBF/e9/FL2uXqw5pQq5CRf188ycNhQcopmPHkJYvy8WjMHSYjBt6EucGrKmjR5YF6
         aWr7DEG/VmCy6c1Nom9cGlSzJtTVNfuTHXwnWUlrareFC17tMh0w1+YiHudxYK6p7fOP
         +Do8Cq7UB4J7wmCvXpE8UvcxeQdNMINakgsOzAps9y74JAafxAep4htIwJEfoB1g0RK5
         QBTxLhHOxXXQ+MBeNZiyHili1gHK1vma2xzNRpWisBnDPoeHlByVtaNjr3ECAaqoYcde
         +Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XSg1KClhpY6agnGkYpv/G7LfJe7Hmjfoc58jUe7Kj58=;
        b=ZVfNVC27Wo/WWNY5C2yBKJQbgijCJXjX2MwLLH+NmumriH+mBJyY8SVsuIgWQDNRRf
         nigRiRdmVzmYyDGzVPkEpyH33h4sZh2XtW1ZRlcmZ6dXo2zgEdkGOximZwUPZnUj+6Vh
         ugtSXh8Ky+mDD0cQNimJbC+Mqww39zlntYowM8XcbVB2EpFJ5nTUgIcEFB6iMJ9wpDRD
         9UxojBnfQ+O3XJes8+DxKJb8DBRWe6YyyhQN8i0F9g5jUjNcpxzhWJgY4rXUDFO0bvZP
         +wwOGWrBuYLxEpXUGOtfD5sB4Yj2zBl/yrDu5e1MA9A9x5u2t9Oq95Bm2y7W4s7FS4xi
         LFZQ==
X-Gm-Message-State: AOAM530SFNi8L4AIUO9wBzyPHzJSk+1uHMyca7HYq/c8EMNljvu0U206
	txTsEf2Jh41VdySbsXHaHuE=
X-Google-Smtp-Source: ABdhPJzE4/hNCW5Y57W4WcRPxWQmXg7g/IPEA5r3KiXjfej0nyvqskFFYS8Ax0lwSX5krTBdVjFl5Q==
X-Received: by 2002:a1c:9d91:: with SMTP id g139mr11650562wme.76.1627520071083;
        Wed, 28 Jul 2021 17:54:31 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id t1sm1459628wma.28.2021.07.28.17.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 17:54:30 -0700 (PDT)
Date: Thu, 29 Jul 2021 01:54:27 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Marco Cesati <marcocesati@gmail.com>,
	Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tablet: acecad: update the reference count of the usb
 interface structure
Message-ID: <20210729005427.GA784014@pc>
References: <20210724205542.GA549014@pc>
 <20210727123756.GL1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727123756.GL1931@kadam>

On Tue, Jul 27, 2021 at 03:37:56PM +0300, Dan Carpenter wrote:
> This commit message doesn't say what the user visible effects are.  If
> you encountered this bug at runtime then please put the stack trace in
> the commit mesage.
> 

I made this patch based on the following documentation of
usb_get_intf():

[quote]
Each live reference to a interface must be refcounted.

Drivers for USB interfaces should normally record such references 
in their probe methods, when they bind to an interface, and release them 
by calling usb_put_intf, in their disconnect methods.

[/quote]

Thanx
