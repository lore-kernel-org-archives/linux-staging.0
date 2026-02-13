Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A6315D58
	for <linux-staging@lists.linux.dev>; Fri, 13 Feb 2026 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771025811; cv=none; b=nAm3iN6lW3aYJywSz8HO+JLZ8TxiXhxOSlPQ1iglogdLJLnhtCJgcNhEtUyIPZmbizz4wD73OFS/lDbLbSMnsTBcavkBuDYwdKcgCF3wJYE4MBHV0amV7N1un9GNRrkDIFwrB1jQDJdawLP8CSRx4J6mLV7vwK3ZsPY21qQpWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771025811; c=relaxed/simple;
	bh=dQ7PAAK/uBgMQmRMuh76TGAZVvMWjI3NugKBqmwfRp8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dygDbA1ROivzp6hicBBBO0Mr4gdLZK7kf/FE4YDg65Mhwzohg+AlAn0ptyF51ljSRLTG3LUHvgzYoj4J9ZLiRobum8vZ/fCB/W3pqtNKvkB8IsSilZhGqC84yJnDPo3F4TD1Fzmz+Pb8dBQbVRhT3Ah706F1DJJThCyy8npanzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWECC6L/; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWECC6L/"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-797a75e47afso7742857b3.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Feb 2026 15:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771025809; x=1771630609; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ7PAAK/uBgMQmRMuh76TGAZVvMWjI3NugKBqmwfRp8=;
        b=cWECC6L//0HP5eegEAF3+TwbNzdw429AZMDJ5ERejo7i7OjycKy8pFGo9LTnIBaT8j
         LjpyjDjuCxqIg+JMCku5tF7JBy0lx1iGgsKOLTTnpsgcTrtflfYtkO6m0g1JSYvFjMQJ
         AWzBOSUndsWaIRoSWa+sNB3lDOj5CEIEwGgay94hl+WzjipBep8XVhdOYlsYwMpRjAEj
         DD8cFWSd6f6EUM4mJliHeiuI/46xLlRq/vs3BIR7ZOK6chH8wsFg7yH2ozXYN8Qn4yZd
         jHxobj17ZVr3hSVanZ4OudhdE3Pbk49JToEr+EEO2bzKZ+thZgfJUDnbJcf2DwK5tGbH
         Du9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771025809; x=1771630609;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dQ7PAAK/uBgMQmRMuh76TGAZVvMWjI3NugKBqmwfRp8=;
        b=MGQeuF5fgOz635Bms2gvvCWMIEe+dj8nU/US0aFZQtMKZ2sCH7aGZP7hW3xJeMrlpT
         L7TvomKROBtVs1Q4FRODNdHlIlG4OezWb/UaOVSo0DYB2DBpfMRtVby1CP4gLjvNmSnC
         NSg/hpOSl9vkF5LRYslk0UdeiEWW/YxIyrvPeC71rQesSmtgtcUYGpn8EtAh/5U7yR1f
         ABmjcLlvE/TqkBzymQsy/qy6P2QZ057xdrdQIhZBfZ6cadU3lpJS/n1+VYNnpxe+AugC
         Z+NwCRdR3G/3wVwYBboTtbRodxiCdsSWIN2vQcCnsrQisGxYwnGmkY/LJpiCa3B5vrby
         LDIg==
X-Forwarded-Encrypted: i=1; AJvYcCU/GQl0PVVbLuKHYnrxnKd1CNhucjqpZpQdvngAIqGJ6mT4LmHGjuMuoMMtt7nHIYr6zS9Vjy7tmXwUrPhN@lists.linux.dev
X-Gm-Message-State: AOJu0YzXmK5eJsiBrw9oVQcb4EARYaZ+78SsPsebVbu0nujSgLQMglVt
	cKgST9vfAdaBop+Q6I6/+dRdop9MfiPPffsbW/u/MKV30/KPDXXYfbj0
X-Gm-Gg: AZuq6aJ4/h8b251vHVR7tm0Km7ZcxzmQaqKXAoWrG6DEGXmGMNpC8Vm+1BWFiNtcvN6
	SiVTmOqUQTdXNdutMIx0MkDK1yHvfN29hjCxcNqUBOtdaCtZ68jvs9gVots2hv5lNh1ilmQ0k7C
	8YRGchBEB9CLUqVNqAytq5uNNukA8sLr1uNIeaSbAC1utsmu8aYCHc2Q1QBVfb7f2JIgVAn4qd9
	85lPt/qvZs86JKSswK2qBG/PQhoGRXtQYVbxm/1sLqmu01qVSZ0X68LC0cUhGY2U5aFZb/0j7Uf
	nOda4h1eZ0y51MyN6V6BKfYvfpxUxj+PvjuJKACh6St7UKYKqEm7WgnIC3B4LCzLcluIiDPY8lo
	XrXcaXNiEle/5aypXe11lC60a4tAmBVHIrnQEiy+Ruhq/+4xL52+o//l6ZQlZrK1GtwGn70oc+Q
	P8Af+50XktToZXUjXXdbPVkJyYgTSOtNxlXb0zO635gUMJWRR6O5TsSeXQct+oqmybCp97l2LSO
	yAFYfLVnuLF4FhSeR4ohNggOJVNsjpVlD6wyNhgmB1mF1mnkLNFVwJcZ7acGA==
X-Received: by 2002:a05:690c:101:b0:796:44e0:abb8 with SMTP id 00721157ae682-797a0c69eb5mr29435987b3.31.1771025808917;
        Fri, 13 Feb 2026 15:36:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c267f4bsm76265707b3.50.2026.02.13.15.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 15:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 17:36:32 -0600
Message-Id: <DGE88XETJ97W.1LGV5U59Z9W9Q@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] staging: sm750fb: Rename nDirection to new_direction
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "RachelOvrani" <rachel.ovrani@gmail.com>, <sudipm.mukherjee@gmail.com>,
 <teddy.wang@siliconmotion.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212180402.69356-1-rachel.ovrani@gmail.com>
In-Reply-To: <20260212180402.69356-1-rachel.ovrani@gmail.com>

On Thu Feb 12, 2026 at 12:04 PM CST, RachelOvrani wrote:
> Rename the variable 'nDirection' to 'new_direction'
> to fix the warning reported by checkpatch.pl
>
> Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
> ---

Hi,

This issue has already been fixed in staging-next. Next time when making
patches for staging use staging-next to avoid submitting fixes for
issues that have already been fixed.

Thanks,

ET
