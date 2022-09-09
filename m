Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A8622
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 06:01:41 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id t184so1192286yba.4
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 23:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zZ8jJlzfW5ni1oE/+tdYMxOdGoMqiiHVTECd9TNmHoE=;
        b=FOoy81KGKOz9ngRAqabXhtCs/NZfHJnkIqC2EVX5WUCbNA6e/m5MM/bl4dDmnjTovB
         Qh4GUC66j8uEF8PnbaaXW15BRIm/CJtYMfTsHdfOIwSUUOc4YnTbbPVnPWDWIFO6IUZB
         fYCHEpv2rjAe1OFmKkUytJ6lMIbOUyl893yy48m/bDwHC5PVdVQny2wwABqJjE4qamQw
         xLTMDG+bLO+ZBTNihZ3EFV7nkwsZ0Qne1pZNx9necuBEwZqWA7hRyOzoD6xGJlmg9YM5
         /ybdG2yTfXSGvYB+s7WyguKWrlozrtnWlx0aKVmZCnUjdkJVbBwoKDXwxmIyUPylIAdT
         vw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zZ8jJlzfW5ni1oE/+tdYMxOdGoMqiiHVTECd9TNmHoE=;
        b=jHSbE+7dMWcKu/HCr1p6P9r7uaB/koDBhsS0boT3+fe+qh7ek/r65xzfVd1wtI+SRs
         SWjKPlAWUDQ8PyOdJ1QKreeATQKluf+cBC44Oob9Q6YcYromZw1ydcpBai8TAiilLoAF
         5eYhtM9VjPX4uwCQS081s6dzwRQnHgCrdvm1WxubEhUZBCxoAaC6J5RDqH+Fm1C4UPWp
         8X6nfgGb3yUqy0ztl4fGqGMt2DlOddnajX6ZavJwATQReyTHg0EE2JDCzLHBcttuvM03
         q6RYBngWycRLh51XNw1koXTdzpHat37roGqQ1rvaHVD+pt+vr3zM51Vrg0tBudJTzrvE
         d8Yw==
X-Gm-Message-State: ACgBeo1gtHSbeFgDUTtFb2Q4P91ewLCjqt0l4tjx//D/ymKkwGhpWgV/
	nVWaeuhtLz6yDVqOYWoUTWK2lcQHDFE1chXIWTQiNwQAtxu4ZQ==
X-Google-Smtp-Source: AA6agR7D1hRiZW0n15HZiHh0btPBxMcV1jngPBPde488w3tmA6WU3A7yy3ke3aB1+WQi+OIkJoTbvzCftXQA54Op/gQ=
X-Received: by 2002:a25:9a85:0:b0:69b:79d2:7f4e with SMTP id
 s5-20020a259a85000000b0069b79d27f4emr10449738ybo.379.1662703300042; Thu, 08
 Sep 2022 23:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909053038.33188-1-namcaov@gmail.com> <YxrTiN1OuJ2cbtrn@kroah.com>
In-Reply-To: <YxrTiN1OuJ2cbtrn@kroah.com>
From: Nam Cao <namcaov@gmail.com>
Date: Fri, 9 Sep 2022 08:01:29 +0200
Message-ID: <CA+sZ8B_VtmUWnvvfWBUV1WVq_=gRid+6ffGRQwdxp+9DYcLDtw@mail.gmail.com>
Subject: Re: [PATCH] staging: vt6655: fix potential memory conruption bug
To: Greg KH <gregkh@linuxfoundation.org>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Just out of curiosity, how can we be sure that sizeof(unsigned int)
is never 8 bytes? The C standard doesn't say anything about this, as
far as I know.

Patch v2 will come later today or tomorrow.

Best regards,
Nam

On Fri, Sep 9, 2022 at 7:47 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> sizeof(unsigned int) is not going to be 8 bytes, so there's no memory
> issue here.  But your fix is good, so can you please just rewrite this
> to be "make it more obvious what is happening" type of patch?
>
> thanks,
>
> greg k-h
