Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F83B5F48
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003551; cv=pass; b=eT6iOF+aoNUOjeRjbBT/hlzNcMe6gYIoSc6UysEI8bse7Oazl4twfb1S7/sXgQlM6C0W3xSC+iesKjWyZoGpM7noFqOAPslkxCSKN2riNW/SURDgFiYC3BBa6/ZjwXW93rH14jh2ZMr1imTpADt9CCpA9kCNTfaH6+Qi4W88oVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003551; c=relaxed/simple;
	bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/eeMTh5t7vNTilXFxknowBWWZois4N1Xkgk3JR07ibu8Edg/03rKN9cEr+bgDUc+vskMftoLPsaao7Fv+UZKqGEV7niHAu1YNHAY9F6hYJnMEM8kEKafOJwHsA+0rZXnEeY5/N5e35OmC71YQVj/OgQxlyKq4iXz2PPsSCweWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5FMzN4h; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5FMzN4h"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a0d7so116444fac.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 21:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791003547; cv=none;
        d=google.com; s=arc-20260327;
        b=gY/942lRqYyl+ltp+cXKHCDrv9MXn/54MOww73Xa+KdMiLT8blTXjbLVAkXFKVHkgq
         NhW8aLZAO127hwt/j/8YjgYGVnIMBVXFc+y6WACnX/TmfU29HSlsEtUZ9uVtYEN+lC04
         vOAKSObCFwm3dV++S/hv5qC0csMFXy/c7b5kK3WjmJT9OGHSVNOJGwfTsWRj1WxkduGS
         MMFP5JxxCNMZ1ysq0DgaMzOcaoTq+4SUj6IbQGM/WEBRHJOWd07Xyt/5XtHIYJWS9dEb
         WzJhTmGjWDhOjaf6yJdn5fzeN80DZF9OKOrPUofhS6mcp5aHN/F/KR3qv0vdWZ/xSjnR
         XBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        fh=JKqtoBlgnhwC6jF3scDPrhT3MrdrReF1CUvvVt8sP4w=;
        b=XPVNgqQAuSE1n2aIS9N0c68hcnz3VZj0uRbCpvTaemtcYLJOOkAeuIv19uxnDslhIA
         pXyZTYbBefbwkoY0BBxQyx+YefsS2iUlsUsX4xSHpur5G+WTitFfkklTzwCeZBPt49EG
         XWnO76ChXG1K1dayuFIymVVmA6Rzw1fd+axV6oqZS4s+LE41wTbiZ5DvCvajG//VV+m2
         ARM6ajJsO7ZYuouXGthurq4EsnmCwkEgxQ85NrvgynzyQlREFXURHt6W0tgr+Mm8zA6s
         XFbAjO2mDhN0I7ctMf6h/NEY5vcwjtv7Ga9v2i6R+RKnFldjxaT9HBlK4fNznagQfmdI
         KLEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791003547; x=1791608347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        b=A5FMzN4hfh0U+4SXZX9pj1uek7sKa3ZqlGoeRLSiOOmCVMpcbJFWLhAOqa0PoQ7O7g
         jCLZfUwbhUxQ18Vo+UEHuSf/2pEKgqMJWTuwWnDWs3YbCp8xHTgGqAPh3wvKE6cm0Bg/
         PwGoMXHwn/aD7UmvvmqkpqDvaskQXKzvXWg/EYUQ0cOkvmyzaIo9Vw9nQRjPyqYAcnZ2
         uxK2iVo1wVPw6GTEKUnK4GsUXnO+4otewhm/B0436NCN3hIcwjJ5uKSPbMHld9L7EbBZ
         4p/EPM4PjsjctU8qGV0b8bswc9HQGC54mEq3UqDVC9pBxuXE75UwsPtLsjtPRVVOuPv+
         RvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791003547; x=1791608347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        b=fUVXieTS098i6bxB4Pgx8u0/O9fzZOT4SmjU+j/YldSE/udrZpERgVx2OHJAcLu7fc
         9PIcYn0vMZOrG2qBh7CF24CemgzFk9TMsO7x8R+SHd4R3vSec3RPeEo6fznRtEssdPCA
         +gG4xCIW5Kbw1doU2/laRnoxkd5noGvKK9+J9MxK+1zkrttmMI6zmpF/Kxj+J+kzw1i3
         ZxvoP8WsiT1/m+xTNXcGIDKTuB92Cuv2QXtV8RpnJ/X2+ov2VclEpnfVdly9tVsT+5Vb
         OUoKsVHeyxh7aHXkC3bcwjnaTtr7/bTR52wXiNfl+sV2Fx53glTMgonarMNXCuKkj6H8
         3eqg==
X-Forwarded-Encrypted: i=1; AKwUvBzeY2qydXCt0H7H7ZnOuqwF6AArUdYHPstAIWa1vv78ZVM/aeeSYIAa4KzVRbboGPWMVcDJVjy+f2SsgK5K@lists.linux.dev
X-Gm-Message-State: AFuF++kdRvFsO4clKBshchhnOVRBDg3qzN+QeWqQ0t+eCMlrub7pd2Q5
	vZbK6CMa79FtORQwyhgq61GUyqNP02EBR37gbhRRj8NbDSrRGh0h2OJNVejVTjtAoOmxGPFadOV
	rtT1Squ0ddh1MVXxe2v/esbe6e3yP+8Y=
X-Gm-Gg: AYBFou0fKP1L1DmqBefn2N/EN1piNOGVw92c5wfAvrUsdb/Z8Z0FoeG80DFivpcZtzY
	dIIN8+8cooImdabJD9ZqpdS+KgP1dYDp5HncAjyesSbAHjMGgYJotpuo2COXrxrRKnLFsAuT6HW
	4xN7E8++faKnH6tIpsTH2VGr0YpnTlt89ycaDFa+hRz1O7Lh3u4Bakv4CJrMFxgYMekr6D/HLul
	tobxqYYbb7ByKOB5qpGIcmf0WbKU8YTkF9h4z17fpY8RC6o9OsnpMADMEhHscZDot5p38+NfR1P
	FK7Mbji0mq02zj296tC1/ln4Bvd3WrSGFoeNLm/gdahJudIVwRLlF+Y1
X-Received: by 2002:a05:6870:6392:b0:49d:ff8c:205e with SMTP id
 586e51a60fabf-49e15e0f1b4mr4145457fac.29.1791003547211; Fri, 02 Oct 2026
 21:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20261002153302.5c64819d@jic23-hlaptop> <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
In-Reply-To: <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Sat, 3 Oct 2026 07:58:55 +0300
X-Gm-Features: AclHuK-DJYCkVcKcz3EQyuz62gVz_--FKN6noxc3KcgVxv052URH_j7bypIZRJk
Message-ID: <CANpqX3Z5_RHPHFCCovZ1jXiQcYgkB5uJVzAKX02udzt2+KDcyw@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I apologize to you all. I am the one primarily at fault and fully
responsible for this mistake.

Jonathan, thank you for letting me know=E2=80=94I will make sure to always
check linux-next moving forward.

However, the important thing for me is that I still learned a lot from
Joshua's and Andy's reviews on this patch.

Thank you both so much for your time and valuable feedback, even if it
was on a driver that no longer exists!

Best regards,
Abdelnasser
