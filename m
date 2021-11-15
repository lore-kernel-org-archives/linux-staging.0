Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA12C81
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 05:31:22 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso11993953otr.2
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 21:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KPmwQ/kJpf+B9rVby2s8xXr+WWWYaWAXm47KkH9dtJw=;
        b=Rd8g97AHhg6FExk66AhhfjhX9ObjAX8MJBZJZN2EvcmioayzuXGznGKwED2YkJi8ai
         Kc9eYkIfRwjxCY6wzq0bb8Xw8evTZ2UQGd2siJLBmyty6RlOg7C7E+wpA0aHCS3a37N+
         ZSYQnnmBSHgQNdS9x+lw5GV3UVlTdG0mHnyvDuf8MSXsfFpguELaoyry6lnag5/rRXJj
         IDts84Us31hrBPrewtk7mEu/55usIdE76ogxn6fubyiL3YdWrwkf96Wmrg38Uyl/al5q
         hpfAwflR99fa5JWOcc/7TRSFd/1vIGFwRX2CeTcudg16a1K52pIrru93oQ32CxG2fagq
         To3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPmwQ/kJpf+B9rVby2s8xXr+WWWYaWAXm47KkH9dtJw=;
        b=TgLlyX3N0bA6LqDq+Iin3bRTSTYEw1UT79QOoU2Tv7mVSk7FR5H9JXhusA0kbp33EL
         CyA1O2UQ7edTXZehaln0m/AJ4QLtuv3YchDWCzi96i5/+C/7qUZm3pWxSZDFSaJDTcAB
         ihCel4MpUMQf11CzhCnNfEE/MLa/+KWsWDnY6tbYpSAMS+usmWMP6hqOc/yGZXmIavV9
         0zd5KvCltcCdKtl7qbzTI+JKfuDZDWJ1cPL/yge+NnixRf31NS1V/2plRDM7Ng59a8pV
         xugX1O/IksfF/yuHh5N+XSm1wDBBIs/msxgu4kYJgYra0ta/3M+knLBOOR397++/rA+l
         1ipQ==
X-Gm-Message-State: AOAM533EM4OZo2S4RSaOZVThYroWUC4a1KL4sCwdSjAmhPuU8fEZjhV9
	uUBGvmPNw0bvtwSyM29eIXwxbqo320qTkw99jIQ=
X-Google-Smtp-Source: ABdhPJwSbHIfB3qSPRPm28j+psyLxiB2xNqOrIlkrk95AA/OU6BtMmBRmu01MGqbdQYFYRG5YelqnXRJm0o7bUxJrlM=
X-Received: by 2002:a05:6830:1e57:: with SMTP id e23mr28554851otj.16.1636954281875;
 Sun, 14 Nov 2021 21:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
In-Reply-To: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 15 Nov 2021 11:01:10 +0530
Message-ID: <CAKfKVtGGsw10RAzowZdGmuu-5ABsnfOWhR-Sxnoymc4QiqvCPA@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] clk: clocking-wizard: Driver updates
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-clk@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"

Hi ,
Could this patch series be merged if there are not further comments.


On Tue, Sep 14, 2021 at 6:27 PM Shubhrajyoti Datta
<shubhrajyoti.datta@xilinx.com> wrote:
>
> The patch does the following
> Update the versions of the clocking wizard ip.
> Move from staging to clk directory.
> Update the bindings.
>
> v12:
> No change.
> Rebased
> v13:
> Update the clocking compatible
> Add the change removing the driver from staging
>
>
