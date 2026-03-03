Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052D1D555
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 22:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577055; cv=none; b=lmsLRJ0QH6qm/CgjioTc5GyMCWEX/fy1GWOlpdNe8+iGp6htdGnxjFH+yzi0fnbDjg12Jmxo4HMBOtDue110+JRpORm6AEMvpUowCr44w8H1smK71ZYAV0q/lmlI/PpSaQAWa3VT18CrjBUMgxcU9wVk8UJe5ngVzbobz7Z6Cjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577055; c=relaxed/simple;
	bh=w1xDXRQLtoNZZSVnAQ2brffWAXqeya0izVLZdeKgn9w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BTm2qTijkq9CmOs3yNCNQ+BPvJlsGXtLTwkyd5TFbJKo7sgLYPzk6P2ZN8zE/0gkwyPtsRWNT2Zk2wFeBLFo6LiGhC+4/b7PoCJ3hIRph9w/xeSHI2TsK49Gdl0ZKc0Htbzv925z0Y0Yv2Q9MBa9SR/eJkK1Inv/WmZ7jutic+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heD5iaZX; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heD5iaZX"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79863ab8478so61941877b3.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 14:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772577053; x=1773181853; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhaY+zsMrX456z3/ZauXujvFM1QJ/5npkYROaaUq/Tw=;
        b=heD5iaZX3hEgID32cYYXt4xRSHcwtDdk7fyxKDdxplLG45oOnytorpIVuUblGD1LRA
         1g2SsY/dhuWvqAMMy5th0rBWds/ut6X2JmK6dpm/Tr/9HUPyDQSmvXlxQe+pDvdtzZsI
         1SIC63Syc8sZQ9U7XKsqIfBt/fbKII9KjEivxT9vU5pSmehT3uy0qloXSl/PlBDPJk/J
         ECLTcrRKShIofegCI/u1zdKnoJEa9yYHAgbOFZ3vQZHkj7Oapy+7BSUMdTJ5cfEOAC07
         annLp4FutgJQFMhy2+EnPxhXztjVBHdwcEOV8a9S9II6YI6Hro9ngzw6wYwfXp8Sb7NF
         wTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772577053; x=1773181853;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhaY+zsMrX456z3/ZauXujvFM1QJ/5npkYROaaUq/Tw=;
        b=XV6XglIUn0pHoOK4/Ibxb9Eyb5e/3JdCvPgdo6ASl3Dmz4CbCMApUUH5jMoHre1HZG
         kFCbAUtaA4dNh+ToCcdDTfADyxnRpBaIZtZOJ/zhgZEgX9rTsL7xyijhbb/C7XsXkmh/
         aj2f1QwGhTiNROhsVz3BxR0X80M1Q5ZTKsOg4jAkxmsFA9HJ3cbCC+fP0YhGoFUtI1iE
         nnQV4laS5WX+xINY4m+thfjEvGOmf34UFOfbIHLy/oMYpA33nLeBLy+C9WuzMnsttEfu
         ysA0e17dcSVKIvYN8OSjRD+LopzLKVszLaG8zZpoGZGtwXlCXHw3rSNUF8cvIZpCVMfX
         yIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9GKoz7QGj+wGrhO+C7lJ6PdNL1Ruv/7VqBvn9yMCwc7z55pSRMtTTjcSZUD/jTSBmjSzZiIqlSA7Qp491@lists.linux.dev
X-Gm-Message-State: AOJu0YztG9NCABWyuxT94oo84BfKGVksFVO6X24HwPJ20OOZxyXNshNN
	JpqpEI7E5NcbYJN1zGr/TK1bR0MjFJzFHXoh5iVgvUJ25NZP5YcmILmw
X-Gm-Gg: ATEYQzzj6kP+livrEV8id3DMzUg+bO7zVApbwPWv3ZjBp/ZwlZvprCPZXtIrY+H/Cw2
	6foUmm0r92qEzWX1ymBMvj5qerWTOyZAsFZFQEBzWFRysxdobDCp/711e16zjbKp2LCueySl1DD
	Vo78wt9SEKo8/Jq7AuFeakci+VrPn0J1M7LFGCUWjSaas/ZxD6pY79Z+1JrfYYwNyaQqMu6P/Jz
	9X6s05oz4cQxjDov6/oAbi6HJLCI9QWquJTuc2eyCSQwUqhsAdAPbV0u/wAR+UGLV/WB0Y27dao
	RHMZYAvuFRkL/jyGfWH689l/1DiDVUw3q3GsdlzIWk5+/EqwlN2g9itu5woRRcVB2cCltMaqams
	0X+OfVxMP7bTLtpXv2vjL/t8OtEjwGRLB/nSrS5j5CIMihuD6dmQZiZamtUJ6iv1ibV+F3//Kbx
	YIGw71bhCsbGt92dnQtrWd3rcGhObPu55rW50whnVyXBGNe62K45q7zcvk3VLW2eUFmBo7FssU7
	tkDIrUXaiH5XQIkCCNCIEQ/eltNd7q5
X-Received: by 2002:a05:690c:f06:b0:798:6d83:da9b with SMTP id 00721157ae682-798855deba1mr172770317b3.48.1772577053008;
        Tue, 03 Mar 2026 14:30:53 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a91a28sm68712157b3.5.2026.03.03.14.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 14:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:30:31 -0600
Message-Id: <DGTI46LV9K3B.13GIMLXBFRI1A@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Zhuoheng Li" <lizhuoheng@kylinos.cn>,
 =?utf-8?q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, "Ingo
 Molnar" <mingo@kernel.org>, "Ethan Tidmore" <ethantidmore06@gmail.com>,
 "Artur Stupa" <arthur.stupa@gmail.com>, "Abraham Samuel Adekunle"
 <abrahamadekunle50@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] staging: rtl8723bs: format operators and logical
 continuations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-3-azpijr@gmail.com>
In-Reply-To: <20260303173844.47975-3-azpijr@gmail.com>

On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> Fix spaces around different operators. Move logical continuations to the
> end of the previous line.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 48 ++++++++++----------
>  1 file changed, 24 insertions(+), 24 deletions(-)

LGTM.=20

One thing to note though is since this is a patch series you'd
typically want to have a cover letter describing your changes. And
then you'd send it all together using git send-email so they tie
together.

Thanks,

ET
