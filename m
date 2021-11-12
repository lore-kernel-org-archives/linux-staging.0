Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C62C81
	for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 09:01:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r12so34952194edt.6
        for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 01:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UcIHLMef49THsgwvLfI1bVNvCabXW3IkXo4MjW8OE+Q=;
        b=aK4bqGzck1WLzHmKqUpQ7xIM3Nq0XsN/FS/20+L21bWIZSz8kEdqOqpjUUMTsUc7WF
         6XrRNkzbSrWzEOiDs3xgb+kJ7SJBXNbWAaq6IPpw5Npwg77dW+3/vb70I2kDBZnyWGRm
         vcxUzgAUKSRQ9EucQPB3/SylJQrW0qW6XfzkfoeYhmtI6y8WH/iwC/da9WRnPLtDsWiM
         99oMWI6Et4UxDcoYSVkOre3KolNUcJRsTTVCgrpUSf4eQBEnhQ0vk5DYQhRbUCcnxIlg
         qGMg78xljNziFdupr60m7NP2pSp1IHfw3xvWsLdfdvd1ZHLxfwddbuaZue3sn7TL/0Wq
         yzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UcIHLMef49THsgwvLfI1bVNvCabXW3IkXo4MjW8OE+Q=;
        b=SgNnjKWRoaGiwXcua3umrEEMwWLmd7GrKbXfxPWQ+ptuvc93GqFcjkw2iisl1fKTUu
         Ga8rtZUWBi3XRuiM2VWhZzYdiBKYoMUvD2QpN3aA5qQu3RccLV9o/lsQ7frDSNbn81GI
         UlVqbWdfzu8lA7JX9wfiZQzrZHxwj6Nv9ynSKuusVHqV4p4xyMnrvh/u8DJ7gni7UipX
         R8DOo+jl1cUCb5mKd1gGawKjOX2cC0vVDOjHyPM/QRF3lIX1UI4GexNpUor3Nr0T2ObD
         JqTI5xlYnEakc9cExor9eH68Mk+9ZM+Jw/U6Ew8/cCI8PBivc4pZ91VmtSOv80sq6dOa
         iWJg==
X-Gm-Message-State: AOAM532ihIX6vUXfzV9D2ianomJ4j6RxGJ2R8UJ6YL17kDwUOh9sU1SA
	5JnJmSBuV0u9fPhENYZyd7o=
X-Google-Smtp-Source: ABdhPJyrxrn0N8bjvkMJDNVDv5vN3bsnLj+3LCU0IyFkwP3nwzFCemZgK+VDj1Tnd8i6YVZH+ZFlSQ==
X-Received: by 2002:a17:906:2757:: with SMTP id a23mr17830390ejd.230.1636707668574;
        Fri, 12 Nov 2021 01:01:08 -0800 (PST)
Received: from localhost.localdomain (host-82-61-38-115.retail.telecomitalia.it. [82.61.38.115])
        by smtp.gmail.com with ESMTPSA id h10sm2688052edf.85.2021.11.12.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 01:01:08 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Kaiser <martin@kaiser.cx>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 1/7] staging: r8188eu: remove haldata's EEPROMVID / PID
Date: Fri, 12 Nov 2021 10:00:59 +0100
Message-ID: <6997531.xZuqOj027S@localhost.localdomain>
In-Reply-To: <20211111212644.9011-1-martin@kaiser.cx>
References: <20211111212644.9011-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, November 11, 2021 10:26:38 PM CET Martin Kaiser wrote:

> They are used only in a (disabled) debug print.
> 
> In practice, lsusb can be used to read the actual vid and pid.

Hi Martin,

You seem to have overlooked the usual rules for writing conformant commit 
messages :)

Please say "what" you did along with "why" you made the changes.

Here, and in two or three other patches of your series, you forgot to 
describe "what" you did. You actually wrote it in the "Subject" lines but, as 
you know for sure, commit messages must be self-contained entities.

Also, it would be nice to have a cover letter and have all seven patches in 
one thread in response to the above, even if it (AFAIK) is not strictly 
required.

Anyway, many thanks for your work.
Regards,

Fabio

> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_halinit.c       | 8 --------
>  drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
>  drivers/staging/r8188eu/include/rtl8188e_spec.h | 2 --
>  3 files changed, 12 deletions(-)



