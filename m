Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AB2FAE
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 13:01:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n12so26281988edx.8
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f/GF146nQqp2PhpJ6ztsdUf2MFA6TI0c/YyPE5i3rWg=;
        b=Kv1VN0BT3FxD3LkbsJLmMC26j4eip3NJXB+o/zrrjNYED2aEVccBpxVY6QJ7EJXIV0
         YQ4sjPo/t9+DbH0EuomMUE+nTU8iptuN7/xXU+S2xmdo6ZfxHCp+eqPzNMBYWt0Xaa0Q
         iDgWOaq9T6bKrQumJ+BcoUSQi4NsUFwk0JviFUA2XO6UNk1Kx0LH1A7OtL7hwL1ecGTl
         Jv0OTrnblF82yJ3DvSOudENG2GxDPAigYbMIAP6RlJbq8q5shkmsNoT1y5j4tOg4JA3Z
         I7qMuwY0dH1EEaXR3mGhNwJH5v9rVGlpP/ximSyMQxBPD6a7Co906xfxevORX79YHaPf
         cgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f/GF146nQqp2PhpJ6ztsdUf2MFA6TI0c/YyPE5i3rWg=;
        b=jqtQfGwtYvUpkWM/v33YCkXtbUldtKqyIT9U7+KlGKbQufypXQikgPMEQHIelTpWzr
         wylsUYaNIHRNvW0AUjaZeAGwx2YEXp1IVmeolsl6h8js2gO3VVB+EOU9UIrT8QhpNTjc
         66wb5Emmr3dp4W97WnyNQeghK+Codndm3d08jPAdcS+8vu3pXuVMO4Y7hTVpzsItAgd9
         7y0EnLgUHgUXVnEBaHzV5yHd+I4TIV7aAxh6WbBuCpKFWCYrI/NpvcMMlqMJvTR+r++y
         2Eiu6L8ZHNHtFKU6JOIAfOwQoj/VHtuKOUN6XFrq3ML6l+8A9igmR7aPnAHeJ74FSzwf
         MOrA==
X-Gm-Message-State: AOAM532PzxwvW+SwNovQE46rfifdTjTLOVpXryjACVSA/HVFJ7kxxl/y
	rPUhdDywtlCc1Vv3bfi3N4Q=
X-Google-Smtp-Source: ABdhPJxof+bTIruXpbIJCpbwPvbI/t1rMO5oMHrf6faUO4UkAc6NNpP6eYZulvrURyJPodQq1gGquA==
X-Received: by 2002:a05:6402:31bc:: with SMTP id dj28mr19977771edb.143.1629118891817;
        Mon, 16 Aug 2021 06:01:31 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id f16sm4873904edw.79.2021.08.16.06.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:01:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 2/4] staging: r8188eu: convert rtw_is_cckrates_included() to bool
Date: Mon, 16 Aug 2021 15:01:29 +0200
Message-ID: <2093947.dRTFVrr4gv@localhost.localdomain>
In-Reply-To: <20210816115430.28264-2-straube.linux@gmail.com>
References: <20210816115430.28264-1-straube.linux@gmail.com> <20210816115430.28264-2-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 1:54:28 PM CEST Michael Straube wrote:
> Function rtw_is_cckrates_included() returns boolean values.
> Change the return type to bool to reflect this.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v1 -> v2
> Rewritten to apply with v2 of patch 1/4.

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



