Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176017C
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:04:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8377363wms.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yEW+4BVZ5ANLLKSU6/pPWr+45B5glov6svDw8cCDQvI=;
        b=RmFzJxAPOtZ8+xn00ZferYr7RB5rD7OufL3hGTVRHS4dvw83IRFiZDzmpQsv3UnxLT
         tEMn+gpS1FdOKiCKS29Hb4mIi1Jnj6s2tMyLhkR866+3W/b+bhKLqlWharvxz6vaZsKU
         J1re8wH1mLk9y5qZDZ8mIrhRUadvn5z5vFewkRXTaL3inZKPA6JDQGSzewNHvjc70TEh
         kfP5jJgs8xitNRe8DsT74NXADTULkfkewhGUN62ABEMxMbicAV6whi2hSHj6OWQTOm/9
         z8f/yKUZwmU8U1luOafA+nCnhICe10Z8dOKf5Rhf5ZXw9WAMOixts8ho05CzL4xUUYpR
         YBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEW+4BVZ5ANLLKSU6/pPWr+45B5glov6svDw8cCDQvI=;
        b=QwVQPSQ2DcRdDjs0Ypmcrm0OzgwoW8ytVAvD1zGG6oqdFCbfDV0FfMW3scvn8ruPBf
         A71yRPa9IAcb6sbfiVStguj9kSDkqe9v+jXTg6K0Q2m2LGrcyWPtKOoKLgiQzZFIfeBU
         oyNcezhklYlD3cQobVEZxQ/34+KL4/ZbXA1q1SS4VkX4RjbPvwTXPy15RwkRoQqni+xP
         o3MtterwC6NLYUGQW8KGYj9Y+ZyIJXEOXuUxuRML0UzpXT2vV32ficihOGKpPT8NJ+ux
         LKTTc3SW/Lhqtji1ZG0iMdm6TmbZ2AJ4hMHa5u80L5PK9C3wivFY+saH2iA7ft5NbwvI
         B/tg==
X-Gm-Message-State: AFqh2kp1cracWd/+M0n+lnFYqgLk+XchQ1pRE4lwsQWkOueqzyUxLSD7
	eA+OrPkfXVoDR2mdMwoec/w=
X-Google-Smtp-Source: AMrXdXv5ZMGamm9R3AWrjyhn15xXR3YYflE3NfcWaD+iEm1LJp3aaueWtJibWE7ROr2kFZ2GA1xlyQ==
X-Received: by 2002:a05:600c:5390:b0:3d9:a145:4d1a with SMTP id hg16-20020a05600c539000b003d9a1454d1amr20516589wmb.34.1674475492382;
        Mon, 23 Jan 2023 04:04:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm14511122wmg.27.2023.01.23.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:04:51 -0800 (PST)
Date: Mon, 23 Jan 2023 15:04:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Fix full name of the GPL
Message-ID: <Y8534H/2JvussfAh@kadam>
References: <20230122191047.58769-1-didi.debian@cknow.org>
 <Y84wk+sw/gR7gNW4@kroah.com>
 <Y85Kkax5+U4AUedT@debian.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y85Kkax5+U4AUedT@debian.me>

On Mon, Jan 23, 2023 at 03:51:29PM +0700, Bagas Sanjaya wrote:
> On Mon, Jan 23, 2023 at 08:00:35AM +0100, Greg Kroah-Hartman wrote:
> > - You did not specify a description of why the patch is needed, or
> >   possibly, any description at all, in the email body.  Please read the
> >   section entitled "The canonical patch format" in the kernel file,
> >   Documentation/process/submitting-patches.rst for what is needed in
> >   order to properly describe the change.
> > 
> 
> Hi Greg,
> 
> drivers/staging/wlan-ng/hfa384x.h (for example) has already SPDX identifier
> that matches the verbose copyright notice below it. 

Resend the patch with a better commit message.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

