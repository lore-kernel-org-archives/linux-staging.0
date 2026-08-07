Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86A41F366
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097536; cv=none; b=MDqwiG6H/ojucJ9CHe3LBgqJ3MGbdwDwjyusmItZWoXVDUSYb+vfC2ydl42Gb1PypSDxJeRfxIBSBLZ4dJYAlyDaRNoV55/99DBrTEWDffqR36xegPWyBX83fm/lUP/PbqSU58LUFsgTFIXcI22j6cwgi3EsWGCQ8TGsbAhka38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097536; c=relaxed/simple;
	bh=oTHqQLCwhxCe7N0D1T5nZxG+I/w2kOY6Qan/KcU9ovA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gqpc70d7IvenHN4s2/jyFYwAFkKe+KEshuikkC+k1+fimT9OcUWeMXO2CWF+LglnN1gsnYhs+y0nZllzE89r39j/3hun+Kl/+EBpR6Qe9/BvUiFYXKKJrumEAOTpR+bpdOkJ0o8NifxzVoiXYRiSvyss9crxpsxGotWQ9wXvmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGDLGT1E; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGDLGT1E"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so2763646f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097532; x=1786702332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dysWOlTH9FYoN0EEYHBpje7XGNqqwHjlQuHDF1F6Br8=;
        b=BGDLGT1EgAwZot+SAFGCNVyL7JtIanWlseqsMPUnPA+xSKI8Uxq5ewjbIvv8OL6trq
         yAPDxg9DBSD/0ajd9hw9bkddynaPLzETwycuNKVEXM8+Y6S+OIz8lMLYc58BzSelWaW3
         MyQQ9k1McSFWA1SohYBhE8qjE7jg9hdpDIwq0ZpgB/CiaE7n3posXMklndp9oGF5oTu7
         SfuU093TojmV4L18bbvSitjQCC0Ac55X7AfoqchNiEpxtZNa2DvV2Gdag1N6iVVRuSx6
         vC1zu/ydgTeys3rG/Lxa6Wa1uLdabkcvSS3BvJ2z4h87I2XC35f19cFfTG5FpIGYehkz
         lcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097532; x=1786702332;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dysWOlTH9FYoN0EEYHBpje7XGNqqwHjlQuHDF1F6Br8=;
        b=MDuWlSKmNqvjmtKNJREfOgsbYHCU+bNF0eFEfLVnl3XkqJlGJokHD3AHoqu/2dNsmQ
         ejX+/lougzbKLZY7aBk+AnK4onUvYwUxr7Cv/cVQxVn0Ms/ksmZ7pWNG1B+/PfMs1O8J
         qROqQWaAPhAyDMN1X9lYMi7k4EPOSZ9ed7uvywao+PEBXOknrL2YR7bqRI3ZNuQfNeaT
         c6YJECdLIbgd8dfdI0ikZ6NnXwMIMfd0Q6U2iF9dSN4bL7F5MrLrMVMjKrCcThvAiZkZ
         i65i728urqQgV9eBlmEk9rwQl6iRxMUdNJSGHaGB/URXw5UQhUbjGvtDKRzRTjKYwjfC
         d7ng==
X-Forwarded-Encrypted: i=1; AHgh+RpRd/dfBMoCAfi8be7WiaGe4O85WbzndtHP7wLfDB2x+zihSch8zWA/BzeicqviiMoyrAuFEBPArDxN48Ch@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn0/FMjdCngibmI3xgxEzUYAW7so6/UuUlaTtlZks4eafFDOF3
	Z9gApiYN6tZfhmy+RGNEWLeq1r8b8JGE0oSRdDE9f1/8XO/0e+tubstE
X-Gm-Gg: AR+sD10IEyIIrgINghUS9CGdxUuJDv10j2kUoOBLqSLK0EwBGuOR/jet/kFhfNJiDDF
	3rlDvvXz7Rdla7JOvzv8pc6bsoFCqnWv8IA+zvUTnc//R79plAv3Jwea4GDs69QsXQGaXsuzzZ4
	7lgspYg6onATQHd9zyQiZ7kbo8yDty8Oska6WgNfnYc1IvdNXKThcVVQ+OFHF+jN8HLO57j0BHO
	X3ipgGSlwT6XcFnGxa78IMXH6XJ8xsIulnR6T180FSJ0Al+b2zZm3cW9PBnLRHudLUuN+dCSvX9
	QLF4hDv7LXH+VjSsrOS5FE1Xht+45kzs8s2XkzBn69dnOi5OqaG3Js+v/Kk8zlW7nTP62rsNBfv
	tPihAhIDDwOoxQwUGfOtgdQ0m7kvZLxP/3jIH2nvM/5JhucRjyf6U/SglXcK2lwXAn3zvD1TeNr
	RGA72X8NXPSrEe0CDeV0zg/7CjYC7HjIEUhHMJuQWb0MaPek2GTLKshN3zAh17S+DX5TJzyo//Y
	jjXe6Wa7I9GB5SO67bWHlPP1eR87x7xBt6HsX+edz3Cj9lJBkUa2VeqD1whrzOwgoilVzYp0urv
	QwBGlkU0Pgo+xTKuewTJ8a6vaazeATVWUXnDJGRcEni0U/Ax8feT0MAAt0d4h5FSUMAqY7Urpj6
	Tg5+tcVIDec+7PBVEBsOubvE9wje28PN60GW43vKSJeLSX07TkJDtu430SjiuimeZNNOaRMA=
X-Received: by 2002:a5d:64ce:0:b0:47f:e4e3:d85f with SMTP id ffacd0b85a97d-47ffd9180e2mr14145937f8f.17.1786097532403;
        Fri, 07 Aug 2026 03:12:12 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002206effsm4153583f8f.32.2026.08.07.03.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:12:12 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:12:10 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: andriy.shevchenko@intel.com, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, nuno.sa@analog.com, gregkh@linuxfoundation.org,
 skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: iio: frequency: ad9832/ad9834: add comment
 explaining do_div usage
Message-ID: <20260807121210.0000764e@gmail.com>
In-Reply-To: <20260807094704.5371-1-raizudeen.kerneldev@gmail.com>
References: <20260807094704.5371-1-raizudeen.kerneldev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  7 Aug 2026 15:17:03 +0530
Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:

> Previous attempts to change do_div() to div64_ul were rejected because
> mclk will always fit within 32 fits for this hardware, making do_div()
> safe to use.
> 
> However, Coccinelle continues to flag this as a false positive. To
> prevent future developers from submitting unnecessary fixes, add a
> comment explaining why do_div() is intentionally kept.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---

Fine now.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
