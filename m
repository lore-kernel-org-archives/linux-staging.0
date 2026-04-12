Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6C337BB8
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998687; cv=none; b=EwofCwFPSNBmdWVRno7vvoX8x0OPkhThkEegTBtNR5aCIzFEVyLp1gquF71BnnABFMr5xDx8X238rgEb6Oss551lFirM/x+gvRbgF1aqVADudmSmxtqpZNTFvuLez5cU7dPGxoSWSGAgcW7YaJrPaDhGiOaoj4HF7CHk+V+6eLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998687; c=relaxed/simple;
	bh=ODAEhkchItJTYN0hQTjTm8PYkpnYXzF/Yp3CpmGsKNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzYwmcLOZu8kuQ4zzNd1yv7IqtQ9NLR2CrOQ4hKCwxDedUxL+xryp4m1PYq5IQQPvJ/SXIu95xD19U372Vt2EtQQLS0XyriKuEX7COEwZDukptnztris1v3o1ehmxnEcr8LIPltWxGX8lOuucF/3ieYmzYGG2FMpEVg7vhVjksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtfS+sEU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtfS+sEU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ba840146so33381955e9.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998684; x=1776603484; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nP/0Rv4uOkvV3YE8Mcp+3h6PfpM0h7eJxFsh2cjVBaE=;
        b=rtfS+sEU3jpnvaJ1Q+o8azVbJE+jK4ipBKz9fSBN9XOhK9npWzPg5QYmrOt/6QGVUD
         Nyz5wLkExWp5YFdR1KVPenSS1M59pZL+zJnGt0yD0MwWYCA0zHWT/f8ivPsKLDRKFO8t
         aHTkkvdXWwuVrbhH8TGzSby92UaGxpsyR8mGGxq/sBurLkomkp99DB4posPIxwoqaAW2
         I6DagXQYJkPoHHHpGtnws6o21DpWey2XuotiCG0DjRNLzfmJAaqmcz6CuXC8E9gf/MEd
         GezQdxm3j5+WfUXRWJSyCtqnZsBOz9gu75zveSTVIRzed/cTTf/RLkH3JUNgsfZg7NZ8
         mbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998684; x=1776603484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nP/0Rv4uOkvV3YE8Mcp+3h6PfpM0h7eJxFsh2cjVBaE=;
        b=lOP2Ge8xG5da/rIN9DsNMjf1VweAD2scwyPLFnSAwB+vATkFAZPrbvfMZCWbMPvARv
         i7PUo4QK98uMI1G7WjwRPiS4RntWE7hfdLq77hKitBEppX7WrXBQ5zxtw09Uw3vcyVrE
         SRQDhIF1v2yeB/ZuySybsaD66PpW5g1WM9Ghd+ow+0JqPXvofEtY3su6r5W1f7t0O8aH
         ioyI8PcAnkAqmFWY+LMDsk9rS3AZ8aMcJ4APd1nQmhlmFqodFj+RoUXdnzMIawdOkMLg
         qq21i2BsFxZg8JGgUHZ1FrvP4BzCwp6k/fWjJHKHSm+OVsH/ktohceHuhmvUNnRRBUDU
         TH2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Mj5x/zhsksWnif6SNgFPmioxcEPm85h56ZKFX3MVgglvkFP45Zibm7ErDrxncPyXVu7nDmCf7/KzFSM0X@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9TNlew0EAJKWCoYSOQuxrScLLneassaxVwppy1GtrLnXFzIO
	BdRQuebSiuBVKntMgQXICckLAxquz6TmnIFwMlfGSsmZ5CQwjErhom5X
X-Gm-Gg: AeBDiesp+yx/SKEQQYOpwCtalbD8tKjQY5OlMM7W7DKKDMeYsYL0u6jVOuNVYwTcSla
	lZjbM5Zjefv+8CzZJ19bWU54fOSunpJGhm3TuKHT0pD0qFxPtZzsCup3eMAVj+ob7XBWAXwqfuF
	unMgy48h2pkTo+v1s0/hhojJ75zGzWmV8P0CPC/X18ej2S5KkHYrgnEn6Q7Wa6ZCmtsF7sS+Z6B
	b7OWrBNBa74NoMoK/cY/7RhPDP/ffNQngcK8lTk7Uqt+l4zj8UaD2MiCiQ4ccxVSZgR9r3UkPNC
	zjx0ZZzzcVYz7BhoNU9DcgyWzxgPolfyMOH0vxkWP1KXENH/j3wKfj+yDxskMg88t0zV+G6a2Wd
	AfYLiTRsEGTbgeuPEy/X+Mr8m0PO7WsxsszGqQdTYfOuJ02DwxSQqS5RoEV0RW25Odh2P5AwDq+
	tJSKhJyf9DovaI9Un0yyneH6gfkSHfDw==
X-Received: by 2002:a05:6000:24c2:b0:43b:8f30:39bb with SMTP id ffacd0b85a97d-43d642ab9a7mr13597067f8f.24.1775998683705;
        Sun, 12 Apr 2026 05:58:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50200sm24456048f8f.29.2026.04.12.05.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:58:02 -0700 (PDT)
Date: Sun, 12 Apr 2026 15:57:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adith Joshua <adithalex29@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <aduW10V3CweT7Dcf@stanley.mountain>
References: <20260411052817.354594-1-adithalex29@gmail.com>
 <adoBQ8skQ7aRXKNr@stanley.mountain>
 <CAFvcH2CjS=HMxt_Dd04eMAELQtxdB5LYmLa_1TLnJeEuKvR6=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFvcH2CjS=HMxt_Dd04eMAELQtxdB5LYmLa_1TLnJeEuKvR6=Q@mail.gmail.com>

On Sat, Apr 11, 2026 at 08:04:56PM +0530, Adith Joshua wrote:
> Hi Dan,
> 
> Thanks for taking a look at my patch.
> 
> These values come from the RTL8723BS register layout(as in original vendor
> driver)
> 
> For TBTT_PROHIBIT (0x6404), the register is split into two fields. The
> upper byte(0x64) is the TBTT prohibit hold time. The lower byte(0x04) is
> the setup/margin time before TBTT

Is this available online somewhere?  I did manage to find TBTT_PROHIBIT
on google for the rtl8188e driver and the explanation is here:

https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/drivers/staging/rtl8188eu/include/rtl8188e_spec.h#296

It says that the "TBTT prohibit setup in unit of 32us." but the patch
says it is in units of ms so that's wrong.

> 
> For BCNTCFG(0x660F) the upper byte(0x66) configures AIFS value for beacon
> transmission. The lower byte(0x0F) sets the contention window to the max
> value

I wasn't able to verify any of this.  Please provide us a link to
your original vendor driver.

> 
> The intention of this change was to replace the unclear hardcoded values
> with proper macros(like the todo said)
> 
> If it is needed I’ll send a v2 with more explicit names and brief comments
> for the bit fields
> 

*grumble* It's honestly, still not clear if you used AI to write the
patch or not.

regards,
dan carpenter

