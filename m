Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C803FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 09:39:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q26so6268235wrc.7
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BzfT+8mL4lnIIztKWMb14N98BJQF3dCybA3fCPHp1cA=;
        b=GRi0/295tLKKHZERq1UUtuATtq1NANk8QB3E7eoQhEGkmqpdMOVzq29PGKefr6Yz77
         94cq5nrm0Li3BgK3DWODFJB+ybgOtNgqpVXx9IBOqJPF03D6mrE82XR4i1JaZ3a/Y7Hq
         PBPmKmVOEJTiB4D9bxKvd8Nm6LNmMsRfGV8bOzZHK7NsvQSJVvPJ4WHkzda0bKQXd+0e
         Ir9DcsTJo6odp49jWRgqaflCUMQst6ynQIEU5DzfVoGPt1l4jPI3kyJCkvpOtYEbAP1r
         OOQMtUpCuaGRzu+3khcBhykNxqVNGBJdLtkFX40H/Gi8qbaOFNYgDvuqtU9ZRHqdwGRb
         s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BzfT+8mL4lnIIztKWMb14N98BJQF3dCybA3fCPHp1cA=;
        b=la+JmxacuPERfz5Xl5SmNDsusxW60lFrIHkwlLYYQX5hek4C/DiXSFfTsQ1eLkO2Ja
         9xt4dvws8kX9geyakY9mO2kqW7ZlLl74i8V0JSnXej5IsOxE0YdKAj1U6bqlS2m30la8
         4l1sRuYaRH4LDK/PtasjhSBabqqWqs17UEJVe5RMwsSRdC1n7VeUbB8gx1Y2Lp043khl
         iwtiDm8wxUN1bcykyTswqhvXpwLXXueK7Y781+BCalPRqzJdmywldhdorGmJnp1JAi3/
         EWb7bEYNCYE7kCakOUSHTpMwpgspqSrcU+zPIQQ29i5E2ez3rZJDrcatwEC6h6oMdnjY
         vwgA==
X-Gm-Message-State: AOAM530reQR88WmbGffQrHSFmBg9bpCjQwFPdbjajul8jFig5U77J8nu
	zvsk1Tsa4w2MCOhqxsecuPE=
X-Google-Smtp-Source: ABdhPJwrQAMC22waHM9G7/C6yt2NkNgHcg9+tAxqYf1Qw1czq8VoYwnRAlFkG5E9HWP8dABbUPjyLQ==
X-Received: by 2002:adf:cf05:: with SMTP id o5mr2261763wrj.270.1631353139351;
        Sat, 11 Sep 2021 02:38:59 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-5-131.retail.telecomitalia.it. [79.43.5.131])
        by smtp.gmail.com with ESMTPSA id j20sm1231871wrb.5.2021.09.11.02.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 02:38:58 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH 0/7] remove pointers from struct hal_ops
Date: Sat, 11 Sep 2021 11:38:57 +0200
Message-ID: <1858319.rr7sHpn3up@localhost.localdomain>
In-Reply-To: <20210910205033.3778-1-straube.linux@gmail.com>
References: <20210910205033.3778-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, September 10, 2021 10:50:26 PM CEST Michael Straube wrote:
> This series removes some more pointers from struct hal_ops and
> removes the function rtl8188e_set_hal_ops() that is empty after
> the removals.
> 
> Michael Straube (7):
>   staging: r8188eu: remove mgnt_xmit from struct hal_ops
>   staging: r8188eu: remove hal_xmit from struct hal_ops
>   staging: r8188eu: remove read_bbreg from struct hal_ops
>   staging: r8188eu: remove write_bbreg from struct hal_ops
>   staging: r8188eu: remove read_rfreg from struct hal_ops
>   staging: r8188eu: remove write_rfreg from struct hal_ops
>   staging: r8188eu: remove rtl8188e_set_hal_ops()
> 

Hi Michael,

This series is good.

Furthermore, I compiled the whole series with gcc version 11.2.1 2020816 
[revision 056e324ce46a7924b5cf10f61010cf9dd2ca10e9] (SUSE Linux) one 
patch at a time. There are no errors or warnings at any time in any of the 
seven builds.

But, unfortunately, I have no time to test. So the whole series is...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio





