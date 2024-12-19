Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748D1BEF71
	for <linux-staging@lists.linux.dev>; Thu, 19 Dec 2024 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641136; cv=none; b=V3t1s78z70z++W0r2hujxA5iqLDRKble5GOH08POxZXhk4llYxa5GwWNntuYuPiVb5eXOUkFQ1CRBUhM7cjtruP5do3fBvP7+uTChnhk4ZDf1bH3td19IijzoEXR69SCMi7t10CnIe4c9a9Y7hdXqLfenDSYuhNFLvKYgjUi+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641136; c=relaxed/simple;
	bh=JZ9kuIjLGYKrsdfVnek3gAP91z2OeLTb9p4Uy8pGFHs=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=e1Q14DjB6XeIVw9tKwlJzIEXlsqmie5O+10umY/9PE3+Bc5m+EVUL1s0xlCvB2rdbS7nknpU6Mf3BM21Cjm9PdgcwMqtss8jIn4gQpkKwxBbj8vOx1s2CjWKfW7F676CiW6lp8OFo53Z3+AImarpErZ3XkjBuolFnzKw0AqTw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=G3Wb0QVt; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="G3Wb0QVt"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso805924a91.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Dec 2024 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1734641132; x=1735245932; darn=lists.linux.dev;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=34fOr+sBMBO+x2ZRjtswvbVc5FTdkFy/NURmt1Uylmw=;
        b=G3Wb0QVtClIkrzI+tDVYYZfcrn8pAhS70EhvZ5PgynjUylCoiXy5FUVY2nptsbWuWY
         Je0XZQ67H41TyORTdVueojmgT9ixYbj3Bf32dFRFh12UPSuMhaf0FGQSpDF9K792669r
         gk12vp6c7ZkAwuaeGiAUiWnDgBnKC1QK7pkc2LIf9IIBknd6sl9s0h4NYN3tl6ItM5LN
         WRp43vJUFI6zdtq7F2l3y1sUfwMpB+sw4djCLcGBdm+EJJsYAvDNcpEPe7ptU80jUD1y
         lQ7tOlgJ5JF3OLQ734XXwEGI6TM2DXsmGRWVU8q58Xj0Z+/xZm9IGWmw8lHRLZcao7Hh
         MzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641132; x=1735245932;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34fOr+sBMBO+x2ZRjtswvbVc5FTdkFy/NURmt1Uylmw=;
        b=v8UW1e2KL0nac1tV3GqirRye9PvSv3FhJzTjN/74ZG8RNRYakU9y2o8btRFsOpcQm5
         9tyHuNZTplgLbLq7T+vZxJ9k3LioxCZz0xq+8V3ypc8mSroNyUhNl7VoayNXwLEvZXXE
         lXPG+bcrmz3FozhsyffyrgE3rigNWtyb6yzdnkA0exxqmo/XnZkAJJNYmDOf3KgBld2r
         IQo4Sm8XVhaOBRtf4/DfAQEStmuxq9I7T/byPx4qrurYL5eMcJ5usMM1mNhyUeeXriwl
         l8gZxRPxAUdqUVnKcTkIQOjKj4/jOjhJTfTNmkxhXkd+ZJ/yvu9PFKDExYIXmmKGlBoY
         vVDg==
X-Forwarded-Encrypted: i=1; AJvYcCU24U95s5YBNOhxyc7ppS6enFcvy8R1AduwgxW/rU6/tLEekNuElC4KlC7M1QPpbSUWvqgTF+Od7T4l6lH7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywub84NcviN0L1BtX++P/ybvnCv3m2kyFJKF8zQkiseTPcuRkyG
	aitCpwXtNdABYmg5SXZtVtYMMKIbdYu5YDd+c1cNSlLqEIuTrwNvF7Bacev167I=
X-Gm-Gg: ASbGnctPxhoP9jyu4SoeDN2/pkSGpCK2ZXB/LZwE5g7f/bIi5D5ibUoqb0JodNYQtVU
	/4l3fv3o6x6fi18kyVyLAsy8V/yGoJjP136JR8hyQfPNtDzQgz2fOc4bXgYQdHIy1dUMg7gfDAt
	0mWJV19BpsIcdp4dU/QNYgAem/a2cH/55eHzzZ/wmn4qlMkcXWdCSE4HInBEplbcR04LFb8EG1P
	EgtZIBzpHi+iQgAB+AA3yGrFS4gCuigTyQM/N9FLXE/GisfXe5viQ==
X-Google-Smtp-Source: AGHT+IFfsH6nItmnV1XFAuzY6o7+fvj0dTuG3GgNIqcyFmA/JXY781LWRbrgWJGPhnc8FcLqpXIDTA==
X-Received: by 2002:a17:90b:514d:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-2f452ec1ceemr532698a91.26.1734641131935;
        Thu, 19 Dec 2024 12:45:31 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447798801sm1868196a91.8.2024.12.19.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:45:31 -0800 (PST)
