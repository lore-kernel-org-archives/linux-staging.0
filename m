Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0D7471
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 14:07:47 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id p96so1561729qvp.13
        for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 06:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lI7bNBM712aJHyLKJ5fyHPeJK8BWNRSC3RcpgvndO94=;
        b=KHtYoiEGDHvGcMAIId58pIH/ad712Vd1Ipc/s9+GUT72Bk5MszZ/aYutEJu4zAuVCu
         OFCTh5hVApxS6FTKAQaWZsjqmW37l5RoZ+Juat+KT05dMBkJHHH1Zy+HcP7nd9KVni8T
         fjpZWSFZ/epe9iIS/fOYd96JzirjpCrUHwLaD1xOh3D4HuEILxQEtGr0yIKKwoLizZ49
         9A3lIx2RODW7WnKBTl4jiJFvha0jVi0lys5EI+Y77zVlyaSZVtcsg+OYDXP4hAHQlSes
         c3aq/uLhTlNjanPmyp/41DZ4vyhxiq97KRceC9aqb2MssK8tL002ApEoMUEoLowi1QNK
         kQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lI7bNBM712aJHyLKJ5fyHPeJK8BWNRSC3RcpgvndO94=;
        b=pXkcvarZ7ekFLOD7gAo0KYWH7NRcuHjL2ZPOYQUbUTRi+K0QfGfX4Ota+uo7ZySPBV
         kwikwkCY5d1+yu2FUg2Y6eMhRsySXjQ3SPQQgE91owseWJRBsfWC1IvxbnSF+J31Ir5A
         j11Ru1x1MLFxLeFTVNmSVcMcxFfb1U5I16nvz7ZVItLqWhTnevTQQ4Yy3qoV4v/B9DxE
         ejgyvhny01IpQA4rOjxYBAeNy9gKpKWNMv1NeXiui9QVWqoOjBnrIcATUtDxOS3hN9Xl
         XJeYfVKxz60B9ryv3qPY2GJvgU9wBl1RS9AyGWppZ7raxftSBBu7uBa99+ik1ZJbqJwW
         v9jg==
X-Gm-Message-State: AFqh2kp4zeRjJM1FvuVhEzYRXxNvWTy49+ynzqMBup3UD/nDbmQPpgtu
	mex0bcoJy5G3Lf+nblchy3A1EP9BFwJxLuH5vVM=
X-Google-Smtp-Source: AMrXdXsH7RqaoxO0iZCH40SaRq1NMTaoNUhOBacXaJih3JlcUdNFDSYkeyz/5LfMLBYhKnC1N/vUZsTKn5dr0MMMxWM=
X-Received: by 2002:a05:6214:4c08:b0:4c7:1ebf:719f with SMTP id
 qh8-20020a0562144c0800b004c71ebf719fmr418413qvb.64.1674137266231; Thu, 19 Jan
 2023 06:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230119134218.12280-1-bpappas@pappasbrent.com>
In-Reply-To: <20230119134218.12280-1-bpappas@pappasbrent.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 19 Jan 2023 16:07:10 +0200
Message-ID: <CAHp75Vc4QS=Gr-DSvf7pzCKktqGPfno4TBDmicj5CKgyHGjSsw@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: pci: sh_css: Replace macro
 STATS_ENABLED() with function
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	gregkh@linuxfoundation.org, andy@kernel.org, colin.i.king@gmail.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 3:43 PM Brent Pappas <bpappas@pappasbrent.com> wrote:
>
> Replace the macro STATS_ENABLED() with a static function to conform to
> Linux coding style standards.

I believe the best approach here is to drop that completely and move
its content to be inline in the only caller.

-- 
With Best Regards,
Andy Shevchenko
