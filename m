Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395863FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:10:50 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id k24so11764287pgh.8
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PZkYaX04SJTyAmZBjQ/RTl7EwzMqBzGjroEaq47D3eg=;
        b=j8xlsQ7+PPpnH6Xv+zC1Lfs4ooIwmE0wnR3RPVEFTaSE5pCSs4qbaQrQ6JE5eeR07U
         mDbwRnSjnlkiINnueu+4McCKH7Som4jjpgTl8CMKApXSm1rvMSOW7P3/PARgn6a3RHDk
         jOxPIaCB6TcGZZgZtgeDqsmfb1TVbnzGF7vq+61FmB7GCo3b+s98QscO1cr3qpeM9TYy
         q2ttzwZGGRri3UkkDRsItpAMSzRYmYOEQ39Vs2sBuvHpos0BfGK/bZr+joUkeBPEbwxJ
         PNkHz2joSIMUghlZs2s8LgDyHKV9NK+A2JT4m7pbXLgWKjFRCGfNYGRTzjMmOzf8SG6z
         r3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZkYaX04SJTyAmZBjQ/RTl7EwzMqBzGjroEaq47D3eg=;
        b=iic44xB7RMenU83fiB08hUwbRcyFrtYQSmx3KyEEl636T89TK1l95WmiVjs9yyyZFC
         xrlV/W2NlfBF9Iy8hf8KumzH3/25Gp6ZxRdtvjKKcVrArbQzxq/afXLe8Vlfkebznry8
         Y0oONp/px3KhJNklUH3ZrdsHwAfzx/I9PwE8c+W4MUeZrBB5/Efi6+gRoTZynZ8UnT+6
         9KqBK5OCV/4hZbpnKSg7F7NQIk3ZDr6JGQPBKT6yxQzVOLVzwC8oI2ll05S58257OP9j
         NCy72jodQtO1dpHOruABEStPIUBoF+YbZsDyOED8zaWvLOhEoCGQlZn6LaxWT0KXAmFL
         IYdw==
X-Gm-Message-State: AOAM533g4OlRWgQYs2LjQtfOQVFXbb4uz1TE9uHT+E39rb8shqACerU2
	qBirrQ9+gqMCzLFm+gpyEXDvQHXxIpfsQvmI3g1i0w==
X-Google-Smtp-Source: ABdhPJyu6/3V9eKmnpx2uQta51qEI07S6kAqMlt2R+lW/WPOU77bfxXCGRpKT3w0b+0RdjidcXTvmhVpMGNvOQvBXJ4=
X-Received: by 2002:a63:aa43:: with SMTP id x3mr19197570pgo.208.1630282249796;
 Sun, 29 Aug 2021 17:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829092502.3658-1-straube.linux@gmail.com>
In-Reply-To: <20210829092502.3658-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 30 Aug 2021 01:10:39 +0100
Message-ID: <CAA=Fs0mWAf9T=QtMA6=kF2kYNb96teAYG=zeg7SRNhJqWcMxHg@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: r8188eu: remove unused functions
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 10:25, Michael Straube <straube.linux@gmail.com> wrote:
>
> This series removes unused functions from core/rtw_wlan_util.c.
>
> Michael Straube (6):
>   staging: r8188eu: remove rtw_get_oper_bw()
>   staging: r8188eu: remove rtw_get_oper_choffset()
>   staging: r8188eu: remove get_bsstype()
>   staging: r8188eu: remove CAM_empty_entry()
>   staging: r8188eu: remove is_ap_in_wep()
>   staging: r8188eu: remove should_forbid_n_rate()
>
>  drivers/staging/r8188eu/core/rtw_wlan_util.c  | 91 -------------------
>  .../staging/r8188eu/include/rtw_mlme_ext.h    |  6 --
>  2 files changed, 97 deletions(-)
>
> --
> 2.32.0
>

Dear Michael,

Looks good and builds/runs fine for me, many thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
