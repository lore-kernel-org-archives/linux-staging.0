Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE125A334;
	Tue, 20 May 2025 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767592; cv=none; b=G0rffp+inlajYQ/L+nRb3L3SGF1An9T+3wNq9ftZAi4CKivH/JvKBHW1MvLtgvolKOQNDwvXiheMOy+UAF1iefK6YHMEciHZhLFSSXPV68ZnbfpxThlNlulL3mWr3nN+Es+yyE4kM/P8lCOkSd51bJSYLOHZw3HWoo2wUd/Cy/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767592; c=relaxed/simple;
	bh=lHhHH18Gvn/lfwPtUE2bbE5SUT2dnlX3N4jAWOw3v4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pP13dzLWYxSGEmxlOVyuJpCFmYCou/vza9a95z+2w5X30BRqcNwCHaDTHkufXR1b/H0IHq5GE0htBsdviJncId7retko/2uCzTn+jJBaKcJsZqOlnRyGVsZB5rJT96DtDB9n5sAX0hlKGuCwI7/7l/jCNCYhqTYqAAaAJu2ESlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8WRJfly; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8WRJfly"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87bfc9ff795so903765241.2;
        Tue, 20 May 2025 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747767589; x=1748372389; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHhHH18Gvn/lfwPtUE2bbE5SUT2dnlX3N4jAWOw3v4w=;
        b=h8WRJflyZUQE9PamC4J8IUYLat/0LmtcX43sTt0uaB59pdxHvLZAPU38ZS6HsNu48D
         MYf8xIL3nfAtHDDFlijo9IA4tc+AAx73RrYBz3fV6ONe6jUPydLtk1KjXtSYEOXF9sRb
         FxfmX7IDDUABhLDinTXXtbPRDHfBf/YeyU023TlnxYzWgF4klK9mNVYq7j0EMvFSf4w1
         Mg8nfAkbQpSfA+WOOlrGvWjSGpTUXk9wsPvN2z3NHoB8oAsy5YmhXAxDl4canQSZvhF3
         ikM2Q2300aoHHjYIMvnRISxqc71ZmZ97+5IwNi1x14M9ppkiFTYoPaKgukqixBnZHtKE
         4qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747767589; x=1748372389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHhHH18Gvn/lfwPtUE2bbE5SUT2dnlX3N4jAWOw3v4w=;
        b=EwDQ8pxTyE7A8bPzrX0NgltL2/bDey3kYA4qlA4XWOgV1IRs3dpf65Rp7JcA/STmXM
         9c5o9Hh7m9fJRpesyBJh9nW5m439ncVKgdw19Nz2vIWUakDauUxOEU2eGAbHUVZULel+
         MOQ30i4DlzkvpWoNXG4b0CseLych7+oQ7VH+N4oVv9+nixVBhCJsZArK+y1oZNUIc7Wq
         tEBmqJqNOX5U2d0EBnjkrQYMBQ9Zl47TiUjCw4WdNm3ffKgJkvNzwI8au3AxwN743UUQ
         gCKVarIEJ6Nto2XnUtSQgOYLNhpFX83LX2OEC1wGoaw2lIWxqVTiS7WnLlaS9yd5Glqt
         RwoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3r9R/CeXBkazRq/VxTqd7fOqb4jr1nVSBsV5q4phTfelh3k1CJnzHMAnuCqbU6IwD9+30w2jXWtigVjiTEw==@lists.linux.dev, AJvYcCXeXh5LCyCj8DJpu9WoNprx4kKw/lE1se2QNeJ/toYQY/bH+ozOOHXF7uNbEge2WIeK9ogIeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsWnqFmRqhvakec3camVHLJOS3BGIlUIpwq2ClJ9Pttnbycu/L
	Vz/C98e47PO8vVrmGKt0Ivyz3We+dg5/ve+etpXbesX7SlaDt/cKRWat
X-Gm-Gg: ASbGncvkpXzfVyU+1krXz7iED0WqlBSWx0240+eNQkQUDEg9EnI2/LuuER3LVl2v4MX
	BIVl3c7c68fZaI12kQvsUWGNxVpmw5bMC0ahdsdG9a7Wv9NrYZm4jXSTpRqBtFE5ubgj8AiBM0K
	edD1Nn8z4HVJ3Tyq8yEeOo1gBLl+X9v3G0VOqMGNazGFgHvmiHBhJ7rZQYI8jWmmqSVHj/vB07R
	9i9IfB6fi2VrOuWyzz0NDBC7KqI1+AmJeZhW6NUezqU64Fo6n1mzjGjB2ybY+6MBra0fhOZPsm8
	xy4f8FHkMoun6GkkIDjtrUTKNYBZvLU3Pzz4M6tUFZ5sVl/v3VqyshuJ9qcY
X-Google-Smtp-Source: AGHT+IEAVdxlUSvPb2pr9kvVXJmFvRdZ7wx7jIGnUDEAeCUNLvgNsDDib4yRXrfZ2wG+HOOKFJZ+2Q==
X-Received: by 2002:a05:6102:2088:b0:4e2:86e6:3785 with SMTP id ada2fe7eead31-4e286e63831mr6007801137.5.1747767589373;
        Tue, 20 May 2025 11:59:49 -0700 (PDT)
Received: from eaf ([2802:8010:d580:c200:bf4a:f31b:7897:b2a9])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec22769asm7856197241.31.2025.05.20.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 11:59:48 -0700 (PDT)
Date: Tue, 20 May 2025 15:59:39 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: ethan@ethancedwards.com, asahi@lists.linux.dev, brauner@kernel.org,
	dan.carpenter@linaro.org, ernesto@corellium.com,
	gargaditya08@live.com, gregkh@linuxfoundation.org, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, sven@svenpeter.dev, tytso@mit.edu,
	viro@zeniv.linux.org.uk, willy@infradead.org, slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
Message-ID: <20250520185939.GA7885@eaf>
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com>
 <20250512234024.GA19326@eaf>
 <226043d9-068c-496a-a72c-f3503da2f8f7@vivo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226043d9-068c-496a-a72c-f3503da2f8f7@vivo.com>

Hi again,

On Tue, May 20, 2025 at 01:08:54PM +0800, Yangtao Li wrote:
> Now that some current use cases have already been provided

Some interesting use cases have been mentioned, yes, but I doubt they are
common enough to convince upstream to pick up a whole new filesystem. I was
also more curious about your own personal interest in the driver, because
you are going to get some very hostile feedback if you try to get it merged.
You won't get anywhere without strong conviction in the matter.

> I'm curious about what the biggest obstacles are at present.

I don't think there are any big technical problems, the driver is fairly
usable at this point and it's been a while since xfstests found any
corruption bugs. But it's still a reverse engineered filesystem, and there
will always be risks. There's also the issue of the buffer heads, but Ted
Ts'o has said before that it doesn't matter much.

The real obstacle is that I have no idea how to convince people that this is
a good idea, and nobody else is going to do it for me. There were no replies
to Jan Kara's obvious and fairly friendly objection; it's going to get much
worse than that if you try to push this through.

Personally, I just don't mind maintaining the driver out of tree.

> APFS in the kernel should have better performance than a FUSE
> implementation.

Sure, but how much better? You could try running benchmarks against the two
existing (read-only) fuse implementations. And if the driver is indeed much
faster, does that matter to you for any particular reason? Keep in mind that
you need to convince Jan Kara, not me.

Anyway, it's nice when people get interested in your projects and I do
appreciate that. But I just don't see it happening.

Ernesto
