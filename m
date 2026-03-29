Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D16A292B44
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809295; cv=pass; b=u2vYILtJ7HtQLTJgCto1joA96082FsFvF9GPR7SF7rmn+9o1diELqhDOmlz3rZTAzkL4mUNL/78bTLJpg9WfCJLhjbRvOsg/lHL/T/U1FWDSJRRH43fLZLSiwW9mcLx/gWXKccLiQk4lJEDi0vUgXMZwytYXys07/t9usMdhSYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809295; c=relaxed/simple;
	bh=vDFMFPJyrJ2WrymoxSzDzUGVEoZnj7c1PELSX2msQjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdJDKsMxMyj0oJSwViAgOOKGmCzgt/mPnrsqWoha50J8Z5J2K9iNVjYysd8OjtAoA7XKaJ4irgMi4Cb8CINHtcVP0YrKLfM+ESvel2zr+mUa2m/+Uj/qwpz17ypsu2XN6ZDfOcQuyNwli1lwv9cmEnuYeEHD+dIkMWH2cAFZ+6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiziACWX; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiziACWX"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65009bfdcfdso1861190d50.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774809293; cv=none;
        d=google.com; s=arc-20240605;
        b=NVbn97XBX/PywIxPtsV6UWPuI36GyNdElmcFYOaB0n+G9go5SFvmXah6H+mjOAnXDz
         bQlTX9el/FwOiZqtGZFlHVuhFFmYW5Og/HTHKGCV04p/StaTOjLJ8Qv3YHxyy2XR0d7F
         ufFS76tcyHxG9DYg2FTaOtm5xSNT9SEZFVvAUTP03vPdNpoNqyjVZ8JV/Vkr30QBJZ2J
         jByEQe+jbs1gyPRUTVroDTy3f6eHpYj5oaVKwOraS+edJ23WOPE2lF4oGTyOa5fm3TSc
         KSw2GEIqeDbEmndUg+uOe9V+WRyFq/YZudTz3x4jsBqWR/lYUGL91CP+CCEdxP09S7VX
         hy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDFMFPJyrJ2WrymoxSzDzUGVEoZnj7c1PELSX2msQjo=;
        fh=oRejCK+BapM690C3YJ8VenR9ldZk76M/6aWTBrejHH4=;
        b=VGTOv2ca3zm0VdRtFGZzQVYe8PzZDqTMCcLay7SBYcrX3R+yiYEM73xJ4o8GpK2CKq
         +Icfb+03ISwg42hXkPlIaBhvdu6STEropbwVShlK2b+xarMnWcgyZ2e3HEBVSr7KiMud
         K6LpxW04l/ZaNwBQK1MxxoCplM8x1ifTBC+eQF/MwFNTs59jBKcoDPKvpTxqIl/lLwtc
         KciFoLmmLvgCQjSxNrnE2nNfDXOiFesWUF2yyNf6VsAU2kYG2Jxbt1mVeNNWuzu5lD4y
         PPH+V/OnyQxTGNNepTYcauu+xkE9s2LBBv/umcV3y1nEP/8pjWaH2qHtL9S6l5yMyK90
         yNEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774809293; x=1775414093; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDFMFPJyrJ2WrymoxSzDzUGVEoZnj7c1PELSX2msQjo=;
        b=DiziACWX+zQHV/flVyOhA/ZVKZE7DpQNr1pzX2lrvEar8W1O3TqS1W5xvCH0nl1SuW
         bCIjEuH/m3ZHM+iFORFLhcQZQZtwPtJT/su6oxMEP3yJOTCU+rn2eCaQBmpOG4pVMjCL
         I+8icLyhtdq3cC4EDsyBMbjcNxJIO7wrrIPUpf4Eh0MuEl3haWEOPBeoBLNQfR16cQG2
         P/1TKt8FvBvcDKzYbd8ruccgAL+mUYAc47i8PdH9GlKGe+ERZY90lBWwAvZBMeTQTQFL
         yXlnKUp2fHwH3idblbVqw078nFFOSrcPDpp1oMPlUar81Mu28qQh7jHW3D6u5jIbWTlN
         9dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774809293; x=1775414093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDFMFPJyrJ2WrymoxSzDzUGVEoZnj7c1PELSX2msQjo=;
        b=oStmpILuw0MNYdqRUB09eWgTPyetoMt7y1ajVo24DhbojW23kuI7XDaS8xbCb+gjQh
         fHl/1yEseWuB2kSBSAnAnsuNiWe4EdJzHte783/tGEmpadb8KwIPEx7XAD4KTEIqB8/g
         rmRCGANxxjixZQmFXDCMoOdqm0DUiYTr38PJ2qfIadYfEGUO0UeZCC3M8H7RKwJdLLnU
         aiMjEdDnvwU/1RA9JPfPVXqE9nutE8Jg2eIV9JxbZ9FOdEHr/C0Fl27WtVT+e3eItI4d
         oBuyf8U+tndOpZca+sZx9Tf3A0073IrScfBRwsACvlfzLafhKhiiStusONWXH0Pq/CgI
         D31w==
