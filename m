Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6E33C186
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 04:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773461904; cv=none; b=R2rtNNqtKeL29aSpFd4qDJAPJRNXsmBZcHwFa8Pw8x8N4R2hVI4fCsOQ4YltM4S1PNuIVVTO1ByGOA3D4NyvmS4HThMuENcDIukFuT1o/5MfkWDundoHbr6qAALFU8hY68EFmXsHHDGuqg/R51yF/qRFihoMmGynSNakbmdKX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773461904; c=relaxed/simple;
	bh=Fmz4bdmm/IxdgaxzaYC++5IOXm88xgXfKAIjtTk722k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=l6IagaM4OlvfTeOg6WxuvhfhMldKLHo6cpAu+smkwThVNwC1XVMp+0/Nxy+kh1QhBng2Gnkqm6RzuxWk3DAwvBZeVcxPBJdCnm6R3cNtcbmSxvInLoEwxqctPkIPZItAegd/Fq8Umu7Q9F6jHl3sa5BsuqZcWPYW7gURNietVEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8m+2dhX; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8m+2dhX"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64ad9238d8fso3485598d50.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 21:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773461901; x=1774066701; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fmz4bdmm/IxdgaxzaYC++5IOXm88xgXfKAIjtTk722k=;
        b=d8m+2dhXU6amc0F+GCwyiUtsaDdX3zsBhC76C9FEyt9efr4VgVdQt/FaTmz2wTRDIB
         Xb79O9YYn4IJBSTVqxuQe6sgA+7GdQ0/rWjMf8JnqUM6+eBGe0O7zxTWi9sLmtTbKki9
         48ZwYS7ff1R5cPsoOejTiED5hpKelqDV5+hzVydVY/wfADJnumIZa7JYNYAdnjaXAfLt
         UFXotLjYRjiaE+/8wN3m+FV3wP4BBhqq7tSxNXofKb7aXUFONqcH/wMKVsf+G1ZKH0KX
         6MgePoYSrqpIu8FsW/o3EQG3dcwZb6Xtv8O3VXAyAfRxehBZtrz1pEFoBJmZNu1j5tD/
         9yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773461901; x=1774066701;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fmz4bdmm/IxdgaxzaYC++5IOXm88xgXfKAIjtTk722k=;
        b=RgM4gzGRgLc4Vb4wej1xbKk0z5sn2Ht2ZxZ+YC0HI6G9GWvqINnUcetYUsqmpQz6jx
         1CMhgIJ9Dfy46LoDbWxWwoKdoihRebgFPBOssA8EYNPrOzYxMEB6i3K7GZqr8r1Jsb6w
         TCNEjrY3GDFHwf+wvwZslcFDwITk9qYLSxNYw9guX8TotQSl6UJ8u/FyJYz3caqL6uyK
         LxQm180iayT5hTPt03wgzT/vlt7s66FvCWoU1TbfhzLNUXyHqAmk29SC0VzHaJqDkKLH
         R6ODzHbsTncpF1fT26e1AkVIQg4YdgMRYUEamutkHOhZHszsTuF6TR49Jx8gQsN4+lox
         dr8w==
X-Forwarded-Encrypted: i=1; AJvYcCVTp+bhX2I4aR8/BQi6NYoOIOjU70DlnA9EZs9evgaZHYP3ms7925OUFqMNoUBiSwDpZDzJY4ydOUI2eui5@lists.linux.dev
X-Gm-Message-State: AOJu0YzaXPpkN8Efsz+yP98XGPfGeko0i3zWNCBwL6eRDDp4HdY4CVu0
	qu7wgY/bipeQ4ccOz/UspsQdRowk7RCrRSMh5pdmD82xyCMwhyyM15IHWlVjv2ED
X-Gm-Gg: ATEYQzySZChW0h5WAGEVF10HMXMNXFKLEDRJBXN7hCm8LkZ/vWxxdfKHPH/zLYvPdr7
	rtp2/OBOD4EdAiQhb7gzg3WeXNIGuR0zuoRPH20O429UPHFauDBvX66DhRc179R4JtXTgQDronI
	wUt9vbnFUiUtX9OopDkuh/DqQTFBkn4/w9zUyAEark18dJ0d4ZWCQW7dK/uiyrUFbuq6MjQKEM0
	giJJNn5jMGNrgss19w8ah2D4p4l0KzHEfKPab6dmUtfqABfxpcoF0nDqOg3XE722QAmqzmbNQIT
	rA+0aRfASiRejrI6xhASuJhgEGuC/+VOaga2bMFjoXLpdyseWmcPyc68RABbLXLf+RDBQZDiQmq
	CLjL4F5ztYOySCdvLQO5v5OD3UzSqgA2G20UEoD4LHPoDBOSON8ldbQgyEKsSFkRJC3j4wOtjxv
	zOIX3CHVC4fQxEr7PZgCQYjm/tEbCla42ur2SJP32VVPWpCt0I+PkEiPjTdlqhGeZY1jRC8WAtA
	aRg7fNHNgaDnVeXWXyomdZByTz/Rroe5E9gTlhayPM=
X-Received: by 2002:a53:e3c1:0:b0:649:d979:449f with SMTP id 956f58d0204a3-64e63087753mr4362505d50.72.1773461901350;
        Fri, 13 Mar 2026 21:18:21 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e6592282fsm2218519d50.0.2026.03.13.21.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 21:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 23:17:59 -0500
Message-Id: <DH27RODDFRFK.1CWP2HI1ZJ04N@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: add missing blank lines after
 declarations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <straube.linux@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260313223738.7657-1-rayfraytech@gmail.com>
In-Reply-To: <20260313223738.7657-1-rayfraytech@gmail.com>

On Fri Mar 13, 2026 at 5:37 PM CDT, Oskar Ray-Frayssinet wrote:
> Add missing blank lines after variable declarations in several files
> throughout the rtl8723bs driver to comply with kernel coding style.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

This should be a v2 [1]. However, the patch itself looks fine. So you
can include by RB tag for your v3.

"Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>"

Heres a resource on how to make a v2, (this next one will be a v3):

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,

ET

[1] https://lore.kernel.org/all/20260312194112.1876-1-rayfraytech@gmail.com=
/
