Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795175086;
	b=CTJVLiPKXWWsKrg0jZw6FtOsQvoyQ/6HYYfudbL44mHXIKAhwsww/HpNj8TaJuVzTBIk
	 p8H8t2m2BPP1nylHl09/4/Bdp5oAew8Jf9T+hdYIBPstnnslG0dtFWg+kJzQ9cNqEhMpb
	 aV+rctBmZ5aRvmKbT2F9y/vDLsZmzJQdKIjDYnwKTjUNCLvchiXaOHcNLfadgwGZWNVSq
	 3zAVJW2Y2pJJ+k53MhIaVi6FbbZ8RSU1gbpuQTiH6NO23NwVuV2Dvxu1FzpwLIKkAkUaP
	 A9AePR3xTm4Tkrjdif+lOWoK96d7tma3Yldv3zdLUxNhAB19zF2EFbqKCqllXQwlv1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
	b=UFM/cfle+TViEOgLaOrFxwIWV/i1swIiXri2iGWq/Xbpbv4koXml8VGAJixXa8F56Tw2
	 MWw5jf3BJ3J/HywHnOobM9cHBAjQdkUaORPcvosXxN5uT0bssN8Z0DbHCIXQ3BvSWhEje
	 MEb14ttwbnwquL1jUCJcF0ioiUHLJdGuHxmgfGAg5NEaoBVkpeHhpWYWqNoH3DAP2x60w
	 Dt4YkA9TqARhbpS+z4OjKwLJv2bmEQT5zcez3tuenvwjZ0Q/CC7x6zJu/yVOtI+mwJNkR
	 F0qtQUvSGDHW+xrYL7SzJcuNR37cOTQQ+w/LrSk36DNMpY9g+LkCcHzNsMo7SC+1LoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0OPFtYw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6C60A2603
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA6C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0OPFtYw
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db1f6f50eso947975d50.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 03:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795175085; cv=none;
        d=google.com; s=arc-20260327;
        b=B9Z5et66bS/3qC5fw58d1sxmre9BlTZWkHZGYhttNIyGC1h7NOOUoJSbBW+SX1dsFs
         k8P1bLclhbuVVZ+uxiAX0yvO9cFa4vWcDQoaAQW3ZupbXiUexUhVOQ78UKaqDWSgXyay
         HPSKdHtAoedq/8V4eRRFKgd9yTWKMeRapVC26dHLw0jGfOC+wD5ms8Z1NXRtaoVHDXTb
         ABUdrbbGRGjireM8YbSpK+34ar9xXFApKyk0NoIElp/QQLALKtk+zUnm+CiDtvpf5dmP
         qMCVWcvJ7d/c/f/Y9iiVP+Zme12vQ66+/PSqeAVF8KEXTlQX47XBbMfDt9FWL2uNdna2
         n5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        fh=L1R+oOzR0u0xdMImCZxrKvGRerWyqaA3ewzXejCh5sQ=;
        b=SdtgxQGE+CUxp26/HYF1bxZmgnv7TbXQKm5rfH0pK/6BymXQNti9APZFQonL/p99vU
         kyOzfoRser/iRYEWcdNqsbgBEersPtUDmh8mki4jLgdhIHVEGgG3QRB4rg+eX1awvD4Q
         EfGWUZEeHbgkx78lVeWX7ugqML/CaveKtlcDUN0RDLItQR7zFl1En+r4Ppoq+cvisIEI
         2FvYWTHsv2H0PPKbYijFRGY/pwRP/6JH1o8a3uffS7hDFwXdW00zPgVGqjXFwGd37M1V
         Y2DhBCRBp2m0ikvUKFQGxh+LkTzPKvcjzJJmjOY20ZE8fepzrcJGlgtj2/kIpEETRNyv
         fEFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795175085; x=1795779885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        b=O0OPFtYwvIXM/O7aDG7shk+odOHA3HFyh5w5nTCV6okBlWDbsoqjnUTnOAOIfo+txd
         8fhhgqvltDPq/nxLlt58LgwjNShErCILwxpMnZ7g463fZ0qS/vYjrl18ztOvovuyu73V
         zhSA/aSILDnVay1FFaEPzpe7VEjv09oObTD+Hhwxyl2aek9n9HZGIWU6ZCszVIl2louz
         IkQyuCuH0Z2zTIZagcOksDx5CZAB3qOjsSSgaQsZLf9KRPXMHra3MSOGk1IQRLqCZky7
         tYUbFvePI3LTTu6KqWYuLTYgWe95s0p4Sc3UaLO9iFz+yq97PYYuZiyk5+rCh6td1Ul0
         /vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175085; x=1795779885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JC8Bc6cC/0zXiuAQ2eEDZMlg3ki7dHtSWqsSjDIl7fk=;
        b=YSR3H5t9liL4Uw0QXck191GOmHIgHNkMDWhNz7zIkkaIBTL7tFXIS7A1OC1GWJfIoD
         SgcinmOruOLGgL7H8r2ANnoKVMgymsfiw0FMDt+6U3JecwNAdUX2q0/Sw2pdHBADyZte
         EKQrvYLFDc9tLvQbKI5MoxBCrujeUws4HkGzmWmu3AujplvL216M2ZCj0kde/Hb4MfEW
         bYNXSjFXVWfR/lmFh8LHJQLsnCOrh6r0Lo/Q+ONP/ZVH7Qm+2DAiF6oB0ovn2ksKXu+J
         SCXM2HUDlaMyt1Rrf3mMyY4b6P5aD/nPlh0AdMGW+P53K9rzPrbpviwDaKBZccOsmDXL
         vz7A==
