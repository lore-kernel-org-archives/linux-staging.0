Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FBE35D60B
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915341; cv=none; b=OXs0lTl7wl11j/2ikjZespOs0uVqC6HxQIx8PlbTSZSn8jPlddegQspFqX+zONEsQGEoI+lTIYm0dAMEFhOKj3RybgH/Ez42kkID1cAmFryTj6grt0sWvWuJSznG2+Z8knbLbSO3Ar7zmhFfD5Wz5XHHeMPZtejJGZIL141o4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915341; c=relaxed/simple;
	bh=ux7H5ruMki1SQcRBW6YhrTa92ozN1cQq2g3y62TrbYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LOE7DTesRKCE/vAme6ncaSYOdIwUt2WvgeRAGvH7BNI+70zc2ei4+VMCHnYh67Ia3G1arIq3l5g4TXR5vQCPrD/froyoj5EQBN0lBkkZcj6pwxNw0Irckx3zmYIq/+S5QfHaM886PDMrzPdTW0qyxJ59P3zcW43kJapuSjj03i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/8M2jGk; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/8M2jGk"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7964fb9ae3dso1342437b3.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915340; x=1771520140; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux7H5ruMki1SQcRBW6YhrTa92ozN1cQq2g3y62TrbYc=;
        b=e/8M2jGkwEkvTowqsQFDnJrnucUGA6KyXPzCzI1/w7Pi5cjVT0bcwEytna8cmQ8V9O
         1NriVobdbaBWgDC9vhCB/agy8pv7uiCmdSmO2YjDGYE7SR2gMOP6x+U3et49zFQzJsPv
         o8Ph51r/vUsMNNfKM+jy2T7T7pLG4il4TpuXc1siga4Cdftc/npOf4wADmHIw/uTPz+X
         vyFquIEj6thYXWtKULaZRt40U3udISpDVDNXdKSA5+5JJUI5eMrHb1ZgJKMU5M6miUZm
         g0oHJw3A4spyzvm9iC9/9bUXCV+ygqVHKZ2N9ncNW0Qd5Vxa3/TTPcfMtraejWaShyUM
         yyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915340; x=1771520140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux7H5ruMki1SQcRBW6YhrTa92ozN1cQq2g3y62TrbYc=;
        b=fwHTT20BJcGUfvZx55xuVGYSYVK7r4wHuVTCVjijc0/a0UIjw4q03Q12d3rOzNEJU+
         NRw2gzeLsFeDvQYajgr5DdQS+wtrhJqRFElfTxZVZqlgrXZM1c7WPeM3dzi2a303e1QG
         x2f7CJxrk9yjnlqqQQHRNbkugpLvhMePg1fiiUUwmTvtyOBMFfFi39+Cvvo+Dqi7ZRUz
         V5x/l1YlBwoUPXDk6mkDH+vfRLHT84vAfckg/1NknyP++n5ft5JgOzLETyqiW82EZm+E
         Xgs52fG1xADzPWPGG6ku/QO56CO18HFFGHxOKXJrORKRy7qwXmxSW0mmNSjCTB6uu1PW
         klFw==
X-Gm-Message-State: AOJu0Yzdv08BxstYhpPN69NkAlHoKrJiuns3XOGMqXTsg75Yo6uKADkT
	Z6REJwVw8DY7zcmxhmWTuzoSh093wmxmMv2aEcCHlS+pj1EccGKZDR9R
X-Gm-Gg: AZuq6aKhbWB0jC2ZlHOIZsT27qE11cwOC9HN+5U1ebqJfPOj5FgFLHtizGCgjE31f8p
	Iv2n4E0uwO8y1ss4oPZUF62lz2s4MUZayQrpPmLKbrzn1PSWC8CLRZ/4tYVK7oRjNO/EwMgMdXt
	VrVQJRO3nWuTOPPhghVw/Uv4x69Eq70Um7aNJbbz1dDZndDyNjvIG2Hvy6XSVrbr1PMfFYiQPQy
	mqaqDfpy4CpmVypVUYXzi1TZoxojGx+aj+Ad7mLM2PlthLwX8aUF2+3TYCXAuKAWADV49Z2yCpA
	vZReUX33Yi5vxlYdn+L8RhIro92tmDV1ceaesF9OAC8vrIkJSgK4CiMP//HP7zqw/CthYAIVVqI
	yfwU9P2RhWWAZ9QMdOTcK8pJt797cCE9sqP5zBBmQ44m7RFTbuKJiUK8+X070EeoCKjVMcprRiC
	9rfPlsxrKZWp/65bbeVDyokiBIDkZaKXgSmmPH3KGdS5uR7kK1hu6r/ANbakoebgojaGAF75uHL
	vxjf0GOulb/SmcEb9h34yZJfBRv2pGx
X-Received: by 2002:a05:690c:6904:b0:795:294c:fd4d with SMTP id 00721157ae682-7973777b960mr35434627b3.37.1770915339781;
        Thu, 12 Feb 2026 08:55:39 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c267e14sm48059177b3.51.2026.02.12.08.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:55:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 10:55:24 -0600
Message-Id: <DGD538WX834K.3KMSX22INMTKT@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] staging: rtl8723bs: fix long lines in rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Sarah Gershuni" <sarah556726@gmail.com>, <gregkh@linuxfoundation.org>,
 <dan.carpenter@linaro.org>, <arthur.stupa@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212082358.3403-1-sarah556726@gmail.com>
 <20260212082358.3403-4-sarah556726@gmail.com>
In-Reply-To: <20260212082358.3403-4-sarah556726@gmail.com>

On Thu Feb 12, 2026 at 2:23 AM CST, Sarah Gershuni wrote:
> Split long lines reported by checkpatch.pl to comply with
> the 100-column limit.
>
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
