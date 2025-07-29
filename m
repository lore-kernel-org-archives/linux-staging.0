Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E841FFC74
	for <linux-staging@lists.linux.dev>; Tue, 29 Jul 2025 05:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753766110; cv=none; b=Mgyl5NH2W9za3PYYvBjxCL8/Y53tExmAm1hPKbuNRzAum7S9ufXaNLjXF3jjAkSAaBFvU+IM2CJY59bUspJjyHaQEHREYOpWr1YMsekzjwnVwHTvVsG7uiCNzl4899zK9s2PPYO2u6aXmWeWGVwcurLK12NKcJ3CfobDHCkdRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753766110; c=relaxed/simple;
	bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSZCGRXhqh+9nDHiXJN6L41LqVR+fBwpUcKwg1PtulQGOkVwgtDPpH7Taq/08cSgKMBfJGCPUSkEXBAfiWlIIqyiIke4x8UuSpNL3HHrZvzGe9QZxQjlE/IT18ZaT0Qa+6CaJhxfVw01c97cJvi3ldQYXLPMPw7McCm+kDwK5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebG4Wn6F; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebG4Wn6F"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so1491579137.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753766107; x=1754370907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
        b=ebG4Wn6FOkni8EiPFmVYrOaVm87hb70pGibDRQNQ55ohRY82Ptp66vZhvYsdPJc7Jq
         /yijltlh2IfeoYPnN8m0NL5V2hneoXklaEQrCshQ+dHINE/5eBrq6JjafTYfz/Wf6Elk
         jeJLK6gE0hn0q+kn+4au7Is42jtn/+Dj6L9tZH8IwdMo6FEUzeGWlVmFGyeKRONzBLl9
         y6FQ2Pva2tptxEfb4z7eHPCy1437wBaoN2cG7piiev3AUqtkE0ZdJlXx/z6qujr5Wx2f
         zop7Jn6KV7qh1wbwIMnNeUC/wZHoRe09dbx+Jo6lIJ3w1JJf0NYiQfXaDzp68DuzYE05
         WEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753766107; x=1754370907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsWARfck02K8FlpDOd1ZR5gMvfYv/p7eSp2lFpjb2HA=;
        b=h6X+iH0kpLjRyqrzMpWpN7t1bGK/Le9s6Sg7C1qEGiShyBxk/nowqddewdB97uhGz5
         Gi9OJ/gqkP/FmzoEzBnTo549ajevI6iwH7p5uv5m22MoloVdzFoleTh9Cy/h6TXlSgAJ
         jWXtZym4idNbKIJSK7QmI8UCQyGOB7D+eZ4X16Zp5gO3jPSuHxif7W5x3sIqLoqOyOXq
         SjSI4yBWlTUdgQc964/sokcpZZGRAPh1C5sVJ2Ut3/kDhNe8dZbxc5Q1F/1hpWLxxhG0
         1KBI37bBcJ7TACrRmOHUAS5f3uZNBn72otOjPike9kOaYwHrmTB8ekVYaXZaQVu9H72W
         gkAw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2Kc8oyB0cEHZguFChN0GQb93RA6MmXbDE9NNcukrIAu7e5dHpluhUJSTWAa6/mZ2l+c27g6XKeEXomV2@lists.linux.dev
X-Gm-Message-State: AOJu0YxTVoGXwJ3JXH4gxAT8TaPl37hB123wVwsZRDGGdB7avQLQlSgb
	vq3Jvcz6XEQaL6kGvHTfGMMn7zzwS+vPmmA4KVoj4Qu0tj44PJkHv8zgVDC3uKefhp8v5yQNKcN
	KIHgLBgYwmpvi2WvlEAzQtD/q/rwNPGM=
X-Gm-Gg: ASbGncsVR1dGa7mjZxllG6g803fHUW19epgzNY0MvixglLo/n8HnKMf2nJZa+qhTlN6
	9LTGVtmTS5pXwSQkpLEDtor4VLq3ldYvNAYyWBOB8uN2tizByj4n0dEL1RX8Qj/lJZawqpNa2Ue
	ke1gGBG9d9LV3bXQiJfTcjRMIpPgCEYSCRd9iyVHskdURifeVH0WW07P+GW6WZXYkzeITV7aMuA
	uOwrt2yoREQHHHdF3XX77WGipsBRib1x9japkLpHg==
X-Google-Smtp-Source: AGHT+IFno0zUgj0Aw6YpqbiUSyDL8qKR0XIqSJkgIQWlCwXeHID0sqfEdnRuV7QtINe91KwD42altBqC6rX2oByXIk4=
X-Received: by 2002:a05:6102:3f8e:b0:4fa:58e:89c9 with SMTP id
 ada2fe7eead31-4fa3fa53e65mr5523077137.5.1753766106990; Mon, 28 Jul 2025
 22:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728072822.10730-1-rathod.darshan.0896@gmail.com> <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
In-Reply-To: <CAHp75Vfq6P2osMc5A5TZ5Usgyc7mFGNme6TmCQugTE1=8c1zAg@mail.gmail.com>
From: Darshan Rathod <rathod.darshan.0896@gmail.com>
Date: Tue, 29 Jul 2025 10:45:33 +0530
X-Gm-Features: Ac12FXx4nWqm93Dxep0xI7h8FOwPhhH-QR82_j4ozPQ6iUsTnDmci7QL56S-id4
Message-ID: <CAK6+rv4yQ7BsJP4KJWAv0wwvcA4MOHwo+y+9pJtGPDVOs9GY5g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix indentation and styling in
 output kernel code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	jogidishank503@gmail.com
Content-Type: text/plain; charset="UTF-8"

>Hello,

Please disregard this patch. I would like to formally withdraw this patch

Sorry for the noise.

Thanks,
Darshan R.
