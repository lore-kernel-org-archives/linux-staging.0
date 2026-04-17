Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDB2701BB
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431810; cv=pass; b=CAP1wKyYCmQCPSrkbETppvHV/Xn/7zaIjp/EJhYUwl7y+HYUvR5S2XHKzBCjCgg+O9M6hORNLvoPAaoQp8nLIziOrYRMqYSriqoaJlQ7Ul52UflF7wClNj1nFS2oVJ9a5OgzbDXKVrMorox86+ezzugFZMjaRlH7AM56Ike2+eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431810; c=relaxed/simple;
	bh=3s/oC2gxFO0+InhCcu7xTpMSDsPip0QFs52mALT2Uco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZSHNu4wzMGUjVCxZt2K8fg80Wjo269XDkFrx69Ln4jhH2dq4o6I+3AjuFEodH2ohd+TkdYnm3beLvHQlxyWxRKCm0S3lvEz+mEoMn5jnH6R7mNz7QXfWIyYqkdzC7GA4GwdKJhSvTLEIG2s/x0eysw166PvfxwFc+RfNvlwKes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKIOB4Bu; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKIOB4Bu"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65006c99d38so670060d50.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776431808; cv=none;
        d=google.com; s=arc-20240605;
        b=lmDTOkAqaG7RX147FNg2Wv0vzRwOv6voGR1VMUUhJq05Lg2g8zU4LzgyTf4vdxB6eE
         uN0a/O8O3/I7NExwmFPfwKkQbJhnfcFRiw7bfEb3/RZNZye96DfxpCKkEU9NTpryr2iV
         5abkDp72RwmkrHWpyc8lnntTljlmuGZwEVL1dt3C3xMrfq/CvKg7Stn6/RhsA7tqQFu/
         DFtp04y+UhtzYV2V70FhnrtOo+FHW/Lbls124OavIXRZ6PFagzS1zJOdKLaBXOkkNAir
         ssC5UFiuvK4a+YciaeST2S06lOnnTSuAijTwi+uE+UfD4zY4vc8g6h4SdgiAFdwwvwvu
         SMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        fh=fvjJ3ToFRwx6+Fmi8PZruZ9E1MXBeyYv3K2UUiMfFCY=;
        b=gQ5b31enLpRMCL0p/4yNyzmxUAsZfuxVScgc1aIV6Ys2WvvjTYs5eQpN+HByU73M41
         y3u/53epLpB/Wd3aGlckmW5YFUi4h8oOa2lKXJ1i+Cs9qM86YwfmqoXvsRyYun5dJsD4
         6nDXan5ZmXWHfjv7W1mbNrmQtM5Pry7EtlqRMgn5PP0AP7sj+lrD2nfl3pCvnZ04ydxw
         JNAjuGtxqvTdyCeR26X+926WULjxNMEtxxSnJ81J5Js7Hnf2gQgRkRv9+zp7VP03hy34
         iKcuh3n/qQ1vS/6HN1Sh3VQmtMaIPKtBqRx0TXBJ4GeGMlpF5Et9F8uzgC8KfUfaquXJ
         /9gA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431808; x=1777036608; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        b=tKIOB4BuQtHUb/g5cLGDPc3S+g0BhQq5nnexZGA8M+Ta3s+GTrkrGZ7zwVbP7r+2lX
         7HwBMbpmWihIqqHn2ufYJjklPHsGX/ECGdmgqUAtqMqdwIDMy4eiAqUipqcdQFQYkk86
         oUEGyi6rlN4SgOMr7U9LNrfts3GzBiZYVquFhFi8Xp26YmP09bGiEO2MYFLmEQMwMc3/
         AdIk8ZWB+bWqeD98Hq0OxYJL5XfQRlD0BU7ThxpZoat1vBuEktvugHKVtUYzfDCeYzr8
         +DdctoOLqUuOI7x+GEYqFKqu1eUSsp1ATB5958n2Lv39DFUDmNuRVMoYwbH/KK9S3P5Q
         q56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431808; x=1777036608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        b=WVzOAuKLsaWhoy2BsU2tfm2kW9abqJbGfYSiDUCbZZ8Q7h9CEv03FHhSpmdtlTq/Mu
         M+RYT09zj3TNEB6ksK2Wyj+f8G3ZglX7wNZyyZ5QtP2jt39j5F6elk4px8t9uFd1kk87
         47iSfx2Whcnre/rTyMSNkeIDIbvJf5VixVc2oBs9SBnzUGtOJfkLrROIhguQWSa7X2Ef
         BT8QDOP8d4mW0/i14DuRpsS0OTMJ+bsE72ETmgeV72lFaqgwPyk8J7d1tp0bdxfvk+kU
         RnOE8RaFTVQJD5UZQjSVwJ5SA6SkLppzJAY2bH0EwaEtbWtG0Mit0Z6NDOjO31cpG/dl
         /oAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8opWHhRb5/x+0oD4WjJ82+lw2/4HZ3euX7ia2887Wx0JanW0tigHcIDqxRKAASv3M6FhV1cbfm7FSbxcfu@lists.linux.dev
X-Gm-Message-State: AOJu0YyYYGJseTSy1PR7aav6rVLv/VxFAYdUoIWH3oMaQ26EbLR+/98W
	eYn6v0n+AQArA6ud6cF4Ot6hn4dfILk90DERmCV7x+bYTqpQSZgQA4ltx5mNaJ7Rn3vpgYxB4xz
	eU/IzvMGCyPeq9kkQMBSmuIef8kGnEvk=
X-Gm-Gg: AeBDieuvzD/4C+KqMsa5QA40MQljoi8gnabsxRZEKelnXENgdGWYpEJPI2a290acKmo
	NYENQh6/RBItjgq+dXVFHJGdhDyE1VaWt4GJo/FrHQhD1CbjUkzlw3LnOV0g31c3Km9+kxAUBNr
	6PyBHGsPD8UArbQguQT0TtH+eUnAooCr26+3IWm2xEA9F9kVV6CuPlMaDf+VI8D6a0k7U1GX2+F
	wAAw5s2Kg2dJtFFCcNIQYASRRNFt5/gct5A7zmeJ64mgQsAokW7mB9Ur9HEjlS7Y8Fdr885IM4l
	atUTNoFjz2aqAYqw7A4W
X-Received: by 2002:a05:690e:d59:b0:652:5567:b408 with SMTP id
 956f58d0204a3-65310869318mr2273093d50.26.1776431808068; Fri, 17 Apr 2026
 06:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260417023602.112359-1-m32285159@gmail.com> <aeHERE58gSbAe795@stanley.mountain>
In-Reply-To: <aeHERE58gSbAe795@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 17 Apr 2026 08:16:37 -0500
X-Gm-Features: AQROBzDE4fwvUAcvG1BxbCof6C0YQgw_F8sU6xGyy5kWPzV7c0WRMlziP1U8oBA
Message-ID: <CAKqfh0HaG1fQw2_g9P7wHPyqib05CeyPcTVQREYyz4u2xRgbQw@mail.gmail.com>
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
To: Dan Carpenter <error27@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:25=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> This should be two different patches.  Is there no way to move the
> variable declarations around first and then get rid of the typedef?
>
> regards,
> dan carpenter
>

When I was test-compiling the patch yesterday, sparse raised
a "should it be static?" error, and that was resolved by moving
the extern for the __cvmx_queue_state_ptr in the header to the
top of the file.

best regards,
maxwell doose
