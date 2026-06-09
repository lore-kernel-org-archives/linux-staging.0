Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8F36680C
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035781; cv=none; b=PlhFo/pZULws8rXgAG9QwzPnP4A2FtRWQ+c0GVqJD+dtS5J/dgiHfmVRxgtE8BZ6f2PSlLOrgNOfgYBQekVVwC/awpQCKLzTAoR2Lk6Cw5Bm11Y52UYsRATlHYtPG6ybqW8VDF2N6ug8yGpNlTDPA+gmd05tMIb8L0z3ha7R6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035781; c=relaxed/simple;
	bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaniwKIH9HjLEhFH5QxX1amMHa7BJyhqqI+v0y7LjoAaEl6dy82tb98if4M9gFW4XUyLZRNOvMrFho/4PuVcmfGbct5IJaCAHjqtDu57C/PqcXtgb3/3J46jWX076bzdS+HzBOKtVY28HCHg8sUUjPk7HaXIjpBjA7rhwiYQBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=IFxO4eog; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="IFxO4eog"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3255775f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1781035778; x=1781640578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
        b=IFxO4eoghLSQN2mGCQi8+Q0PDJSL4tM8rmz/5hckvkQCY4I7C8ptZJtwn6WbvyYLUN
         s0l1tyaBp9UXzPFYzSF7gp3/YE0xNNlMJ+Ate6Q9O13CabyvkUkyrqcJr+pzdsAwnQZE
         hyJVpBlo5xN+AD/9uzKXrj0oZ8qtBSokv+e1Ahv7Myq5hk927HeL40PevKo3fSk4zdOu
         9BHQyprjmzput1QRGh5lcXyvYmBMR1Gpw6pvY6+zJgoq2ivI+9azltmMfcqE4Pcxp3uH
         5lotr8N796ZNvdgJtAWNfYcBAeuVAfx1a3zf+vtDr5UeYjKUrUXwvkdetklDwBSE3GxS
         dEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035778; x=1781640578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
        b=HvDgDoKgU+9v8l+L4U+Gs6h4ScgvFcTUwY6AhFzReNQznT0uX92sq8fFu/HW70wLew
         eO69DRsU/TKR/9HqtZLjuqVIhKm8wUrSQU8zR9dytpWmN0DsFt4dYaFnWlLwNlDfotoX
         SieDLr8driTje+pCuQN5jClJJhwx7BXjYeVXYmfyoHQ1BHt6RzwZZxnCgvwMpYhBXgey
         TVYmApd0UZi4bNhe/eNtb/rA+R+uGcmN8ougHyRP9vuzTJANEwNotUsyb6BMino0AD/i
         hmSd2KJxgl1efDkTGvfvp2FPUD8IJq4AWwUwoquDb/fMKj7rPlTlJBM5x0Gph21ncxv3
         RNfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kuonjiZCvDqRpFEEWFPIcOJmFThI7Nz1tIkm4oNVPNyLc8sUl2mSLNhvtI0b0iM0qrjUQ9SfuRqH5OgSz@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3nJH8oaC1HrCyNaxOrfOkpOUggkyDBeIbdoaPPPeBmdnqIvt7
	evMnTPY2Nshqe4PZP0Ku3yFgIpr5/oVRffqchyqWMvD3qGNgyhrVeNBhUhmK99ZYYXY=
X-Gm-Gg: Acq92OGeakybxJXvVOtmYxhb5/CFMYal0OaXP/gM3NLeBcqOiOEjjggQD8FR7QI/+zm
	aK9/Ey6sI06EyQGZdbtLdiqjR45V8EC8BLQj8uUVEjm6R9hpYWtWdWwu59f/EC51f70i7Jqo1vO
	GttojjMRx2DSGR/72aPs3tV4WuNr62x9aAx09TAzcfI6S8LaNECKeefdbuOTLDEDad4zAFR7iOp
	uIaolQJzxsUpHbZqQnmHXbF+RwcbRV3LNWuY9oqdvlermZqXb0v2n4yw0HqiOrvo0HZj5R46kno
	W0FumT8/6T2oBNyv0K/VyWfEvwr1lv6UxmtM52OEfz9xxUxr0NT+b0WmYE/1a9T49wr2wAPmuIy
	iBYowN40+RNClF+eDPxXqPdsa2pPrD2MIdVV1m8dl4FVUNWhaWTa+B3K/g1TbLEHwKAoWcEwEu6
	3012+lM3XEnCSQ9hG3qhHCijE=
X-Received: by 2002:a05:6000:2912:b0:45e:e44b:3147 with SMTP id ffacd0b85a97d-46056680a66mr5598468f8f.5.1781035778244;
        Tue, 09 Jun 2026 13:09:38 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm71280456f8f.5.2026.06.09.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:09:37 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	rhys@tumelty.co.uk,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: atomisp: Fix local variable shadowing warnings
Date: Tue,  9 Jun 2026 21:09:29 +0100
Message-ID: <20260609200931.670292-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
References: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Jun 9, 2026 at 11:42 AM Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> Before even looking towards (some of) the W=2 warnings, please pay
> attention to the real issues the driver has.

Thanks for the feedback. I'm quite new to kernel development,
and I'm mainly just trying to get my footing on sending in
patches, currently starting with W=2. I'll have a look
at the TODOs or any known bugs to see if there are any minor
issues I can trust myself to help with.

Best regards,
Rhys
