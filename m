Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8913A6EE9
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 16:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075601; cv=none; b=t+7rJLOHgSWedhIEGLKRuOzCxPHUQM/mLZaArxKO3HcdfYJ6vczd4KkGVbJs1yfUi96ugao5hbeA0C5uFsVKelk3UYcTa+BE8AjQlfaVrXDogrnvINAlQOyRyyeEF8LMmt2+c0sOeH7bV5CDwrHZpVBNd7qyjlqrswWX0sGpQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075601; c=relaxed/simple;
	bh=Z+HGdrBFEu1KtTO54bSIm7XtwdFJI6uv9njLqQnhPPI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HjBIOSq4PUQ/oIx6he3e1/jJnoA3GCeZJDhLM4vm8NR0QI2dTFROA5THm196fUSvHKxRsjrzsVix41ouT0BNMpPYnyJHu9G3x4JWlWFkfoWjdU/i2VBlNUJ+5Y3b6T2USbw6+LjekKh9E5uO+TArkM+Wbv30kWwQ/Nnqc7sLbaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SY+CNNan; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SY+CNNan"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so100194065e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075598; x=1773680398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+HGdrBFEu1KtTO54bSIm7XtwdFJI6uv9njLqQnhPPI=;
        b=SY+CNNanDXkSCCtnTsnykDtJtm9h0DjfLdb4esZRE0k0rbOxwg0IUSdwl9GeJMDtOi
         4MfI5wcFAdXKxbEbFXi3PBmLPGUB58vGmigVM9FmYBVr3AGa8TvJOQBuotWSnwnyevux
         Lf2YHBW73oyjDE5hVUgOMBK/q02HxoUq3Q0UH2al4qbepKMMnj+39OYr3qM5/4cxpCAa
         jvtT3sVO/mNg0Ehb3iC+lQ2YVjezo0e7BAdh9VMftpEZfbGj+Z9IX3e7E0Iygy5XhVpT
         i6Wr2kGnRNKxSzKz4JZFEUyvuG6aFqpF5QWKUl+MYmV7d//FB7dWVGKs6+MdmrVngZdp
         AXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075598; x=1773680398;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+HGdrBFEu1KtTO54bSIm7XtwdFJI6uv9njLqQnhPPI=;
        b=fyciTaCGS32PmJ/Hi0uo0g98u/harlCmLCyde0V2AKaJlBjXiWP7hT+Ror5wC/UM0A
         NkgODgrNvr5wBKw5lyPClCW7xpIXLuygumDY+CfRXX27VtHJGEl11VvAu1TzY5JRMChO
         wqBDocPX9961n6nTfrVmEkKJfk689/UXmejNw5Jd8lyvmTmV254oxoKhEbaflXr2chan
         xZnBDUECRDvD6Lfabs/EKM+EFQ8Y92+gbFGWSVmdzXYxNpcqlhzThzwkpTW67Wz2IlCi
         BSi2x4Sd0UdMR27v+x8xLp19qboGr/U/HT/lXPND1zCbyJU44SrKiCUkCQy5b6xyDn8h
         s/ow==
X-Gm-Message-State: AOJu0Yx2bOceHT0X6yh3MH6GgfjqYFOmP0G96p85h+XYnNWUsAxj/HJM
	oIO//RAOExdxWh7XNVNBl4BMlo56HJDgfkFpTs3Jy+9wOsX7jtDm+EuFu3Qzm+CIWR991A==
X-Gm-Gg: ATEYQzxgQV7inACDSD/hkZYtXIdWxREIk08fHXJLXeNsOop1HPUWRR9YI5A/tDijT7x
	3AycFqWM4YpaFo2IrXF6zMfBQPNRCfljwNh00OzVFm2RXo8JSQW05WeSDRLRfpYCNOELUDCIHbA
	ufjO2+YVCMCPBHeLucytZ10KhZRvbjtk2mwkWf6zKggSBI1/sab0pwioVxm2AaiVd4AJun3eBBo
	zvBCAo6egIhdrse5Uad94ALjsnFe7u8q6XykXh73ye/gOiMs8IKg75+dNjqjKD1S5lRwrNQHzCh
	NAhTWwjV3VXthAn2CqGP7CoH1ZP589caNfCXCX3xnhQ5ruFxoxv2L5y/pupL0BixKmzZFmjK0I4
	umWwfBDXNnDVnsneuakoSnSx0v7pFsRzdCckBJywnQEWvS2LzfTpJeWJlLQOJzxsqlOTQUqxAS3
	qfxWhX2cAU+C1u63/C
X-Received: by 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr198194165e9.24.1773075598123;
        Mon, 09 Mar 2026 09:59:58 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm5038805e9.4.2026.03.09.09.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:59:57 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:59:58 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com>
In-Reply-To: <2026030952-petroleum-osmosis-50df@gregkh>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com> <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com> <2026030952-petroleum-osmosis-50df@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com>

9 Mar 2026 16:57:19 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Mon, Mar 09, 2026 at 04:14:47PM +0000, Josh Law wrote:
>> 9 Mar 2026 16:12:17 Josh Law <hlcj1234567@gmail.com>:
>>
>>> 9 Mar 2026 16:09:27 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>>
>>>> On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
>>>>> Signed-off-by: Josh Law <objecting@objecting.org>
>>>>
>>>> No changelog and your From: line does not match your signed-off-by:
>>>> line, as others have pointed out :(
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>> I think I made V2s.
>>
>> Oh and also I made 10 V2 patches, come on.. atleast ONE is useful for you
>
> I have processed all pending staging patches now.
>
> thanks,
>
> greg k-h

You've NAKed all 10 of my patches....?
