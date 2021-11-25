Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA662C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 17:08:16 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d24so13133082wra.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGh2DLNS/hhJyZQIObSk6tHMQ2KGLvBP7mcZX6l/Xpk=;
        b=myjOAKYGovGV9PEdZhCETyYZtcDup2aU0YXJjix2Q9FHBkQyfdSRSGG2z6zTekd4Jr
         iU+2l2IHWiauJIhrLcLXoYMDUMRF8t43QS/W1orCTr8N9R6V+h/FvecH3rBKiNpezDJX
         msLq4WNisW/tTDGBl9h1XVbHZQar5llPEBH0MNfyldtEH5STyWkWJ4NVGB17+KF2iEor
         rUuZtYjuCDVU21pL30qeg9jyDuSIW3N1vhQBkk2BIQnHp+zuPK8/dmayNmRTHnKFzPkQ
         p+syaA/KywXeZDlRWgQD72sdU4Xtv2sG+we6m3b/dRZjBgpZ4cE+zlzZhKYxJkzdvktf
         v7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGh2DLNS/hhJyZQIObSk6tHMQ2KGLvBP7mcZX6l/Xpk=;
        b=ALFZafblF6sHb9ww6hdZZNpKHLUzNt/+xCuXzzp+ZZI0/rOgHquA92kTqPmI61pAL7
         aFNIOGe8mhU0SAV5x6iUmL4MT2sbwEslNWAxetIf6s5MwYDKgmEK33/CHNfMPF2Zsv/2
         4eztLhECnOaoRhj3wHjIGNUw6SCTD3Gv7uFUtp6f1m3WjWwTXttmRScoCeHTkxCr2KtU
         5Fo+zzWT2Z/J5/0MYyHSZeYGM2ceqjAzwGoWt/MJGhU/vm4A/kbV53gBJFc//P2iZkeC
         f4usbA1Aa0sGTO7jAL9WM76esvucOp+luj4BM/e/W2sHDYOfW1gT4EiKV+uYmUlkAwp/
         cL/g==
X-Gm-Message-State: AOAM532k3CHo6DFPQk61f+nRaxMqKWWLv3UxLWnylyLCHm7NZeU3COXV
	mEqBhQyd/nRkWVtl4f4RCYZbXeOOzsPK6ZVgo2LpqA==
X-Google-Smtp-Source: ABdhPJyh5mOfDI1hes5JAKVqu7jhhHV3VkGhFyzpVmc+T8IaEG4DsoNQqRZtyikjiDUmrLqJ4xqA1GoJHdi4OkTzPu0=
X-Received: by 2002:adf:cd04:: with SMTP id w4mr8405735wrm.406.1637860094302;
 Thu, 25 Nov 2021 09:08:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122103931.GA6514@kadam> <20211122170335.1468730-1-zoebm@google.com>
 <YZ4Nej0yftiWh5rc@kroah.com>
In-Reply-To: <YZ4Nej0yftiWh5rc@kroah.com>
From: Zoeb Mithaiwala <zoebm@google.com>
Date: Thu, 25 Nov 2021 22:37:37 +0530
Message-ID: <CANMHzA4U-qc3mqz5XV4YOex-=CtsJ1UA2Xv4VaEQsf66Qfnh7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] Staging: rtl8712: Fixes a camel case variable name
 style issue
To: Greg KH <greg@kroah.com>
Cc: dan.carpenter@oracle.com, trivial@kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Where are patches 1/3 and 2/3 of this series?
Apologies, I was unaware that the preferred method is a single email containing
all the patches instead of a reply on the thread with only a single
latest patch.

> And this looks like it does not apply to any tree at all, are you sure
you made it against the correct kernel branch?  If so, what one?
This was against torvalds/linux, but I just saw that
https://kernelnewbies.org/FirstKernelPatch suggests using gregkh/staging,
I will clone and make further changes on that.

Thanks,
Zoeb
