Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6C833D518
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237211; cv=none; b=ApF94QegTOnaj4tYJqoEaDZ6mkpsb+y6UphglipEG5qbtC0mQBGyF9t+4A0SBHvKNcIAh0IJvhGoPZp5JccCmzn2IW6wwihFF70Igh3t//l+ll7VBk9RMPM9qmy/6p0cAJlOsgvSVo5jmXEb8yL0bDm+DP1rkN9B3S2g4BXYSSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237211; c=relaxed/simple;
	bh=Nf3L7jWNjzi15TYb/9IfhXL63sgK08nSJfHq1hL6ELc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Bm5cVLChGOO1E3qbS5joutWWlNdODYJc5fuyfautbr77GkR8do2SRxXaW0eZakYUj0wLzqQ5+DSCjtW0XwOO2eDBMGFIfBl18L8xAUi56KhcxRAfa2zpGkf5TdMy8ycSEozeMln1As1ZSVnbNVHxYIPOEVLytRRKT7uir57zBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZgg9FUd; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZgg9FUd"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649bb5a0ba1so355975d50.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237211; x=1770842011; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf3L7jWNjzi15TYb/9IfhXL63sgK08nSJfHq1hL6ELc=;
        b=BZgg9FUdP7bEqYSx8a3qD3MsfUikjC761rRRMPyWEsMPRmtK0zfQJm2q27XPJ+LjSr
         rm2z++VN/irVA1dU+6URwrx7S2ibwcXatg6UecLRy2PAegnFjgF9WoQo+RUkReH/j8hN
         8UmAtJDhxML9uuBRY30R9tE8wj/fmYVeeHNzXUnFHjTkJje2gl2GVpOl3r2ru0JNPGFV
         MD84rgQ6sWkqOsvZXgGCUqK3Dt0+tEgdTjN4pevO4oM1ty1tg5mpaHA0+wMrrHue2olE
         URFT9vQ0hXTJqlpuqjmUKbR9ijaY0+BltH4r5hnAVkohy6fJ69OCFO2q030JFJhZGxzc
         oNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237211; x=1770842011;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nf3L7jWNjzi15TYb/9IfhXL63sgK08nSJfHq1hL6ELc=;
        b=NWcl7ZRSoeNspkA/hW9OIVc8cQQX6iWkBvxRi13zFVFvQBjYo6RrhINRMmo99IuG2a
         gGzF2algTVlmpBErt1WMj2Te8QM55tMkxmU7kqB5c5R1Z9BnTjRxLN5y/ixcAf00SdQp
         G9RC6kqoMezgsYILhegGYonTxPD0kpoD51Mq9FjwNyKJJafSDYcQ8GAj9/yYavWSnuPU
         TkE2adjQVdeKiS3VZXVIdpRZj+/5TvhSZOfOtGXxg7tZeIsQVU5qnPrvlYQNhAVgzMz1
         D4/trkEqPEsOjfDjfxKCwa8gEauJYVbpwAQS2kY/oTS4fm/8qAf5LDaklkBK44wO9uMX
         al8Q==
X-Gm-Message-State: AOJu0YwlFNyj1KjFIALWsGpgxdsYn89uN16qboH+DCR9oDuphaOXnJsX
	jfr0Coe2uzXiVxKYVyx9gRHT/GAijMRd6rWIop0AjB3qTnFIN3hhwJwb
X-Gm-Gg: AZuq6aKVbuSFdwzW6kUs9iKuJ0wr6lMUYjcGFIn4SYsAkUsaJhe3YN9dxRHpzS4VGiR
	5MDEuZ/SCzoQRijEbFgXahma/+N0WdSX9XbKIuzZwTmjOF4aHW2h65loI9uDFitaCI/ifg8N2jd
	ibwCO0XyHb6WagCgPTCHVSxCYrMio4yHcMQ+dbLoUQsZp6+lxCmihj3BvJm6dyLKPWK123byHKK
	ml50Wzwd96eIaE4+tqMd6HJao4XXl5uwobQJc/s56vD5OdgSvXhhNqU+88hXIMCW9eMeR/nDtFr
	zGrTfgopZYnG3ppIpwxZjMeneMevvtmF99grjuwrHni8H7JNOQgh9Xgk35hX31b+oHBF7v8hMSF
	9FoBqh40sFjm0+gc4OaqYn3iuBpW0gyi1oRgz+rl9qF6yIGNn1anVn+uFwU9RLFPXnm0p/v4TUn
	au8QTL2s++V7LrNLapXxbL+AvrFxTTW6M=
X-Received: by 2002:a53:cd43:0:b0:644:60d9:8667 with SMTP id 956f58d0204a3-649db4c49edmr2613205d50.88.1770237210667;
        Wed, 04 Feb 2026 12:33:30 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc4b730fsm3413965d50.8.2026.02.04.12.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 12:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 14:33:16 -0600
Message-Id: <DG6GPP22WJ92.1RZQ7OT706F95@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haroen Tmimi" <tmimiharoen@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_cmd.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260204134447.138362-1-tmimiharoen@gmail.com>
In-Reply-To: <20260204134447.138362-1-tmimiharoen@gmail.com>

On Wed Feb 4, 2026 at 7:44 AM CST, Haroen Tmimi wrote:
> checkpatch.pl issued a warning about msleep(10) not being at least 20ms.
> However, 10ms might not be precise enough.
>
> usleep_range(10000, 11000) is a better choice.
> It allows for a little flexibility in scheduling.
>
> Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>

Looks good to me.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

ET
