Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493411EEA31
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515301; cv=none; b=l1GkFOLHCUK6Q9CzHFMuWus8EkRol+v0jOVG4v5oD3GaJUrQp4PSKcLMJczH6la0fbCwoH+ZeMt1dGpstRe1LzlLeFpA34h/cUM/b1YYqwed6o+poLeRaGhAzkKVAflHTQGhN+tr9DoBAltyEoSA9IoUMVEw5h+X3gbOaawr5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515301; c=relaxed/simple;
	bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptDzfcw8m5D+ZHKZfyUKyAnaCEU4PNtBrsASgZkfqIUcpiZ6OX6NycYBiUuboQ7yJfYwKeAdcRV8j8+yHzuVnVnVoc1+jbXQF7YXlo6//AMh8t0tVpIDSpJGg94IWGzfn5nrT5YqRJbJSEh5cufsHpPy2s5bla7bbwO8GUXf3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i182M77u; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i182M77u"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so8708173a12.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752515298; x=1753120098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
        b=i182M77u+7oA3Xay09cSCEna7EyPG2y8lTYHJlYQF9mIVGjXDKEb6zUzUGMFRNGHan
         AcvXpfxXnYpujZgDUAirU4gX6vDYB7PCvInJisz+rxshTJm2Ss0zITemYeX95AC7HLkb
         pNf/3LpQLvxczMHX1i/PTMTw9haNd3/IdPJLX9qbZP9huOxnRz0Dg1gljy6SUEX/QPQ1
         12fg5zsNhEmY60BtVEC85UN1QwWNIkHw/rZkFgDGYo2+9z5zcamNKYHoouJzdK2JSoxG
         RQCdLLwz8n1K+fSOiszlr50oLtK35Fx75L0SYZOAsMJOBVcnQMDe49afT75rcDco7aiz
         2G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752515298; x=1753120098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVMR5EXV8k6eD6rR6o3olHZAHPNYMmm96AvBBNldjgg=;
        b=oYWSD6xKqHDRMiA8wZspQFLN6HZMKYIsLH9wl1ZJ93r/fGr3Z80K73fsRoFE3zgfCO
         YCiXd/ZRYZGkq15LaPey3gZ1JGJ4gJOgA/G1t4IJ1s/o/6DMKSMz3SXKKDPRJ9EfUW+2
         DCApB4dPKueeIkAm6jYH9ow6wbHb6xI+1FoGWQdu7j88EDtQRpx90TJb5ufM6bLCJ+dX
         DYfVS7dw3Kssl8FGbcmB+N9UAnNxbHpeT8Q5C4XIdGwJ9shbR4Uvg3sTFB/IzWiHx2m0
         aXLPMHovY4364psqItA2LwLuS4fA9Q0id9iNl2gFEz9qkPWxpcM2I18WiCwf7uP8rtYf
         IKXg==
X-Forwarded-Encrypted: i=1; AJvYcCVMijMuOSPiBEJZda0UMiuWjbds9kdQCZAp5kUPE7e/Fu7ApQNi/gWaJHf77Hhy80QRS6vuiFZSttJzffzL@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5nDorioku+PlOTje8Hjxym+vJxltr8ea/O2s/urJhb4JyngmE
	6HabDmpa7qkeIl0lImCjDusD6tUBKHeapEqOSg3Hp0IPbBk2ghQJixTR6XVtY8ZPwIpU908kdUJ
	U8lbf1lMvMZFjrne0bgLUYrte6KjSeKE=
X-Gm-Gg: ASbGncuFeXWTSZYH0xvFAeidpBqZdzimBTYWEmytQugQVTdurxf7ITVZO0d3xgkofje
	+WdLk6A8PfJXnAZbhiN/SQ3GpeE+PfD0XTsux49N/5QvvMHxOi5WU5qrpdsZiQN//kIo4I0uVpr
	W16ik60DA9+IdXUZWd0JM8MBY4eXZ8HQLfFpeZpO1akbaE0WWYX/nwmEFZnh6TesVz4Hg40mzbA
	wXtvfF+du4yZdHP8Q==
X-Google-Smtp-Source: AGHT+IGcjzBmfTiWeE+N2mLwhGEP5BvYK9+VML9tJbJRcZap8A8xcLJsoCcrWNT9arZ4kLyLBKLax9ZxO+eLpNK7ji4=
X-Received: by 2002:a17:906:f596:b0:ae0:66e8:9ddb with SMTP id
 a640c23a62f3a-ae6fbdc7e12mr1528201466b.19.1752515298262; Mon, 14 Jul 2025
 10:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc>
In-Reply-To: <20250714153409.46085-1-martin@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 14 Jul 2025 20:47:41 +0300
X-Gm-Features: Ac12FXy6-0zrWuqaeotADyZJbAA0J8fwpyqF8G2dlE1cswL8QBsJQQz4h1A3eGc
Message-ID: <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>, Woohee Yang <woohee9527@gmail.com>, 
	Jongmin Kim <jmkim@debian.org>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guys, please, coordinate and issue only one (or a few) patch(es) per
an issue. No need to send zillions patches for the same problem
file-by-file.

On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@weidenaue=
r.cc> wrote:
>
> Fix checkpatch error "ERROR: that open brace { should be on the previous =
line"
> in ia_css_dvs.host.c:277.


--
With Best Regards,
Andy Shevchenko
