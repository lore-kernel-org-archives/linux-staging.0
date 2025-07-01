Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1500672602
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359926; cv=none; b=ZRR6DHKkKfN9VYNRM1202JzWx8UV0AylJgY/KxekB1UYqqGbAKltTGehfc6v1/Vju27jn7EsSr9ZQgyjPoK5wUkaQLmq4TN6ny06oMMZYPhQg5bJGYj2dZTPbdNaCGuN8WFEzwWu9fH2LSX+jAcPS3D8v6ZS3wE6fIdXHGITqGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359926; c=relaxed/simple;
	bh=NWPSylHlVL5xApfhc5FegYDDQBDT/NsQf3kdjmaUKHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1Ey3hb/TbmgIXiXdFFrkWqY6+csZPumEkcoIik4MJ7iwwLeYgh/HtyUHP182X/sN0mYiW8OuMytFkx+Dfoj6LhPHCx/GG1pdpiNX1qb6T1kgJM+Ts6V67IWJ2h+v4fkiOWVRcikaFZ6MMT/gkC7y189UjvgTl9rul6N3YTQxmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQVjXmyA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQVjXmyA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7490acf57b9so2250660b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 01:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359924; x=1751964724; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=88KwzuOUdx+VhG7N8ukidarGnCXzhZ74KKnQWyukHXo=;
        b=CQVjXmyAao+G8OtTZDqwuv09AbATFSZEQR8msx6I8DCDqM00iUeo8C9N1H24rWfUvw
         Cvn3L8C32gzWWst7ukvDbpnXdqsaThDljrwY8qN3rZHwYwnISeUcG31vRlhSOjcDD/OC
         gV9PqUuTa54KusCqThBrJlIf5yijITmnMROMaafzerkk11/3g6npmJVWrVkgGt8NRmp6
         KtyBL6/9YoAx17+mkht/1ZMCFx4StqoWEyId3jE1YPSPQuyjXNUuyUt0KVkTmiRu8Zbq
         KpJudte6OPXsOXQmiVpOMOPnVp6nwyNFkTchW2Wxl3pGqlQs4W4WAnkjAngaotBRBPje
         Yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359924; x=1751964724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88KwzuOUdx+VhG7N8ukidarGnCXzhZ74KKnQWyukHXo=;
        b=o3EnY2wcRMpEza+hSTbk75lp0iN7Tu5ALNeasIt/g0C9NI7oHv73vtBZbMlInsGNV1
         fmLSI2qMJkumhqcXOpyzLukV3wYBSWfGfdgXuCW3RLdqYstChPcCM2L/qiFNSFPkRSKe
         WlP+rksp2bM6tLDG8VjrZKzYi9CI9OiFmdaHFm7lFqAlB706Y8GYTsf8AktdjOBGt2zz
         bG7ZM58l+Re8tPLltcWKxaYXG6BNz2VM4dm+PJhhSCEoktW7QIPZSAlrPdPYfw1fMzcm
         KNWGayEYlgGOKdlw2J7KHkVrzQHU5Q9FFBIfdmByVuhiv4kCm5mmevRCpqEd9vVOZpXB
         bbVA==
X-Forwarded-Encrypted: i=1; AJvYcCVsxgcV/LE+1s29evUu/ypsbY5FyDkZZUanZoRz/kKtpvwfqhUEqS2q+25zbOEHeCKa/hmnOoIaRcMca7qC@lists.linux.dev
X-Gm-Message-State: AOJu0YxcH79Ju89+fEZkN8n1SUbGiFYMR50rc4K+VoRdFS1M4ICFWXct
	ZUc4l12eyxWk37ZoeNeZJ4iR8jejwY6bp7J1NY7nrbAgyT3r5O8cxg5a
X-Gm-Gg: ASbGncsCoUW6RKF2ReznerhossQ5eob+lTQIJg4OEFpglyjByKDDLnXUKFimM2ybkys
	3jtaPbaVcnBV/kfOJZ++2TdaIM8PIBCgvGAj6UCD5+AebhRFCPRAZRuor8Fma7GeUHevaSa5q7G
	h/Hrl0UyUbQrsRgjSWq1YoqfWQVcOEgsHpXZ0/tkSfDH/t6CdpwgPCDDEdfbdSK6G2GJmXRbym+
	6/X+wev6RHT9X6C5qFpj0oEQQ3mOnA+tSsvZpI7e1DzptgLawpUEGogQd0ShufuetU+qckm889N
	ruttFEqk1NIim9L+SbaKTpaCMpJM7KQ0a+lRiq5GTDFm8gPO6W+7qeg=
X-Google-Smtp-Source: AGHT+IHxISR9hyQ+YgkO2UyVgvCjizdx9FY+4l1HiTDD+Xq2hunYsnuQWOfVSy1cXwISnEW95/tslg==
X-Received: by 2002:a05:6a20:9e47:b0:21f:568c:713a with SMTP id adf61e73a8af0-220a12e597emr22598713637.17.1751359924244;
        Tue, 01 Jul 2025 01:52:04 -0700 (PDT)
Received: from essd ([49.37.221.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3200f13sm10050149a12.72.2025.07.01.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:52:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:21:55 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, andy@kernel.org, 
	dan.carpenter@linaro.org, lorenzo.stoakes@oracle.com, tzimmermann@suse.de, 
	riyandhiman14@gmail.com, willy@infradead.org, notro@tronnes.org, 
	thomas.petazzoni@free-electrons.com, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Message-ID: <cofo3z2thcwxaiec7ko74vqtczzavqtyxv6k67yxngv5647tpg@rsnzb3jhcb6f>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
 <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
 <2025063022-chump-pointless-6580@gregkh>
 <ezkfonpaubsmw6gr4tutgnjmbhvsuwkhaiya7xozl2szfqi4f3@zmde3sfybyzi>
 <2025070128-amplifier-hyphen-cb09@gregkh>
 <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vev8r7KZ79=CoUtt0wbx0x3O0ZckesWtQrxs-MBpiBz_Q@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:03:50AM +0300, Andy Shevchenko wrote:
> On Tue, Jul 1, 2025 at 8:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > I can't "drop" patches as my tree can not be rebased.  Can you send a
> > fix-up patch instead, OR a revert?
> 
> I think the cleaner solution will be revert and v3 patches together as
> v4. Abdun, can you do that?

Sure, I'll send a revert in v4.

Regards,
Nihaal
