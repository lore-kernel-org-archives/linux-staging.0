Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8125393B
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 00:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772582865; cv=none; b=MDuxYqvRk27ZvN3MB4UzpF0oqgbbezUdIjwA/519nug81Z7x0wbD7PezC2UvM1irq6P7uiRKyQTgBY7TBJawVscFM7oMOgQ13ouaXbNjVik5RakSuOHbIooFP3WpruztZylCSWlNUmQLbPHHqDwcJQkSa4bZhXTgXaKcGgwrfxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772582865; c=relaxed/simple;
	bh=d3Z+rZd+0/vZ0c+ULhwSQ2IwO77g3fAfRgXE7SGDvj0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QYpibQ5+KeCXNJgu/RCxesV5aQ1F12wCWSOQybiPL8qeo8SYKtNBpfJOCQv3OWLI/N23diit7JiBtdwXcs+5tkSLSLSi1ExDmYB18Y4TS3dE2dA5ZtcQ/kIKUfpjl+HVYaHJ/TaC8OlrKtyPgAG506KmndBWdcfrQWTYrv98f2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsCEZtD8; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsCEZtD8"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so6062024d50.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 16:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772582860; x=1773187660; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3Z+rZd+0/vZ0c+ULhwSQ2IwO77g3fAfRgXE7SGDvj0=;
        b=TsCEZtD8qOPD1BXhj6LyTOjln7Jl8s6B2iZeTcQKu37F+UeSmP+86GjXbpcz3v9mau
         chc8GSxwxEOKhYRIXn4qZfdNJDoERiXDgsnrAaZp8zI/uI3+uACZbAER4JtY8XWFbrg3
         0ksLhAnZNRqZ7Ox8EDqXWe2/e8v4E10gjcrZ3k45tCTSpzEvxtMQuq+tz2QrLC/7gsmr
         kaBgIjAqiBw14PH4e91y3MtvfsV6X4rmXhXCja1l8whsX1X5QWt/Fn65DGfID+d54cq2
         LcPehMej1uB6WwDdG0ah2VSSJPyud9svaMJmNwDJ/B8u/W62KLq9Qrryf9rK74TsK3qA
         S9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582860; x=1773187660;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d3Z+rZd+0/vZ0c+ULhwSQ2IwO77g3fAfRgXE7SGDvj0=;
        b=PMk/zoE2NGBL44drRDidHvzAEZFKmZU6+PlJufL0Vgj3ROxc599t6J+IZ2C8ce2Ffw
         tmoZOEjBqC1anXqXUUYjLXYUp9aaHd6/AuLa8+0CBhXNzQjkZ+FCPd12DBrjev1vJAHC
         M1fcpa5B8A7Jpvo3qI3vfOAI3K8KVHO8Ed/2R3ElYU1+QraeTwGPGXXSVwxBtjUAv8oP
         ynaM57B+MUUh3Ytih5W8R/E7lqn/RVhpM59FMO/jKd1etEArUIJUxQnlnQbcuT6bpwMm
         gHJDU7gx0GDUTRyLpQHbvwjnHaF/MkwEZt+CLKRLR3JrUJYoxoj8iv+LVa8vZmgIJ+tK
         l7BA==
X-Forwarded-Encrypted: i=1; AJvYcCUYYue4+f+jHqXmAbcj4cU1+mFegBOxYLEt0F3PvhczXVz/OVQsgtQabF9//MkI4pK2fHrq+BtWSFwNnVva@lists.linux.dev
X-Gm-Message-State: AOJu0YxSs1SZny9rHVxMZbv9jU2jNpSYt46Fyhhlz4Dl7BLeaA/LwSi7
	nh8PN0zHemSIftsE1fgphGtXlyltynJI9OWA/t21LuthmqtccKOCZ0pE
X-Gm-Gg: ATEYQzyEs93LYY5924/Zmtyw0suNJpIg98dkIN0vgqlGvQvBq/cKybt8nX7AnUcNF4q
	nqSo7xYGsdDs+X96Iebyk+PVDo1kLYwbOfTz5j0T+ODs4l4j3SGSuBIaN5Miwpyn2c2fe+HmhOn
	46eC6d0zWq3s6ewM4D2T/qVPCMhwVKsid5wzP+wnictVCqHYE9HienulFTDndPk6YN1OD+dVb6V
	eHjU7NCwRZfUNs5CRvPvWCjNVWPcAj/9qV9VpUnIFvJ94yNbULie63bzGV/GpAUKHDO75Wmumdc
	A2hxdrIqb/1jFZ3ETchTBbzelXJ0BQMeUBmFcKW9C28DKDXRgnEfV2eckY9r7ql3DOFQOr7l1CO
	+e95k4xKH43j3UZQO4yNHLewHMBmYhkCCIzmLHJA32gBnJh3vaLhN07GqgIWLt97gWpS5Ago37f
	C/LzpZcf1VWbNiLlvvnsXdjEnvTuX5MJvbZvddMIyuYmVztY/G4aLQ8RSg3edngpHz4nA5TPnFY
	G1ezTQiLBhg83BpsAqvSLOdOByj7w4e
X-Received: by 2002:a05:690e:bc3:b0:64c:905:6f2c with SMTP id 956f58d0204a3-64cf9b502cfmr304971d50.20.1772582860229;
        Tue, 03 Mar 2026 16:07:40 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb75ba104sm7306810d50.10.2026.03.03.16.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 16:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 18:07:18 -0600
Message-Id: <DGTK6AEA2PV8.3KG0TGKFYXRUD@gmail.com>
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix indentation, line length
 and declarations
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Ethan Tidmore" <ethantidmore06@gmail.com>, "Zhuoheng Li"
 <lizhuoheng@kylinos.cn>, "Ingo Molnar" <mingo@kernel.org>, "Artur Stupa"
 <arthur.stupa@gmail.com>, "Abraham Samuel Adekunle"
 <abrahamadekunle50@gmail.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-5-azpijr@gmail.com>
In-Reply-To: <20260303173844.47975-5-azpijr@gmail.com>

On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> Fix indentation to match opening parentheses, wrap lines exceeding 100
> columns, and add a missing blank line after variable declarations.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---

LGTM.

Reviewd-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
