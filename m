Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4007263B
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771699519; cv=none; b=rkuNotDLB5BFQOYjlYtExTuGQKx94bsU3Sd9TCGFL3BsuIJ4V0RJJZFvXWPk36J/Gxw9kGgh0R7YxU4nDyTMQhOXsUker5/JVMHgW+drHpkifj101akdmX64i6vKQJlTy37bU9NtRboUdoAIQcuYAn/eG8afvKlMtH10VpKYoRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771699519; c=relaxed/simple;
	bh=qRPMy3Oymb8z6om13m/l6bzS2mXVu8gCGIK0f9mb+Zs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CPwzvEHz3xW0w5syN4s9VSfpmfwlfKo+vv2ncWhh+Pxeh16v2/2enn1mVfSlqtHoBVUPeLxpgeBtpA3ASZvLH6335nmpMOf++ckWMDaoEiwi9wrpcvUotiMzZwx8o5Dbj6MO2u6ZCQsGaiw8uuTwdaPk68g4dkY4yjphkXBoyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+zxrDYp; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+zxrDYp"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ae5f0777dso2800774d50.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699517; x=1772304317; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRPMy3Oymb8z6om13m/l6bzS2mXVu8gCGIK0f9mb+Zs=;
        b=f+zxrDYp1a5yIH+DGREFOstbqK9xLHLv2l4Pg7SqgoHOrRrTN4DyobGHuMMKkJQa7X
         VIQYoI49Gm+CiHzDtZadQhDXAryulDX5K9Ysprm9gTsKg7pjS55Lg6zkRuXGasnIQ8tX
         ecqFxrUHhyTR1ciJ/jdN8Tfy3kffk8oE/Gd9OlOsddQqXSdX2jZKz28bABV7G6aNfgEA
         NutsFguhrKl2Pm51p1nQQVlP3iqGvfR8C2g0KCrPX0sk+8bmEg5XAO/Ip+sl6Z2/gUO1
         ZwxcgfWEvYNer4bs1v1ZX9svkLQ3tJ+baPWOfKMabaLJ97fZfiZxkYJ8Q2DIRBLEbVc7
         +Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699517; x=1772304317;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRPMy3Oymb8z6om13m/l6bzS2mXVu8gCGIK0f9mb+Zs=;
        b=vLfh+9qrK6vkZfZAJuwS6QB+bGomcdzE7ZM+g0grekkKNP0bWC8XHY7RlngxY9fP8i
         WxmRhzfcevcWJcws+CfLaOEBEX9bRbnqkfAYku3uhP1eyKZGdT4arD+F8cM1lp+U46AQ
         MGt9ARmGpkqs3E4XVTmhMaHf8WCifbTkWXan5Xehdj3q/1J2rO/MF7HmniCcYLa3+BCW
         PWEaMi+LGq6kV1qhmzc08I3dS9wFTHZSSTgz6Q9pFPvI6s/nLYCdkHLouLcDCgz54JUd
         bP2JiWALSVweR+2NvtukOedJ428NUFJ9V/hValEuTb6+9FnIssTVegHB2V0NfIEotfDD
         XJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/5rYx+IzpXTVWJizhUHFPgOq1cYaRf8B4FlhFr+PSkLuUJzm1buykkFkK9eAv3hzDIXtaeNMQR69Pbruy@lists.linux.dev
X-Gm-Message-State: AOJu0YzPr5WewT7MvjtyKnK6IUhhrkqrGc6+TdQIEyQx/NimEsa6MrlF
	gqCREOMVtpnBA9npKfYK+oEPF18SIYgqBBkAk7tXJzEZbF1KTZ4RAQb+
X-Gm-Gg: AZuq6aIOqHonLFMHm//WAadTwb0Ni4BOu12DPp4TwaHKXcM/DFQX9FrgMT9wB+YfnO2
	Vvb+MJiOAfopbDxoS9euIMWgbCEryx2Fn5LgKQE11NDKyM/NM60FjALTa9cadyfMU7dGGpQTIhI
	RNU1El71OIKwCQf2R48PHkkmtnZeA67tgqyVtaPuCtu+Hdr+d9d66f6QCjaHuooFoLYWgYL7XEL
	p7gv0pSThwJTg16tkKLhpqj9ACHocCwWZFu7c7loCaHuBnLW2djrePu/L6fy/RD9DhxOossu2Oh
	bZ2KcG+yKhJuxVkY+6H8ubX+UkwCDUaMDXSS2Am1nPalF8C8RedryXLGmnDz7Vqux8Trj8gVzHk
	1RHcJpVvdl3TMcck6DZQqddr+qpYSGohzjf77Rf7qr9B/ir4qpBIA25Pzn3wT24qnL79g3gQTNN
	XSMIVUXvewIwsipmi+Yk4K0DBOy+U1hLtlvuPsIGYc0hmb8SvAXIdOZROmtKnYmbP/KeUk+An+i
	BQ+6TAmyGbAksvFcNlMsv5ULikozGbI
X-Received: by 2002:a05:690e:d1:b0:64a:e7e0:a70c with SMTP id 956f58d0204a3-64c78f66569mr2674110d50.65.1771699517255;
        Sat, 21 Feb 2026 10:45:17 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a35dd56sm1253754d50.15.2026.02.21.10.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:45:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 12:44:58 -0600
Message-Id: <DGKV21DET5W6.2OFCJE8T8XJEL@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Giorgi Tchankvetadze" <giorgitchankvetadze1997@gmail.com>,
 <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant NULL check on
 premainder_ie
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260221124732.327156-2-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260221124732.327156-2-giorgitchankvetadze1997@gmail.com>

On Sat Feb 21, 2026 at 6:47 AM CST, Giorgi Tchankvetadze wrote:
> premainder_ie is computed as pwps_ie + wps_ielen, where pwps_ie is
> already validated non-NULL earlier in the function. Pointer arithmetic
> on a non-NULL pointer can never yield NULL, making this check always
> true and misleading. Replace with a simple check on remainder_ielen.
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
