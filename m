Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF114A90;
	Sun, 24 Mar 2024 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711304837; cv=none; b=K7Y9JzuTAOClr0CdH/xCOgnBoP2uizcyKKeu3oGrDNBMDM4KlQV8zBVHMGq8TFFEh0D9bhkkSsZ6nrPtxEiRHk/0oPBcI1RFxEuWPyJOVAi5GfBK3uEXH3zmrDpNUvwIuffccX8xNlUMevJzF0TynlyjjO50eFA+55uc/kspBKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711304837; c=relaxed/simple;
	bh=S4wwW9cn6LWhbIRaMDJKjos0xWCR4AxGV+X5wW+IRds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tq033cgPIlsC/K/Q+fOLKlbzEJAdevv8d8Oz4lFfuMJDJ9XlXtMYmFOoh07dG6ggcXBuDxbujW8zwCMBVCA835gCQ+ZRpcKcS9gSKeGfQdJSXRXWi6gi9+ZEm3cLNJmm4El09DoAL7uw+8OrLpk5fCtRudQQOBOszBx3sKcdLBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPmwDbSq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPmwDbSq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-341bba83366so498024f8f.1;
        Sun, 24 Mar 2024 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711304834; x=1711909634; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2AUEII76GawRGMPwgMrEb72tMFWD+SVsGrQj7LCN2I=;
        b=cPmwDbSqwIC9m3BHRzrLTnWxU/8MAjb2EHIai9q/vEgIDTrw2JQLk1/oTEMVX/gPet
         uGQuDY6Rzxb1gRrU/ChivBC0AbKfuQZ8d4mseZfKNzt2x4U1NT/RreQblN+SkyYTqP9C
         EibaSNVQH63unlsYi6oAQfL5/UJXDQICtBUVHDMRLnpTrm18QxANdHz+oDt1uhv1+SGk
         N/ZLTuHgMhiCQDNcBDBEgG1fLIbZFA5mY4Uid6eKLduUFkIN1qUTfPmvmJitq3O9dJF+
         phS2azL0GfZLDELe7jQeAJTqCoVNuEoMRYiRSqAtduZQLNBvSj/3dQw2lXyBe1yQrrKU
         FNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711304834; x=1711909634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2AUEII76GawRGMPwgMrEb72tMFWD+SVsGrQj7LCN2I=;
        b=FzVfM+LXmZZ7h6MFdQCgSqeKO/YDCK4xd2kWpV9BaMKtMPOLT/UMOKQY8HLOS2czzc
         3uD53E/mejAfCl1k44FAJBzMOEj0cbp4fPbQlvTs/cNLeR1wC1uPl8rUiG4EET6jVf/l
         SjmbBCucRLd8a9FCGGLoSk08/ONDceSWw/Finb85fW3rqEgHP2gX984NRE3vGoXh/niy
         2SDrieFwYGWe+pPUmcRV6Af0O5Uoj4WJkLlagFY8xzSHPwqXBN9pG7MSe0bZQQ1EVkiH
         /sni9aT/gd07JF2TPwTzxo2iQflwk3iZwEJRkTZ/NFF8nDA234FQ8/4vXnyvsBS+5jvQ
         EfKw==
X-Forwarded-Encrypted: i=1; AJvYcCXcN84Kf4Gg3d8BmNySi65mhj8WbPuX5Y5FAcjqY5LdPbQORlfOEYhoAGcMprBli8omzBfV+MoSvAqvfATmaI4zlHsGA7Xr/JkMeKoiHDwTYOrvbsuSnmIhTk6PWxxh/PBrEUMxWaq8mQ==
X-Gm-Message-State: AOJu0YyXRndTkktXlNxCFdalLvKY/KxzHTMT8MyW0do0wXOvZoLwpvPZ
	YpqYjiqww9rX4Gmh88KMijTPs7c1j5FaVj8IMFHEdel3H9wVcH7K
X-Google-Smtp-Source: AGHT+IG8PJoUf9SxBrM9M3HkDZiyi3YI7wqt/D7ThxmfZpHwHfG7A7LGLggr8r7WhRfxleKXExUQsA==
X-Received: by 2002:a05:600c:1f07:b0:414:85de:a02 with SMTP id bd7-20020a05600c1f0700b0041485de0a02mr1986250wmb.4.1711304833588;
        Sun, 24 Mar 2024 11:27:13 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c444c00b0041487f70db7sm2304655wmn.29.2024.03.24.11.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Mar 2024 11:27:13 -0700 (PDT)
Message-ID: <c7c765cd-3f89-40a2-811a-b472abe7f7cd@gmail.com>
Date: Sun, 24 Mar 2024 19:27:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Rename variable bw_40MHz_en
To: Lautaro Javier Fernandez Pricco <ljfp@ljfp.xyz>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 outreachy <outreachy@lists.linux.dev>,
 linux-staging <linux-staging@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <Zf4fhSomoYzCE4gW@ljfp.xyz>
 <9d8f35f6-2d23-43bf-9ac5-c88e4f65609e@gmail.com>
 <WH1VAS.9RZFLNEC6LFP3@ljfp.xyz>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <WH1VAS.9RZFLNEC6LFP3@ljfp.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/24 17:22, Lautaro Javier Fernandez Pricco wrote:
> Hi Philipp,
> Thanks for your time. Your suggestions are duly noted.
> I'll undo this commit and look for another task in the TODO file for 
> rtl8712and its checklists output.
> 
> Regards,
> Lautaro

Hi Lautaro,

you cannot undo it. The patch is only in the mailing list and will not 
be applied. So no need to do anything.

Or maybe I misunderstood you. Of course you need to reset your local git 
repo.

Thanks for your support.

Bye Philipp
