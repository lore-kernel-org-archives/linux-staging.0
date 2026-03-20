Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1834A791
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 19:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034444; cv=none; b=T82cK4bzFo10NLDgSftHkOgSQ2qCdJUDqtsVCxgmoOy/1lSFwJu8mSJFGRAOBZJybvhqeMrjfUWp1wLr7S1dsttC4tvU+7cWj2AXHf75wwR5jLFvdGhoMpxr96LpNivsHhwR2jHEgteVTM1RWGUKBRLomgoqFpPK4pSZ9mof1qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034444; c=relaxed/simple;
	bh=bcUaLaDT7X/+4e8Tm5i7a/qLN36+zeQCnz+0YlCBnJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+BVxxJvTK/ydfObwk9u2b63nquSx0IPJScnfOqT+u6ykcm0e1x0h8okNC0kGBBmXXGLMlzr0PVWzfGBlLcMd0+XGLIq4d7vhOTMC9hGbarTIXFXMCvDeL71vyvRgTd9A7dSSSxYpwsxa5Tuh6r0vJRo5PtmOlKK8EzyPogeN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeGFRRrZ; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeGFRRrZ"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43b41b545d9so2760528f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034442; x=1774639242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwyLx2/sa/LxIYpzrmb1C8yx6vkOmY822xVrJx5Km60=;
        b=eeGFRRrZSktY48966f4p65f7zNzs/ECcwBXNMIYaQtlkUIzM1oT5tv/aSZ+McfVv64
         Y45o6TibMTf48nMqo015mkj+PlHB5ibuZGD97ypGYru8JMItSAyKyvw+DG+nC77qjwSz
         ZcZTQlDMrkjRyyA1Spm0wiJ0HJiTpUgB4K+zIeDk44wJy2xF9uZ1FMa43kC4STAg/HN0
         qdyf/gudPStHXuTvOfXdPOApI/2yWOWVFw7FWDkMok2+UNBjjR1+n1U/pH+fUE/ypeLE
         Bl7SLyxRj1vWOicm2Ya1+3lXYuRZQEnjzjSi02yyh104ymfjH+A05q+TWr8rSX1Dz2dF
         O80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034442; x=1774639242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YwyLx2/sa/LxIYpzrmb1C8yx6vkOmY822xVrJx5Km60=;
        b=rf2FojuUecjiAUQFcGseMHHa8tO2XG2FrNQ+vbAdYJlsaae/qd6B8ZbhjU/Yqxbr1I
         MIhXPBdUXBeWcuGfEDLJLyxLQInPlQlYqZGjECO6t0r6yMrl7OvYBUD4RkWxdHtB5j/6
         KUxT7LXKIAalq/9ehh8EXWpe1t3KWlvpH6eZR6IJrrKkgVSJDjcrp62V3gWYifmW0e9G
         4xjaSUO7mc2u4JP4Ni8HcpIrrHVE7V/j6dtqF1dLj7yrKDhNGHaPctB2UtwMKQCWwbZ0
         ZHyB4Z00DZJV6TrmpfLlBfnqr7l8k8nW/18QEd93FfxfTnjJPfQYwFO5MCdqiMN/xkZl
         smRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcO18JJO0TgYCS4fXSZ1Mw3zR4LN79AgMOprIdomxRpYj2zIP9pTBS2I/yB1y4lgqGiVPhgNjVhTExsGMr@lists.linux.dev
X-Gm-Message-State: AOJu0YwnOEOqOetO1B7jGF/9I+hNP3NOHZBRot4H57twWcm5hrTCSoYK
	ebkfvRtkM4DvmMnKfW5gzhbSIBp+TxryyTf4+xg1T7KG4vAWb1K9Wk1d
