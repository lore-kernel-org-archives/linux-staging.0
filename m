Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A93368953
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734479; cv=none; b=NYv0dz00SmA5vqmdKCjV6dOztMDLR8GHvYj/qG30vp6NCNA9SOHhAzYRXjkn05HHL1+0iZ6SHzXRjGpu2+q25B2eis4izaEQLGMIwe595cTf0xNNr/qCU0evSsR2nWBPWcvCyM0RfVHSRQ/jl3TtmTj7fpIJRBu/eP2lIYYAn7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734479; c=relaxed/simple;
	bh=AtOW2j2S9kvd4HTKIsRDwYe6iNndoP0GStTxeQJEkvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFAnyjsPZJKF2yj/xlyLosM0mprDBQb99i8TK5PewAFmHxoDvKM4GR3ePp6mEuN5bVjr0z6l64xA9/IXzKJOUlVBFnc+ovEVJ7VNRTgsYk48NVJ+QKD9QG9pDYN28gD8OLFOm6RN260/CpDRE10QDwexkd7b3lzbOg7zdfOOToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki+G25xj; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki+G25xj"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6649ffb1d01so2135028d50.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782734478; x=1783339278; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QT8i1Slk3yJGfD9XMmRDKAAJicTpOqFglW6PfHlcFSM=;
        b=Ki+G25xjGY+pOT7mj9fECrL3pbOOUbKA/qUCpDo50KnrdZqnOAqunHHvh/VbRVP+e8
         tNoNqYzWhY5yiNV9j04ps67aZn9qiSM9/w1e/MhLrUNl1nfbuPC87Zui5UycHZy4lsqS
         Vxii+6i99KHqU/V819Q34+hMyVe4NKDJF5OEFmQmn8iRK+o1WttaU45bH8JO+/LY0CMv
         HC7kvKgv0Y85tJuimtweAAHk4/oRF/29Ca5MjYBNpIb5a6/ICzjmXSUQGTNb5zKIryTb
         6zq/+2H2GnamWJchSeDzhjmBmTpjYe40pdfhqBybnOnaGob15Ps8Q6LRIfQSMdQZj96r
         FS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734478; x=1783339278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QT8i1Slk3yJGfD9XMmRDKAAJicTpOqFglW6PfHlcFSM=;
        b=Th6h5AqRdonzR29fxjWFi0NVCR4dxQl6XEAQN0DoTmnENAo40VgJIEHvO4OeqaRSqA
         FIvk5/KWwVctXnL+D2QcTUeu3BBqHVJHMbLBdk4L5dxs0JBaNfarByugmVjC9nPrDI3J
         17YaktncYP986dFf8XuKWMUslPhqhDQs7jSXUjWvCU66qZqWNqzJBVqZ78xAj3Cz1jq/
         AfF0tXeDoLln5vTGJIyzKYO5BMqa+qcPzCzG9sV9xaBUON4HEibdL3uoMzuP5PHtBWBK
         wPm+iWmkMJVutiLf60T005MPWDuis6GiTsYa/+5+cM78TcK+m9Enf9D1nRufEX0lyx6g
         k4cw==
X-Forwarded-Encrypted: i=1; AHgh+RpRLcbsoWRRiy1znseRDl4MBTJ5M5KA+V/8MWA0UAgqnkJnrFgkIP+0kMI40Ociie9Z0gN77eT7rMWMUuDl@lists.linux.dev
X-Gm-Message-State: AOJu0YzO47CZ6sa5guTer4XofiIjj5ODBEaeeroHc76y5gGPP8jwin2Z
	yKLiHoZXqqKnokvulb+cSasDejF23KEEqA1kPr2bv+JwPvwuFQdK9r8r
X-Gm-Gg: AfdE7ckuYbUmAAyAbAISX/FXoT+U7ATGsBenHkZg2aMl/PwSXhHIbYVWPnk7aKcVjnN
	JJycxSh6rXi9soWJjuV00iL1QhjJHrziw0WlaHFVE83r4rFE4YtMZxZ1YC0S0vfODISFy/nEtYj
	p/IdyigrnkPBzMGI9Vuqiy57XTgWCiFoUGeV3PeQiY9tCWHj6yj0IbRw0H3iX3spS3dqOEXJ2dD
	AqsCUu7m/AF+AU+Gl3MEgdlnxlR6+FqP0bIXDodroHWjW5ZHQog7QXK8OfehxIVYVLe5VtpQnii
	LNL1GbgttlLzXqp2NeNTlpM0bDEg3OqBZI5eZn+oI9xakhnRU73pvYAIlVtoO+JT8H1eADardL2
	NCITx8s+GTIT41A1+RwFGKlwcvws5h+3MNF2daVfCh9TMEOd3+OmIiSUlWSnrkp/YWzdhGumqjU
	IFkrJeZg==
X-Received: by 2002:a05:690e:4012:b0:663:5ffa:1671 with SMTP id 956f58d0204a3-664ac40f937mr9003702d50.44.1782734477503;
        Mon, 29 Jun 2026 05:01:17 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-664c061fda0sm2897859d50.9.2026.06.29.05.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:01:16 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:01:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akJehriJCKiJNo2I@stanley.mountain>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
 <akJUBYUpjIX0dvx7@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJUBYUpjIX0dvx7@ashevche-desk.local>

On Mon, Jun 29, 2026 at 02:16:21PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> > On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:
> 
> ...
> 
> > free_output_stage:
> > 	if (need_scalar) {
> > 		kfree(mycs->is_output_stage);
> > 		mycs->is_output_stage = NULL;
> > 	}
> > free_scalar_binary:
> > 	if (need_scalar) {
> > 		kfree(mycs->yuv_scaler_binary);
> > 		mycs->yuv_scaler_binary = NULL;
> > 	}
> 
> If we go this way, double check that the checks are needed as we have kfree()
> to be NULL-aware.

Dawei, Andy is the one reviewing atomisp so his opinion matters more
than mine here.  So do what he says.

But I don't really agree...

In this case, sure, hopefully the caller zeroes the ->yuv_scaler_binary
pointer, but if we just follow the simple rule of only undoing things
which we have done then we don't need to check.  The function is
self contained and self explanatory.

And more generally, I've always hated patches which delete NULL
checks before a ionmap() or whatever.  Hiding the NULL check inside the
free function makes the code less self contained.  The real fix is to
stop mixing allocated and unallocated pointers.  Then you don't need a
NULL check because you already know.  (Also I think those iounmap()
patches were wrong because some arches have a warning when you unmap
a NULL).

regards,
dan carpenter

