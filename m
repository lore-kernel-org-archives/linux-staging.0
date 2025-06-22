Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAE2F2E
	for <linux-staging@lists.linux.dev>; Sun, 22 Jun 2025 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624963; cv=none; b=sILgKXYGWhrmFUTFRP0D7W3nRN5DSLr099mov+P4TyteoDR4Ahx9B1ezIjoDJukBEm8wJdX1vhpIXEJE+eJ9XME/ErKHzVHszqCfW80Nu2hGJ9qhC+VgLFw3Lf+sjXdDBAuczAuOLazXWasPaXpiOlXtpacpwpQMBPOt6+u/LW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624963; c=relaxed/simple;
	bh=aBH5ync0KSrwnI3FXleDVUQ8cMpif4dJqFHJOP7BLpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGeLOwMqFYgQ9t41onW4S8oWTZxjn17gj6fWxska2lPvN3Pwap7QdgWkXEx6+eSdwbHiQtqbTfkBsbojan3pfKTqBIjQuSn/sk3t6M8vArDjvM2HbklNh136TbA8mYlgZzZZCE1BXNhdeqMwsHKzsp/v6znW65hKme6KUKVLIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5xm4cFg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5xm4cFg"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb5ec407b1so579777666b.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Jun 2025 13:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624960; x=1751229760; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEaaZjTLxR/wmDq/Wpxqo+FbQo3s+O631q6fY/ypEKA=;
        b=B5xm4cFgRBL2jTc/kHTSUO1GYKOPRUBKCDICOHXS+4A05d6YOAfJhB8N+pLBAl1HYA
         yDQc6giktCnjkQP5q4C/YdghWAfMiVf0gwqcu6Yv42oB5kizJZWRq2eIIThq6ULlZ5I3
         9/NT12QmHNhemVNvXXI7UkzdGD0DczDWEhQCoLn0kfZsfADYFCOuORIFl3VozPjOuaAG
         4ccUZbFq23hrYOMYqxDu9EF75nmVPTw/pGU2ae+siVJH4KM8caN4mj/4SGKD7bDy0FH8
         yhUMKeSwM8SJgpa/e6VV6kyiHMsRj291oo1PEessB5khd/zxy0NJSA9y4atx7YG938I+
         nx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624960; x=1751229760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEaaZjTLxR/wmDq/Wpxqo+FbQo3s+O631q6fY/ypEKA=;
        b=oJRmT9Cuq9aX58hzjckgbRF5WwBDGYajFscqZgyQ53raG+GsdWS+fkvj2bFbMcaW/u
         JiuFKdD4iFkzFwdINVRWg8sfE+O02MZ2Dtzs94GbFbvsm1U8ux38uX0PINc16Bl/j2g3
         bE+EUV2+VJ5eKbM2iQfsALJscHYA7gcyClrvP+oxz4npQoyiHD66gPZnVaIeiljuUJq0
         3P+vq5CKvCj2qnmDk8k+LnVvaTRh56uDMIK4w+5lYXiKJ51ljp6vJ6QTco0sGTxfcZwk
         Si9fc5nAbeUc+i0R9bDhp1e7Z1TJQ62FpOxJklfYUzJYwFb8ZoT3ZqE2z/gOqHKLi9OP
         CZmg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9CEtWvKh2OneV6uzcQbpH53U5AKbFFsgNOJ23T8cpKda9DGmqnCgkm0CUG8BOI4AWeIgmZ0nA+57j8od@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx4EpbdcfAbXS8v9OwAo25q3guu6CLBLDz/D0cZ7rzLccVQa9z
	NGNFdjRnMJSSItCVBT0L/wLeOiBkLzvQuPwWUPVlrKbaftAnmeao98Nkasi7STGtNhcIwXgAOYH
	PqhDwt6bsFDfq0XnLlbaCmcAJsCA/370=
X-Gm-Gg: ASbGncvUaGu+Zvr9y51QQAThbQRJKAEaGX20Bdoz1kN1hjn0BKi87+pPJzU/c4rhWNZ
	fVOovmDfAEjAdb8RTPmJVeaVBM2wR33pwVz33N/ZCXfznFE7+zf+cSnFlV2EMNjLjZaze1jqDtk
	Iqz6HRrX2aaH5my+vLuuAdPpRTAjAb6wj7KxQc9jb5y/5k0dcFRadIMA==
X-Google-Smtp-Source: AGHT+IEuCW/KdysCM3ldMjDLa6Hfj5krLcXWfqFZ/oZd25TNQe5yelt2PpsMVNswV4DMKz9ZLEhFH+kmoAcg7ncOtno=
X-Received: by 2002:a17:907:178d:b0:ae0:635c:a402 with SMTP id
 a640c23a62f3a-ae0635cad93mr668278066b.50.1750624959931; Sun, 22 Jun 2025
 13:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
In-Reply-To: <20250622-bar-v3-1-4cc91ef01c3a@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 22 Jun 2025 23:42:03 +0300
X-Gm-Features: AX0GCFt-u0KDswVjW_bfV4Y3-CzEDf1LLgcF6bQ7Jm2retz0Z--D-RGtvpCiwyo
Message-ID: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 6:42=E2=80=AFAM LiangCheng Wang <zaq14760@gmail.com=
> wrote:
>
> Fix multiple checkpatch.pl ERRORs and coding style issues:
>
> - Use tabs instead of spaces for indentation
> - Move trailing `if` statements to multiline format
> - Remove excessive space between type and asterisk in function
>   arguments
>
> This cleanup improves code readability and follows Linux kernel
> coding standards.

Change looks okay now. The question is are there only these
problematic places or more? Can you double check the entire driver for
these?

--=20
With Best Regards,
Andy Shevchenko
