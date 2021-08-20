Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB9E3FC1
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 22:47:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k8so16266647wrn.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nd2DplYlzS7tpLT2YnmXCm1lJ+3H40hwh1u9gxB43hE=;
        b=MVoVNxGBO2HhxMCZMQBtTKDl+8fqji/DgKSE6Lf3ld0I1RogciMZmkYFKrXKW8XiQU
         m0wg59mGHlnPVl/lIxUMsbAizNdsmZamVoOX8388O4KEpc92gfQCKGUwLvXLjY19BkW7
         A32p+A3PuVY33DIRX3jdICh0saAeC/i/GF2IPnhF4t+Lx5E5fpQbF4O4wQBWPqWcW8yS
         7OPFbeQoLJfc6jQWObCf0ZJJPy7gmNeDbNfuMXDuR0uHIVoHy6mdbXwzRCAIlIKS7m8D
         7wVIevf3Q55dtsxOkvpg46JN/wX7cGxaOlTA0N0VQnJgbHP92hoM/PiZuUg+AbTBK4fM
         KfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nd2DplYlzS7tpLT2YnmXCm1lJ+3H40hwh1u9gxB43hE=;
        b=uCKAuXJ2i/q3bEGNt8YuiqWSQilpzdQHAq+wR37x0stnjxOe3Ttxn246bPPwN0Atn9
         anSvRUJeBEjK0R/eXx80pOd7fQgBSUjlr7MxW80c0GkM9xebAO5Vno3DcyBcWv/UCTdI
         JDUELU8fzONnvQPhTRCXDwVm8S5S0QvYjNaqrClzzrVEXzZoWbAFxUv8j1h9OhuN/TKc
         zQlWXnn+4wgIlFaKvKClG2Wu4vW64F3yENRGXehZIXkdAozvnp2uCreSnGtjK0+PH+UW
         HggLq1IwiVNWP3veBGCa+qXX1qECmR6V+65A5w5zMgLD4hJfm2P//rnzgCL80azbXJDr
         qmvg==
X-Gm-Message-State: AOAM530/efV5vhkuFPQNtrEi2izCDiyBmGTIZUeiQUsbsB41ihBx9cM0
	ZFvyFlrKY0okdizXbk0QmfUsWQ==
X-Google-Smtp-Source: ABdhPJzMMcPKJhezh9ZmdvzFupAeU9IfMrM8dO02glOm2bpB7YSxu8BX27fMA/dAQ+Y1YpkBnQ26EA==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr1022516wrn.365.1629499639180;
        Fri, 20 Aug 2021 15:47:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:dfde:e1a0::2? (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id v1sm7003487wrt.93.2021.08.20.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 15:47:18 -0700 (PDT)
Message-ID: <21bcab8649183ae2a36fb015fda32e79cba7ecad.camel@philpotter.co.uk>
Subject: Re: [PATCH 1/2] staging: r8188eu: remove unused function
 rtw_add_bcn_ie()
From: Phillip Potter <phil@philpotter.co.uk>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, martin@kaiser.cx, fmdefrancesco@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org
Date: Fri, 20 Aug 2021 23:47:17 +0100
In-Reply-To: <20210819112200.32030-1-straube.linux@gmail.com>
References: <20210819112200.32030-1-straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-19 at 13:21 +0200, Michael Straube wrote:
> Function rtw_add_bcn_ie() is not used anywhere, remove it.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ap.c    | 63 ----------------------
> --
>  drivers/staging/r8188eu/include/rtw_ap.h |  2 -
>  2 files changed, 65 deletions(-)

Dear Michael,

Looks good, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil

