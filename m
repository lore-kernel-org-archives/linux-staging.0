Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688CF25B2F4
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255731; cv=none; b=PpHr9V8ae+IHcdZrnSIqe48SX+DlWKVpsXA18uDW1lHXXfUcwJGFB3iAgJUS92EoB00Rvl8t+PndbUZcJrq4P3Gz5YTJsSJv9mvncKJC/a6BpCmTWyreO/G942uINAVU4YfRXq23FHHSsVroIN2coOowosUupViOnTGgTABWA2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255731; c=relaxed/simple;
	bh=9nGv9Nacc2acSKEHduGbMXsgbHR/IljNip8DJOSP3FU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F4D5ItiV11X8adRtd2OTSQupA8BQdIaOwvISM+OrcA9mWDpbR5ge0nUsFVfvWjXsiEP1uAOQKV0TAtFLadDibEtPGTbqAX1YvqKixd9dL42oSWmpgUnrrJQeozdTfBvWohdNBDXan7zqkJqxxhxg2ubDfvOfJxc96ypG8WwJZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNJ0O4cW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNJ0O4cW"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38dd8e7f131so7377661fa.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255728; x=1775860528; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nGv9Nacc2acSKEHduGbMXsgbHR/IljNip8DJOSP3FU=;
        b=gNJ0O4cWIZBCG0/9JfqX9diQGjCRsJOjDlJQjBt7JNp8abrR/1BwW0iBex3TnShIEL
         cE5G2kE4gLRnkeW411HGNNGMMnEeOKD2AT2PzznrYLBVL7wdSJZWmXCD1ctp6YV+twuQ
         AZfPytCCyBQFvLSPqudI+OyQGMAmJIhvwqcjYnM9RaDarnLtIrUwVErLxlm8lzG0mroK
         XgH/oGOehYGi5ypEyQn6Pv/C/o0BeUTODI+CeZYVDAu5pCzX3RpHPAyZ6ub28swB/YVV
         XX3MYVO3GrvK3XKbVuo+Dqrrr2T6c2zgs/MJUMnBUDv7kqOhfrEaTjZPFW6oKFu84F32
         VFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255728; x=1775860528;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nGv9Nacc2acSKEHduGbMXsgbHR/IljNip8DJOSP3FU=;
        b=UpfoSG9TMGfHnapVJzbtW7QLoDAO/r6Dhn+k92eQ/aZvUfaJDlAjuOCyiOjeDvOxNX
         Y5hssdnIDBvlZj5m+jGJ0PR5m8KmgIMWoHPA0kQMH/QbH7W9lrDXilEMYcQUOKrOxGp2
         6wARf3FDD+W/rjaH9Zu9ty75+JZHRFnaOejss7HO8foJre8tMBPqxhZNomU05UjrgpAD
         WfEQXeJad1oHbSxJ6Djg211mqlleOqnJKGZ9Dw8TqkoSLrE45vDpNyO0YToTV+W0645f
         jO58pqCKXk1XeR9vSCY9qrPwRX4EF7VoQf1SSwxFWmtnaTfViJTjzyzHE41WPNcO8+pf
         u0YA==
X-Gm-Message-State: AOJu0YzIVF0y9G6mM0CVHHjoesdHvXgBQY2wwQjKg605mCn4+dx45CdQ
	ZQ6iHPdWViw8u4khLlBWYlamEW9kWaOBtmrtdqmAnYB09mcAxtpcM9H5rFRHxIRg
X-Gm-Gg: AeBDievuF/jwRTDnwLmCcqipI0DX5iG9hjfyQKDwB9vla0G5Vyc7uFG24iczDwyFT06
	F89SQAosQr28fGPGAIZJ9hh/hGHhCit3icQFnyXajfNWQU02VuL6Wkb3AdVTEgaOozwH/DiAqOT
	4MJB+jyGSMi6Znv1qEP5NmiTkehfuGy3z/CZ90LL9sdzkBYmp/aC0nYWyeJMFgZlOsnZDE2kDfN
	Bi59Rov24q43DMVqrWt42/JsGkUna6J362TqEF517kdXaf/YKkRtRynE9Xk1viRyZWFKSXS5Msa
	DxTsIaiFQBhaikMwNb374KNdYFctYZwUwNhm25XSh3can8i8x5QKh30nLiAelrgcs3pe440ziFL
	RMZnvvMnveK7PVK/tItuBnmauZP7M8HYu2oJ99MeZKyLfeEl2tv/u/iVwWAZo1t+xaZP6cfiXq8
	vcLsKf0X3C3IeUjEU2oq9jTyw06esACFKg+3o9p0nVTeE85+rFiIVO
X-Received: by 2002:a2e:bea4:0:b0:38b:f0f0:e264 with SMTP id 38308e7fff4ca-38d8d39aac7mr11641031fa.9.1775255728368;
        Fri, 03 Apr 2026 15:35:28 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2108c9dsm14951611fa.21.2026.04.03.15.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 15:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:35:24 +0200
Message-Id: <DHJVMT4L8UMX.SC0FW9OB1SEQ@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/7] staging: rtl8723bs: rename/remove functions
From: "Linus Probert" <linus.probert@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403223222.1831072-1-linus.probert@gmail.com>
In-Reply-To: <20260403223222.1831072-1-linus.probert@gmail.com>

My internet flaked out when submitting this. Apologies. The entire
thread has been resent.

Br,
Linus
