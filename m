Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BE23A1
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 05:52:33 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so1834573pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 22:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kS7je0dcRsUISdffSoxUviDsBXhqWD5R3EEaLG3WV4Y=;
        b=q8IkDnvh1Cu3hw8WQYu1Y0x7SAeul3kp00HcnhJ9OSTsHmoxPT4uZMfLUY0bxIMXku
         iT7LFJXWL78mzzuibDp5ul57Dad5Ka2v5ZV2DNYvSOEMsDCn520Wk31ZdpIGGdz9Kir4
         8jBt4D7ZGZg4XF6QqTxAiRh7fPI6N+pq42/3fCKhlRoIl2twJtMFKC6VrUvCwITDur2U
         5kFErN8MO5ZUdc+PO5hb999jXs3VHrPedfXuLAAb3tpdADbsqESXRIt22OmHH/5Y7xtc
         tdQn6hD1jF4GPRsRlIw8bLKu3nNOqU89sFC3Be2oVC1fLCxLj6iQeNHYMOijqYF2zdxY
         knjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kS7je0dcRsUISdffSoxUviDsBXhqWD5R3EEaLG3WV4Y=;
        b=L6GjiVoecBYwLPm8dHNlLtIkv87UhPX9etGF5j2f5le0vA3TlGuRMmVPdVTDv9+fuc
         5ponC7f1mqb7hQYEda/34OUGyq6vqrWhij5tHpAbSUSX4R73r3mPa8G7KTZSjQBVrRxd
         muTU/vMX40Lb94wBAqlD2j/VWIFHaWsJcOMe0mnmXGPMRPGhUsfyL4tCRtg7S8KAxhKM
         YS49qQpGoQA6duLC/TO1sycj8mskGwUSY1fONxhx6G+MM5UR8oSq557PFqkD2WdmjTqr
         5fNT5YMbLTR3OPR1al/R0NmYcJSioFlsZpMj1h24HN2TlohnYLUoIpAHuxzqx+LfbHXJ
         Gqeg==
X-Gm-Message-State: AJIora8ClI2p9V7whxux3KJgQ8svGWLpivF2CQUeiUil60hbx/xv+eIj
	56GrPirRLl5+n0VrbGgtBQwaGy3ci60EcUWS
X-Google-Smtp-Source: AGRyM1uwB431JlIyYgxTLIL3PTdW9faGO5ffqUvlZQEe8IPe1X/DHig9tf1kdbxdj0AUXA6S96w1NA==
X-Received: by 2002:a17:90b:794:b0:1ec:c760:5736 with SMTP id l20-20020a17090b079400b001ecc7605736mr1954563pjz.241.1656049952989;
        Thu, 23 Jun 2022 22:52:32 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id s17-20020a170903215100b0016a4ca6516dsm126589ple.278.2022.06.23.22.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 22:52:32 -0700 (PDT)
Date: Thu, 23 Jun 2022 22:52:14 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <greg@kroah.com>, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: combine nested if statements into
 one
Message-ID: <YrVRDilTaAIVkpwV@zephyrus-g14.localdomain>
References: <20220623031515.402691-1-marcus.yu.56@gmail.com>
 <20220623051404.410632-1-marcus.yu.56@gmail.com>
 <YrQ2Izg1b399yJou@kroah.com>
 <YrUw3lejTP0UyWmt@zephyrus-g14.localdomain>
 <20220624053930.GU16517@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624053930.GU16517@kadam>

On Fri, Jun 24, 2022 at 08:39:30AM +0300, Dan Carpenter wrote:
> On Thu, Jun 23, 2022 at 08:34:54PM -0700, Chang Yu wrote:
> > > - You did not specify a description of why the patch is needed,
> >
> > I'm not entirely sure how to fix this. I checked the original patch
> > again and the subject and the body looks OK to me. I'm still a newbie so
> > I might have missed a couple of things. It would be greatly appreciated
> > if someone could point out what's missing.
> 
> What's the advantage of combining if statements?  Out of all the if
> statements in the kernel why did you pick that one?  Probably it's
> because the indenting was wrong, no?
> 
> Write the commit message like this:
> 
> [PATCH v3] staging: r8188eu: clean up if statement
> 
> I noticed that the if statement was strange and the code was indented
> too far.  It is cleaner to combine both if statements as well.
> 
> regards,
> dan carpenter

Understood. Thank you for pointing this out to me. I didn't realize the
description was too general. I simply assumed that the reason for
combining if statements is obvious and did not elaborate. I see now this
is not the right assumption to make. I will revise the patch shortly.

Thank you!

Best,
Chang
