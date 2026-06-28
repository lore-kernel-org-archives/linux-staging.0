Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4DC355F41
	for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782661431; cv=none; b=SrzuaDwKxfPfh/eedZoUK/CElHsyebPAbNudKTw/YGliD0PRLAP7/GRpDksvGtGazsduEXqK9AP+ZUOY4m2Fev32B6O6qRrvjDwEgO9x+R0JaOfK6D20rjp1lQOZVuXE2CKrFrHcIfoTEapRFbV+KfFx48flF9BvQt36de0scbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782661431; c=relaxed/simple;
	bh=40arCt8NqhJaNl0q9UQATGJjGRq/MsPHGOmI0715nXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiO08o5+/d4ZylSFgHBV995b1bxqh9dNecmKN9YsK0pmNaIITABhFyyzeBfKC4wNvKzsvdmn/2ritiZnjoHV+ujRKstTOqrWG3q1Gi6TEBFHSHP/3cLf3gBkehJyBBrmppnEG17kWjyFctf5E1GzLADLMRrKt0B1FqvVZ1x4UvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoXPa1PZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoXPa1PZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso32815445e9.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Jun 2026 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782661429; x=1783266229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+OMJP0P0VJX23QejDNAiRcdNcoGaSYxL+867MSgbJA=;
        b=WoXPa1PZUlS/TyNvQknNVVFU5L6y/oLjt+BnZccay08xx0d2QjPTR77gUTKWMT6Bs3
         01aIP/2Mmkb742hEXrlUGey9wvDRfczZgiyksWVye+qTsAoRxmvV9kVLzbD8uak5P713
         NXrXlkffAg++sKfwWS0gCHL2YiX+t1dhr5SCG04A7r9cKHBeZB9ILsJummKO1a6b0lFg
         Xk12DvUM5kQJZ+PW5n+byAdU8gnokcOIOlJ/RHoSDFUrs87X312WORzsW7+Id4r9IPoF
         N4MJzao7BZvVbqn1OHXEwcbnUsJfE6SrnAf5UvfRAhAg61tmk0uJ+5YdtZvh3veeldzl
         nvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782661429; x=1783266229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D+OMJP0P0VJX23QejDNAiRcdNcoGaSYxL+867MSgbJA=;
        b=kOMmFmt8t7QhQjOMe9bzNUPgslCjfIjvxnFlZpjdjQGEsBUoUAadLJev/ekXVU8KmM
         Gbdu5niquL/ezkDzzU54HSs1mWwVPuy8tYvMdi1A7J3IK+uYkYKTYYtmvjoCvSVYi+cq
         /Owx6mXO7Tl4D7sqANdKmBy+TPINaoNMUp6jqz6MbwpoCExrFUwJBIpowlgXv/Uckn3j
         j4JpQxdncObJntwNVcp/x7+nCByUOR1HfouHrxnE5K8VboGs6bc+1G63Qs38V8xmLjdO
         ivS6ABL5I+1bR2DdBO2WyCJ2pXlcvbXcABzIx7xX03OBRqHblXhOX1WVv9aMFc5m1QKw
         5yqw==
X-Forwarded-Encrypted: i=1; AFNElJ+xo4Xl2dOYlidONxNf+r3tM1e0U5/cro6CbaWhqB3IiDfXh77CGo6FWFc/zCUbOuyqGG19JdPRXZxzOJ+H@lists.linux.dev
X-Gm-Message-State: AOJu0YzixiXcPP1g7ZljX4Ox2MDjd1G88F27xYdklLNzHXVknVcCv/7J
	tSl4o8mbuxrRdHzhcamCjJW6XLX64NOyewMJDWtIsQSBXssLxgwtjMTw
X-Gm-Gg: AfdE7cmhQhVbnWfg5ysvY+V+dR/NlpfZzrHihnk/CnPX1zjvK6F3c+AOlmDlKCD2EHG
	PKu7SqeesXBs8HhVxfJ7kSOdcWs5dYt2e9ZFTmL4Vx9S0+3pUqokk1H5blRDSHQPBuMQKXaLF5E
	T/H/aX2vZ9L3sGA86CGSqJeYmloo9O8kjb9JMupl+5C27w/fjoxjomvFLL51ESEM5yfmplpFqpP
	waqsJ7SGFsztkiPUVJ+Lian/brlkKMflyKX9zox8eeser4/sHdSdUQBqYswkI0OCK3vDENJHt2d
	Q5ALOOcTNOOOLeqMvtt70AtvJQ+OXV9gCMpdYcMM7XBgHBlUy++lrzx8IvBa98U+Z4gykc5IWti
	WEqnpEMuDj0W0owSwH8K9j08ANlozQtqvDLHWX8z3lb04/kXFvJi1rBtcnBlQgLpqWYh1XZp3Uy
	KBqoSJ5anAvFyMQW/0J414P28ixDc=
X-Received: by 2002:a05:600c:3e19:b0:492:4c5d:4db3 with SMTP id 5b1f17b1804b1-492668322camr202514645e9.5.1782661428588;
        Sun, 28 Jun 2026 08:43:48 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm32384608f8f.5.2026.06.28.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 08:43:48 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: andriy.shevchenko@intel.com
Cc: airlied@gmail.com,
	amit.barzilai22@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 3/4] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Sun, 28 Jun 2026 18:43:12 +0300
Message-ID: <20260628154312.46185-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ajpLyronl7a-yxh-@ashevche-desk.local>
References: <ajpLyronl7a-yxh-@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firstly, I'd like to thank you for the review.

