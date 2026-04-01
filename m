Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B32315D53
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065101; cv=none; b=rzCF3rIYGcPRMJ26rigl7eHdYdLpsffX0/kvOz3nnNvZhTdWBjgxA8aHQTRLZi9g8HcYTk2te2PMfVKMPTyWXZH6UWq0QkfxmithTvO6slZDjvlRC31YoUHupD+5mvVOq9XhsljDw+GKo27vLzBfIRMU+4lfI2adxtYs7xi8AII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065101; c=relaxed/simple;
	bh=SOjKSzM3BgV6eLJgyY3XCDOeSA61O93L5BFEGEdyvXc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SqJPakvy4wbtz36bTGk+HgaeUQREU/ne/ESpIohu/kmRduj+Mt7wvlcGmfEgaIrOL0qNaHXJ9HV/BhFnJ758vKMfpRLKidGE8dKm0WT1jwfdPzozf8+2nLWJIGdCztaZBdbYwn1KUUeX2JM5treALutsYXzoZPY5XmyQbt8U8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvtNEt1v; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvtNEt1v"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79f855b2575so12802387b3.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065099; x=1775669899; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvSKeYTGipIaYmg1ItNsl0PZ2s+DqozocFmQZzRtZoA=;
        b=XvtNEt1vT8bU24rhm8Vpkp0lag2gxgQmmovMxpsNouKOfrX8ZZpw0NdOXqdOuc6YEL
         SzbuR5snCxVHKIk+Ir84264askli7ZbrRd2q8DWjm21wAcsA2xG+vvSiXKxBwGfTRm6t
         Wo2ZTaQMO5crhuzhzXEyDUHxvVr6abcZX+vX0LpAiimfnJIAYSJ4XB1KtQDKA4OYTsbS
         vNDbTeRk9r3fcmWzEikrj/HYASbuBdKj8WITNBXnHhniHvoiACOxAHr+zqrBuvzzLmvg
         oWp13cLx56ArNc/GJ0hj7hoeBG9gFO6sR9kQANEijbwW7pK1NAa4+A1O3jskvcPA/4ri
         YMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065099; x=1775669899;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvSKeYTGipIaYmg1ItNsl0PZ2s+DqozocFmQZzRtZoA=;
        b=TIabkf3u+h8FhSbuemd1uzl79jiCSD8svd2XTiz8q0Yqs/YyzZxnx74TRD2WK7MSQq
         kzr51stktpLUuxWGxXGt7GqFABz/a562Ha/7u2z1s5ZPK1IgjInoLJVuQYnB2D/tHRJR
         03rtHrOwgakcq3UIxhE7WSXUJ8zIan1qzz8cwTP0qxZpnFG7DjMe3ncQGGrw/P12HRE0
         4yhekQrxCr/4B+eJpPPuNAk6I02eytGlq2Fbq/BFOfkcT+kac85piVFXDD2SYUZQLFg3
         Y7OyfpQQGvWXp5lXFtG/hW1zr2t3kqRpBDVb0sw8dc86O16KK1IJ+AH8PqosFtG5OeiW
         iekg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+jQoFyM6FR0iUmHLJ25vmkduxlhqP1tBqglLgyeF0Y9ZP2fFTTxTpzOhELbcww6jrx7GkoLxXUo7AwJy@lists.linux.dev
X-Gm-Message-State: AOJu0YzW3PPCOevwwZjDLwxo3/r5cY308s/wxdWnLM0Qd+5UcNJ7UUmI
	6RBEYXGINxMve3KXHiAl9STME2Wp0dn/pttyj2JsMRWez/9n6Bd3+bkH
X-Gm-Gg: ATEYQzzYu2Q3iNNw7Vlpa7dlUgGlkWmD8iWBK9QHGeIQm2JRGcW+u1ekjqG7CSFb0aa
	Sm8wW5K45Wmu6X3R4uhHQJ2Kzblx7dD7mJnXG+e8IxbeLm/RX3OOrNdujvrJoLI0RGh0VAG4FHR
	4RxXqfctcR7WZC3M8B0M02DdWdFg8UEQO1EPTXWcorxUYjahtwXdY5roTBrWwc5gxoiW7R6dMJV
	hzMHoJIqRlJCm3p+aeUEfnYqhJp3NWyghB411QYI+Z7ios0tpm4OanN5r9zaebcXdILTqxc6pcH
	PqWSNfJZCTrkNpRi23KthtrF3lqODJOYtFU7XbipsuEhAruHt1W7wV8HG1DAA/Jh/xKofLKswCr
	YxNOPlHj6QhltXM1+wDg9u5nwGviXBl3+R66ugpp6izwFw1ETRVwGE0XTec/ShDKUhY99TXiihP
	w5njZ51DNPgCxlV32D0miQ0u+UDpjSz/fSrd0AjUdP2Fs5G79UVQ5XbmRzH8vLZe5SdiGnplGKC
	m6zRsnGe73tncrlCDFC3KONiLrch8rq
X-Received: by 2002:a05:690c:386:b0:79a:62a2:b3a6 with SMTP id 00721157ae682-7a21263a07emr48013527b3.29.1775065099404;
        Wed, 01 Apr 2026 10:38:19 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e228f75sm901597b3.10.2026.04.01.10.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 10:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 12:38:18 -0500
Message-Id: <DHI028NONLPC.2PWE306RVXTIH@gmail.com>
Cc: <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <luka.gejak@linux.dev>, <straube.linux@gmail.com>
Subject: Re: [PATCH v9] staging: rtl8723bs: remove commented-out code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Aadarsh Mandal" <aadarshmandal9354@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260401095550.33943-1-aadarshmandal9354@gmail.com>
In-Reply-To: <20260401095550.33943-1-aadarshmandal9354@gmail.com>

On Wed Apr 1, 2026 at 4:55 AM CDT, Aadarsh Mandal wrote:
> Remove code that is not used anywhere in driver.
>
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---

Since this is a "v9" there would be a:

v9:
- ...

Here.

> v8:
>  - Restore the formatting of non-commented code.
> v7:
>  - Change in commit style.
> v6:
>  - Change in commit style.
> v5:
>  - Change in commit style.
> v4:
>  - Remove extra space insertion.
>  - Delete remaining commented-out code.
> v3:
>  - Add the extra space that count as insertion.
>  - Remove unwanted addition.
> v2:
>  - Restore braces for standalone code blocks {}.
>  - Delete reindented commented-out code and extra space.
> v1:
>  - Reindented commented-out code;extra space remained.

Thanks,

ET