Date: Thu, 19 Dec 2024 12:45:31 -0800 (PST)
X-Google-Original-Date: Thu, 19 Dec 2024 12:45:29 PST (-0800)
Subject:     Re: [PATCH] staging: gpib: Fix allyesconfig build failures
In-Reply-To: <20241217101904.370bca1a@gandalf.local.home>
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, dpenkler@gmail.com,
  Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rostedt@goodmis.org
Message-ID: <mhng-cc2b2d1a-227f-484a-a3ac-94927f8d336c@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

On Tue, 17 Dec 2024 07:19:04 PST (-0800), rostedt@goodmis.org wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>
> My tests run an allyesconfig build and it failed with the following errors:
>
>   LD [M]  samples/kfifo/dma-example.ko
> ld.lld: error: undefined symbol: nec7210_board_reset
>>>> referenced by fmh_gpib.c:1512 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1512)
>>>>               vmlinux.o:(fmh_gpib_detach)
>>>> referenced by fmh_gpib.c:1637 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1637)
>>>>               vmlinux.o:(fmh_gpib_pci_detach)
>>>> referenced by fmh_gpib.c:1342 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1342)
>>>>               vmlinux.o:(fmh_gpib_init)
>
> ld.lld: error: undefined symbol: nec7210_read
>>>> referenced by fmh_gpib.c:46 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:46)
>>>>               vmlinux.o:(fmh_gpib_read)
>
> ld.lld: error: undefined symbol: nec7210_write
>>>> referenced by fmh_gpib.c:54 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:54)
>>>>               vmlinux.o:(fmh_gpib_write)
>
> It appears that some modules call the function nec7210_board_reset() that
> is defined in nec7210.c. In an allyesconfig build, these other modules are
> built in. But the file that holds nec7210_board_reset() has:
>
>   obj-m += nec7210.o
>
> Where that "-m" means it only gets built as a module. With the other
> modules built in, they have no access to nec7210_board_reset() and the build
> fails.
>
> This isn't the only function. After fixing that one, I hit another:
>
> ld.lld: error: undefined symbol: push_gpib_event
>>>> referenced by fmh_gpib.c:1166 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1166)
>>>>               vmlinux.o:(fmh_gpib_internal_interrupt)
>>>> referenced by nec7210.c:956 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/nec7210/nec7210.c:956)
>>>>               vmlinux.o:(nec7210_interrupt_have_status)
>>>> referenced by nec7210.c:962 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/nec7210/nec7210.c:962)
>>>>               vmlinux.o:(nec7210_interrupt_have_status)
>
> ld.lld: error: undefined symbol: gpib_match_device_path
>>>> referenced by fmh_gpib.c:1370 (/work/build/trace/nobackup/linux-test.git/drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1370)
>>>>               vmlinux.o:(fmh_gpib_device_match)
>
> Where push_gpib_event() was also used outside of the file it was defined
> in, and that file too only was built as a module.
>
> Since the directory that nec7210.c is only traversed when
> CONFIG_GPIB_NEC7210 is set, and the directory with gpib_common.c is only
> traversed when CONFIG_GPIB_COMMON is set, use those configs as the option to
> build those modules. When it is an allyesconfig, then they will both be
> built in and their functions will be available to the other modules that
> are also built in.
>
> Fixes: 3ba84ac69b53e ("staging: gpib: Add nec7210 GPIB chip driver")
> Fixes: 9dde4559e9395 ("staging: gpib: Add GPIB common core driver")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  drivers/staging/gpib/common/Makefile  | 2 +-
>  drivers/staging/gpib/nec7210/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/gpib/common/Makefile b/drivers/staging/gpib/common/Makefile
> index 0c4c77bea75b..460586edb574 100644
> --- a/drivers/staging/gpib/common/Makefile
> +++ b/drivers/staging/gpib/common/Makefile
> @@ -1,5 +1,5 @@
>
> -obj-m += gpib_common.o
> +obj-$(CONFIG_GPIB_COMMON) += gpib_common.o
>
>  gpib_common-objs := gpib_os.o iblib.o
>
> diff --git a/drivers/staging/gpib/nec7210/Makefile b/drivers/staging/gpib/nec7210/Makefile
> index 8d4d90f21109..64330f2e89d1 100644
> --- a/drivers/staging/gpib/nec7210/Makefile
> +++ b/drivers/staging/gpib/nec7210/Makefile
> @@ -1,4 +1,4 @@
>
> -obj-m += nec7210.o
> +obj-$(CONFIG_GPIB_NEC7210) += nec7210.o

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks, this was breaking my stuff too.  I was just going to send a 
revert, but this seems better.  I've got it stacked up locally for the 
testers, so no rush on my end.
