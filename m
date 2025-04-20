Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB7374D1;
	Sun, 20 Apr 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113324; cv=none; b=eXbTfJmRBbNjfOtaFwKcPVgNkBbj2RP9UPyENvnJ749lYmu4eEiWi8XjodpdYGbf8L+N8j7SdVN8evtK5UCPkjsqDukfz1j4n4B/vwFhlGUskA3Bx1DXN2w18c3NHG/m2/ZoIMc/mLGcrricqbcXc89QtHMLJz+Ae1r9s4G7+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113324; c=relaxed/simple;
	bh=tsaCaU9Ezr0cIMp5ShIilmqtgbAZpojFeGzVG8Gx8K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckfkZOSSe7avzSobVI7lDxX9IEd+XOuwE/pNFAVYjVSYy9FEQpeXX+2+Mt/yZH9gnzr/xWqXwAdcT2KQEZrVODKPbT9xsQn5EL5h8xR0J+7uFR1IstUG0QaIIFJwZ2/h+fiWSTKzHGImgNo1YCcILuqKEPKNfOhyV/dieRLxJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9nQE1X4; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9nQE1X4"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e1b40f68so307551385a.1;
        Sat, 19 Apr 2025 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113321; x=1745718121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsaCaU9Ezr0cIMp5ShIilmqtgbAZpojFeGzVG8Gx8K0=;
        b=L9nQE1X4sacZRGXJ3uHHEX0BD9xaBzQpTaD1mCbjCD705xEtIJ2saasmrh5KAUYUMX
         nJBnpypDinPYU/OGIluBVhDtYLoBJqjTBqjYBy7aU3bR/8UHcQYJLUYHhk7DcQFI7RP8
         vgjXaHOiyZaviesYHFVGQ5A7Oc6q7k7KLphM0Cc7vi/px+LcoSV/pUyWvBBPUvUOb2tF
         oAnlGcNPEJRcCKBbORBJLZ1kengybIUHZ3jStz0sYuPDm6Z1vae6BNTl6bFrC9ZAksTq
         5sCNpwb/RwxQbOUAk1pfTHkZCUkvKQdtgjZy4ndjySHwZuWnpdOJsfjqhVd242ANw06b
         9JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113321; x=1745718121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsaCaU9Ezr0cIMp5ShIilmqtgbAZpojFeGzVG8Gx8K0=;
        b=WuJKpFDGWnv4aQIJxhoMlwAgao7SBydqnb8SQpjAq1NRg6T4nqT3jtlgZxapI1T91P
         v2vvpTJtgchaiIcIMhHfWoZqAlilAPY58//vKkbXVfHKwrHkgZ4XHBbJ8DJ/z5DVZhDL
         EHcg4dzMV0I1VLiFoIGh9a34hpNCpWz9yN9CSo1+NKgPbtM995qkn6tywc5yLXkDfxoL
         x/Z6yDGsNlXXQDnA2rN8ljRThylscSv3KMWrXJ8YZE0mGsJkaMMN98wAuXcsCnwjfn4i
         evYIaQO4eNB+w6+clCtEv+AlMhYDoPWbEw2fCwTQnJ5/4HXJT0MbOAKuUzT7QGlJjxli
         YxAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6yaJn7b0j7ozhObuTU93wnhHfYEl2eEZ+4eSauH1csnL97YI0XX7jEyzMWVwE/9xiDHHA4El93d/HJ/Pxe8TmXlA+Cw==@lists.linux.dev, AJvYcCXgTeHZbCTOkZh/IYCvqbqfuXWO5kFPeLuMgoNnOFiB6sEJlJy13vG6jWlQAgEdO8Pqa/NxQfRWxBCLf9Ymtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyrb2dyWixbaNeU9rgesUWdDudxryg05ms7bqA4j7Z8uAYH7Bx
	JBFAh3mtvpsc1fWwyVOIo+7SBWsxhA54pKHHuvh+5NRynfNqwkg5pTu2lhwGZg+AQo7ovwuRX3r
	2g/WF3iiJsuzAkYmOxyjQfEMaoyqJfQSzvblGgw==
X-Gm-Gg: ASbGncvEIcJL9OpcvIZVj+KfiU/j+OvUyJp/r8IUg34gCXsKmdhMvqfKKjbfwHKm2qI
	b0XB6F/b2PlGbSMV5EOndFh4Mn2dY0CDL7EmMnvcIWqEx1wOH5ag+pQcJz9+D8mUSijccI5BGAI
	N+ntQ7zG7JfXcBfp/e4kUIIq1jw1xeDnJcnf5F4cbcRuXlipe0MG6i9h6halgtm6QN
X-Google-Smtp-Source: AGHT+IGtT7QLX+7ds1/I9qdUhstYhhVMMLe8WqSFbnO8/AS9IoKoujUwgBw1UMPZ2iNyTCzr+bpvr7+jXJuA4u176YE=
X-Received: by 2002:a05:620a:3953:b0:7c5:468b:5658 with SMTP id
 af79cd13be357-7c927fb904cmr1058657785a.28.1745113321715; Sat, 19 Apr 2025
 18:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250417135434.568007-1-gshahrouzi@gmail.com> <aAQZrhBLQCa0TjOJ@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <aAQZrhBLQCa0TjOJ@debian-BULLSEYE-live-builder-AMD64>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Sat, 19 Apr 2025 21:41:50 -0400
X-Gm-Features: ATxdqUGWomIPkEKnO1A5RVPhgghPnE3H_nH650MuXGIRClqT04P8Aoc0_et-9W0
Message-ID: <CAKUZ0zLMAZFHwvuqfoL6JZfphYRhtjkqOyi50_ZffbA7-4MCew@mail.gmail.com>
Subject: Re: [PATCH] iio: frequency: Use SLEEP bit instead of RESET to disable output
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 5:45=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> On 04/17, Gabriel Shahrouzi wrote:
> > According to the AD9832 datasheet (Table 10, D12 description), setting
> > the RESET bit forces the phase accumulator to zero, which corresponds t=
o
> > a full-scale DC output, rather than disabling the output signal.
> >
> > The correct way to disable the output and enter a low-power state is to
> > set the AD9832_SLEEP bit (Table 10, D13 description), which powers down
> > the internal DAC current sources and disables internal clocks.
> >
> > Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > ---
> Looks okay.
>
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
>
> Unrelated to this patch but, if anybody be looking to work on getting thi=
s out
> of staging, I think maybe this driver could use out_altvoltage_powerdown =
ABI
> instead of this custom out_altvoltageX_out_enable.
> Crazy thing this driver doesn't declare a single IIO channel.
> Seems to be somewhat ancient IIO driver.
I can start tackling this.
>
> Regards,
> Marcelo
