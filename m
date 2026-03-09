Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121C413225
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 19:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085782; cv=none; b=u3tv7a7TQCusyaMvZH4OkGV/helpGM1hUA8vO3u8l800DIgY8T+FqocvNNyezU0SBG35cFVgjZ2PZHvKQ795qrTL88lbRP5dmdZSmpouzUf6bzOzhXsoUOnKQnsPlpzLhpNORTai/5+WEQOO0bKR1/ROsprv+vbFiibbXrwFWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085782; c=relaxed/simple;
	bh=La0Dw/iXwCfK61DiyuwsS3pFYs6qMrRcFm40LQ1YPiw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Pc4ViDZ8327DPcHYa0sZtHPnOsgO3AJb4o+5SLgjLTY1j69sau9Ncf7YCjgv5DPGjJB1m6CJDU1NAguGVsgbjhmUkyfD5S3I0KWg2m7GIUzKZihWZyFgdGvo+ayR261cd2+vaJNgXd6YYuk6ieqP4Al3brx5lkFZyTFKzXjVbyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eot7UIOR; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eot7UIOR"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso14944946d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773085780; x=1773690580; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGTHhlmI1UZ2hsezXBBIxDta2G1mkmTT6ZDlStdS1w=;
        b=Eot7UIORryBh6ux73JHGbxCACvsxV9WPlAKnyqCmy6t20bt1RUqgOAbgsRxK6O67LK
         xxaohxHXkpy3o4JaElMQMgdpBDrLsY5wsU0rNG4JffBBEG0w2rOWvfUR0Y7jVR0WzVIJ
         39dp4/OS8nJ+2rgtIUFHIUj0GIEZNAL+QtcSLY/VWwuGIcqY3uuIpGumszDlUKW7EoVP
         52/4YlBUxj9iY6nZXL9aPEbY0byMgcpUpSvgSd74peY7bsKzUTdSsi5bkRJsdKLiAF4O
         4Acda48uo4Ue7MsQ6MVEo5px4vkOP6Wa9Sj9sLDlCyZi5dzQBW8aMfoYlrYjnWBysFkG
         Rz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773085780; x=1773690580;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYGTHhlmI1UZ2hsezXBBIxDta2G1mkmTT6ZDlStdS1w=;
        b=LWxSnxwFxMH1+kKyCJqhYhP5XJuzZmN5Uw0s8cbZdDu6otBCQat8vsPEYdxBNn3Q+g
         HGZaJVn2Matu5c0M9j3+Fk3UurQ7ogDeWk+PDPIyL+GJ/Zv4ElTpG8+fhGRgDqF4k6At
         K6pQI8FibP8wwsErKzLsBIY1+yuLT7W+MKTEEFegGQyeoQlQ9XLdCNoDA/lzXPC2WDyG
         evf6mKogbpoULSS7LQpE86daVJAASuqNYkGFMaSX0dcAGvLzfUit72PZWGvHxFriMBtL
         IWGtz6PsDWMdnSXnNi5OBv19Ses7aOm9U8C6N0aoXyYQKScD9Zv8qdNzz7J3sY0G094j
         p8TA==
X-Gm-Message-State: AOJu0YwBDXhRJfFHiM+piisnvr4Hu16tXPLbpc/iMgH0hp8Gfki23YVB
	MJDF0xUavxhF6vHk7inWmidP5IQJWf3yaLWet6VntD9D2/UWKCdpgyIb
X-Gm-Gg: ATEYQzzK8d6Oyaz+lG8OgT5sqNvQluza6yp3oumwwOrQ28X/l9Tu9OCP5qJrwg4Y//K
	hzkob3VBaT0ukmDcryITHDlt/qSwY+mu/WXlZ+Dqc989JKOkmYKLVec8sYF35NEzqwqUHSFSSKH
	a06R4+pyduQjiYQ1zs7bzDgnjr6l0TKTzns23oQqjU6/lvk3nQyEHgCmm4ETA8l8dwGTgs9brTl
	KrfiGf/KimSMtDl1GjqZzNEPOjnEeQnhdaZ0oCWH/+COm9GeKGyne8hqEB6LAWldAQFzOBZNhFV
	vHye4oZIN3kSwYjpwIqWBkg7qQ213XQo3RZSkJx+RVlUDt6thdsXQhTH6kee2zCW7c38slShPMx
	fS9SINupGyiYax43G1rBRpkKkX7re387OU9QFFA6vGaceF+XPt8m2IivYargssV5VUB/WXTsiCC
	alFACV90TZoGzdJGaOKD+TpVwjVgXTuFou/p+ENR0jNSZ4Mj97+ceylrluXwfQY1YLsndXisTBF
	o0B3jbV/A27YgnKm9PR6elPWSHjZTo/
X-Received: by 2002:a53:ebd2:0:b0:64a:dfe6:c37b with SMTP id 956f58d0204a3-64d5a11ee41mr640994d50.14.1773085779979;
        Mon, 09 Mar 2026 12:49:39 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5148883d50.7.2026.03.09.12.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 12:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 14:49:20 -0500
Message-Id: <DGYIG1G9HUYB.30NLQ60XSCQLW@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: rename supportRateNum to
 support_rate_num
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Esther Zilberberg" <esty5664@gmail.com>, <gregkh@linuxfoundation.org>,
 <arthur.stupa@gmail.com>, <jannik@jrehkemper.de>,
 <william.hansen.baird@gmail.com>, <kaizhetan@yahoo.com>,
 <s9430939@naver.com>, <straube.linux@gmail.com>, <ysinghcin@gmail.com>,
 <kees@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309095543.14495-1-esty5664@gmail.com>
In-Reply-To: <20260309095543.14495-1-esty5664@gmail.com>

On Mon Mar 9, 2026 at 4:55 AM CDT, Esther Zilberberg wrote:
> Rename supportRateNum to support_rate_num to fix warning
> reported by checkpatch.pl.
>
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---

...

> -			if (supportRateNum + ie_len <=3D sizeof(supportRate)) {
> -				memcpy(supportRate+supportRateNum, p+2, ie_len);
> -				supportRateNum +=3D ie_len;
> +			if (support_rate_num + ie_len <=3D sizeof(supportRate)) {
> +				memcpy(supportRate + support_rate_num, p + 2, ie_len);

Adding space around operators is a unrelated change.

Thanks,

ET