X-Forwarded-Encrypted: i=1; AL+hErHWeS0VgA9WpvIYIYm6TSwWuQ259anZLZsohLQZlcrDKCZYzvpVa9pK0e+/iCLXA+oFFOxIAkzJxdqPURbx@lists.linux.dev
X-Gm-Message-State: APuU4Z/El+2sJJOi+Nsz6FKQ+xkwPt4eNU6Q/6lqNBlQxujMPpqiq70f
	k4dHPxLNt+PxI1DcFeqp/7V6/BaVQ/yk46RRFdYl0ZuUTOBOhQdYQICgd4Tn/94x+jjErN/4BQd
	6LuAZDmszVxx3a2XarUN/e1RssC10oDQ=
X-Gm-Gg: AZFdTZd/nYb99qpRCaMWoRSYJgcECyMzml/e0yEpzr7Lhg60X3hCxuppX70SGKkpqIj
	vDXaYWTx0uO7ntCjWq5ssJTk7i17H14OpFcxCnoepWzNpYDxiDp6Mvm7qA76Ad2msvRdvzJbCfW
	6oiU7l2Nj8ZAYni4ugQSpXU240t3CSLT36KJxbpYJQgPBm2L2YQ+txlcsF5xbRwlwJmLG5QLe5m
	sPkULMQKq5+IntOsLt54GajEe5FA4Y6Kw1ggK5yWXgRiJrT9yFT9hH9zOgJLbLfICA85HW6r9tI
	fB7G3dfHVarMoL3DLIC/44IW5GAxk0rq/pKLhOkMo3WGwevlnXnQNEIPDLzeGD0YfnCi4Rf5J+G
	a6wzKJUOspwdYfSDm5AQoIKn2K96wC8VSoLI=
X-Received: by 2002:a05:690e:4881:20b0:67c:1e14:4fbc with SMTP id
 956f58d0204a3-67df42d0721mr858402d50.11.1795175084774; Fri, 20 Nov 2026
 03:44:44 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104205108.1041666-1-albu.victor.m@gmail.com>
 <20261105202110.1081296-1-albu.victor.m@gmail.com> <2026112048-dimmer-ravine-ae33@gregkh>
In-Reply-To: <2026112048-dimmer-ravine-ae33@gregkh>
From: Victor-Marian Albu <albu.victor.m@gmail.com>
Date: Fri, 20 Nov 2026 13:44:28 +0200
X-Gm-Features: AclHuK_tQvLq8m0AECgKZuYHhvtIB-hn-yFwix8vwPvtNzJv1iLXLnWfdq7ZoBc
Message-ID: <CAE5KA-PZzGXhkqwx27LdEFxHv0gHN83p0k4gC1NW0TQqNRyTHg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: most: dim2: add missing Return: documentation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, christian.gromm@microchip.com, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	parthiban.veerasooran@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added a Return: section to every function that kernel-doc -Wall
flagged. For some of them the comment already described the return
value in a sentence, so the information was there, but kernel-doc only
counts a Return: section, which is why I added it. Nothing needs this.
Let me know if you=E2=80=99d like it changed.

Patch: https://lore.kernel.org/linux-staging/20261104205108.1041666-1-albu.=
victor.m@gmail.com/

thanks,
Albu Victor-Marian

On FRI, NOV 20, 2026 la 09:16, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 05, 2026 at 10:21:10PM +0200, Albu Victor-Marian wrote:
> > Add missing Return: descriptions to functions in dim2.c.
> >
>
> No, the descriptions are there, you just moved them around a bit.  And
> why?  What needs this?
>
> thanks,
>
> greg k-h
