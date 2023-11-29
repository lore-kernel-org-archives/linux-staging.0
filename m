Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A051111A1
	for <linux-staging@lists.linux.dev>; Wed, 29 Nov 2023 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdvNgVey"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b397793aaso3375725e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 23:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701244280; x=1701849080; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0nRN9m8DqmGXIbA7BIsuGqeh8HuO+BD8tWUX8cCp+c=;
        b=JdvNgVeyxJnnx9tA2xS+BbMOkvywM8TV/yR2DfeO2rIuhK58PASo6TGHBBDQeBCfx7
         AG53P+LCVRJ3vErnxum8Dd6zJwofdZNWMCOhwUtkf8ChkKEMWmk3nXGQkRBaG3O8Y2Zf
         fQDQpgNmCjRuRqUO9BphF5uAXkbH11p2ZBxdyW4Tyk6QH2jikrIqKNtQeBO5eUk5uogn
         Kj43z+2r32uAZy9fXIJ2OBkT57YfoZcT4zTk3HLBv98bsGcrpr5qrphGoQROsLjMqQR/
         /2jQIPENZNV0aOcBSuxbHbNHkfEoV1hH8O3DWRoYBL7ErIaLoCg0ijMfuEydNixh4918
         Wl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701244280; x=1701849080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0nRN9m8DqmGXIbA7BIsuGqeh8HuO+BD8tWUX8cCp+c=;
        b=YbV45cBwMTxyuNm4A9QzYEHR2EY8SGSi07qCHS/hOhYVsgq8SOmqSEw249kXPJCVYn
         jEpEGbI2YccoUMgpViWbqmYLlpm7eld2YMpmJQtmgl1kyJS9X3uOP+01lK6BlELDvtvL
         Suhf2UuPsHtN4v0l8jOPZT7LAuEHW8KYf/ApE4EWQtJIEoV+FTIKbC6cfpKZtXXHMebS
         i7QbaPzKoXaIQJoknG49VN3pMumW7IuJsiwbxHqDIaGrKQf0Y82h2E7Vodl5aOn7Uv0H
         QRQKyKY9wSspc1Hkh5OO/ZMyWXWlzzR6KkbCyfFcQpBTcB3eyTRTZ4fDnvmaU5JPn4tV
         jghA==
X-Gm-Message-State: AOJu0Yx1JYv3wOO5HaqDV/WKa8TBjipN/Vd+3rfp1djcdXN2lfKpueQB
	2mnMlbxoB8PAzZ2QNHj9zgDh/w==
X-Google-Smtp-Source: AGHT+IHIMpbYFjvqyBeraFtCt0gyWzhoZSR754CDn+q+lkmBbZ+0NWNse010w19gaydbF0wGBwlI0Q==
X-Received: by 2002:a05:600c:1d08:b0:40b:2a62:a2b6 with SMTP id l8-20020a05600c1d0800b0040b2a62a2b6mr14966752wms.1.1701244279644;
        Tue, 28 Nov 2023 23:51:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c34c900b0040b2c195523sm1204468wmq.31.2023.11.28.23.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 23:51:19 -0800 (PST)
Date: Wed, 29 Nov 2023 10:51:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SungChun Kang <sungchun.kang@samsung.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: Re: unsubscribe linux-staging
Message-ID: <af9b7b0f-850c-4bf5-8fd8-2f5e471b7ca6@suswa.mountain>
References: <CGME20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d@eucms1p4>
 <20231128205134eucms1p4611e41d1bcf43e6ba281c04e779c3d4a@eucms1p4>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128205134eucms1p4611e41d1bcf43e6ba281c04e779c3d4a@eucms1p4>

On Tue, Nov 28, 2023 at 09:51:34PM +0100, SungChun Kang wrote:
> unsubscribe linux-staging 
> 

That didn't work.  Send an empty email to:

linux-staging+unsubscribe@lists.linux.dev

regards,
dan carpenter
