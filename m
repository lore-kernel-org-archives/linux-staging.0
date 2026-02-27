Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB15346AF2
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212589; cv=none; b=LpLL3JknHoCfu6mk8AU9UruQo6y0S93KqG3sitAug3N8xDRi9CJS+zpXMOJ47HEe+JC1l4ly9NilvvcupXNn/LcqSw4E/KpcEfZx3XD1+9RxeC5Aa6NCjudr7h2mU9Ru2Wjge9EhShw0q6dUvVtawSq2f70b15mqW4j231h88NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212589; c=relaxed/simple;
	bh=NfbU1RBDY31CszwCscX8jNEklH06g8DVxaJC+XgLde4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Xmloh2T9t/Y/bhHOwcZ4A/mN37Q7tr5EPqJ104YXMF5IQnwxzoS6Dx2GPLvZUt/GZqzfuIdC915JiI5NmoY3f0AOr86fOOo+wKSDg0YliovLtgADmw3L/MmYcdB+XggrlF9EcM+W7WOrdBpYUgO+mrAyNK56/Y/ol9PxWiKblOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnuLP4Hx; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnuLP4Hx"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so1962515d50.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772212587; x=1772817387; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NInD6tgW3uHC3N2D36Y6VAT8+EqRVwOxj+jQQUfDC7A=;
        b=BnuLP4HxTsLidRXRuRiUv0EdjelpcRvKVS8KCG1wWflhdTE0zT3dI/PqkPHg190ND7
         Lzhci8Sj193oujBFr8mwdSEZ4ZqAfzvRJLkkDFM4ABKLkvjJ8K6cS/GqOBKnQ1xRL5Dt
         uDRLPG1d7JpZSGA1SsZqnsdo+XOPp5bWcf85m+hgJPlWBW9suqhZG4HS3NhPDOn02AHJ
         mF1BB6pL7klN9aGvUhDwbunNrGab7qz1IMbppJtoFa8hunIrBU7Zyhgtt7tYzQ3msZD7
         Dj740eqB7nqCTHPXOYg1fdArG4VygtKVUtfTSTz6U6175FaVo17Jh+8KQzty2aEnDUH1
         oWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212587; x=1772817387;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NInD6tgW3uHC3N2D36Y6VAT8+EqRVwOxj+jQQUfDC7A=;
        b=ASOpNbZ4NbIIQyB4FbiCN+vJCOItPblfWNXs1xqeYGiJ13V9cAMit4vJEgRYMPZyrI
         MQyweWoWr+UVr47Av+Jgs43IBJQ3nHal189S3+TfmFfjnuAjFOlLtd6P1BBhe5ays4Fe
         8VBDFAkW9YCy0vWGr855zVa0whAVItSGvY/S8PYrNrcNtfUrbsQby5afCKQ8GbB8Jf68
         nN9Jm6mDKNEYwrO/XOXziB3iEIBmXtXqsccXgOlnb2yl8b6D+QNmon8dyH/tM/OyG01r
         T5XmxfHivdyUBGj4ws/4WYoTDdNNe8zJLLi+q7/0tYQ653mGwwX4N/2JUD9Ql36BXWRh
         /cAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPuhxipyxj4pF2n5pbOjifa+V2jlkyVmRYREbsPtAx5IwTWj/JqYzAEgPzUdehrrf58qFtmMQ4rMFE1eIH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+O2lTwVhCobiZrsVcU82vAzDT915gbxT0OnMniijun8tCEnih
	TwFqBeQq+AnIhoFGaD/kjaoA5Yiktt0tjHN6NdEpYecdqpfEZlSJkmCM
X-Gm-Gg: ATEYQzyi4Lig0L/0cMRgP4/lsK/epk8jD3EnNin8XxC44/d22El8AUATXuW69yvKTbZ
	NwCTE2pyeMpVLWr1eqTZyNdgDVaoVBcMub1t7QBsrQBwuatbxC4c3Tje4dxnWCW9ZiwdF0f9WfC
	4yOLsPyt9HW2YkCQmJBPQCKm/DYTP7p8TYQgE+eoDVHrd1YRk7z1XFVNoEKp9DfWHJHH0ydRQzQ
	uLuFtSIBeOHwU2T0qxBP+qokdwagQVsNeOigxvN+GplNeFC3S5Gi7Rntf4+5ZoYKsknO2FY2zeX
	stpGobD0cwDUveqWBgEiYYz8jejITMBU/twVat9s2+1Z7pmbQlxS/myqEY2LKfF6x58TZGC94FZ
	uaXM36HZJmpVzupogb2x5XfuVR5XbEFXhZaPRw+TBdVgGWHQpYIeWMXV6Kn+Dwq6IX/Riig0iSH
	2fbFhwuK1BcfwX4fA84zvwwrNxaDrBzXaE+hEi6MWNPRuUm+Ix7vVGf0Ppjb/Hsg+9URCYVq5ej
	RoVsNINsySGrvYRrWWxTkwKt5O26uzYxZYfefb2ZgA=
X-Received: by 2002:a53:c9cb:0:b0:64a:db3a:f83f with SMTP id 956f58d0204a3-64cc2083acfmr2439489d50.16.1772212586645;
        Fri, 27 Feb 2026 09:16:26 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb759f507sm2593053d50.8.2026.02.27.09.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:16:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:16:08 -0600
Message-Id: <DGPWXAMVCRMC.18JS9LTH3CC8R@gmail.com>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Minu Jin" <s9430939@naver.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: replace msleep() with fsleep()
 in rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226010536.179729-1-azpijr@gmail.com>
 <20260227084623.209913-1-azpijr@gmail.com>
 <DGPUF5A1SKXT.3TSUTM6ZCRH3N@gmail.com> <aaHI2a6DtQlSXS0u@stanley.mountain>
In-Reply-To: <aaHI2a6DtQlSXS0u@stanley.mountain>

On Fri Feb 27, 2026 at 10:39 AM CST, Dan Carpenter wrote:
> On Fri, Feb 27, 2026 at 09:18:24AM -0600, Ethan Tidmore wrote:
>> On Fri Feb 27, 2026 at 2:46 AM CST, Jose A. Perez de Azpillaga wrote:
>> > Replace msleep() with fsleep() in rtw_cmd.c to improve delay
>> > precision and follow modern kernel practices.
>> >
>> > Specifically, this fixes a checkpatch warning for the 10ms delay
>> > in _rtw_free_evt_priv() and updates the 100ms polling loops in
>> > rtw_chk_hi_queue_hdl() and rtw_free_cmd_priv() for consistency.
>> >
>> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
>> > ---
>> > v2: changed to USEC_PER_MSEC instead of magic numbers
>> > ---
>> ^^^
>> Remove this.
>>=20
>
> Having an extra --- cut off line doesn't matter.  The other thing that
> you sometimes see is an extra blank line before the --- cut off line
> and that's fine too.
>
> regards,
> dan carpenter

Oh ok, nice to know. I guess I assumed the last cut of line was the one
that counted.

Thanks,

ET
