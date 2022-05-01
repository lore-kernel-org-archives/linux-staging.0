Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC22918
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 20:13:44 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bu29so22405423lfb.0
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Af6YvJ/bQ4g0cZpEqaiRxER9UMLmWrxLeH8xi992H8w=;
        b=Sn+yCF7EzbvgA/RjBCegCyU8kaRy8zPQSxaZwU2XAcJmTDp4VEbJ2sCYxrfSt1c1u5
         IufXI1t12+Qu88WHdcO7wOZFTQlFHaYMCw6GX0CY8KCzM1jgKYpLSJMfEY0fARJy/ODr
         x2RnI7DyeqZ3Y0Kg/iLNnjMl1mrfX/zKJ3c1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Af6YvJ/bQ4g0cZpEqaiRxER9UMLmWrxLeH8xi992H8w=;
        b=ETVpXnRUgvbm6QbKKbKjvRhi4mXGbqOEwoWLKMtJAugSZzYA3ZxmNt8kwYeeyy5aRK
         V6nBGuIpehrX4SoLjjMIDxLZjLyhEabAsfA+gpVaT9VTAJ2NNs+kD7ZpOMppw0sGsxYP
         HtmRKZeKOcwNzvTwHvOV0HzTw8oUR+cX6C8aU8ji/h3nlC2hMPuYkNDGCGJtsBbKCJmp
         FONSmbwxqEqVVNkS7pGZo8CgbYZ3yF04L1RXDZz+AJssa21PrqRKqQKVYihvs6AqCLjK
         uMDtXdKTvGp7hgE5eFskeWmkcSKlg41w3YwV9DOarkaOshvelyYQTJsFv6lApyvFKKnq
         k/WA==
X-Gm-Message-State: AOAM532V+MGhE5YnDo4q970v+p8BcB17bUrMAs3FlLRSK/ZjZtpXnyRs
	3bxjl2HKVJtX8aT0zxKutiOVJ0uDluYlLg==
X-Google-Smtp-Source: ABdhPJzLFCVfqTUFbi4pV+tBm614UuggsGoObaMKVv+y006PSehMD6BCNvWgf7yH/81hjmUni3XoFQ==
X-Received: by 2002:a19:5f05:0:b0:46b:a5f2:5fab with SMTP id t5-20020a195f05000000b0046ba5f25fabmr7272487lfb.8.1651436022422;
        Sun, 01 May 2022 13:13:42 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id c5-20020ac24145000000b0047255d21173sm520073lfi.162.2022.05.01.13.13.41
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 13:13:41 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id w1so22332534lfa.4
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:13:41 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr7168727lfh.687.1651436020874; Sun, 01
 May 2022 13:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOFRbG=mGdbR72moLtW87ZQW_T1HkhZtcpHRGzZy3NZ7afGVqQ@mail.gmail.com>
In-Reply-To: <CAOFRbG=mGdbR72moLtW87ZQW_T1HkhZtcpHRGzZy3NZ7afGVqQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 May 2022 13:13:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXp7Ps9ML5ThsX1tvdRg6SKRH3r6MM1-EA_Y8-n+6v2A@mail.gmail.com>
Message-ID: <CAHk-=whXp7Ps9ML5ThsX1tvdRg6SKRH3r6MM1-EA_Y8-n+6v2A@mail.gmail.com>
Subject: Re: [5.18.0-rc4+] report: kernel compile
To: Ozgur Kara <zgrieee@gmail.com>
Cc: linux-staging@lists.linux.dev, ozgurk@ieee.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 1, 2022 at 12:44 PM Ozgur Kara <zgrieee@gmail.com> wrote:
>
> Samsung RC530 (notebook) - FAIL (1)
> Raspberry PI Model B - FAIL (2)
>
> Fail Log:
>
> + nvidia driver fail.
> + scripts/Makefile.build:497: recipe for target 'arch/arm/kernel' failed

Is there full information available somewhere?

            Linus
