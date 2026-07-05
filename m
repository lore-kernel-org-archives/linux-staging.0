Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8065136C9C2
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783295809; cv=pass; b=Qd9itRBLnv0lTSGPlAnq9jFafLhKDnCdyYUcuobDyp593OGg9obAxuywovNe4izyJsjDcnbYlrGV0kosMzsXOMNuQ8PrMpn/6slId/5p7NhRdd9xfIg9Me2pYkRstfrr3yoWcu1nimZSORB0HXnf6YNgEumE0r8QlyUKSl2+/HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783295809; c=relaxed/simple;
	bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0sH9rel+jpKIUIt2tgItlrbS7nIqrgV5+HLggonb10wWBYLZEqzUNegj7/GqeCr0O5GysGpkzRq/ZiPEgSZLXXaFLBUVlupF+i4h3ryu7J6v5579Te3WsGX5qRrWToWz7X8red+BXs0n0dRkjsKeY/JnanOzLdFJc77M/kZpII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aInvHRfb; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aInvHRfb"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6a319a80309so59111eaf.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 16:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783295807; cv=none;
        d=google.com; s=arc-20260327;
        b=Srky1q9ZroANKGQoJmE0o5IpSjQ4jzY+ilZ24+lEFBJKIzzWTs9/IVwB8wWmV07o7D
         u/+x4aNwZ5uVYxbCfnZoVFcXh08tmdfsoU+clK3CUye/D/B7nWMDwi5678vZ3EmLGH6b
         cG3rlHXqyqxt/+1h8V27o5wm1lACXdP9NeJPMboBTzXHvZsap23yOaxGgsmCQubDuaEp
         w5Z800RnlkfWy+9houScSDDrZ51PBCN4lRubT0p7r3Ni+C6n+0I1D120clJf0GtvlvY9
         9q/SmhlKcJWLdYC4mwh0mlMYJ2bRvxP+VK2pBHabETLUhKJglJdRX4QSL30U/Y1VfkMs
         bPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        fh=wp5TyMQzzFWix3gklDV4Avzkv30zYcNBYfFOz0+lDPQ=;
        b=fsYbIf34TBhk1dyXYIVINmdl598490NdtvXYYleKNjRqXYG2TQUOBzJdlSQpDkcsss
         QcNRY/WZ2h5rTNjS9DmWcPuuFLVzdgL/Qvu4Ba6Yb9nQviv4zLZPGq+vsf2IdrEc//wt
         agaKEsohJ33MQqFwtSQ7psrMRH05gGwDjZNG1ZCeFNrt3qexCCMyjSrOhUQL7Enr9TtJ
         mitXShtT1PXu2utlBUURCbVJ8gun2uWV2CXnEvdqC99qI0TrD1HlsjI8J21ughTs+rKY
         6YxzVT3nQsX59826qpmrpITbawfhy36+TuXaYCosyjDldkfwDshKBAwKAVxxo76Y0z4h
         iI2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783295807; x=1783900607; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        b=aInvHRfbO/5Ao4rC0GXCq170KlOzQrSFvgQZLD0gywYw/r7N93KzdF9U4LlNTWdofI
         9WwHu0aS+r1ZTS4Y7lfA404Ta1jDryfgJLBAjCTXBesXfeagiusaXLQZCEeZeVdLtewQ
         6DbHiJUuwCqil4jHDc6AL0eEn1xS2JF+8PiVvrFx3DTtph3UDOawiBTjhBaMzHRJ5rP6
         4a3fKu6F8LU+b07o8KbpmDdJcAu1JZhwxRiuxwkQzzFHMLGnSfoSPex1OqkaJhEO1Ear
         4/WJGMFbiUHXmyhWWNhPnTK1pAMobnFUkDyylFLKHmQs9gWdh9stLlG2kHoQNIbfDFZr
         tong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783295807; x=1783900607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64A3RjqKwHf5tCXSdbvzN8P2GTNUK3YmMcpWKlrj2Dk=;
        b=YtergZrTZWhoP98+PlQ3laHIHRIOLIYTTAN8NlWdLbjgWYUysy4b80yl5H/d9dfIFu
         6Y54w1FpxpzJc3VF6cIl/XaTn/GbUMvp8a1q9xffhjcBFjtqg1OS5rZwfzqQ7Qhq3yN6
         8YXucv0WyzsZkv5b2TNEDNV4CAASgQHtyLsPlPV9Cu+tIMCxIUEWFbKybnSf7809EFHP
         O3Ll30MRcXnuQpidffXsWhtg6hSz3pbaTOaUjEtyS6Kdz/J+vig9HxNFKVO6exBRXWzy
         +sZ/ku1JuuAvwKwTj0hpFslOjzZ56MOx+95OoX+e3Nm8OlKVlThGNR5Dg0TvBhHJbiwn
         oETA==
