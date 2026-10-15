Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1F53CA9F
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078953; cv=none; b=KftVI9P6Saik9DPYlokEtJ8sjNGx0anJ9X6DjTxP9WQk8EBvMSOzxR+gMVOMvYUrSXBnF2AMRK7StJGfBuhFn4XBboXJPCoERvOE7bWg++1D9ehK37m/+aNiEsDej/tQzFd4ACDLKbN1tz+wqA4JzQB1+FyO6QQWdiA/CuxSgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078953; c=relaxed/simple;
	bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KT1DBX+kP9KCjJMbUJH7hQOAjNsgWvB64HK87MYeqfLpaVTxya5rtSoTgcQQytBCnEy6e4Hy4/0z8K0BrPiURmU/+BxyZRISsK9fCHd6AWHp/JWaqGYzsUBzhqr7Ulhq2b+oPwunbr9SnCyBhXYzWhw0bWhSErdXirYjdv9Boqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxELfenF; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxELfenF"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679334baa1fso4815040d50.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078943; x=1792683743; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
        b=sxELfenFh2pYoGa8J6U0yk44HiDIDlULZ50mZpAFc6vrcRKw/h8l/sljMSjXUkXyvC
         cef20p6CkeqUcBdeFmQozchBBhxFXHNQghutOfU20/yEhWy9bBe6my9C5CRDMxhBmIYz
         po4oO52vK9i/9/mot4lCjsiGQmxgJz/jw4cFjRgKSsuJITKU/9q9+lXYL5kYQCLKuse7
         OgjlRK3PKBEf/lpv6aQdmN1Z/8kmRviGni5lGW14s5egqnChCVJBOm0YHo/35KkzI8Cx
         vQWJgJe+h4WZzFmo8rV+v1J1oU3zjhQHQxZXw0zfPJhxQE1WYoV4K3sTNtfvxnDClU62
         4AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078943; x=1792683743;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
        b=pFPUl8ti+eUveFK2KWozzFiH9kwvWgJvQGTySwHwTfyIzN7kjbnRP7oLZhz7cvTWLX
         B8PF4qLFv98lKAvBKNH1ZpAwMe0zEmrbsBWbyDB1iy8ToaIiRflEfghbdrkP1tbgJ4jZ
         Cwy4XnmWPAEhmDbQY74sYlAGskvQ6qRejMEvaYPbBleN79mbAqUp6K4DRXlLmgoLnvpA
         MK7Ur8yCuyUVBiVSlDW+s8JjUPfkJ49TbvHlTO5ig9MFf0I7hj0fXpteWkF/aNGDULaE
         0F5SDQ+DVdRosr2Pj0LFQmDqBm0R7PPmNGz8iG3VFy0kzqvZU3tTIT/d+iLHiwxs/AJZ
         JgLA==
X-Forwarded-Encrypted: i=1; AKwUvBwFrKrEX3PqN2pxy+hBToNtpQwSijS/MHDrk64fkCmqr68WTDLsnixNuIsaznAII5k/LDFdD08oYAJcWEk5@lists.linux.dev
X-Gm-Message-State: AFq9FYLvp91jrWm0qawooZc/kXi8NILO2Tp/2kV5bWNUB46Jr7MRppeY
	VcFW+ogvwR8G1eiaz4GC3HonB75kRgwP4tgTmcXdvdyZUhemXQlHcf7+
X-Gm-Gg: AYBFou0fo1VtSMWzAgN20L2XaGZNBohD74tTgeT9sek3bdfkle0CGIMmPidv6fsO8Wv
	SgsMPzZi4bYKVN5XsOyjf/iCgAn+8zd3b2XUYVhI3EF7L2SzC2YrNBvMkyIPCkPqguEDjF2xYHW
	c9zMgHYzEb3md60CzWQVQF54d6Em+vzV7my+GWF4vptW3VX8YmNIEcz1QeZp88dTzWTpQilINlU
	L7JE9Cv4Y1/weq5VwUrfvE4C6qI3ezpLb/CpLQ5gArJHbHOqd/ER71zTiNomk2cefPUmsDUkJeh
	MWSJiKlhK0oaubLO2CAHYIAa9Z2gZXrVqV4FSYbCofydNpWInzyH9T145Nn/psM6poHQS6aFwyX
	eOnvuhCHxoZZ4CiApyOLcrBZOKREo3gJzXreI88D8ErdCyDsu/hdFL4nrM4rJk2kYcRQGh57kV8
	11SUfPXxRBEZd0Fduz+S/OBSgQBNI03IZ1nGa2e/8y8Snj2MYV+KZsoswAkxrAGZ3XkesISFBmF
	Icmy3CEa6R44NyBY8mI1WJBMZif9ibJP1oAj5K5Nu9/TJcUKODlMfGmnG5okh5YRUvZs3klBh+5
	D4I=
X-Received: by 2002:a05:690e:1304:b0:678:151:5218 with SMTP id 956f58d0204a3-679362f1c23mr5974469d50.110.1792078942713;
        Thu, 15 Oct 2026 08:42:22 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e11207sm162433d50.8.2026.10.15.08.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:41:53 -0500
Message-Id: <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
Cc: <error27@gmail.com>, <ethantidmore06@gmail.com>,
 <dennylin0707@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Luka Gejak" <luka.gejak@linux.dev>, <pavankumaryalagada@gmail.com>,
 <gregkh@linuxfoundation.org>, <outreachy@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
In-Reply-To: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>

On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
>
>
>>=20
>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>=20
>> Remove redundant parentheses around the address-of operator to
>> follow kernel coding style.
>>=20
>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>> ---
>
> Hi Yalagada,
>
> I'm just letting you know that this change is no longer needed as the
> entire staging/rtl8723bs driver is being deprecated and removed.
> Support for RTL8723BS has been ported to rtw88 subsystem.

So rtl8723bs patches aren't being accepted anymore? I saw Dan reviewing
one earlier, just wondering.

>
> Best regards,
> Luka Gejak


