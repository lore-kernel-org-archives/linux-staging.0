Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CAE2D1914
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157845; cv=none; b=F4T1Mi84n1+HBHVrg3WalooBpSIZuP/Q2altELMl+uAiwWAVNq9LftflmyELdFE3aH1JrK+fBGRXxMIGLmK42F7tYff4OYJvx1omQj4q1QKfxUS1sGUlI/GdCVVsdEoVEv3VkWEpixJGevkD8hA9LQOrbBoFNyQW4/SHLJOgYSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157845; c=relaxed/simple;
	bh=L0/k8V3HbNC3Rbjv9wQ1SK7tR8DEowT2Ha9rRtvNk/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T3Vux6qr3a0Y3IJD9fH6k/BSxeU+yCNO2zToGZUN7rvDss8a8vZqpTyNVeOu25vqguCUPYrbfHRr47vzN1Suct+CEeW2Z1NRCsLsYwEAzcrdTYZ+79hAVBeYukWI1EGoZCO320A/brho27ruXCYjiginf4H5aQ3BpJtBGS0ERr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX+rhE/k; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX+rhE/k"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79885f4a8ffso3181057b3.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 18:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772157843; x=1772762643; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mky5EJIKY6m2lCVUPp9GcJwSxelYZ9nTjAx3mMslLwY=;
        b=PX+rhE/ke79cjC5HO1vtdxAR6Lvs+rZnlKH2ut7ma2YCNPgzN73xQcxUxb1pofJ5m8
         w93U6sOcq+r7TOY9W+6ttdoB5vLWv90gqqHLWessvlJjIw7VWHQhPpQtgdTUc0z9Fap7
         y81Tv04LVjsIA+/T15eV9dK0Ccjq+Np8yyoBrp+XWJQYtHb4v/uF//ue/vZTk7emP5B9
         YK9yUzOjdwsoIyKvtorzOTiSyNP8V0L8yL0F22BHkfGiLXBzBB05pLsLBpfgVXe/e0mL
         Ib9iMV8e291YGMJrQFj5WurC+/V58rysU9NZjILXFJPDrbe7F7GIgiqfu0CUDiW+ebXB
         aC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772157843; x=1772762643;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mky5EJIKY6m2lCVUPp9GcJwSxelYZ9nTjAx3mMslLwY=;
        b=PuxzT+ZgHyBWdOgBcGc+8mlr8nAL5a7QQ9lqqoGtrCi9FttZ809Azp2jiaJdJbIcqw
         K+Fpmr4F9bhFVeccfuT192tzm8FIstF+D6TeT/AMTQFMTrXrVlYPACs459Hui62/eYUO
         yV5saNPCWTExMsbL9ff/NEEygcYGToYkSHsbR+8KA9dxBQP1IyU/hSb+7KdcISDrp3Kr
         /Cu12NGpM0veJpScDxOiUAPkqhfPGJPLd1joOoE2gMqNQCbBAsC7nl7H4dp3ZV0JNpkO
         3aniWq11pkFj5LrNe4Ug1eFuO1gM7EKDiUsCGrKpYYI+LT8YRJ4UrcYzafJ2Jtcizar7
         cWrA==
X-Forwarded-Encrypted: i=1; AJvYcCUh37PYZqu3lIggdPyCFzV+Zab+pqcNSHMBm4tE4y25D5LnIwfkY98YNq/xjzf9limWD/bdTRe5cbZDScVy@lists.linux.dev
X-Gm-Message-State: AOJu0YxrFvn1+QZzKiMi58+dDEsOvDueaqYS10fnBM2VlIdnV8GOng1J
	1/9alELQE74oOYwLZMmQPCdxykMAFqRnI2cCRsnBfykKBsCl4/yhUGQ5
X-Gm-Gg: ATEYQzxvTdx3Hhn3P8s57tb/+wX5riMAGUYLS/8A8meYSii+eAxW/u85ukkXiIcCQhu
	cwbBwOJT7bejaYSZAMTdr6tQQm44vYw+JXa7RhwbyDNZ1A3dcmPMBCfdQW6hZX11GygxW6ZD/TI
	oz+/xj3KGES5YrR6o7QTHOs5v/EgsU7/jfXY78bEb5Q420mW5rKvBBpfxHknLdPRrmH2Fqg7KVY
	vX5hGXwLcklKN3MQ1sSIJusOQdrQd/idGqiZ2t7IaHFaGdokP4EDxZS4D270TL+Mi567NVGnFe0
	wR60cbvs3qvT8R/DSqXWrHBPmxEhUYE5rTec0W0uGiM2SBjH7wP3gppdVlGlS3xuc7+3ZgLLOQM
	X0s/3Chdtc9C4VZF2sPlE82psNwXQ4pZ+CvqM+xlKOlsYF1nUYifulJvAnQGVSLh80Xf11PWq0o
	7aU+oxjrLJZBVWFdYg3Ynexm75kWYinMmznrkVkFBVcziqtgo0KhS+5ya9VYtFO/tH/2T070bLq
	KtZFqdcT0gST8SBj69Wo3anqUT0s7H0
X-Received: by 2002:a05:690c:2609:b0:794:cd8e:3616 with SMTP id 00721157ae682-798854dbb07mr12097817b3.21.1772157842822;
        Thu, 26 Feb 2026 18:04:02 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c862e5sm15433097b3.44.2026.02.26.18.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 18:04:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 20:03:39 -0600
Message-Id: <DGPDIN1FAML6.3BSV5TDBEBO0X@gmail.com>
Cc: "Minu Jin" <s9430939@naver.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep() with fsleep() in
 rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226010536.179729-1-azpijr@gmail.com>
In-Reply-To: <20260226010536.179729-1-azpijr@gmail.com>

On Wed Feb 25, 2026 at 7:05 PM CST, Jose A. Perez de Azpillaga wrote:
> Replace msleep() with fsleep() in rtw_cmd.c to improve delay
> precision and follow modern kernel practices.
>
> Specifically, this fixes a checkpatch warning for the 10ms delay
> in _rtw_free_evt_priv() and updates the 100ms polling loop in
> rtw_chk_hi_queue_hdl() for consistency.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

...

>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		fsleep(10 * 1000);

It's better to use USEC_PER_MSEC instead of 1000 to avoid magic numbers.

...

>  	while (!empty && jiffies_to_msecs(jiffies - start) < g_wait_hiq_empty) =
{
> -		msleep(100);
> +		fsleep(100 * 1000);

Ditto.

Thanks,

ET
