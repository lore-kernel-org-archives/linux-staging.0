Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F82361D6
	for <linux-staging@lists.linux.dev>; Thu, 16 Jan 2025 22:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067208; cv=none; b=tqcZglyAT06ykUxOmqrCbyqEvTm6I9iiC7JUXdoqCW4r8iGAfEBgl5iBX9kWX9SaWFdeislcp+ogrXj+a4eOS4tqW9oizIZ6whZ4NP3Hhx/pTMj/tSOFFCqyZ3b2x89t9/QT4zr8sftLGB+cQtDp84LW/PAXprlMG/qbedf+0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067208; c=relaxed/simple;
	bh=Tichz8rmur5C7a0JBIrn3d0oUxwdb3BHBgmDQ8igiCc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXatmCymQqtWcvI6SihRlr5F/yQtfbFTbZt1YB2ljTT2S5H08p34zX2qf81LotENgf3XAKRHod4Efv6kP5GwpDrE/50MQALUdz6a1tPvD2LFpdGRbf2GLApgU2czRE7wk6qlMdcQdmnUZ/kajdlTV9BtQDt4ulaR1VSMe8lLb6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QU1WZaeD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU1WZaeD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43690d4605dso9689965e9.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Jan 2025 14:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737067205; x=1737672005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AO/JiY4dvyRyJpB16ct3F1/8J/G5+gXcEVnqK8Clwg=;
        b=QU1WZaeD8Ay1fyi46fB7DWddFczfFiJW2HOr+xsRYOPUi8x8nPmZxyf090SPIc3VHO
         EvNl7lPRdAplRlQ2T4zNRJjAF8qQMv5msqXSNvtZW74nWpPeHf5i/F5tGlBuGYtlZSRG
         FIuKGFEBwqy3Ciy5WcUxmQWJELBjhAWAhriwarsywjgDvr+LnGDSLWM/9CBT/1dHAI56
         LsSQd9JO+w5Jot6Z8NJlUxuCokSzNdeKSeoyqNZ6jiz+XxNs8kr3tAJCHWSmRROl84EL
         jfkGwHaTon7l9IL1WI8wqQJt+bgaQFlW3M7SUK1to7UIzr1sKNnlMvOiUDW7g0q60Cec
         VCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737067205; x=1737672005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AO/JiY4dvyRyJpB16ct3F1/8J/G5+gXcEVnqK8Clwg=;
        b=Z+MnVSaqdC1FpU4VhuEYslz6tGsWk98FG3Z80h4GzU86AB9dMNTH5qwiz7rY3l+8UB
         0oFvaBrL38WMIFDradk9otB7ftwuSe0qskkVNaDGo3ifCsg/VN1ezv7/s7MrsReDcSFC
         cet8rDUNRIbCh4ZCrQ036zIbfTIHI0V91EEIf9xxbVDSK0I3JA9qyFA6SUrb3B9IZAoN
         +4KTOdScVO08ax1eXgqOO1hI77fKihnyPQ/CzPkgA2RDs7T1277IKXoD4qzpCIgh6vVz
         t8FzwBnEd4IzrDUMWTkydSJRYnDz9Mvoynuzb1HFJ/ys51P+iq5oLPkGKOe2IY8o8di4
         i/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXh1lpJJ9EmNZdev2XClMZopeem8aivDp0e5o93v3ZKTuloYJ2eRT8j48KIxZJjDahj90UdLyFP3xa+9CSO@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2ac9Ajg8w/yGM11+rpBxfhb9+J60vGNpKWnOksUQX7C0FiHA3
	RhDWhrNTNoz/TwkfjP/o2v6sUaBLWY+HLgRGWPyOPtgUudfzJNmF
X-Gm-Gg: ASbGncslCJgm9mnJ1b9hfmYcn/+Mc29zMqawz0VvppmIu8Pz5JEnOR7dUD8rfnxd66N
	CW6mzb2sF4HjWmXR3oVyE0364lD3nvdrL5QMpUo/EmYcLzd3SLyrgXhhxd4Kj1syubgfem3kaXH
	1n1tft8fX1oGMbhOar/ZvI3rQ3hQjDa/UqmztLdjTvo15Eu7Baac/aV4PZqgdjN/8/3yeaOOWNa
	j89vKOW9527LOtGAOhpJF8e0TrfB1DCyOZAsIeW84SzN5biSD7l0o92Wx41uFeht3d/9uegzMLK
	dfs/1Ostx/BJUlWcGx8=
X-Google-Smtp-Source: AGHT+IFNg72aL/XKoo7kX4+xHyIYWTim/+cQw6jPiZSEs8qlahlMY9WWWCZj3sMbUrIjLUX+5F7Ryg==
X-Received: by 2002:a05:600c:3d85:b0:436:488f:4f3 with SMTP id 5b1f17b1804b1-438913f8926mr3572125e9.17.1737067205180;
        Thu, 16 Jan 2025 14:40:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221baasm936184f8f.35.2025.01.16.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 14:40:04 -0800 (PST)
Date: Thu, 16 Jan 2025 22:40:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Fix inadvertent negative shift
Message-ID: <20250116224003.28675481@pumpkin>
In-Reply-To: <20250116110014.15577-1-dpenkler@gmail.com>
References: <20250116110014.15577-1-dpenkler@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Jan 2025 12:00:14 +0100
Dave Penkler <dpenkler@gmail.com> wrote:

> During the initial checkpatch cleanup, when removing blanks
> after open parentheses, a minus sign in the argument of a shift
> operation was deleted by mistake. This transformed a pre-decrement
> operation into a negation.
> 
> The result of a negative shift is undefined and a warning was
> signalled by sparse.
> 
> Restore the pre-decrement operation.
> 
> Fixes: 6c52d5e3cde2 ("staging: gpib: Add common include files for GPIB drivers")
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
>  drivers/staging/gpib/include/amcc5920.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/include/amcc5920.h b/drivers/staging/gpib/include/amcc5920.h
> index 766b3799223f..7a88bd282feb 100644
> --- a/drivers/staging/gpib/include/amcc5920.h
> +++ b/drivers/staging/gpib/include/amcc5920.h
> @@ -22,7 +22,7 @@ static const int bits_per_region = 8;
>  
>  static inline uint32_t amcc_wait_state_bits(unsigned int region, unsigned int num_wait_states)
>  {
> -	return (num_wait_states & 0x7) << (-region * bits_per_region);
> +	return (num_wait_states & 0x7) << (--region * bits_per_region);

It would be much better to use (region - 1).

	David

>  };
>  
>  enum amcc_prefetch_bits {