X-Forwarded-Encrypted: i=1; AJvYcCWbWUkOW12xCybDDy1x3zanIsin+FbiX/yrHfWta86pgycUCHQuhSxxk1G9XjH26kID9evwtlTy770Z9Q3V@lists.linux.dev
X-Gm-Message-State: AOJu0YzuPuL7Bqp6aOu6UAWxNxwkkEhbhDOlsnGM7Ff+kSR6VIQBVupY
	nmIDA79v092wKHVfu82piRtiGjpZ2Olrbojrsp4MNAvqV09rZUPzDbKfFnEWWyYaYLxB696mIY6
	JQw7gRSq/MbkABA3bYo9DHxh2RaPjnD8=
X-Gm-Gg: ATEYQzwbBQoYCBQZbsaZkJdH+dY722MLB5Svngb5BahgvqMH7knW0Ydw5pld5bOxd4k
	BEx9r2rNW6fKMCHUAzMCPQkCy5Edllv900imf2N451wR4IcoL8f9FLNdy3rTAAvbLXXOnwkz0Wj
	UTYys5XHTBx407wZ+0S/+ck7I7IhQa8f7Pq3CdhKVdLEdrr8tT5QGUOcW0pW43lkSrtK1i/bSyE
	fWv4NJ4khwSh7sOiKhHqyb+M7jZBO9oxEGcGKNslRKtkQemw2LebdsXOLVpMT6TxJnJBaYqJKaP
	BFMArft6+8fqIIiHjGt7IRY6BIAceGYG5FD9Ytkr5GjeEONllw==
X-Received: by 2002:a05:690e:490:b0:64e:f224:e852 with SMTP id
 956f58d0204a3-64ff71fb557mr8054334d50.26.1774809293419; Sun, 29 Mar 2026
 11:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260329075941.60247-1-tommyguo024@outlook.com> <20260329093508.11560-2-b9788213@gmail.com>
In-Reply-To: <20260329093508.11560-2-b9788213@gmail.com>
From: Tommy <tommyguo039@gmail.com>
Date: Sun, 29 Mar 2026 14:34:42 -0400
X-Gm-Features: AQROBzDrMsUTzMPUaU4eC14flZqv_alFoTEwncE3dUkQ6rxXDuqbfIp3vzrSOdc
Message-ID: <CAB8ud-7fvRyomaLuPh+O9gPHPP2n_k5_uJD79Vm0BMMbKkRNTw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix CamelCase warning for READ_MACREG
To: =?UTF-8?B?QmVyYSBZw7x6bMO8?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, tommyguo024@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 29 Mar 2026 at 05:35, Bera Y=C3=BCzl=C3=BC <b9788213@gmail.com> wro=
te:
>
> On Sun, 29 Mar 2026 03:59:41 -0400, Xiyuan Guo wrote:
> > Rename the _Read_MACREG macro to READ_MACREG to resolve the
> > checkpatch.pl "Avoid CamelCase" warning.
> >
> > Signed-off-by: Xiyuan Guo <tommyguo024@outlook.com>
> > ---
>
> You sent this patch with tommyguo039@gmail.com but signed with
> tommyguo024@outlook.com. Also add a changelog after the '---' and wait
> at least 24h before the next version.
>
> Thanks,
> Bera

Thanks for the feedback. I'll fix the email mismatch and add the
changelog 24h before v3.

Best,
Tommy
