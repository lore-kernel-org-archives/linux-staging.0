Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5D5445AFB
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362476; cv=none; b=GHsbchN3x199fXjHGsACpbr0aLecLY8+ciqLAmM7sGq1isXX37Dx78YsfFsnFr1DHIjdHM7tEhXXRoQQ0AfezvOf4tCLFF3+HOxqxsMVqWoh+qbaINRtlbPfVozsARvTy0lli3jsZXnwLUCq7ZbT9ghYBUX3xOpXCM8Aag7v0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362476; c=relaxed/simple;
	bh=/Rwo4LDhZUjIbFRPjUjS6LJ+Dmkr6YTUn1svaPRl70c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUAxWxn/COhtneah9jlDVD2zJb9+/B3VI4oOoGMS9uBGZpp89HsvTQaG8oHzA5kEDwEL/qP26nu36FSL/Yh21QO3TAgj4Zl1Til+nIyhtYsPxrnr9UAy3gqggm42N4BX3I4A9z/JW9zO0d5EZIQd6CYO3C6npHkMM9b0/PsOdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxiqQqLi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxiqQqLi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so1080226e87.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362473; x=1788967273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZnwvwUXRAcxB5889VVTWnxerlefp4zNk2iq52AaEUg=;
        b=SxiqQqLi+Ac2YJximgAcM1b59/iokhEU6fDL6XAdHTi85CBI3raQTxSY1lxyFXunCE
         rPJIOMBqtev0kYKsUpYOIJBdAzFNpXWXoE2W7L5JhtGeMb47VG9txY9NltzvO9f71QrZ
         T7XPmInfYMnEjqMJ4qI+4/Kzs0Q0Ns3EsHQeslt+3FPYlWdpXOGkSu29r89BnHwCP4dh
         sEqJO1f2+BplSvkGSHJ3d6i9AZ0PsXSUQ1DLyXPBZlrm8f/oFC4VldvjAvw3iPIPubho
         IXFKbUudEu7/iRuO6eTWq0ZtTU5KEG4qkNMg1+1vGGn1cKICZsvHoJFOXavS73mESYIY
         vAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362473; x=1788967273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZnwvwUXRAcxB5889VVTWnxerlefp4zNk2iq52AaEUg=;
        b=C/Utt0i48jMoLYApmjTnC+VCASWX1FgW9h6h6ZCPMiaKgX5rH6+G3TfUc9QnRBOOUX
         c0KnbXxOFxK/E8F3kCYFOKTEAwcmBi5iXShrWVB36jMuZfeIWhe+mXSzvmXyzzzf5Koy
         jDpCq/te8ir1lra6Bpbe8mmW2kAAawKaSZue4O1FeuG7SF67vuQKeuM96WHfnHt3BCfc
         qUpPWvGyZoJYH/cmZxg6FwF4RbAqVI6nZ4WvmSpjqV3juqByYPkIXoKV/rVA8KiKfLVs
         tv6b1cK7m48atFww7PEzEj+VlOYx9xLWrzpd8vmjw+U+P34bs0YkExtChlYv8E+kc1oX
         Z+QQ==
X-Gm-Message-State: AFuF++nmSdp9n9SZsRWrfsXfGK6Nx+WTyavwnKB5XDq2EFcb0s8Eov9H
	tk0pJdVSuNF/R4ij8JJpSBj+CuFqJmbVtmVUiPMAoy+XrpViet+8juN/
X-Gm-Gg: AYBFou1povxdRtZ1gvqG16/7TouA2sV7UhHUh37UTIGyYP/YItjsCVX3ZrZ2eAzxSX0
	jQLULlaV2BmLucv04NruYND2n+oKTtpSo6MZ+Wr1YdzUPJ3pdjVNt99HWxC8h69OqUfLIUxkZqG
	u4TobOMTIEJA5cm0A625cX7Sc1S/doK8UeDMFhpiSTQImtpvgu0fbR7eODWK2iyK+2Aue/8QNqW
	r08pe2fZNm9qc0J/NDUccCqGm6jvzH64qDQ6sMp/VpXRxZB5FN2xINS+vjHb1klODlFtFwPPSqj
	14O7XKOoD350ejbr6ahbmJoxZKj6paZoK1JK/4b4Dff/t689hUNNqVrtdv7Gvjliqs2j1U3OxPR
	M8/4oCcCOCDl6TojQTGmew1vngazzIY0g+rAfvJxXuu0JSeSoYjuqSN+3r2WcQBdQ1yf2buTXYZ
	+Sp+gtf3gj7NBvb5u7dDjm9kGlY1ZU6tAuPWx6KAvhM+iCMY0U2XzyobBSmsYh2a/s/jtW5rO85
	dcFyg==
X-Received: by 2002:a05:6512:6d4:b0:5b6:4ae:3ff2 with SMTP id 2adb3069b0e04-5b6095ff621mr1814965e87.26.1788362472358;
        Wed, 02 Sep 2026 08:21:12 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b23fa3sm688086e87.32.2026.09.02.08.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:21:10 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Date: Wed,  2 Sep 2026 18:20:50 +0300
Message-ID: <20260902152051.2661-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026090252-reformer-kosher-c6b5@gregkh>
References: <2026090252-reformer-kosher-c6b5@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2026 at 14:40, Greg KH wrote:
> After this patch is applied, what is the network device name?  Are you
> able to test it?

I don't have the physical rtl8723bs hardware to run a runtime ping
test or check 'ip link'. Sorry.

Based on the code path, since the driver allocates the net_device
using alloc_etherdev_mqs() (which sets the "eth%d" template),
register_netdev() will initially resolve it to eth0. From there,
standard user-space tools (udev/systemd) will take over via
predictable network interface naming and rename the interface
automatically based on system rules and hardware topology.

By removing the manual renaming, we stop fighting the core system and
let standard networking and user-space rules handle the final naming.

thanks,

svyatoslav
