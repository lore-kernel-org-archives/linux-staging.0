Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47128F948
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553607; cv=none; b=QUUUdUSA5Qa7FkUTOWEKjM2AVLsKarVkKxhGIxgOH4W34QgXD2yv64bbdqhPmWCzrtZY7QR9vDwhx7sIohhCu3BtRbXGgfXyf6UPXtQ5Y7N+Oij9hQh9jZw7Nqjz9D0T7YzvzhzV/ZsT84AAiXIBgEi06J8xg6e3y9EIomAv2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553607; c=relaxed/simple;
	bh=QXh1CChDjH8ohddaaQ6/VxWgyIzHHlocmmkcYT/MH4g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJrU0MU5kpNmk8mKjdz9/Qm11qugP32sMckegSE4oGOKupaeFwTOMHgt9N/feUnNXS923aEHn9K+GHgmqzjG3nibXonQzvAPS5GLs9gAQfVHeVEmJLRZuZB4j7pTa6my5ELipTk+abbF8z30WY/o/I1jM+ARUxdCpsXgGvqlqzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfxy5ZAA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfxy5ZAA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso59070905e9.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 09:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779553605; x=1780158405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS7AaSnvi+8g347V46yumsct/iLL/yBRgoDzhYZ24Ng=;
        b=gfxy5ZAA2rEqUZjslM0AiohqWKC0APfm4WVFySGaRhSKJnCpmI/zziflodXXy4n66d
         TqMKaZytd8KTWpY2NP0eTp5JJYmse4QQVsWTsICw3DJ+V412nvgBASyqwEedda/jcDv3
         uGklBMTnmLxuyBdjy3Lw/7YrLDIY3aOj50qgpV3bPU4iKz5Af4GC1Lld3XDPmmce1Jhw
         /YPm+w4HE6x0TjrJpP+g9CrnVRloAET12n7zJHZZGZkyzJytW3aM04JMULuSg79CIYL4
         KL7QN29OkteMoklQLNdf4oxmew+3cA+D8WL1Xey91eHbefNQp8wRdo5m+1RfHYMiPIe6
         dHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779553605; x=1780158405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hS7AaSnvi+8g347V46yumsct/iLL/yBRgoDzhYZ24Ng=;
        b=cImRsioRubLhE1Y/TdSjKJO56NW6KJ7VHSPr3uKwcDKwjesdB6fkjpsxClshYpo1Bb
         Sq3PUK0rwhxdRbPEXnF18r0vxrFel67HsiRmdm5tVsP/GAyuTyqxNyYV1J04LuI7O9kc
         Gqe+oUs0EqhMtWVVctugKg4F29BukMG1RD9JQY/3hUOofeKFDOEc5PVScR2X5p5e9X+f
         zmvgGnzGQT55mT8mMq09w7Rs0n/sMgoRtT5AIEbWw2PvFc7Q8bCVcf6lPMpLznTzoudc
         8RzwKvIFsIj5qsoHFjII6U50WawBh3iZKornL0jxikXbcrX5wVjqrelUdxN5IkJvzM8d
         Ah8A==
X-Forwarded-Encrypted: i=1; AFNElJ8qpJhlbJA+Cr6BguvVdtE6PJS7l+JJm+scmMISMFHES2JkpUUWHcX1CFisvJO/EnIzN9kgTF6yWcwhEqwt@lists.linux.dev
X-Gm-Message-State: AOJu0YzL1zRR15BHxl0T05pVGZsAjAjMynHV8SOO9aMJ9ax4r9ZKOZJl
	ET2hwQ5Hb/XLWuSKMK/vd4WO5j4/sy5HK/KSE/Zz5WmOaJ4iMGF5wv7u
X-Gm-Gg: Acq92OF03mhvJtLfbYycataqYmAjRMzHaZJYGChLHR7J6mHJVjPMYTJ9yIGwLAOiXvT
	yBIr7Xy4DgaDFcXdlsCDhnzzPcHL2RD4xhkjGQda7WeeFCu0D5nDULxMZUvqYoXXPEi8IlYWi51
	J1Gpo9bzfmaZEzWd/3wHTMyh1Zhb0Vx8STSNLMoz5VZoiu7umqXH7qUY9xhFSDJyFntlPY5b2L2
	FLrMEZzbbWVtUgt957LktID1A+pJbJnDQqmja5wF/hPQQZTV9u54azX9xHXqRJOwSYUqM94egDI
	pnUP8Ycuo9EurYfASLRixq8LVpKOVkTZXJHE3RnrZHkWBkIHThKnRPSeLp8wZnp4VfvRTL5Sfr5
	pcawahuCFIN/qkOLHfKpp9vZ9d5rOyMW4eQ9mhe3EonTY9EjDEQlLhmLARRT4A69Z4UaqOLFSgv
	nuj+0etKZDg/pr3YcCq75MD4c+8nVwaWyd2bqxMOiSiIPE5uWE2zn8iqK7sBIxotgt
X-Received: by 2002:a05:600d:640f:10b0:490:3ff5:737f with SMTP id 5b1f17b1804b1-490426cefe0mr95618465e9.18.1779553604681;
        Sat, 23 May 2026 09:26:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c5eb0sm136093835e9.2.2026.05.23.09.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:26:44 -0700 (PDT)
Date: Sat, 23 May 2026 17:26:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Ahmet Sezgin Duran <ahmet@sezginduran.net>, gregkh@linuxfoundation.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] staging: sm750fb: use ARRAY_SIZE macro in
 fb_find_mode loop
Message-ID: <20260523172643.1dbcafb2@pumpkin>
In-Reply-To: <ahF8dacOkX0tdxGf@stanley.mountain>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
	<20260523051509.166152-5-ahmet@sezginduran.net>
	<ahF8dacOkX0tdxGf@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 23 May 2026 13:07:49 +0300
Dan Carpenter <error27@gmail.com> wrote:

> On Sat, May 23, 2026 at 05:15:08AM +0000, Ahmet Sezgin Duran wrote:
> > The loop in lynxfb_set_fbinfo() iterates over pdb[] and cdb[] using
> > a hardcoded bound of 3.
> > 
> > Replace it with ARRAY_SIZE(pdb) so the bound tracks the array.  
> 
> I don't love this.  As you mentioned, there are two arrays and they
> both have 3 elements.  Why prefer one over the other?  This patch
> makes the code look simpler than it really is.  I would just leave
> it as 3.

Or change the code to have one array of a struct that contains the ptr:count
pair and iterate over that.
Both pdb[] and cdb[] (or what replaces them) should (probably) be static.

This interface is strange, the NULL:0 requests the modes from xfree86
(which aren't visible) whereas the vesa modes that are defined just
after them have to be requested by ptr:count,

-- David


> 
> regards,
> dan carpenter
> 
> 