X-Forwarded-Encrypted: i=1; AFNElJ9FRKYoLBSc4LxwjrHqr8iFg5dC8l+yStCBBnuOsv/CtyJco5Z51J5KVW93Thvn0ZHXp7+JCaYFGA7HDCzK@lists.linux.dev
X-Gm-Message-State: AOJu0YzZwMXikT+fdK8LvMniX5u+0ZqTVfCBu5MURmK1HbEIlIBcjJIl
	73z8XgLY768YRtfj+NjqRAgXD22NG20mv80U7n7GnPysBd94npqk3AkUhnfY9D6toP4yZkVURfh
	/mzBs1RSV8dqWqpD4ntZw1UfsV4PpA84=
X-Gm-Gg: AfdE7cmmsyz/Vx4ycYyvsLosazD1UIPSJerHlqgmNf2Ug2EU4/9CuO4Ra+swJlWaX/E
	ywzQxXwKWGgg6flcM24X+BTtsyu7xlZaVwjnerOWvpj9seiLIqAD/0WnFrAzRNQwjzfCN04VLJV
	BPCo/p5gereRfbqihirB/ivOrRIQBin054wlKZVRpGsqluSJVDV6SL4ks+K+M/Xko6U1SjIaznY
	5hs/Dt+aRgx0WscZHGgtcA23I6ehQzJTgRwC+RqRhva6GZypgV6p/TIUVaaqJ/RbDRpx9Iuyxd/
	kXoXaylz
X-Received: by 2002:a05:6820:c090:b0:6a1:334a:90f7 with SMTP id
 006d021491bc7-6a32d8e1f4fmr1968742eaf.0.1783295807040; Sun, 05 Jul 2026
 16:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260705073844.146578-1-nealpatalay0@gmail.com> <akpopoFZyWW2e9En@ashevche-desk.local>
In-Reply-To: <akpopoFZyWW2e9En@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sun, 5 Jul 2026 16:56:36 -0700
X-Gm-Features: AVVi8CfaWYTJPFlFAn3GUSPgkRxVwBdu7ezv3P3Yzznr9ibVYaCCBIIVkcP7O3I
Message-ID: <CAGjuiT_WMkYOJJ40AJPcF_mbyZv+0pvgMOv8fp6hxPN29N_2Wg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 7:22=E2=80=AFAM Andy Shevchenko wrote:

> The blank line must divide the definition and code blocks.

Thanks, I'll fix this.

> Missing period at the end.

I'll fix this too.

> If for some reason len is > 0 and offset is 0, this will write beyond
> the boundaries.

I'll add a check to make sure the offset is greater than 0.

> Broken indentation. Note the statement fits a single line.

I'll put that all on one line.

> This will continue writing even if there are more than 3 lines.

The original code completely removes the third line from the output
by writing the third line into enable_info3, and then overwriting that
buffer with everything after the third line. I'll assume the author meant
to remove all flags after the third line.