X-Gm-Gg: ATEYQzw1X/nPce6E0NWm88CVb/4+YGLaKqz8VEb+6bhQBtBTck9ShlSiP76jTrnJm7J
	Crte1Qka1DKkCEmdo4UkQ/XIi52z+tJNiP7EKpuftIpkeTNwLvNHFfrTE3vFFxTPs+B36ildY85
	4suxDkBX1WAHsaHJx/ZsckANsf5maGuBqFjI2ngpA8W2O8N/wDqaIYGtnvRlRf9CumNg1UsZYmB
	6lrAhsOy0Rlnx7TrR3rAnN2tOz4ob+Jrd5j3muBZOUArkrlPFgu0awD/m/WcGKG1l11rG5wfP1w
	jVouw2EpctoVHSyO3JQQm1OZ8K+WcBrPhFrvkHdXWFXhTRyay1fFSSutMBb4YmyaCk+ZojZS380
	yItunkeYIe47kEi74l40ZH/v4u8jyf1Hws3NBC2ZztPBNoeNgBSEuR/6h8hllmmDscreg/7bKwy
	ysPX6KApv/D8t8QTLqGJQXruiV
X-Received: by 2002:a05:6000:4381:b0:439:fd13:5c4a with SMTP id ffacd0b85a97d-43b64234891mr7331505f8f.6.1774034441641;
        Fri, 20 Mar 2026 12:20:41 -0700 (PDT)
Received: from bera-arch ([46.155.28.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm9070542f8f.14.2026.03.20.12.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:20:41 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: b9788213@gmail.com
Cc: Yeking@red54.com,
	andriy.shevchenko@linux.intel.com,
	ethantidmore06@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	rayfraytech@gmail.com,
	straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: remove copy function
Date: Fri, 20 Mar 2026 22:19:59 +0300
Message-ID: <20260320192015.30665-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320182437.13948-2-b9788213@gmail.com>
References: <20260320182437.13948-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 20 Mar 2026 11:25:08 -0700, Bera Yüzlü wrote:
> On Fri, 20 Mar 2026 08:27:22 +0000, Andy Shevchenko wrote:
> > > void PHY_SetTxPowerLimit( ... )
> > >  {
> > >  	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
> > > -	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel;
> > > -	s8 powerLimit = 0, prevPowerLimit, channelIndex;
> > > +	u8 regulation = 0, bandwidth = 0, rateSection = 0, channel, powerLimit;
> > > +	s8 prevPowerLimit, channelIndex;
> > > +	int ret;
> > >  
> > > -	GetU1ByteIntegerFromStringInDecimal((s8 *)Channel, &channel);
> > > -	GetU1ByteIntegerFromStringInDecimal((s8 *)PowerLimit, &powerLimit);
> > > +	ret = kstrtou8((const char *)Channel, 10, &channel);
> > > +	if (ret)
> > > +		return;
> > > +
> > > +	ret = kstrtou8((const char *)PowerLimit, 10, &powerLimit);
> > > +	if (ret)
> > > +		return;
> > 
> > This will change behaviour on the invalid data. Before it was just partially
> > converted here and continue, now it breaks an execution. The commit message
> > does not explain if it's safe to do or not (i.o.w. if there is a guarantee
> > that in current state the input will be always in the correct form).
>
> > Otherwise, you probably want to use one of simple_strtou*().
>
> It only indirectly called from ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() with constant values.
> Maybe we can convert this strings to ints so we don't need to do it at runtime.
> We can also remove the wrapper odm_ConfigBB_TXPWR_LMT_8723B(). This should be a seperate
> patch, right?
> 
> Thanks,
> Bera

Just noticed ODM_ReadAndConfig_MP_8723B_TXPWR_LMT() didn't called anywhere.
I will remove:
GetU1ByteIntegerFromStringInDecimal()
PHY_SetTxPowerLimit()
odm_ConfigBB_TXPWR_LMT_8723B()
ODM_ReadAndConfig_MP_8723B_TXPWR_LMT()
in v2. They are all unusued.

Thanks,
Bera.
