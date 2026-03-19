Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C253F65F0
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944772; cv=none; b=ptCRTHq84gRbqanBzoDvmCcV/ClEISyYgYX8DXDvDSC24eUnsKfeHgsK1xY1uEPX3Lw7V7r+7ZfGtdGuqvI1fQMAbWtPj55kPzGy8QOXXR4SUFk3gz4vzHB/L0WudOAB7ZaS+p2VX3URoBDMHMe+Lb6/0+gYyYTkdY+nwC0/JQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944772; c=relaxed/simple;
	bh=NTuElXSZVAzDQNUR3sbfCvGoWK4hablSgCVJx1gzZEk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r0OFib1/g3nhv+v1NhVLl1So9qN/WoC0MUgJHnwp9Ff/p3nMr2DTCFaEqrAEtzPUetPgpSxPer6fxo+GfdSa5UycehO7wDJqYNVf4xzIN9uEprVUv1Qv/yZJQWEdwg2RYmFYKlpkw9Cf+B17bBVIaAEp0mKfYyFvLYJkWHgwwS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZCN28h9; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZCN28h9"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-793fdbb8d3aso10406317b3.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944770; x=1774549570; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTuElXSZVAzDQNUR3sbfCvGoWK4hablSgCVJx1gzZEk=;
        b=dZCN28h92z0e+zOh5MWEtLr1Wj/RWHk6lz8Wu5inLOjpEzJ5dQbjMggKlaQjXCudeI
         sitBwsJYx1Oo5K7C3gw05Mqe6pHCUKuPQ5yjim0KaGjoRuTNveX87NudZd3wSIOkHCOZ
         QLQgwvRykyEx3pX3ShWebh+zoTT9osPkUy1qEVW8yqM6pfQxqC3H5e89ArJOfj6MGbmX
         Wbz97EI4fAk2biLH945gR9NK6HmeqtAml2v4TV0xLTQsa8lGMMqj+BSpoHs8ZkMdK5n6
         w8jCkFQzKFzUs5O94xrmI1yhSgX9SPS2dtEPCFFzthSsiqo2Jm5t7B5elNuVXkWKlQzT
         Wvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944770; x=1774549570;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTuElXSZVAzDQNUR3sbfCvGoWK4hablSgCVJx1gzZEk=;
        b=EdUCJVgpSec4QDKDljZ+BYNLsKFvo4DkgwBYV6Ps28l94qV6xUWEGAdBVknjeDmSq7
         h1TmNooiYEoqc8GA+Dd3MBS9IpvF8MefQD/VsLoMQj+jyIv+w5XQ7QH4WAFLz55APWfr
         B8fEW218AFv6rXb/O7cDlgyMbEHesw2ud0qB3xuvkS0HPzKHYUo2+XgspTKFcBex3uKb
         PHfo600kN7ouQHp8YhGASVkeGQpAFvQw+2K36PQGj1fIKhXAC3Tp+gUfkxhsXE+zda1k
         ISIcq4R+33GzTxCxX6wsmAik3J5kT86xhS0u5m2ipkEkDat8KbP/0EpbrjRtVS6oaN+a
         JRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT7zaWwyk6R1R44k9b2p/21oPkONuqu0HFT0ZOldCD4W9P1OibaLXmEpMhl0A7rXAZKDCxIpSa3Oy6+2ni@lists.linux.dev
X-Gm-Message-State: AOJu0YxTgoPecGBW+cJDCCkeNIJPnEE3gSLLVYtzKop60mcPHMlHthZ1
	2zKe1LItyuUa+02ZKc174Lpf2sJprR6qdtH11fDbsrdtlQZHZaT4FnOb
X-Gm-Gg: ATEYQzyO5eTM7Wzy5kCTnEt16hcb0rio361yoYXT7xsIuvh0qA7PCf9Se+nderyODXo
	uHtfrBKWaLLDjPBTSOtG9sHuUORX+W+h6Q0xWWKNXT/rAaNAMOGlGQjpDEi+vSTEqEHRBVbxZBS
	TJXSEJk2JcfMBDaR6V3E2keL639DFfURKgp02Ao96jReGtH6R7BouW953P6Ez65PdGFz9KhopRn
	QeEbt1URo/LpGt6xrC33yDc9aHB1g6A7mSsFkN/JGIteNOC3rJq53cTTqJ9ZmvvKReDpgCaPiZ5
	zfrfJAD3LlTEow6hXZA/vzk8TuMY0tCGYX2QVgOvspLlypedjEFQR8ryLUQO8HbwyN9+BctslxW
	/h6KLt5ipaZz7l7tQguZlmO5D0/ico2+b7syE/gh9OJkMTboHr6m8Uxj1QFpJMAw/gHGreUDHrq
	jAp9ijfHQkEI0ZJ4QQSFYHIaj8g1S2kGIfa+nh+CVKN1t+sSGdoEg/q8X3+FYR9pRe6+pV41wlc
	Pq5fcNn+MAERCcIVAWrs6RpRip99Qbo
X-Received: by 2002:a05:690c:c4e8:b0:79a:67a0:ade9 with SMTP id 00721157ae682-79a90bf14e8mr1164227b3.43.1773944769984;
        Thu, 19 Mar 2026 11:26:09 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9054ee5bsm1442577b3.31.2026.03.19.11.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 13:26:08 -0500
Message-Id: <DH6YXSGBDFM4.23LJXOJDLZ5Y5@gmail.com>
Cc: <luka.gejak@linux.dev>, <dan.carpenter@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <straube.linux@gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: removed dead code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Aadarsh Mandal"
 <aadarshmandal9354@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <20260319141818.7735-1-aadarshmandal9354@gmail.com>
 <DH6YX1BYWJEG.Y4KGQ7DH91VV@gmail.com>
In-Reply-To: <DH6YX1BYWJEG.Y4KGQ7DH91VV@gmail.com>

On Thu Mar 19, 2026 at 1:25 PM CDT, Ethan Tidmore wrote:
> On Thu Mar 19, 2026 at 9:18 AM CDT, Aadarsh Mandal wrote:
>> - removed the dead code.
>>
>> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
>> ---
>
> This patch is corrupted.
>
> Thanks,
>
> ET

Also, your commit message should be a proper sentence, something like,
"Removed code that is not used anywhere in the driver."

Thanks,

ET
