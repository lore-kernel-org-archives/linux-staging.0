Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE023F074C
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205524; cv=none; b=pIUFaq/ksCFwiDZlgL2ZjiUZd5GPHc2ZyYKWfQsBjEJ5v/h0ao+yCr107LVAQGTj4B+3rqAIFzP9LWe0Zn1h3q/dVk9Bt+ajTS9TK8v6kXw6h2QMBrCQ2YcMtkk57mvEb/PV2mFBfmOYvdPF9ohcjhCmghUSxR656oUhYf16cdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205524; c=relaxed/simple;
	bh=dem2BpShEtuQa3g4FbnhWIzdEfY+yGoshJrwtnNENAQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=SqACraiLEcEblyYuzNa/xGil4JkS622MOc//G2TgSPSfTnYZBlzMtVgSAkKH2+6Td/jyMKV8JnTie7ph83QMhtTKeKK9BXth9bFWsvziZpXmoV61yod4aGqOFvUxga8lgFfF0eAXz43JRiGWQtcL5/MkuEUFJ0VuQ11fBr7OToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaxmmwPF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaxmmwPF"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7985fab9203so19420727b3.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772205522; x=1772810322; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dem2BpShEtuQa3g4FbnhWIzdEfY+yGoshJrwtnNENAQ=;
        b=NaxmmwPFPhcTPs7wXqUDilvkx5XHg+y6/AE9fYvwMhM02ROB5ghwcEKoWSc2FmIeDX
         kY8aZskHMWf112JAOlaRBskkXOkobvqbNTvrVCn1GlaGgZgKmmK/3+nXTdPok+9UVmbQ
         B4/+jGwzBGcPomJXkpf+TowX4wb59/a+KuXRBK1rwy7cU32KZu3m9hXkKHotlEcNQK1x
         s1XjHhnptgSYLEObH/oCmztT05syL4xB6niE1w6Kd6UADZPEzbZKALraqGLPeBpdL5+l
         ++P3vf8cNCYQuvd3f01MmmGtOTIz3NAjFbFiM/lHEnFh8o9ZwlVoNebhGj+7f321m/an
         DM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772205522; x=1772810322;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dem2BpShEtuQa3g4FbnhWIzdEfY+yGoshJrwtnNENAQ=;
        b=Y8Ao3lwskOc4AnqX2XksnRzXP92bFCtZn3qhAsyfRVulqvYxFR34dLg4SCr8t9UFUd
         NeMaltksHHvGtjHF8ealmhCsC6ha/i2EP4B7lyHvS5xSY6MbrK7Yiqex6u9xQaRI9E33
         lfRc0whMYtXYDvDwoJ3MLNaOia9UZ57T1wX9tisp2r1M3bp7TbDuV1NxWAbkvGZNrwbZ
         ps4tMU3OnoRLJkKexhZj5j4S3dx2LJVvb1AU0Uy5sHU947CRuSf4JYcaW4nVV3cEQ+w/
         x/xoOYmbJJqfQ/bTyhxL6WrLVQhcQdhgEqe6SjaQfXga1Atfck/lDwuzjb0keErNmPoK
         PkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzVUsGpodbBucB2ym2K7Cs3sV1yjyOiFBVFpN3QSVMqf9HsOCX0s7GBhQcn2egfhhMsLT/RCY6RtyoumAK@lists.linux.dev
X-Gm-Message-State: AOJu0YxF1jsnkICj9sFznm1v90aqaeH7QDrjLV13oEA6wpFJb7NSmS3D
	Sp+djKh6OPMti4hK6fBMRcbMztn0ubuv1iX4hmA0KYsFnEUJAxttUWxC
X-Gm-Gg: ATEYQzxxyDHJdNAHg8y1BFjvQ9F9yk1KXFEM6tC9r2g+Klizf5VfegbctRkqFOtk5mi
	C/+0ZPcjAXFZ0LU24Nnj4b4I0zvq4yy+Jl9hPNAjI9ucDuwDKCDO/mnk2kozlFj1JMbnD2X9xNT
	k9ii6k4Q6wFS0p1EIdOSKz0ECEMQIiczepTiiOWm/ncKEHuSDrZU9RIrEJ+43e8Vsg78Rg4QQSu
	GVSw+0UL0FtP3jRjeMQ0SjCKQscIpMVMH9/VlY8qs+k3ZvsqQeOjn49iQ5m/7Cd5n1DLIGmx3O2
	YSLUDC3o/KnTZZACaDsFuncUKiq/bQNhcAq4rUQje8GvJI5Fm7xMrM2rZ7rohs2AgTMPXPsjYrH
	B09StnVRK0OVtiiae8WhmSHwiWgvuArso2bRCQg46Lfp7SJM98UKudb6SL+hdb3LDlT5k3qd/K2
	ENzZENQ+9LBIhcEnUOebEn/lPwdHHkYOgHEnT/HeJpsvJGR6Watzdba0M2GDwkuENBm2Ox6UqNz
	aDmw+BoqlZ/ZMSWUfFboqRYc1qNs0gkzXldF70hWwQ=
X-Received: by 2002:a05:690c:890:b0:796:26af:613b with SMTP id 00721157ae682-798854ced63mr27806227b3.18.1772205522256;
        Fri, 27 Feb 2026 07:18:42 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c53644sm23076617b3.39.2026.02.27.07.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 07:18:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 09:18:24 -0600
Message-Id: <DGPUF5A1SKXT.3TSUTM6ZCRH3N@gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: replace msleep() with fsleep()
 in rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Minu Jin"
 <s9430939@naver.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226010536.179729-1-azpijr@gmail.com>
 <20260227084623.209913-1-azpijr@gmail.com>
In-Reply-To: <20260227084623.209913-1-azpijr@gmail.com>

On Fri Feb 27, 2026 at 2:46 AM CST, Jose A. Perez de Azpillaga wrote:
> Replace msleep() with fsleep() in rtw_cmd.c to improve delay
> precision and follow modern kernel practices.
>
> Specifically, this fixes a checkpatch warning for the 10ms delay
> in _rtw_free_evt_priv() and updates the 100ms polling loops in
> rtw_chk_hi_queue_hdl() and rtw_free_cmd_priv() for consistency.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> v2: changed to USEC_PER_MSEC instead of magic numbers
> ---
^^^
Remove this.

Here's Dan Carpenters's resource on making a v2:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,

ET
