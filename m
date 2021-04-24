Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C820A2FA4
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 08:15:35 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id h14-20020a17090aea8eb02901553e1cc649so297948pjz.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6/Lgj2H0ed/XrbAD6J3l5Bl7Ju8l+PqTifcTlzDYqAw=;
        b=pC+E2E7fwVBRG4i8kwWyhwApWasHomUai+dhJFxCiW2CspTjBmsRgsI3V2JX//Gjp8
         Tcz/BjeBZPP7+qELv9hWrOfQzjeDCcv3JU2AvCZVM/hwn/8ENVv20YE4WcLFjo/a/ONR
         Bi7bnZWItgKCgswvLZFCS+tOgxdZvmsEnQUvXefJ7e2Wlzwrfk83l041y9pV6P49Qr5j
         8yTeig3RXUotyTH3e5gJ9gYKUwHB4+33mK0I7zWqwgpgt+sK2Am3ZdtASPTqo98oLX4P
         rT12veJk9NgZeZi7/BtyYJKTBnihSmsv2yFKPPeZg3U0AkwKK/zuT2haGEXREMmzUN4p
         plDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6/Lgj2H0ed/XrbAD6J3l5Bl7Ju8l+PqTifcTlzDYqAw=;
        b=m3oDyn9ySw440ueOWnDGhhDz+AbtdBkOMuj5bRRrYFoywj1XqBAkUS9U8lvxyQoNHW
         LTB1qKm8xArpiKXHgrZ0UY0knraxn88lZHAEAfMMV3mqBIg0ZOIgcKFKoWUDdbdf/tkE
         3dpVuaNuNiZkiLeJd6DuViwR1qWQAvGzes/hmpLgSii5iKvx8reLHdDmNJl6eqEi43n6
         j5LdkrQWuW4Ek5jLnlkanXdrpF4xkBesEQpn1wUE2R2SQTE58FFylJcdWKNCwn4M6BdZ
         qkFDFsiEEQVBlBLCK5ftz58MeF2GuVQM3OFVF2iUBflyzUOasi+XXUXHlVH1xhpcIeq5
         /32Q==
X-Gm-Message-State: AOAM530E9P2GA8Yxh2upTBfh+RnUl3IaTaFwOP4jDN5dfTjCL+fq7n8G
	AaUrMU8G2VcuVgdMhebRbk8=
X-Google-Smtp-Source: ABdhPJybGksZKUlk+stxmZH1m3GigZn8eCjxU4jOZ28zBZJn3L3kM3UjrkTUcN97YagNjlgvPqmjGw==
X-Received: by 2002:a17:90b:198c:: with SMTP id mv12mr8930796pjb.51.1619252135213;
        Sat, 24 Apr 2021 01:15:35 -0700 (PDT)
Received: from ubuntu ([182.77.14.23])
        by smtp.gmail.com with ESMTPSA id ne22sm9631736pjb.5.2021.04.24.01.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 01:15:34 -0700 (PDT)
From: Ashish Kalra <eashishkalra@gmail.com>
X-Google-Original-From: Ashish Kalra <ashish@ubuntu>
Date: Sat, 24 Apr 2021 13:45:29 +0530
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ashish Kalra <eashishkalra@gmail.com>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Romain Perier <romain.perier@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Allen Pais <apais@linux.microsoft.com>,
	Ivan Safonov <insafonov@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: silence incorrect type in argument 1
 (different address spaces) warning
Message-ID: <20210424081529.GA1731@ubuntu>
References: <20210420090142.GA4086@ashish-NUC8i5BEH>
 <YIE3IffGcjrkz4ZE@kroah.com>
 <20210423152619.GA2469@ashish-NUC8i5BEH>
 <YIOz6o8gwHv+cAN7@kroah.com>
 <bc8873a274bf489ad856386a9d9ee1110de4c4d3.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc8873a274bf489ad856386a9d9ee1110de4c4d3.camel@perches.com>

On Fri, Apr 23, 2021 at 11:11:05PM -0700, Joe Perches wrote:
> On Sat, 2021-04-24 at 08:00 +0200, Greg Kroah-Hartman wrote:
> > On Fri, Apr 23, 2021 at 08:56:19PM +0530, Ashish Kalra wrote:
> > > On Thu, Apr 22, 2021 at 10:43:13AM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, Apr 20, 2021 at 02:31:42PM +0530, Ashish Kalra wrote:
> > > > > Upon running sparse, "warning: incorrect type in argument 1 (different address spaces)
> > > > > is brought to notice for this file.let's add correct typecast to make it cleaner and
> > > > > silence the Sparse warning.
> []
> > >  struct p80211ioctl_req {
> > >         char name[WLAN_DEVNAMELEN_MAX];
> > > -       caddr_t data;
> > > +       void __user *data;
> > > 
> > > Does this looks ok to you and is there any other check possible if this is ok?
> > 
> > Wait, what is "caddr_t"?  Try unwinding that mess first...
> 
> Might not be that simple.
> 
> include/linux/types.h:typedef __kernel_caddr_t  caddr_t;
> include/uapi/linux/coda.h:typedef void * caddr_t;
> include/uapi/asm-generic/posix_types.h:typedef char *           __kernel_caddr_t;
> 
> 
data is part of p80211ioctl_req and is used at two places only inside p80211knetdev_do_ioctl
it seems both places it will be used as void __user* only

	msgbuf = memdup_user(req->data, req->len);
        
	if (result == 0) {
                if (copy_to_user
                    ((void __user *)req->data, msgbuf, req->len)) {
                        result = -EFAULT;
                }
        }

Will it still be problem if we change it from char * to void *.?
is there any way to check how caller of this function will be using it?

