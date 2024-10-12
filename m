Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9E1422C7
	for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727481; cv=none; b=Ssr+oz3iSxnt7RiHl4WpOGt0CwLHPBBjBEI9orS7ojQ2ySHiUytTr6vAlUWmv+Wtzj4iLcx7oF4XSLYZUcMdED2onnXxH9ybb1xc9i+isxapyOpevrgKW1SKFFVBeKhmIzoGYPZSC5gMZE1rrLiDzVHit1iUrpApMoyG4hEtyQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727481; c=relaxed/simple;
	bh=GwMWPsFTPSs4Z/GrwCqitUC4u2Kc9UV4RwNKPwpOQF4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HFfatQAo+StMwBH+9vwmwhW+pZmpCb++8ZuqIJM2dPx2XkeB33ExNna1g0IPnei2LmawgXvIB9ebuXJXPrCATXNXb14Hh1qsB5erm7EtfZbWdYZ1l+rVJ7TdJ9V9tzdSEWK+cFU/G0kYLjugtvccFC6VYduf5MhrgRa3ivAWEfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP7eg8ZN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP7eg8ZN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so2189736f8f.2
        for <linux-staging@lists.linux.dev>; Sat, 12 Oct 2024 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728727478; x=1729332278; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2UtuTQmzvjGYkTIA37j2TC0Cks25DWgr+G198C2/zw=;
        b=KP7eg8ZN9DBPJeMVZSSRbuX7PdJuf9XQqCxSwjmjyWAxJN+qWh4tU7/iY94s+zB9kA
         ENXM+PqBTB4ftmqoimhQJhMhTDTYWBp6Y3G6usVVzOI8s9i+WTXq8wqbsjh58D0VBCaS
         qE/pfptV/8IZO2ch1KonB9Tvmr0ehUmbVX/ETveCtQIT8NNO204cUNVWi0F62a7J8UYP
         2ZWyjxdKiN+zwd/KXWdj0nANS8Q10ow3eMxiWRqamnmTXJcZO6SyVMN+NQ0tDw8H/j0h
         5GfEyWyEx74IqJRRkxO5d+nVMf4O3Epce+Rab6Q2N7ylR8DL5QV7Gq6TAqroFEm0AEAl
         IOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728727478; x=1729332278;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2UtuTQmzvjGYkTIA37j2TC0Cks25DWgr+G198C2/zw=;
        b=LW5tJGt6JT/O3AhY1C/dyi+BEeXT7oeJcuZV1/h+L18FEsYkT4Gq7E4MGDWlrIzLzO
         FHw1bh/82KRWgRySOoi1pxwf6KnhevY0dyHIGEPhqZsl23K7nR74jpjT/DYF/oHwJZ0b
         KrNQUPOe8HXkXe59lzDp5rXOSXQpwMGUtpwWO6GluZdCsLxuU2/8CwTX6X1o5VZkh+F5
         3GmNGNk89X+7XpgvuUu8sffg1YVCEOYgfKEIrVdmEaf6EFPyQbqZlNjqZl+2BtoXdzfG
         2XqVNCCsapYDxpTHF1Zt0tHcLgX17CwXA+Jbo6T1EVSkuZq15HS+ytorrV/wRf1KPiAV
         P2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4g/6EUdtsYSU+WQin9mhqH2OUveXj91HNWdjaqU2+isbcv1jC+U9MlVG01tuMxVE3Sa5mOJ6B6dbW/Oyt@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkt1uL1awVd56Y6N7j4iakT0OsRNvgK2iFtjjyflCBrgmv1Mgs
	GDZIeCk0cuejOqnBjZckP+dGLdFMrY4DrKQKD0Se9qGPVxbx+tHz
X-Google-Smtp-Source: AGHT+IGFmd0GCcvAiWziNYf3kxZmwULFCFyXb7MDzh9e/LlZpwTQCJSVcTsV+Bnk6YrLnGm8B9OuVQ==
X-Received: by 2002:a5d:56cd:0:b0:37d:511b:aec1 with SMTP id ffacd0b85a97d-37d600d3861mr2014345f8f.45.1728727477914;
        Sat, 12 Oct 2024 03:04:37 -0700 (PDT)
Received: from [192.168.96.164] ([85.255.236.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99ec5aeceasm58254966b.224.2024.10.12.03.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 03:04:37 -0700 (PDT)
Message-ID: <d18e714d-787f-4d30-a32f-4b0f55d2f5be@gmail.com>
Date: Sat, 12 Oct 2024 11:04:33 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: vt6656: Proposal to delete driver vt6656_stage
From: Malcolm Priestley <tvboxspy@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 Sathish Kumar <skumark1902@gmail.com>,
 Florian Ziegler <florian.ziegler@posteo.de>,
 Pritthijit Nath <pritthijit.nath@icloud.com>, Arnd Bergmann <arnd@arndb.de>,
 tdavies@darkphysics.net, m.omerfarukbulut@gmail.com,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>
References: <d7ef2954-21d0-4ddc-85d3-1334e7270ced@gmail.com>
 <b2ac0a21-989b-4f36-9bb4-923221a77fb1@gmail.com>
Content-Language: en-US
In-Reply-To: <b2ac0a21-989b-4f36-9bb4-923221a77fb1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Dear Sirs,
> 
> Forest Bond contributed this driver in 2009.
> 
> The following points let me propose to delete the driver:
> - This driver generates maintenance workload
> - This driver has a maximum 54MBit/s as it supports only 802.11 b/g. Peak throughput is 3MBytes/s.
> - ping times can be 17ms are often above 500ms and worst case 22 seconds. 


Hmm I see the rtl8192e driver has also gone need to buy another device.

Looks like staging is closing down sale.

Yeah okay from me to delete vt6656_stage it will be stable for a few years.

Regards
 

Malcolm



