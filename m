Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35091350D46
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750026; cv=none; b=jeYfNR/2laz/5dOZWz7cbp3SbXRyGi/44AMccsoZHeSpwevqxMn1MDbIXXRJV7zz3XfxVR3SLb8lhL5MuHW7lZluSHLHI6j6vMbNCU/KNXimpr2K+KGb2UVvO1xBGF0TZEcHS61aT6Kv56qhPC0LRddqAd2pl/XcNCvK2YTpTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750026; c=relaxed/simple;
	bh=VUJRiTkrGKrdTW+FOaHBI1rGK1j+Qdp0ZKGuG/KeVKU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tnRG3U4byhxLfWX0ojAc3bJUHAeunJsaJcuhaQq01GPXm27wP2fI36WHGNfO3aijwAhYv4uZYYai2Ra+UpsoxMTbofD46Umzcc+nfRLjpbxXeenACyn3WnI4X9COAgbwIjghanHATcI7GNpxHiq3NVJamL91ezHfSMyEk826QkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9YQ/5V5; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9YQ/5V5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7982c3b7da9so80632197b3.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772750024; x=1773354824; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUJRiTkrGKrdTW+FOaHBI1rGK1j+Qdp0ZKGuG/KeVKU=;
        b=O9YQ/5V58Zy1ZiI8cN7ssQfWxjE+QZDnABFH4E55ocnUdjdQH9FkAZyVRmtTm8cQxd
         gqDXTp8Qsqs9jRrcl2dlohuFJP14tCUvFQ3tPqBNMQ31zLy1Uic9glXrptNXewW8Mo/D
         mQQMtQms9UPhnwMuNGTHKvUPi8hRerU59MBERInrCw8akkTlJXOWAk7CZRdOIEF7SB/R
         e5B44x3eePiegdaIXHfCoYJLzLvg4v6uIWaPW8Jmg0ztsz9XS9cRPtuB0G9Nl0BEhuhH
         F9PDKZK43GhGcVZUSAq/MxKxpV0PqOgTu0j2D+oIaTRrYmx8iYdMw49CW1UmbJ8qcnfp
         95mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772750024; x=1773354824;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUJRiTkrGKrdTW+FOaHBI1rGK1j+Qdp0ZKGuG/KeVKU=;
        b=Z/AUB0o3/623jJN6llsI30+Ute+W7TmZN/T0KrLQ0sqefkS/35nGIjFF+VuAF6B+VA
         jr9hWSFWlfsXz+0kH0WboyYxA5rUEH1WiZfwkYSV/S+YU+oEdBJVkQV8v37XmKwI7DEa
         lXe6t4PYJeQh/838SIEHiFCk6dPjK2k/FqM9/L0hylwMMAT7Oh43KYzFvcoqBsh3cjnu
         UssSxIKMj6Oy1xSDi40TivdNKQAjl4lVPNjpyFHDBJQZm2zTGDv9evdQ3NgE45xjSsOi
         rl52XxfH31hLz8ansrAGmf6NR8KTO2z5gse9EjIcRC/7yHxATtxlIWpNjHfHcbNBS5wQ
         xhfw==
X-Forwarded-Encrypted: i=1; AJvYcCXFl7x2Ami0NKfhmPr3rCnhbqw+DsbIccJ+BtTxarQk4vGhZqaqEfjfcZSjTEKzc3zsKSKitDz+KpL9tWPh@lists.linux.dev
X-Gm-Message-State: AOJu0YzNzDRWoW/fpN83JeJNeXOoAn6rSUcdIUacPCLrlp1N8Ik1bYa9
	DlvA0nAoJXaLg0dQR5SC1wrMX4jncKclUoDfLywyOIu6siG/3fKpNrME
X-Gm-Gg: ATEYQzw/qdeywsYUjKvZoPHZfegW5dtv8CzcXfJP5pNM1mWTzfZrz/9XeTK1pvihC8m
	cbheqFJ+M/yuwgOyizv53H68FO1CsGFLmO8OgBDKcNqi8I0v5F/N8Qz1I1BliH/UFtIR65LzCYy
	NpzIeneF1JyadXDSsCd+7le4D/XZgMYaYqoHMcoQp07O3OvbiRog+kOOahlgkVTFdlIXNtFQqxG
	xv9fhcEaKZ6TH2QCSkf1aog1v6Oj8K5rwI2vyr64gqYCGclfEL0NCVzW+A8PQoFs1gVpO1vFF41
	goTIgwVYhKWBj+7R3O3HGoDQbD61pJKXaRLzgwmmpRlIDv/8OEKgwCGKSKyCqREH3uLyxRb04GD
	I+XUeP92m8iU6zO7h9uYoPmgWvoXXH92c0eJY4hvPQ2tiPbGJ2rp0olVA3zlvHMiWQ/rrK7QCXn
	zu0scr1shDgYlI/v4Ea3gRq1fMC91cYfWyRp/7btoRKtSKbIhzZnu/PYTKVTaPfjEmmwaWEi57F
	VDI8URMpI5tDg3memS8xioZ5Sc90+Xh
X-Received: by 2002:a05:690c:2010:b0:796:3f2f:a33b with SMTP id 00721157ae682-798da3fc3f4mr12699707b3.18.1772750024256;
        Thu, 05 Mar 2026 14:33:44 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf938bsm94821177b3.31.2026.03.05.14.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 14:33:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:33:24 -0600
Message-Id: <DGV7FH734O40.2ARXLVWHEH5WK@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Zeynep Dicle" <zeynep.dicle.dev@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <broonie@kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <daniel.baluta@nxp.com>,
 <simona.toaca@nxp.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304171941.594-1-zeynep.dicle.dev@gmail.com>
In-Reply-To: <20260304171941.594-1-zeynep.dicle.dev@gmail.com>

On Wed Mar 4, 2026 at 11:19 AM CST, Zeynep Dicle wrote:
> Remove unnecessary braces to obey Linux coding style and also fix
> the following checkpatch issue:
>
> WARNING: braces {} are not necessary for any arm of this statement
>
> Signed-off-by: Zeynep Dicle <zeynep.dicle.dev@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
