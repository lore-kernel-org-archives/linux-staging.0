Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DCB3B8D5F
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137797; cv=none; b=gAQlQ5VCcXD4vGtcDptoWDpZV3jYPOrVEuTwWne0C/x9ox8zjyx/n2NdC3mwwEJiyxhrgCS/aD910a3AO9Y2S9qD1dSw2CV8sri1NbzNQo0Ry/Y73bCP8+ppNC0eRKxfQ93Cv6/jPkJdUAtX4CHeyZlRJhhamQvnnT/qeaX7p0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137797; c=relaxed/simple;
	bh=JxH5U3NzCdhA3Yx8cGZSSy4g2b+dmqxSB4JKEL1ddAw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ltdGCW2KA/aYHoRkUZkpmwxTNfkWpAo2/cNrX4E9XZeVoB18ZXN9nP6c3gy21+CxJTiAMNdovusbM+BGJc49abQRm91BEUyJIkFc7o5yiCVZo6Gww/XJql/jbooVtYGg4ynXGGndIt0nFSYWxoMRZNQMHdgwread+TH28E6WGUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqS6tYCh; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqS6tYCh"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649ae700ba0so3795272d50.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137795; x=1770742595; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxH5U3NzCdhA3Yx8cGZSSy4g2b+dmqxSB4JKEL1ddAw=;
        b=NqS6tYChn9V0yl8A31CFyAQiGFGkqGCmyhbuNRexxbI4I63PGS+4DObQaIRm8UV3kH
         LXvu6cXYuILvCZrgVNd+R0TwjUNZWX0tKT223z9ViXynVa9Tw+B0mRaaTnwWFwUVsQVe
         HEMFkS/Eb84oPZep504slMIsiPBdehugpipNjUuvv8WLWoP3X/QPT1dKFItNc5hIboHN
         +/eDSetZD/mAZ7C7D1pFPBTZkg/psCgjkwOz7Hb1Myuix2w79KrI4T4GdFOz5rkVVl7s
         GkpqOSLxtSoR3dy5YnLBFrrns+g/Rp2J3NnMktRqsKtK7R3Hv2kq7lr0fg5MXF0eOVOX
         pGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137795; x=1770742595;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxH5U3NzCdhA3Yx8cGZSSy4g2b+dmqxSB4JKEL1ddAw=;
        b=XA+ojm30yW7o9bnTiWj7pCSEYCW5QN6bx65v0lSzJUg/pJkQqAUW4ODOpoBzCil8ji
         9GUtTUS/1Ma5yH6lzsVzH3gwW1HvzuV/Bi8Lr+8tDTW/5NvRgDlZ8+pgbbjNFPeY5Ux9
         A2n+lKjRwBlH+Rfsluufn6zE5wHxsIYkYJEbtlSoDXywneF8RaKm3gmk4lDqWfmnECo7
         H6txuMsae8XcEOt1yMlEOWbVMva8uMJ4OhIUpta45Kc9j0DBtwmvwVIOqdBm4EKFaD5j
         9zruFc0kAjHddOzG0M+y2hJTaVrYx4ShzTK5xP5Q6cz7SJADLrTGjX13lbp++42NaVml
         JH5w==
X-Forwarded-Encrypted: i=1; AJvYcCXtAqwe93bpC2hpXFfyQHI2RZI1I/y3MPOjkYRgSB1rxukcBfSg5JjjIg3Ph83ZGArUtv59BPchqWpe6UpP@lists.linux.dev
X-Gm-Message-State: AOJu0YyvRPuMhaEKa4KOGp5UwWmsQ4f+8WrQyDZj2h9GKhyIUFP9VeEe
	RcMCz2d9ppd15lMg+UK2u8dt+e1dEaEqMnkIFtCObg+rx1q2sW6h4RAe
X-Gm-Gg: AZuq6aIglqZSK/6fGX6QdJnYlJmMx7XNbmK4N1fsFMEVoq0AOFtkKBTUHuHQrimvfyK
	1exRYOv6gxd8ljsLLs5efCSorh/ZqfkjBr4pIRdlMBEEfwbH2n6FhvF0SObbNRsDeSoAB5X2L9Z
	bfR/KHb/aNb2LXj/pfOSkGyDlptbyqpOczYyvQiB8Maw7bIQJwH5UjjeVrwkTMm3q1WDPVK7+u2
	rhj8nR4yidbSo/ATXwiJaWVknYnPI/QLB2tOQHnf0P4giPUvem1j5bMy84WaUMM1OnLykp9mE3+
	a9CnugLDY2uAQQ0QlmdUBjCol0eRFpwLDyA5ln7pJGXkcQ9m8xik/5dd02c7eDlMuuJRJdn27op
	MfoZw8GucQmF23/1Yb+dCoNUU2+NJP0kOPzgkeQh4DjV3Crmc7fNsh4AftTO0e/a4aIWbm4HbGC
	+Q5NdRPmVuRbxTd/c1HV00x6R/9H44t9Y=
X-Received: by 2002:a05:690c:ec5:b0:794:75bf:b916 with SMTP id 00721157ae682-794fe63274bmr3716877b3.7.1770137794623;
        Tue, 03 Feb 2026 08:56:34 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794d9111aa4sm48395027b3.52.2026.02.03.08.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 10:56:20 -0600
Message-Id: <DG5HH2A7Q7ZG.2B31N90O16F2Y@gmail.com>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace in
 rtw_mlme.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Giorgi Tchankvetadze" <giorgitchankvetadze1997@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203102127.55665-2-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260203102127.55665-2-giorgitchankvetadze1997@gmail.com>

On Tue Feb 3, 2026 at 4:21 AM CST, Giorgi Tchankvetadze wrote:
> Remove a trailing whitespace in rtw_mlme.c
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>

This trailing whitespace has already been fixed in staging-next. Next
time use staging-next when creating patches for staging. Thanks

ET
