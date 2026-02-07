Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A629ACC0
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770448689; cv=none; b=YAH4F1Msy8NEgL+WR4QAy7xdXRsor4wwGDLneq+qD42qzG3QicHaiNWJnTbtHqH6HJsk0azazL0v5ygXZo0nj0dJU5yF6xtO460HnlQYWC4pp/vt7pUWLLitwgoLrpsHLgIyCgrOjqU8QTO0QfZDtSH7M2Rf7+GxklPjYUsUDMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770448689; c=relaxed/simple;
	bh=qG4tsb3uoJWIyzV24Pt6lzf5n8hBLI2FMrQLYLOemTU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HReSrpGQ4VlPM/X6FGj7/em5bvgKHXh7tFHy4o3KRJZyDA+Ozw2YDLwTjv5RQDef9K8PnzCwEbuuU+STX4gARzLtsDyjHYbUSvn85VWSXb6A7p+QNNl8OGaV2QnFUeuMQ+AuZTqyCxcPFJznEx56hyxAIcRJxYlMqfI9pj+YcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMXnsA8/; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMXnsA8/"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79430ef54c3so13668757b3.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 23:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770448688; x=1771053488; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qG4tsb3uoJWIyzV24Pt6lzf5n8hBLI2FMrQLYLOemTU=;
        b=cMXnsA8/Qv7EQ4ua/yOJFfdsUrSgF+rx10dDyCScDPkrgDWA7D4QQbzXbLQWGxjqDl
         f26xJlWr2XfDaHNqE6RxQS+7D+I+PGVHcAtlRtRyF7FYZTi61j+a7q5BrBS/I/U+x50v
         boebBPX9uFq0EPSfQtamKlGJ4mKe5JEvrH5YkgXGfKhqbq8cdSMclXNXs73aZSH7nC1d
         TVf5Fo7qJ+n2DhcnlfLbUPuWk9MVIqQ3Y4/QH+M9I1F/mRMf7RZ0ePWfePWclWGZigZj
         iZ2gxQg1ragYdUILHdHkxetx9gYeEFy0Y0xj/Dit+D4/aZmvzSWx4OWf0sULygh3pHeh
         2Msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770448688; x=1771053488;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qG4tsb3uoJWIyzV24Pt6lzf5n8hBLI2FMrQLYLOemTU=;
        b=DNLLGSTYKDOoGUAy3jz693FTIX353/6Ny/WC7zP1s8e1ckEC73NHt1F+r3mpF/hWMw
         P5EF7PjP3tvpz6QSMujn8EmfJsHROLFP+1yIUHAZ6+iEvEMYfTNWDnvl/PVfP9B8onZD
         0a+gsvyEUUYaMjI1Jr5jHbnCSmOEkdY2ThTJLPbCcbJlWyMfmjs9VWTaROh7/fiYCxfu
         FGLD1DebZb930YsslPwctyXVUy1K4RMAhazF5AFVXzlR610I8tfQeJZ82UyCwM7DVwBh
         kvzuGRth3wq11JpYZzDPox/DqUtcHCZvyiYlA8Wft0LpPJUuCZwRLPWoXhJF5SIdBTps
         Dnxw==
X-Gm-Message-State: AOJu0Yz8aNaqEz0To2VgK4pU8zt4SFTxDsBDuY6g2v+OPIdhBN7GuzYD
	8mYpnzwv80PLT4zivWXDs50y8fduSrxkpMUl/y6k2xkku48jv4ykTwJG
X-Gm-Gg: AZuq6aIKDFL3dyMcUGZX0kCKiu8F4eP01f1vDs61hP6UXiY+l0kvGxkcEMVmDzQKnHw
	Xu5PYuYnb03KHuKXjRuOm3KJMMm0WzbG4NCmrYRKPWvxB5fKZ+RiRiUjmqIz6n+CJstpKzH0SYn
	jjz1SZImDnIL6ZGWtQ91mmO/QlhxV97z+cxdLQpgQPHYH+BCWZkQKYSBBKfxNdrGL5DP0KsSq4Q
	+s7K8k+9/VIIGXnFqetkHd0MnZMx54Tq963/Qw6IXeeiHBXCt41IiDwocaADYZ+KHz+D8UK2l2X
	i8fYYiB3NtuxUp9sAVrjvBrOLhVMwLS3sYdmjyrfBmYzIEBaZPjnk9h5nAABF+O8UzxepsIuXj2
	jzgJJ4z8Iqlt9AWZwqFzb91x0iGSsEzKT7QZLgnmJQvZ0XnaSWOOn+FHMdMO7cOZqHjsgNvFoSF
	amEDA6AASpXGXCeYb4IeQQvNBeAnWNOMquS3WnKS9wto5r87UAeK+ENXiMcgju9EdmRjs2yJDAu
	6qIa91JjsbNQGRBb3dIS3j5iA/cL30Om5GsJytwZ5QmRjFXWVabqt8uqA==
X-Received: by 2002:a05:690c:fc7:b0:794:77da:aa57 with SMTP id 00721157ae682-7952aa92f77mr56528847b3.19.1770448687729;
        Fri, 06 Feb 2026 23:18:07 -0800 (PST)
Received: from localhost ([170.199.240.145])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a1d8c66sm41080237b3.30.2026.02.06.23.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 23:18:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 01:18:06 -0600
Message-Id: <DG8JOIFU3734.2B3TM0Q1DRLH@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rename CamelCase function Set_MSR
 to set_msr
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tan Kai Zhe" <kaizhetan@yahoo.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260207061313.20103-1-kaizhetan.ref@yahoo.com>
 <20260207061313.20103-1-kaizhetan@yahoo.com>
In-Reply-To: <20260207061313.20103-1-kaizhetan@yahoo.com>

On Sat Feb 7, 2026 at 12:13 AM CST, Tan Kai Zhe wrote:
> Adhere to Linux kernel coding style.
>
> Reported by checkpatch:
>
> CHECK: Avoid CamelCase: <Set_MSR>
>
> Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

ET
