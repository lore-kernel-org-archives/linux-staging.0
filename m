Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DF22154B
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 22:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743545790; cv=none; b=m671rZ3NU+w2+dW22FNRUkSmrW3eF0gy+2rBffYABMBcQnSyy95BPXVrS6C1cz2yNFUYWvJMU9lbNNXCdlJSP9C2sfkYXW9HGJhYkw0/ZNO2rKTmCiuFtcNMOlP7QSBSRTC+YsoWOc4hCkdQLl/r3dYc7Tz6binyKK/fsV6eGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743545790; c=relaxed/simple;
	bh=4ZZoMk7Bzxg7EPnIPY4kMYP5TXrvahs3Zqj6VZqMzGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pt5JBherCbAaGZqf2Zkx7j8pjjo4XKlcVN/fCYP8TgZGNUxNoW1Ak7x46uEp7Zmgp+k6ffiqsR/S5kKyYg3jZH+MFfYRhY/uOioKU7t8BdqD9Bz0NoMxuqR/GWSnqZIVa48kRH8WRv6a8jrzHsaT+gQHfxdBRoJRC+mJ3T1GMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqW9cyjH; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqW9cyjH"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso5604418276.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743545787; x=1744150587; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZZoMk7Bzxg7EPnIPY4kMYP5TXrvahs3Zqj6VZqMzGM=;
        b=IqW9cyjH44ZAjjz6VySo9XTv+4QeoZwheAaNgVQywsvudrzHuXgDmyIL1ei9BI6gYs
         5M2ZK/9sQEM/uwJO8PvyaJdXvhgtmkWPFYR3OL7O3QPaowXmtvFOxgqlcTc80r7Ctgcn
         OlbYMnZEoH2hfrRSAyVr092kzWtuF7CUncDqSoHWFtRPzO04QA4P19sDSHM8sr5hLECH
         a93PHKvgUB5QcYzihPSvaGsfMAc+1MLM1up6JoW3ppPjsex8dd1F6x+G4GlJfSAxO5q1
         xrzREbgIf5QuzIui8r8nFZt/iB9xzPImNSFCZYk5rdRCwZJhqhPEXk01H7ux7T+zLpvr
         wC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743545787; x=1744150587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZZoMk7Bzxg7EPnIPY4kMYP5TXrvahs3Zqj6VZqMzGM=;
        b=XX1AzN8csZ/J39hJLPlwGJhnhFw/G1VfsaB//ZfA9EySJwMkDJ5WTzroMVLdI0XPLN
         xhWVixS70diZUSxGDMrGhSpZzq3OsRBZ8Qn+KyBZexKBFY9Z5jRC7EOkyTwQbC1FtzPZ
         aNxeyNLpsgoJ2OiKORpQnOjWfwA/6CiV3onbSGkAHM/swa1sphFQbFeFY9+DtPsOpSbY
         FFXnhCF2BgDsxBUuThYuojResKig8FeFoZreoQZhH1lPNMtKsSeuB8GtYJlMnkT1+U3+
         9LpQX+TOsK6JYqUB6UMUtZI0Ty/94RCmDpynpI75D1H/k0oPJnEx7mm2CKuEQF2ct4df
         j/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUDJEK2IbiaqCzWDU6Vn/lDcvBLlmxCFNw0ROvug6ci6qXWhlzXbU23ys/esN2mCyucZ1xZQU/G424sNjNp@lists.linux.dev
X-Gm-Message-State: AOJu0YysYhdprpljguqJtJVnS4oc11cYh/kZlCInbWdYQHbdes5uGla/
	VWk8q3Ufo3eHauGM751lvpPNqFMGEVp/KYn5FIe4V2hzftfTxNnEUwdOt3SPO4E/2W0KstVQnTQ
	VkqzdlZRnWQry9p6WiRnteoeVM/4=
X-Gm-Gg: ASbGncuuBYnDpRm5CNtxD9Ci/aqP7gYTyJwSGa5umz667R2vbMjpn604frbgQThfzJZ
	p/dsgmhLe7rvjdFG/8JrTuHvYTudwFGrubX36FghoczjK1enav137t4NokKJlpe8BB5TBHGb/L+
	SeT9GbnF/fBxCRJQVDEGqgb3kAJps=
X-Google-Smtp-Source: AGHT+IFyrBa8Q+V3emMv0/lFeitl4RCHClPtJE1kMBHwIgnDpEGVlYmEqnl5qU4nw4mkToEp+7y4aeRAOhEpWv50Gqs=
X-Received: by 2002:a05:6902:2747:b0:e6d:f287:bf3 with SMTP id
 3f1490d57ef6-e6df2870d3cmr1158460276.28.1743545787458; Tue, 01 Apr 2025
 15:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250330135402.105418-1-simeddon@gmail.com> <Z-lm8l1ILFuJE5YS@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <Z-lm8l1ILFuJE5YS@debian-BULLSEYE-live-builder-AMD64>
From: Siddharth Menon <simeddon@gmail.com>
Date: Wed, 2 Apr 2025 03:45:51 +0530
X-Gm-Features: AQ5f1JqRj0rIFNX3PN0empxqba0H3yBaX-Fa98HS939Csdmd4a9CT6Ad5e9h1pQ
Message-ID: <CAGd6pzPe71oY=+cy3WqKPyZ150q3pOM3LrPE0_ENeKgd+OvnfQ@mail.gmail.com>
Subject: Re: [PATCH v5] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, jic23@kernel.org, 
	Michael.Hennerich@analog.com, lars@metafoo.de
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 21:13, Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
> The previous implementation would set ctrl_fp if val == 1 and unset it if val == 0.
> This patch seems to be doing the reverse (setting ctrl_fp if val == 0, and
> unsetting it if val != 0). Was the previous implementation potentially buggy?

My apologies, I seem to have made a mistake here.

> Hmm, this is modifying behavior. AD9832_SLEEP and AD9832_CLR were only being
> modified if something other than 0 was written to output enable sysfs file.
> Is the patch code mode appropriate than how the driver was before?

I shall address the aforementioned issues along with the ones pointed out by
Jonathan in my next patch.

Thank you for taking the time to review my patches.

Regards,
Siddharth Menon
