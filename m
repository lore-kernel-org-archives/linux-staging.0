Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495E215F5C
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 02:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158618; cv=none; b=dQzS3PRoIwwEzBRAuuU91llDcj805DUC6eFI5rsCb7vG5Y1IkNrqcwuvgljH84NZmxUjAhVhj+SkkvfEE6+bP2JcRDvz95IXbzi//N5XlRrdOKMr1dY7fvte3UfEyCZ13AV7HG5qsoKOnRxaO+mtFtS/2ayoly8s1C7R7WBTKrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158618; c=relaxed/simple;
	bh=M1p4Z0k/nkBEILYIz53/0Ifq9nKXURgwVe+ZgwvvYxI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DbBQrLheoanuAQE8Wlh72HLtCBDsEOl4KZ1g5G1s8f1YZl1xCaNzu5AwzAX9R7w2xX1JTSsBA1y4Ln/y+E7W7eluglRpzftgqQUK9fHRgQFhinVx5ExDKZTY83cStQNilSyBLbXu0X0B5iBQegoXYAnCK5sYW2WrCwtsO9+YVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwCDxSBy; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwCDxSBy"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986d231b3cso31220767b3.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 18:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772158617; x=1772763417; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1p4Z0k/nkBEILYIz53/0Ifq9nKXURgwVe+ZgwvvYxI=;
        b=mwCDxSByJHYgCxT42p8d6Ph9nBSZXrkG/r4yH2PMHRsPPu+UPXAUX49T7qhdgDyImp
         C/aWEOarrLxoMahXWD3forrGzohAimqkTZfaN6cN7nrXQssk8U522WfwbGyj4sTwl9O1
         FeBIKRjIqVgFg21qlVZ1YPVJn93xKpR9gPpwJpA2KdcpaOAPVhNN5cVkSfeZ41rIzwBv
         N5lZ3EfFp2w6RQpIO3d3OZCCcBnLulX7gp148MtMYmshOOKtXMyIPEVmhoHVoIbrgFp9
         qD6UrZwcAKkAVjly1+7tJaRMfrpt88YHk1V0gO9FU93B429Th/BDlkRIRhbXEcP2QnP8
         hkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772158617; x=1772763417;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M1p4Z0k/nkBEILYIz53/0Ifq9nKXURgwVe+ZgwvvYxI=;
        b=JJ58HGgjVR68enoQ8C4uUviZqVBkpTQNVRgeXm9w4VcNZkqYQI71vS9dzz3uY8N6WG
         WZvj+IZQzAXXx3vSLoripjPfbJIBA+JUWUsUGyi5V1mNkWN3bQg33rsVJ+XUXik84pxO
         999+kJvaZgtQMFlvKM/x86I1WPl7D9dM4TDm61D/L1jKxzrLZPb4mT7WrvlNAchJ5azk
         APINu2S/yxk3bFOuIPUNlK3bu6fbA4B+QX9O+Z5HcRhq7Db7cL7k+O+cLPGSn18CqqhY
         5XmRzlNrMYqb54yZrtZwssf/JOazh3GZ/MwQ3rNmlcIYIafbj44Yt+2vzs37NUbH5+1k
         hfjA==
X-Gm-Message-State: AOJu0Yzk+dpzVwpLZAluJx2NpgEAkU30s8pX5cwsxnLFC6IYm1sr6izW
	rev7ggdzJXRAwskqmLkkb+viGGHmOq6RN21nkGtMXGouszahvnrhvteH
X-Gm-Gg: ATEYQzytDt5j9bdTZen/7ifJzovoOUT5aPaRYHQHx+Pg38/QYXAUtI3xwygSG+S8rM+
	LT3i9v/x3obpCP8UduzE1TwFDQ0npVZFUoSXNroz4DevuPhrdTEJQVHsC81yxCOhrWRS5SMq+qc
	4osl8DbPlDmSHwTksawk1ib0Jm6dk1aO2amHtPtZJdwNuszqNBe2/Q5HJnRbC2TH+cNl4/YMbI+
	/HfSzdN1ezAsBFqaR4/uj+aUvi0PBfS+Qr5ka3T19dQ1cJIok0K5h1PD7oJ2nxySxdm91Ldw7UD
	gVp2qrmtzjQj92kbdRTT46ZnEsyu2mPA6PBDdvPHSUJ/aLaz3j//mUQdvOTatp1+ANdyhh2hIYw
	vo87RkrGcUkOozu7QGcaFYeWwhKL2qhrYts2kWaMDGKLg+TdIWSbbOi6Y3Y+63qjcHNXhbKBnWY
	LjDFqOWvV59pBTvfmhitIoE2L6nrwLl3iyGrnQlz8I6lsSGSdS1KHsNiIAbKk+Aos9pcQwd+N9D
	zEZaSRJ4nI+bPAtW17ODevAe0l8UR1P
X-Received: by 2002:a05:690c:386:b0:798:630f:8573 with SMTP id 00721157ae682-79885aa06b5mr9473307b3.24.1772158616582;
        Thu, 26 Feb 2026 18:16:56 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c47f82sm15613367b3.36.2026.02.26.18.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 18:16:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 20:16:38 -0600
Message-Id: <DGPDSKXS6NJH.3MWCJMW7KLGW4@gmail.com>
Cc: <linux-staging@lists.linux.dev>, "Jason Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix function header alignment
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Dhyan K Prajapati" <dhyan19022009@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260225085747.9639-1-dhyan19022009@gmail.com>
In-Reply-To: <20260225085747.9639-1-dhyan19022009@gmail.com>

On Wed Feb 25, 2026 at 2:57 AM CST, Dhyan K Prajapati wrote:
> fixed header alignment in hal_sdio_get_cmd_addr_8723b that violated
> kernel coding style, cleaned the header by pulling arguments onto the
> same line.
>
> Signed-off-by: Dhyan K Prajapati <dhyan19022009@gmail.com>
> ---

LGTM. However, next time say parameter alignment instead of header. Was
a little confused what you meant at first until I read your subject
line.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
