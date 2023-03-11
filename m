Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EACF7B;
	Sat, 11 Mar 2023 13:17:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7969337wmb.0;
        Sat, 11 Mar 2023 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678540677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCjTLaYDZiJ8XkbV6O0se/hxyGHop4SwanTGb6lzi1M=;
        b=YmT2PAymAK8fck2e49AWQL8Wirpyr/LDvSAW+cy7qA/ZIua4l8pAI28j5UlJtMgcxo
         6D1XfJkH8C+xNMsNwhDDF6xn47VVgrY1/oK5BS8ffPQz1ffhozJtel6DPvsFapbs26lK
         2L8SlgDinviMN98LBPJ2bbX9fKv1kor75FSTUduXMPjQzbPa4+TdmUar3OueQ5v01KuK
         iTooxA6IQuIt4fZil6pm2JlihyT2ReFzu7VFTHAWvqm37LeAI/doOMLNvdXCZNlgqFWt
         Rr01UVTl1Ot6Hrf5qouz1GlZZrg8epQBvjruZqkFsXHu/szc2na0kEk1hyXWy0cJUxT7
         8YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678540677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCjTLaYDZiJ8XkbV6O0se/hxyGHop4SwanTGb6lzi1M=;
        b=XtrapT5rJ5opRUAMTtKpxQu5yfaC83d+Il3V8OyFEyxTrAgubGHDhPcnnuvVNtGOCI
         Hi6d3eAZhyID2akOClUfjcd0FZAiIFQ7RXGj5BH2RUH8SGbeo+SHtXVxIolEZP+7t/Z/
         lplYJ/sUFS82bESkYmrQwVZLXjRhN4l/9XobBsoeUSaGF0P+omhekKJLcnc+MWqMMoKf
         EiZ7G4C/2ID/u5aFWejmj42WRjmH339PYPiz8YG9Kls8xZhTSL8tAkAIHZFRUe1MRe2a
         vQ/+T8Q3ev1s7vgUNlUntjrzgQIT8tNg6jcOU9+MthON3Q4rNuL4p+V84FeykC1zUDba
         9QVg==
X-Gm-Message-State: AO0yUKUtgTKw15c8D/m9zqRvzK9XEdjf3HW4HA7ZrVbB9XZwk+yPUmfP
	ofeSqC2rxa3i7tirILSR4Q4=
X-Google-Smtp-Source: AK7set8IojbqWlEavLq+aYCjMF0+8zMNyH3vKf7eumPixvIsxTRAxp0wR77iDdFTjsCWM5c5KyCiFw==
X-Received: by 2002:a05:600c:3ba6:b0:3eb:29fe:7bad with SMTP id n38-20020a05600c3ba600b003eb29fe7badmr6186078wms.1.1678540677585;
        Sat, 11 Mar 2023 05:17:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b002cea392f000sm1708666wrn.69.2023.03.11.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:17:57 -0800 (PST)
Date: Sat, 11 Mar 2023 16:17:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] Staging: pi433: Change bit_rate type from u16 to u32
Message-ID: <de7df101-6cbf-4e69-afcb-b80204bc1d5f@kili.mountain>
References: <b9d62635-b968-4dfd-aa10-e34e38a114a5@kili.mountain>
 <20230311130023.GB14247@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311130023.GB14247@ubuntu>

On Sat, Mar 11, 2023 at 05:00:23AM -0800, Sumitra Sharma wrote:
> Hi Dan,
> 
> The description in TODO is difficult to understand. I would appreciae if
> you could help me understand it more in a step-by-step simplified means.
> 
> "This configuration needs to be moved to sysfs instead of being done through
> +     IOCTL. Goind forward, we need to port userspace tools to use sysfs instead
> +     of IOCTL and then we would delete IOCTL." 
> 

This driver comes with a user space program to control it.  Your patch
breaks that program.  Someone could find the program and change it to
use a u32 instead of a u16 but the old version would still be broken so
users would be confused.

Generally, in the kernel we try to avoid doing configuration through
ioctls these days but instead prefer to use sysfs.

Now the driver uses a pi433_tx_cfg struct which is the same for both
user space and kernel space.  What we do is create a different one which
is private to the kernel.  Then in pi433_ioctl() we copy the user space
struct and convert it to a kernel space struct (new format with a u32).
Change the kernel to use the new struct every where except the
pi433_ioctl.

Then add some new sysfs files so that the user can control the bitrate
without changing any of the rest of the struct.  Update the user space
tool to use sysfs instead of the ioctl.  Then after everyone upgrades to
the new version delete the ioctl.

regards,
dan carpenter
