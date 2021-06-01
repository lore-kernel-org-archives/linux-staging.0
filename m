Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E472
	for <linux-staging@lists.linux.dev>; Tue,  1 Jun 2021 19:20:40 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso316125pji.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Jun 2021 12:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bFNYi6m++gbCXTaIyGQySmm0f86eYc/Qr6XGD1RfsTo=;
        b=nEqGKcRi6N4t0IegL+8HbfXnUJ+QjBc/I85UjwK8r+2W1OajAAHtMS52fDLvCq5I42
         VQf1aq9ltt4QTVpgYd8h00ZVL5ORJBjfBrIgvpKvAODbvgtZqYI0k2qAWnP7QvmYhjzE
         yzlvivuoc8Ey5s/YsQJXDgWJv/8i7HS9xfmQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bFNYi6m++gbCXTaIyGQySmm0f86eYc/Qr6XGD1RfsTo=;
        b=Zk8r4/NZDqOeNAGSkFKhnqXpHdgLUg1bRgnZe67YujVUI1DG50H3biIX75PyCOr2N+
         A9RpU0V+jbjBi51ag6QPJ1Nx0RjvKg5JNmEg+It8weDi7iT6GuezJ26vmZpcJBMMV8w7
         tkIz/m/7MsYPCjtEyp/1A8YNyRb7TEdSp2Do4EG/UI8xa8HMbKg0jnY/cuslsI6uf/yW
         3vQd0E5Ovcr7OCKrZLgYu7dzkznbi4GqzTDGDQiK2HmdAZCMoXnzqZNgHIJMQh2itWmF
         I0dtUtjsxDD3YOtEoq5ZbVarKm5VZgTAp0tGpYzEXdjU06czMhyHHi1i2CTahkItRDrM
         2Nmw==
X-Gm-Message-State: AOAM53338/43kROyHfPDMOWhxQ+trXPyob3SHbne/k1SWDMdgOwjfrOm
	vZaUO4hkxxn8DIJM8z53ViZ35A==
X-Google-Smtp-Source: ABdhPJztxg/Xb8nFH28NC2W6Go33m7YavRvXsBAZ8lVlyjBoR2+/cOoRZPSGfs0lDQpJjGA2LHCwxg==
X-Received: by 2002:a17:90a:9f02:: with SMTP id n2mr1451581pjp.190.1622575240135;
        Tue, 01 Jun 2021 12:20:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c134sm13949779pfb.135.2021.06.01.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 12:20:39 -0700 (PDT)
Date: Tue, 1 Jun 2021 12:20:38 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] staging: rtl8188eu: Fix fall-through warnings for
 Clang
Message-ID: <202106011220.C226177E0@keescook>
References: <20210528200650.GA39289@embeddedor>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528200650.GA39289@embeddedor>

On Fri, May 28, 2021 at 03:06:50PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements instead
> of just letting the code fall through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
