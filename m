Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94C3DC4CE
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872713; cv=none; b=MlNVd227wtxAx/VL7EYJbT3ZbcWL/MKGYnvhIikaXpuC3NNrg2Agcd1+Wrji6S0Ar0ruCkPgQDw6TjiqIbRZTBqcvivPAYpOWVtYI7er9czWW43dK0Dzz6VVdIYdoaka9k2AnNjz/1Mt6ChkuURBTa7bFvO9Bd279UOaOgYIUJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872713; c=relaxed/simple;
	bh=mBUn/hTP80ffwCIYg46mImDDtg9txT49wm8ZCCLAU4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYA0sW1Pa9Lu7MU0GoXLG0e0kPM7Xp3aAZaIMEriiEakvn7zizH/0vXmFnVAOH1tt+T/HcCRGiuQkyRelFor2kA2RzaCeh+1cFNeOJm4HO91wkI80XWq9yyD0LLOoHYg7+iSbPBZBoDZTUNFGAnLahZ4o8pqqBRLLMzlSBm3ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIZqGK85; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIZqGK85"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499840a2575so1870275e9.3
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872709; x=1788477509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=dIZqGK85lBboBTc3MZ2oXHterkkKEX6W0MDeVw0o1+7esgJVAJVr7s9j2J5tOWhYhZ
         MvjOIGffRwTQlc6SOSZbTBE/YMqjDYbbW9rPyL0ZmEwvB7si+tWxJ9IEGrTo223P7TWL
         +X5Gczkhwd70Si0HPh33azNkXlgnRyGuFFwI0n13OkeyWvssrOLZVkKjDEvxTUV3e1ql
         zQE/fQgrkVadQfYODiuFNqDR55kSeC9xLGuRkODW2Y26oNJsU4yfuLOji42vkwDaktRz
         ljy94bYIHTrgtSZWoJr68rNlz3hrTw6uWL8KoSo5Y5Ivq6szrZJf+nGCL0ZeV5Gt7+4T
         /sJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872709; x=1788477509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=k9ZvrBfLw2TuIdjkCuACcZpQIJNyndqlJfqDwkG1XT56DNAiz42pIGyn7iRSaz6OMK
         psenkoQ3SurWL/tTK7+Fxirk1EPsroZDc+yKTs9AIKPhl5MT5eGvz/iG0YGkZW8CcUJ0
         D4TR7KhNocpuuHJKWVMrl8qYNCu18CcuxwynQYyUHilV4DeSzKrpGpnS7QXt16EJTUwl
         vsvtXif2f9Bt/VByfDh4niN4AgFJMki8a2L0Z9D062EyLgdQCem0IiQt/K/dV3igldsU
         uGOOuljGwv9OnfklecKfMvi/OPSbfjBZVuF9fxZQp2jgSJaEilDAVUwIfKcBFhc5hCYn
         1RCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlkY6jgHazNTAijdaSXKQnpkcC9QFDxzJ+b+DvSCIUKy/t+6TwAn2A0rROJyS+qY+gaeI8PAX7WgTtA4ti@lists.linux.dev
X-Gm-Message-State: AFuF++kiubQujiaep3rRzxf2Z4Z34iovyrIGKEF8SeldIMHKm+CEn2Ff
	Whrc3x0FXynUmmvxLDnmwtDQI4Ru0LVUtV5F7Co9ssHhYA+vyGyB8Pz/
X-Gm-Gg: AR+sD10aYaW16O/D4gVhNzoZ0jZzDkjmAvYK9OZoZ13bCrrxSXc1sijSHFV8cjCy9Kc
	lL0meqX8BqMs8Qp2YgytZkQduVy54VnzMejX546HRVVTHKhf/u3voYqHEnEGYZvbZZ0EEa4BVIV
	IABTLU60Ifa71Yn5VYmR3hOZz/xjMtg9XqBhKrCJ4Lcyy3IqlZUlmToeSJaQcax/IdZMbOcx12m
	36Q0Iqjv/khG+zICuyrno+VlXyUWIwsT4IEqQ048fj1ireHFNP8bTHNdpBe8h4v/IMUhzHUY4BG
	p1SjHd6u9GqaBIyViRDvA+5m1Uq06gLiOW6JluXbLshTSIYEf7qH9+kWC2iwsqICOWXaDs0h40c
	sR6Y2sx+GgCL+jFR68AriaX1XvNF0w77A0mYaRO6id7h1+jcAz6BEzi+qi8BgPaPEgnLf7fAKmj
	Y4Y0cWAVtvXphaeIMh2Qg7evB/CfPqj5xi70WLhbDBlVq4XLQ0mjhh40tDxUW2/Z4ULcuC8jCqu
	PKAKXq/hxdyxFq7aKo8yOZXIYzTmXG2UwORPHheJQqr
X-Received: by 2002:a05:600c:8b8c:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49b91c21bc7mr29918525e9.4.1787872709574;
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm6748875e9.12.2026.08.27.16.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Fri, 28 Aug 2026 01:18:24 +0200
Message-ID: <yogabook-media-acpi-dsdt-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-3-mauriziocasciano7@gmail.com> <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

As requested, the relevant device objects from the tablet DSDT are:

    Device (CA11)
    {
        Name (_ADR, Zero)
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV8858")
        Name (_UID, One)
    }

    Device (CA01)
    {
        Name (_ADR, Zero)
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV2740")
        Name (_UID, One)
    }

The per-driver ACPI ID patches are included in the v3 series sent as a
fresh thread.

With Best Regards,
Maurizio Casciano
