Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DF7A725;
	Tue, 12 Mar 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710252589; cv=none; b=dvNSpNQD6QKrPdeV/RyFtIwAEyiD3Tv3fv7OclqqI3ZRo5y981a7eP1ErsFUoicZZCTc5j1yF0yUqwdxvgd8Azw983wz3/UpXyptwSMj7z0FlPqfJUKcFxDOYxGo0WH5BDNJzC2fg4fYy2uTuxKhInCwNIgkjM3oyL3GxeDYFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710252589; c=relaxed/simple;
	bh=zu+uZ/8084vv+m/AogKImKAueKFkXxPoXHpto1b+ruQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuMRxpH0WJEap0CKWmwxeZaELnYWT/kngRViCcIoPghI79j2laCihBcSK0bHcQpQe/51FD3KRuEKZn9UP+wJDVOa0bn3+D34DuIXEeWKI0vVtKRIKyfRCijJawezAoCNLac0v4CIf1pTImLUyEfid9EwcQgWppYtE34pfgyLpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc/z2G9s; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc/z2G9s"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e515dc7bd7so1635082a34.3;
        Tue, 12 Mar 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710252587; x=1710857387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu+uZ/8084vv+m/AogKImKAueKFkXxPoXHpto1b+ruQ=;
        b=Oc/z2G9sxoT+VHSPLS86F28Xw6BfQGQXtAOnfssqoqgV35fneGuiMpwhLDr6dGmb8f
         8HciqVORuGmW1o0zjqnmlz6AxKAkoYqM9CfgJ8o9A1jolG95OootVQed1XBAX3Rjyncl
         y1tr+FKmUzNqArrMYeOYapaBMk+4ZiSrSQbQqGHei1pM0oM2ZNjjTWFSmDAnpVriplUE
         NIDbI5/lZ4uyK54O99KBA3gPjsIOL/TZdUnu68vgMJogYsYuIkEORL5rhMC8AaM3EnRY
         IBBauw9sGnD+NWzF0/U2gkRFy4HDgbB2tWKfQszsrt9VLWKa9HENdXrgz+UaxVNN7YWt
         uD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710252587; x=1710857387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu+uZ/8084vv+m/AogKImKAueKFkXxPoXHpto1b+ruQ=;
        b=phs1bRSj9FrUpCQkURLbOTHAQGP7Vc8LUezoiw229sPHYHBVOUNgcdVrAIocpv9BRy
         6/lg3J98qj1TikeSaA7XE/xblnVwJN6EhcjJGY7VUCEk86FbdcVcscKJOKHbXMdzdwab
         iJl8qqXIcZ94i4qRwSgetdejL0KbjDOANqKKfezWZq7UGqyB66vjvRTFCCTiNs42zmGb
         mX61ayx1OOAolMOLVTKi/lWJXfYkeiiT7OJAb7KnsF1XibePogbSqKE073UtX6DaXWes
         ihRjDgbGcSn1N12/DyfQiQMIEZ7n7fooRBZib354RcV1uNBsyUdU9fRMC9Dhy6Pjsdbr
         XS6A==
X-Forwarded-Encrypted: i=1; AJvYcCXrpMreDmoT9j44SRnx8edM16KBHxPgkBKjH6LyY+Aj0E6sINNAemkyK4gAolCxUYdxXhZSq2jg6W6nXtaNhx402hCJrZlYPJwkzUOVpSI76TNLfpoU1Sjy+s5z91UB2ZBpxGa8pLSJbQ==
X-Gm-Message-State: AOJu0YyLWl6p5iWSUUHAd/6k2Bxas0jt49Vf3lZ1tv1CAWljmbQH62M/
	tQHOnV2rUY0epz2KoSqsMtz89qFZLUra1lU2QQ7uysE0vgtg81k372UPIEHGZQ3QnzAVxzc+XXo
	WvA60n3boTbnewpvuURcSOw9r0pA=
X-Google-Smtp-Source: AGHT+IE+c+ZdOXmBGc3GWGBArNuHaUYW7pUu2NOq0nVv7TTeFNzcJ/MRGEdssQkYOkouITD9YMFOcPhJlm4xc+GpLn8=
X-Received: by 2002:a05:6870:7e14:b0:221:c8a9:563d with SMTP id
 wx20-20020a0568707e1400b00221c8a9563dmr7791776oab.3.1710252587056; Tue, 12
 Mar 2024 07:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ze9Ie67PCSvBU+og@MOLeToid> <Ze+JxSpqc/eHfCKn@aschofie-mobl2>
In-Reply-To: <Ze+JxSpqc/eHfCKn@aschofie-mobl2>
From: Felix Kimbu <felixkimbu1@gmail.com>
Date: Tue, 12 Mar 2024 15:09:35 +0100
Message-ID: <CAK=vLxKtR_rgU3A=w7AEddM4fbtTtmAQ85aCVHYbqyEXcjP=SA@mail.gmail.com>
Subject: Re: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
To: Alison Schofield <alison.schofield@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 11:46=E2=80=AFPM Alison Schofield
<alison.schofield@intel.com> wrote:
> 'rc' is typically used for cases like this. If the name of the function
> being called is reasonably intuitive, then 'rc' suffices for the return
> value.

Greetings Alison,
Thank you for the feedback, well noted.

> 'Also' signals that this patch is trying to do more than one thing.
> One type of 'thing' per patch please.

Dan has already address this, perhaps, I did not write the message correctl=
y,
suggesting that the patch does more than one thing.

> The commit message prefixes are off. Please see First Patch Tutorial
> Section: "Following the Driver commit style"
>
> Patch fails checkpatch. Please see First Patch Tutorial Sections:
> "Git post-commit hooks" and "Understand patch best practices"

I will definitely fix these, thanks again immensely.
--
