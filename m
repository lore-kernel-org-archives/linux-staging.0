Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D741272E56
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658070; cv=none; b=jGuMMEe60KGPoW+oabdQ9dbVeCmyoZQ2FoLLF64xA4csOCAqc2Pr/N8hqWM2YU0/ShfuKjnF3wFBHHvf7AEgY1AR8BKR0qgboYoaWa81C5WbdV72jr8vfH7JwmRJjxonwx66KRQWTYvVdg3NFNcvANTFmXDkO6WRtP8mWoch/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658070; c=relaxed/simple;
	bh=Qm5DTnblC8R/2+6rusIAELvDYGTl0cqEAmM1WA2KK0E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RGKlv3dJJLE9qRSjGTjdRaJ47xP2StE83WPnCNqkwnpZH4Q5o4DMClWfd6t14Id6RTXa1gEdFEdRhw37VSAOov3MHXy84Yur19ok2zN2Ze8Q0B4j0qIDBiM1itBG3hbMPRhWVSv21SSZBoPOEBBnY5ZVfNrQzjAtezujyNi0zok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGiYvclj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGiYvclj"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7986e0553b0so64334247b3.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 13:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772658068; x=1773262868; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qm5DTnblC8R/2+6rusIAELvDYGTl0cqEAmM1WA2KK0E=;
        b=lGiYvcljHUT60NqRXR8qhEeYr4WeAXN6vbGLMYtj80w+hEKtogjcorxAIJ7YkAVAG3
         kXq/esSF8F3fJbmBhjli4u7HQqqJAXh0dZxSlGnKONw6FBNQDgWsSZqa6pcyL0BQotBq
         KZpTLZdbYSXfGZ1d7t/kZjB8DJkYXBLbSap31V893F14nEFHJ3I+juEP+iK2Da1sT8v+
         f9cvLktmrBZZJy4p+BB5dAhPWhJLTmnxdIvbZ/e5ZG8UgS6dmA2EJdJyD0zgqWIaXwKn
         wZpWyRw/v2ooIF4ux76LchWgwE/aqqcvUms1kX2IPLM+uzHRWg/awddMfJb+rNPSKW8b
         XEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772658068; x=1773262868;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qm5DTnblC8R/2+6rusIAELvDYGTl0cqEAmM1WA2KK0E=;
        b=do33EgMdYz1ZHA26Hzo3lC7rS7B8VRFrwkusVcgBw5d1ji5PpWCKg2mRQeRCsC2Kz8
         iB54g1ElaxocqlE6UV2oK+TYHKGPqGT+jDymEV/0W2ILY5M3cb6DjrODO5WmCPZxb92S
         hjQfJR5bOCtPoMWy40p9wxt4+d3RRqa9af/fnf2D6P21Xkal3lMpfWqqn/xO0pkAp4cv
         pnsl6pCkC8t4Tfzo2zvOr90TLjU1vno06vOwCeDMLEUqr0Jy9gnX38BvZjL6fMQCeG5B
         /RduUjINN/uM4zb5fMbcRVRsmCbbI3Tjz3ekl4D2g4vvLrmX3fp71pgOysm7Ircxa3R8
         deMw==
X-Forwarded-Encrypted: i=1; AJvYcCXEqCp7vouWpFkdUYXhCAwBgtXSdHfFtvnFUMPdTaEMRZM0VVUcWbJbPlWG1C/FuVW3zn0wmt5yfRqgLHnE@lists.linux.dev
X-Gm-Message-State: AOJu0YwcdvqgSLk1vNPN+8sXrm3oAsAiK43kbbbmUIvCU3k3I9gZbuoR
	YOyixi8cPNVT75HiqG6wHIFxUiukHFmMQYC7tUEBue4d6JgBde4HhqFa
X-Gm-Gg: ATEYQzyjsR/BRUud4J8wXtAqb/pIXwIX9/weC4nvW+qHWqoxcBu33I8sAjWsLJk8W79
	4Hj0QuzNFos7L0RjarTcJzju7MJDOe/SIpfChTxCZTYs2F7YpLhKmPYOk/j1nCHd177MYgW1m6p
	/njaisie9biUMHNvsxT2CdF9Q+0TP5ijrjiW2c4cm1CBVmcWtOoessS9ZtONOflJqsAAekjZp98
	wN2O5BQCF5VsPOLPZJo/1sakqjYQLu5qPS7BAO70ex7pf5/Ixik7zG2e/7hA8hSEN6Hi9mobguM
	eJwNB9k6kU8U+NewtBzpBqW4DWcnwhoCDQ9oAiM69irWLrxCcO41u44juxJuJ/ujzgtN6U4kd+5
	6exseb1PH2qgPFrHNMp2H0wLxy+SttStTXKhj+0msH6qPgz9xjixtqVJ/o46TBYjEPJl80Ge6O/
	Mr+YH7zWoCDXi08ruL2W8n5EuFELVZjOgmG4l0v82lpVBEEv/t0T1tQUuHWME1Dm50hJiexIIq0
	4BmBZ5scEgRXYn19voEWCsL8/w9qmj2
X-Received: by 2002:a05:690c:6d12:b0:798:83dd:3f00 with SMTP id 00721157ae682-798c6ccc153mr28065647b3.49.1772658068056;
        Wed, 04 Mar 2026 13:01:08 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ad9045sm78273637b3.16.2026.03.04.13.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 13:01:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 15:00:44 -0600
Message-Id: <DGUATZH7A7R7.UIOINNCCWP8V@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Esther Zilberberg" <esty5664@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <arthur.stupa@gmail.com>,
 <jannik@jrehkemper.de>, <william.hansen.baird@gmail.com>,
 <kaizhetan@yahoo.com>, <s9430939@naver.com>, <straube.linux@gmail.com>,
 <ysinghcin@gmail.com>, <kees@kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rename supportRateNum to
 support_rate_num
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302090803.4796-1-esty5664@gmail.com>
 <DGSHDT7BCYTC.1TFCJIZHYUB6E@gmail.com>
 <CAPMPFbjpTjwMfK_hawUnF_CmiKPaZ0w6V+f5_NcGVKC4B6UhGg@mail.gmail.com>
In-Reply-To: <CAPMPFbjpTjwMfK_hawUnF_CmiKPaZ0w6V+f5_NcGVKC4B6UhGg@mail.gmail.com>

On Wed Mar 4, 2026 at 2:39 PM CST, Esther Zilberberg wrote:
> On Mon, Mar 2, 2026 at 7:43=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmai=
l.com> wrote:
>>
>> On Mon Mar 2, 2026 at 3:08 AM CST, Esther Zilberberg wrote:
>> > Rename supportRateNum to support_rate_num to fix warning
>> > reported by checkpatch.pl.
>> >
>> > Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
>> > ---

...

> I am using the mainline (master) branch.
>
> Thanks,
> Esther

When I tried to apply this patch against staging-next it didn't apply
cleanly, so try and rebase it against staging-next.

Thanks,

ET