On Tue, 23 Jun 2026 12:37:31 +0300, Andy Shevchenko wrote:
> While it's not a problem _in this case_, the rule of thumb is always to have a
> trailing comma for non-terminator entry.

This was a repeating comment in the review of this patch.
I will be sending a v3 for this series, I will fix this point in
each location you mentioned in your reviews. This also covers the plane-helper
and encoder-helper arrays and the SSD133X_FAMILY enum entry. The terminator
entries (NR_SSD130X_VARIANTS and the trailing 0 in the command arrays) will be
left without a trailing comma.

>>  /*
>>   * Helper to write data (SSD13XX_DATA) to the device.
>>   */
>> -static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
>> +static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values, int count)
>>  {
>>  	return regmap_bulk_write(ssd130x->regmap, SSD13XX_DATA, values, count);
>>  }
>
> Stray change. If needed, either explain in the commit message or create
> a separate patch (depending on the dependencies).

The SSD135X branch I add in ssd130x_write_cmds() passes its const u8 *cmd buffer
to ssd130x_write_data(), which took a non-const u8 *. Rather than cast away const
at the call site, I propagated it into ssd130x_write_data(). I will explain this
in the commit message in v3.

>>  	unsigned int i;
>>  	int ret;
>>  
>> +	/*
>> +	 * The SSD135X family latches command parameters with D/C# HIGH (i.e.
>> +	 * clocked in as data), unlike the other families where the opcode and
>> +	 * all of its parameters are sent as commands (D/C# LOW). Send the
>> +	 * opcode as a command and any following parameter bytes as data.
>> +	 */
>> +	if (ssd130x->device_info->family_id == SSD135X_FAMILY) {
>> +		if (len == 0)
>> +			return 0;
>> +		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[0]);
>> +		if (ret || len == 1)
>> +			return ret;
>> +
>> +		return ssd130x_write_data(ssd130x, cmd + 1, len - 1);
>> +	}
>
>>  	for (i = 0; i < len; i++) {
>
> This loop seems for the len, so it will be the same for both devices as far as
> I can see the context. I can't find this piece in the original driver, perhaps
> it's some dependency?

Correct, it's a dependency. The for loop is unchanged context, not added by this
patch. ssd130x_write_cmds() was introduced in commit 208211646fb3 ("drm/solomon: add
ssd130x_run_cmd_seq() for batch command execution"). It is in drm-misc-next,
but not yet in the mainline.
That loop is the existing command path used by every family except SSD135X:
it clocks each byte out as a command (D/C# LOW). This patch only adds the SSD135X
branch above it, which returns early, so for SSD135X the loop is never reached.

The v3 cover letter will explicitly state that this series is based on drm-misc-next,
hopefully avoiding any future confusion.

>> +/*
>> + * Variadic wrapper around ssd130x_write_cmds(). The first variadic argument is
>> + * the command opcode and the following ones are its options/parameters.
>> + */
>> +static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
>> +			     /* u8 cmd, u8 option, ... */...)
>> +{
>> +	u8 buf[8];
>> +	va_list ap;
>> +	int i;
>> +
>> +	if (count > ARRAY_SIZE(buf))
>> +		return -EINVAL;
>> +
>> +	va_start(ap, count);
>
>> +	for (i = 0; i < count; i++)
>
> Can be
> 
> 	for (int i = 0; i < count; i++)

Fixed in v3.


>> +	const u8 cmds[] = {
>
> Why not static?

This array can't be made static. It is initialised with runtime values
(ssd130x->width - 1 and ssd130x->height - 1), so it is not a compile-time
constant and a static/file-scope definition wouldn't compile.
The other ssd13xx_init() functions are non-static for exactly the same
reason.

>> +		4, SSD135X_SET_CONTRAST, 0xc8, 0x80, 0xc8,
>> +		2, SSD135X_SET_CONTRAST_MASTER, 0x0f,
>> +		2, SSD135X_SET_PRECHARGE2, 0x01,
>> +		1, SSD135X_SET_DISPLAY_NORMAL,
>> +		2, SSD13XX_SET_SEG_REMAP, remap,
>
>> +		0,
>
> No trailing comma for the terminator entry.

Removing it in v3. The other init arrays in drm-misc-next still carry the
terminator comma, but that's pre-existing code outside this series -- I've left
it alone to avoid unrelated churn. Happy to send a separate cleanup if you'd
prefer.

>> +	};
>> +
>> +	/*
>> +	 * ssd130x_power_on() issues a short reset pulse, but the SSD1351 is not
>> +	 * ready to accept commands immediately afterwards. Give the controller
>> +	 * time to settle before sending the init sequence.
>> +	 */
>
> Any reference to the datasheet?

It's not a datasheet figure. fb_ssd1351 doesn't do it in init_display() either;
it inherits it from the shared fbtft_reset() helper, which deasserts reset and
then does msleep(120) before any command is sent. The 120 ms is a generic fbtft
blanket value, not an SSD1351 number -- the SSD1351 datasheet's reset timing is
microsecond-scale.

I removed the msleep() and retested this on the hardware. The panel still 
initialises reliably.
I'll drop the msleep() in v3.

>> +		int ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
>> +
>> +		if (ret < 0)
>> +			return ret;
>
> This style is discouraged as it's harder to maintain. Better to split
> assignment and definition
> 
> 		int ret;
> 
> 		ret = ssd130x_write_cmd(ssd130x, 1, SSD135X_WRITE_RAM);
> 		if (ret < 0)
> 			return ret;

Noted. Will fix for v3.



-- 
Thanks,
Amit
