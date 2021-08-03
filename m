Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBB670
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 08:56:14 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id c16so22849838plh.7
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VSBHI2kOyfU03u1WdUTP9YGD6lc5dbX5FmCawILdkw=;
        b=xFyAfNKpx2lHljwdqXYLDuofUx/eI05GpD7CjNHjSTi8OzGQi6nhKb/M67VmZsIo5l
         zgZZMg9JuCvYqwMt6HwWXuvZlVcen+VNhITVZNn4VZTLdo+zZbl7k3bQocWzR1lfvnJ7
         s7/ZpmzSnx7ciwZjQm/x3Z8Q1fpQXLy31V2OBrGTPPOrUvlUGeDxFcW4pbce1HRnLZxc
         6qHPZEcN5kwzyUwpTQ2ivR8gwSTDz4lFkNNr40VrvmoFb2MOnfpLCyv2Tk8a7nPJmiAI
         xD9ScBoY0hevG7RuaXFXFPu+TS+nThE779jNPUZbARFbaoeVb/gxUO3BPVihQ5zEIpsK
         tBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VSBHI2kOyfU03u1WdUTP9YGD6lc5dbX5FmCawILdkw=;
        b=lTvOXlbANklaTeqxoRWBpB5G8YeFB6/rjUeMUYjJ0gbxNtxYC7oZ49a8oGsZn40RKN
         hQ0I8y/ZOOQWTTNrR+GhuP2gacHg/+bIvbD89GehQbg2EZlwyIuUquEZXNVdPFT//h/R
         0eWS0qI0/7oi+z31msPjRGDzlX+pUVppd0SK+XYjkGQbPUwqxJHxro0TuZhaS9bUciYE
         K9QZXTNKZd2OQd+esX7VhAh/CRnZF0t+iI0LyrpqmBMFWN06Pwa39GZ5f5qAkmJn+nhZ
         aQB4OnhN2SX34VhS5F91cpk+PWRd3gPpEW6bczeVYqZwNWsAWIapsl5vFJc4Va4FpjZd
         fu0Q==
X-Gm-Message-State: AOAM5318MtQ7Zxe904uEbP6+jA06vdBJ0K2+i39zVGTGSNFgfqDwgiLY
	GGBzGn3NtsaLM+Lo6vzQuklCpkjBBHaDzGxrHwcjFQ==
X-Google-Smtp-Source: ABdhPJzPp7C0RinR/iokila0E0mzC0TMDoH9Ys8TEaTlWqVMLd+0B6mNL7o+4jpCfMcAD5navb9xQle/6NO9/YMqSJs=
X-Received: by 2002:a17:903:2302:b029:12c:bb4f:cbdf with SMTP id
 d2-20020a1709032302b029012cbb4fcbdfmr6974312plh.22.1627980973355; Tue, 03 Aug
 2021 01:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210803071811.8142-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210803071811.8142-1-lukas.bulwahn@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Tue, 3 Aug 2021 09:56:02 +0100
Message-ID: <CAA=Fs0=V_gcfDUxn1m9OkR78cht0S=j02BsHajG1A3vuGTqQJw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update STAGING - REALTEK RTL8188EU DRIVERS
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, kernel-janitors@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Aug 2021 at 08:18, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 55dfa29b43d2 ("staging: rtl8188eu: remove rtl8188eu driver from
> staging dir") removes ./drivers/staging/rtl8188eu, but misses to adjust
> the STAGING - REALTEK RTL8188EU DRIVERS section in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   no file matches    F:    drivers/staging/rtl8188eu/
>
> A refurnished rtl8188eu driver is available in ./drivers/staging/r8188eu/
> and there is no existing section in MAINTAINERS for that directory.
>
> So, reuse the STAGING - REALTEK RTL8188EU DRIVERS section and point to the
> refurnished driver with its current developers and maintainers according
> to the current git log.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210803
>
> Philipp, Larry, please ack.
>
> Greg, please pick this minor cleanup on your staging-next tree.
>
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36aee8517ab0..ef32c02b3e4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17723,8 +17723,9 @@ F:      drivers/staging/olpc_dcon/
>
>  STAGING - REALTEK RTL8188EU DRIVERS
>  M:     Larry Finger <Larry.Finger@lwfinger.net>
> -S:     Odd Fixes
> -F:     drivers/staging/rtl8188eu/
> +M:     Phillip Potter <phil@philpotter.co.uk>
> +S:     Supported
> +F:     drivers/staging/r8188eu/
>
>  STAGING - REALTEK RTL8712U DRIVERS
>  M:     Larry Finger <Larry.Finger@lwfinger.net>
> --
> 2.17.1
>
Sorry, not sure how I missed this :-)

Acked-by: Phillip Potter <phil@philpotter.co.uk>
