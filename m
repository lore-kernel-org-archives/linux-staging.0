Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95715487
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVwWyoPS"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9d224dca585so252157466b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698668439; x=1699273239; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRAvOgi6qogXEjImiUor+DkPqw1Ot9Ogtre0wvi5M6k=;
        b=gVwWyoPSOBfpmN9q4vcxt1imCeYRnQVfWKWvuWDClxSopPV7vD81gRmlNtwuS8xcKd
         VzXkdaQHkfrk4V/d2YkmnRXKVRp3BDJ/lMq/sdY+DudPoYp82KyO4Fun73Pbo8IyswHx
         H/6Wgr44LKaOXfwshvcDW6PY6XW5IzR086E9zpIpfZ5pwlLn8796hfnRXVOPrd6BG5kB
         O2lgDeNxtfVHRUXgK/PM4fuqQr/cDFCikBdxoNQ5fAu4MQwg6jQfGnEBwrkI7LdB0q4I
         /BwIFFdBvhg45Z3xz25qXYElA3+rYgBa2jxm9d02TSd3YpBaPVPLw3QefsDqq/9dt8mY
         EiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698668439; x=1699273239;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRAvOgi6qogXEjImiUor+DkPqw1Ot9Ogtre0wvi5M6k=;
        b=KdpfcznVj3EuzN1pgHOJgE/9nNgrRDCiQLgdSaqF8fD8nM66SHL5kE9EA5qCkq1Qvv
         P5NWBKCDD2PQSf4Fy9bgmVFSbjlpSbHuWsWkyVUFSGiMZ/+uB5SRYu+H2yeXg384kl1R
         TjcNPoueVQXWnMwid9n7T+ekMbtzgqzTAq6h22PRcoDJVBgyZr4nljmtHv6bcpelU3pm
         qUhFVoZLtVYEf7fCgH3c0kGQuc4QwixnV/GM78nB84ZGnrLKwjZyVMfWoCXPVuDEjyFh
         ouRowUrXAxeELOECgM94sPkHr7m7u5+b0dUcUqiFKFx8Kh3BHV9nvscaKazgk7KNkg9f
         POIA==
X-Gm-Message-State: AOJu0Yyl2JntLGMkLFh6JzNcfAF3bkij/GeBZPY6mX2JiQE3Yw329HRI
	CRYLVTp6dm7NtycUQsrVlfY=
X-Google-Smtp-Source: AGHT+IEA4HEagqHQDt4CQKteRzlCff1bThN0D10TLJ2IhOR2hdu91b9A3yPlJ/I94joRwFOXZlnzxA==
X-Received: by 2002:a17:907:72c5:b0:9b2:f941:6916 with SMTP id du5-20020a17090772c500b009b2f9416916mr8109533ejc.17.1698668439086;
        Mon, 30 Oct 2023 05:20:39 -0700 (PDT)
Received: from [192.168.0.105] (5401D598.dsl.pool.telekom.hu. [84.1.213.152])
        by smtp.gmail.com with ESMTPSA id ci6-20020a170906c34600b009a1dbf55665sm5802219ejb.161.2023.10.30.05.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 05:20:38 -0700 (PDT)
From: Kira <nyakov13@gmail.com>
X-Google-Original-From: Kira <Nyakov13@gmail.com>
Message-ID: <566c0155-4f80-43ec-be2c-2d1ad631bf25@gmail.com>
Date: Mon, 30 Oct 2023 13:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: benjamin.poirier@gmail.com
Cc: James.Bottomley@HansenPartnership.com, coiby.xu@gmail.com,
 corbet@lwn.net, davem@davemloft.net, deller@gmx.de, edumazet@google.com,
 error27@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-staging@lists.linux.dev,
 manishc@marvell.com, nandhakumar.singaram@gmail.com, netdev@vger.kernel.org,
 pabeni@redhat.com, raven@themaw.net, ricardoapl.dev@gmail.com,
 sumitraartsy@gmail.com, svenjoac@gmx.de
References: <20231020124457.312449-3-benjamin.poirier@gmail.com>
Subject: Re: [PATCH 2/2] staging: qlge: Retire the driver
Content-Language: en-US, ru-RU
In-Reply-To: <20231020124457.312449-3-benjamin.poirier@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have a couple of QLogic QLE8142 10GbE Converged Network adapters.

They are pretty old yes, but also working well and energy efficient. 
They still can be considered as modern hardware because they was so 
advance back in the days.

And I think there is a lots of them out there, maybe not in 
production(but somewhere still is), but in used market.

So it will be really nice if drivers were still in kernel.


With best regards

Kira.

