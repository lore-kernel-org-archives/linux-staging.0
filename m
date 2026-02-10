Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977212765C4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 02:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691046; cv=none; b=BzHu2qGhm7AMg8uKShztAmZIUMkN+g3cbph+dM7ebDvdRAJiyhxH8Z3Q0e/kohcHIwMuma6CugBeRG5vvjXThTURUYEXE44Oj6CAYtNeJd8nfkG8IaQOPfKN7TICIEOogUsZrMnb+6IBd+kEXJcLhDp46CC0qFWpbQrxjgKArag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691046; c=relaxed/simple;
	bh=Z7OCtUpBeGiJ6J0nuyzFoJ3taqAGGnwIZISLR7/calQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o81CUma67ffPkD5QGDaxeOcS21laBUhUrsjEXpu80aAMIOPaZGZWgDr0N3+b1bACt0z+JWCPyEv86yefNbnss/D7CGswIUNRz69Ap3uiDcaKksYnkw3YTUWljHXF96HwbW/6jIoP9Exsib9DopAeHK6L21domRvDdzJOh+26Gfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1Z8GVKC; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1Z8GVKC"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ad8435f46so2820310d50.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770691044; x=1771295844; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7OCtUpBeGiJ6J0nuyzFoJ3taqAGGnwIZISLR7/calQ=;
        b=J1Z8GVKCGUYtXrHToswK8gzCt9xOLtk09mvEu6lO/khZ9KkIThwovadkdsyxOSvbPg
         6CusHhuJl1RIsNBUXVebDRSC54DWDr1jH1+NJYcGlom/btLStQYD0Pkm8DDpSNVeffGJ
         n+ymaC0yqkioTkDKat4mPonlaezY0XC6yAHAJ0Buz7KznbwanHTZ8BvUzgOTz92z2ULB
         JQ3oDc38GuqzGVdjUwVMPLxw/Klxuy9FsO4WdUolCHeSpVw8DasRTgt1og8/6jXZoawP
         mZ3Sz/3IAUNlOvX09VsJK5MYslO1OmQ363RDIc1oBfZOmavwPaHNO+J28dFIhxb+1p/6
         YQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770691044; x=1771295844;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7OCtUpBeGiJ6J0nuyzFoJ3taqAGGnwIZISLR7/calQ=;
        b=gLpMiGVP6CCdw6cr64OEc37Cl+oFpb1peHqdNJxrWwBO6KTfjd5rbveS5vRYCFZoMD
         Vy8Q8laZiGTbF93fNV73NiA022IOamefHF/uLhMcYRnhZ0zicg1L0vOlIMtpgqYSbIdN
         cYAHaCbOyeAcTJKTL+fPv9Au+vVAqVzPu7NuY1sdtY+yWma845FkHJqfv431oW7Hbhb0
         rb3jgPRGcJ1rB3dW2jKPuGnJA7eC5UR6Bb9/YvBTCiA93k+W0zhmi1mnFj0v+y1R/h2e
         7egHWWan7Rz/HM9hASsNurpQTaKn/XXdvKOxlgvxYZLMPzEEpxoq7ecVFtDeisBdMf+c
         fKKA==
X-Gm-Message-State: AOJu0YwBPbUCn21W/Ukpj5vbEWJ4dM4ujyJW8J1FsThLLvdODABtdzd3
	gqEU9bINfp6mOLinpq69oBCmIobJ4VpGuT2IVeSMLeCcKFQk7pKg9NHR
X-Gm-Gg: AZuq6aI/cpVfLCwxmblKcGljKBmRIV65fHSHOcJoMg/2QyLVNkPE4/D3t3Ium5gq73y
	j9Kc+j71dPnf534v+bM3IyLoRvtLb2hpHBhw1POe1p0/MNs1wrtPm9BL+NyEwYaSXfEX2rIFUBQ
	5aUW5p22Ep0dA2pb0cXCDzxOpMeqzd0/s8JN2M06uMyM+o1jijeos1sTeoJpqgzruRUyiCFK41c
	zocdMsBZCd4JC0y9OY/d0ejHrjUwJ3xzOsxosOrs5UH8pC7hjVpUonRr6qeXFSSsaKnMdOYcN+U
	3DiZxXi0m/NWcNxOU35tKFPeIF6+8B8p9qfaBEyZmPNyyRq47FyBESkOmtE4lEKvaw/JKCYg8AP
	2BH1sfsESs+8hxzZB4sJQJJhTwqNdjt8ovf8XQ6vJnTnnsOfRUlrmya6nJg78siY9KOYhAHmxhB
	PhEVqr2SoE6KrRMeqIW2SAtp0iCLg9kgapm1oQWf0HmOSBIzgr7RnIiNsqCLWErAbfonGvX+ChA
	WlAtUbwjNqny+V6DtMjk9GgByZ3e3Sk
X-Received: by 2002:a53:e20d:0:b0:645:591a:cb6a with SMTP id 956f58d0204a3-649f2074196mr8130793d50.70.1770691044572;
        Mon, 09 Feb 2026 18:37:24 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ad728cf39sm8708017d50.9.2026.02.09.18.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 18:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 20:37:08 -0600
Message-Id: <DGAXL0XT4SHU.2S7DS74PUMEKD@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] staging: rtl8723bs: rtw_ap: remove unnecessary void
 * casts
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Siwanan Bungtong" <horstaufmental@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
 <20260209235133.1292161-2-horstaufmental@gmail.com>
In-Reply-To: <20260209235133.1292161-2-horstaufmental@gmail.com>

On Mon Feb 9, 2026 at 5:51 PM CST, Siwanan Bungtong wrote:
> Remove redundant (void *) casts when calling memcpy/memset and
> other helpers. These casts are unnecessary since C implicitly
> converts to void * and they only add noise.
>
> No functional change.
>
> Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>

Hi,

You don't have to write the file name in your subject line, "staging:
rtl8723bs: ..." is preferred. Please resend this patch series with the
correct formatting.

Thanks,

ET
