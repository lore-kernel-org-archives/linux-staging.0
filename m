Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4313A8721
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 06:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690976; cv=none; b=Op7FO2+X4GuhtcxmtRPON8skNLsUsypcRlOS2TByYb3e+6bdP7aPyadqjPZsRUUXPAL7DWoQVUnPMZw9brzY9ObT5vAWm2pgLbqeE+OdwD6g/d1lBq4BECZV/pbDUzkIF8SJ8bckYk4Z91quf1/AfFMNEcyj5pjFnjY6zLDtoNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690976; c=relaxed/simple;
	bh=QCBrKqAJ6ow+LoFjZV9pyH2ZgaUObHgyiobClRjKufc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A709M+/IHql1c/U/mKsQVzlSnW6G/m94lpuUNfcV7m1pJE1FZnwqPVPtIo6f9F7XxI7RZ+UwpvMOn10vnC8tmRq3hDID7/qk4YYNqvSKiFYXzMHj1URrTuJ2y6d2SeTZD2Og84/fviGnACeoR/Rgi4LX+GLGo7ua4tF7TdhbGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLIqRYeX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLIqRYeX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso116895895e9.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779690973; x=1780295773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7wO/C6d677XmQ0QPXpdaKOuww5QUYcLbTWRM6TtCo0=;
        b=ZLIqRYeXIrmfXJtcemJvRc293jVDFE9h8wJ17KqUJ+hLPDqrbWfBIkWzNZx3EjIbHV
         4+D9TwFiucwwJLHjcHRskZ7NgMYQzREs3l8u1JG8Re/eJVyyM3Z6benDCijdVGdTW0oZ
         3Af8iMz5Gt2pULcsCWkBerJnhouzOv4nIXopz1saacMnwbGO13UteBw/z452U0U4jtNL
         p7FWppOkLrbwCRh26ONsWvR9XbukW2x4tk3TaVVHLvfBc4R3JmKl9czeUS0JursY0dYR
         wc/lG1Hk/hD8DuyqYdc7PneFBmJsKl41tlbweb4QCY9gvs8yPmDnHs0QC3AsYfpBaxo6
         b/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690973; x=1780295773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7wO/C6d677XmQ0QPXpdaKOuww5QUYcLbTWRM6TtCo0=;
        b=sPEzoBzMrR6iO1yFJCCxOE30hSB9/JM1BoKJ5G0/Zd/OTjP/oDNOF17K7budPq6CL3
         Qm/X24kKc/8pVmVI2TyOAL2xPPH0JHgbwsV/qTmGgJ3h2QXliTJMl+tCCYGGfDDg1BHO
         r4lmwO/mYCeXC+VxfZ25tgeS6V8352FS2kN8wuYOueig5pbq8ipH6N4sWV4z95s9WxH2
         U+PaKZtjF/HiK5pEg31sMUyHnK6lpMx0NtxqMRGBNfVRvBG6eaRtPRhBERF3moiVCzkU
         NmEu7ehZfwCcE03YY2/oM7UYBAkH7kZNRhJxkXbVCIGZGSOu/vhnWsgcF9rP719XY8uA
         FWVA==
X-Gm-Message-State: AOJu0Yxdj5YOxmUTz/qm4M88sCKshSvi8C4xSPkS1aiS8bXMqECCwTnD
	LbbRpcXBeVe22H/Y/P7a4kVGvWgfHPU+gGKuZ0T4y3aERcleGNb/JQhbAYzoCQ==
X-Gm-Gg: Acq92OFxzhjxvpdj7OsGEwvpKxAQIajd6d+XrBFgeL7k487kc11gjBef3m7RJo9ySZ3
	n9yimC3LHxqO4+eGdztkT6f7yu7n4td2o//w17Kd89epr/HrxgFV4iEONiyDHFCVQIDvE/CAWU0
	mdA40t8Ker6jHWSZx0ZBwI3nubLGNeJYPn8DD9G3riGfrcDXJEj5HbEZgkY31mz2umzWIAsFvKD
	dVxtLxVtRSDGN+lm2jjFwk1DmNjEJWehTVzo27FcWZWfS8fncq6Ky4kUYYM75CxlPvCGrvnaA7P
	ZhNTnJXaGlJYyDS8aW6gNhX+anQH66r4bQwbYJ+C2k1urkw4DAca2vCmTc8EHAz/QUfQK47ey4Q
	j1BxNrWqCpliTitvhdpjtOSrMCec9hxfd2iuTAO6gnL30NQ39wTxBZW7/A7y1NH7CiUfQVcuVLB
	3xxNne6CW7nh4ZfmlTHTUJn1BdUlxaCdiCOA==
X-Received: by 2002:a05:600c:3587:b0:490:3dc9:4cba with SMTP id 5b1f17b1804b1-490424a9d5cmr219346405e9.4.1779690973403;
        Sun, 24 May 2026 23:36:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c5eb0sm243231645e9.2.2026.05.24.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:36:12 -0700 (PDT)
Date: Mon, 25 May 2026 09:36:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Oliwier Iwan <oliwieriwan@mailbox.org>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	straube.linux@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: fix comparison in
 hal_com_config_channel_plan
Message-ID: <ahPt2T2Y3YF53fhh@stanley.mountain>
References: <20260523123043.22907-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523123043.22907-1-oliwieriwan@mailbox.org>

On Sat, May 23, 2026 at 01:30:40PM +0100, Oliwier Iwan wrote:
> Place the constant on the right side of the comparison as preferred
> by the kernel coding style.
> 
> Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
> ---

You're not working against the currently staging-devel tree.

regards,
dan carpenter

