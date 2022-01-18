Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250212C82
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 19:34:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id c3so25385709pls.5
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 11:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=40MV7ZI2tGZi+RBScQrhTZKoyeO5b0aBJdwY+wGkH1Y=;
        b=lFjZ7Dwsvh/f8q7mVj1DmtDPHMX9W5RAtybXK2f+6FWm6oXdSYGUpkrkmCQbwc34iw
         shhFwQmavNA4UBmMBREr7gojGZBiab3kBA11j+Xk9H07pVon5rnsk/fBEP8ggWMyeLHq
         rm4IdfVqlUGZLsi0tWs0yk25iNCNpNHlhR1yufzBrqhOsY3+qnfgtebQXQBZRyLGYAxO
         ImwKeN9rU8bxkJLJy7dirHfjmGGYkVJyvGfFPAdhqY/v8Zb9xYxzNaMQBDQ+MCaBRL89
         XaxuR4oiAimjjjUvYRLdeIsAUo36g+YQZxna9WAcUooZBAMI124cPXjLHDXefK/3HkRV
         giOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=40MV7ZI2tGZi+RBScQrhTZKoyeO5b0aBJdwY+wGkH1Y=;
        b=4DjgQDKEOZ2iZ5nf+lvoaXZPO4WkLcZkr9JCIpJTV9G5R8mClvJ5hkuZkZxN5LBXAx
         9TFOexGqv9rSCR4O7IGSYGIIyXVycfr6UZTYKCTi07Zo4iY8to+EtYTXlSCn0Fltc13P
         Ba2x+2eY2xC3PoUJOJlm8oZCvObWM/hSF3E0KvFotzOtq+YRn+CgV32bdF5zl9rYV3ms
         eX/43yf5IZrq6E9Sq8yu2eHBim4X/HCSKv1aelafjJdEOH4O/tFzbfWqQCrf4bL/IelE
         WqUTSB/TmUcnWGfQfoVAg0exAgisnhLha8yE+FcNAQvZ+e6GnkZyxD8jYV0pv6OL/y86
         n6ZA==
X-Gm-Message-State: AOAM532qtt1K9uejsmiTdO7FYsy9mG1Kc13jJDoF+vWqe/ejQ7b3R3hW
	vjMy9BuirQiJcDN8Kpe6ZZG+0fm3HJHyXpIo0OU=
X-Google-Smtp-Source: ABdhPJw/rumCUvksSOyguf/QDdyWBBtXkFA5pXyBJirVib31imNTt3X4WukBEBSf1DekNqSl1VXHmA==
X-Received: by 2002:a17:902:70c9:b0:149:76f1:47dc with SMTP id l9-20020a17090270c900b0014976f147dcmr29334321plt.130.1642534468623;
        Tue, 18 Jan 2022 11:34:28 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id c2sm3778204pfv.71.2022.01.18.11.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:34:28 -0800 (PST)
Date: Wed, 19 Jan 2022 08:34:22 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, realwakka@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] staging: pi433: validate max bit_rate based on
 modulation used
Message-ID: <20220118193422.GA3155@mail.google.com>
References: <20220117055849.GA10644@mail.google.com>
 <20220117060220.GA11202@mail.google.com>
 <20220118135902.GH1951@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118135902.GH1951@kadam>

On Tue, Jan 18, 2022 at 04:59:02PM +0300, Dan Carpenter wrote:
> At the same time, this is a GCC warning so it will break the build.
> 
> Instead of applying this patch, I wish you would just make a note of it
> in the drivers/staging/pi433/TODO file.  
> 
>     "Change (struct pi433_tx_cfg)->bit_rate to be a u32 so that we can
>      support bit rates up to 300kbps per the spec."

thanks for taking the time to review this patchset.

It makes sense to me. So essentially for this version of the patchset I
would only validate OOK max bit rate as it fits within the u16 boundary
of the current implementation, right?

Something akin to this:

// check input value
if (bit_rate < 1200 || (mod == OOK && bit_rate > 32768)) {
	dev_dbg(&spi->dev, "setBitRate: illegal input param");
	return -EINVAL;
}

> 
> But you're right that it's complicated to fix this because it's part of
> the UAPI.  I think that the UAPI for pi433 is kind of garbage.  No one
> like custom ioctls.  It would be better to use sysfs.  
> ...
> So my idea is that instead of modifying the custom ioctl then we can
> just add a new sysfs file to set the bit_rate and all the other stuff.
> Eventually we will delete the ioctl after all the users have updated to
> the new userspace.
> 

Using sysfs or even possibly configfs was one of the things I had in
mind too. 

I started a similar discussion on how to change/remove ioctl:
https://lore.kernel.org/kernelnewbies/YeVoAlv0ubKrmckV@kroah.com/T/#t

The tldr;:

If there is a userspace tool that interfaces with char
device and we can change it at the same time as the kernel code then we 
can have a bit more flexibility on how to send/retrieve values to/from 
the driver. If not then we would be required to keep the original ioctl
compatibility even if we move to a different approach due to the
impossibility of knowing whether or not someone is relying on that. :(

Everything leads me to believe that there isn't such userspace tool /
lib so I emailed the original author just to be 100% sure that this is
the case.

thanks,

Paulo Almeida
