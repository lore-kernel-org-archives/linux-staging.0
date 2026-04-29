Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF239347537
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467071; cv=none; b=ZQHeNDZ2GWCLJd0djOK6X0E3KVzzTXIBjwLknY6LUKAmNwUCnDQ9gcI6lEpwOEEBsMvjumAup4SWUN47cVvslHSxYRkckP8Zpm1Df2Vx7kCygH4XXPA6ouwrWgxTe96eg8h9bnD9AiSX6xAEOBoIbNKyYwSgzDfD4ci2eQ7PGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467071; c=relaxed/simple;
	bh=rEwAHwTPmlzCRoONDTTNU58hSyIOkk5ytMkK3WdZJbA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=i0UUf77uGU7PqOCBtrHT4heBnxY8W2jVFfHmTx04oN4H3Ey45ePUM9TeStV9c86q+2iVWi0K8HvpOj+oWzmNurmQIwWvehpLtYxL6UXqAVy1RY3vVQAAjEIIJ3qCo8TgERJMGUcH9nS84Y8CVTjq/bZVxu9Hpg/mHiYxexgVoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMEendeS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMEendeS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso97228775e9.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467068; x=1778071868; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pz7Jr4aophHjazaTYKF3gMpciv3sy6dOiPEqGclFI0=;
        b=dMEendeSnrByyxnD9zRJdPdoZfiw/qKFxX+fEqd4Wp9Ysh7mSeFt+drzeGJDf+uyXI
         tkfHQoPErgjzMWok5szFTYsYi5zFR3iQc1tI6UWgpot8lpwrDosjcb97CohjumVQzc4P
         klTI3yeYxPAGOeruFj6GOALLhJ3UrfJPvTIv2tONqLUkYGX1rqyJ812nnCMV8YZ+1hFt
         rET6bLl2W0biQKia+wzLaHSxhBoDituFr/JEJMaw3Pmx0XbUITl6uKYkfrPazDz5Ce4y
         5ADRnqzc4+50g+WyXm5h9HQ3AUdfNUTlfTbeIX6bNiaxAjNxc9oM9rbuH3LdgimUng5c
         EvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467068; x=1778071868;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9pz7Jr4aophHjazaTYKF3gMpciv3sy6dOiPEqGclFI0=;
        b=YaEewRWcywMnTnahVTuzzm3zmONhtMTUge4lLP0jODmsoWFwLyLP3cixXEJ7bWpX2O
         6gr/ccyruk8qDuRXAifj94XRCujmOpv2OxMiW2uFBClzbmG+J3L8ymJP4K+/u0TELuY7
         wsJowayX1cIH/st3O7zOMIAgo/+Gahhi9+vdfmiKAZJ/zQd7OXcDSMCAM/ODQpFbg2o0
         JesPc1nxbj4mMc1PWYl+5gCl7E5MrntRONvEjnQfCoUMaDIh6sLuP0spriznrln+9dPT
         BnsKx4ROD2J5x6OcvCAiJHJBHZhNuEA3z1WtrwyqNWDSRqNInh7MLaSNSRusuWi1TqxD
         oQDA==
X-Forwarded-Encrypted: i=1; AFNElJ9FjXQpm/Rzq4msGsV/nzS6knY8rX54AFc+/6Ih52P1vuAvpAoZea4yHVKQEMX6421wGyB685xK6eiM5oa1@lists.linux.dev
X-Gm-Message-State: AOJu0YysAx/nYsstPOfd0ItirWwudu2zQloIURFxb4CNDV2kiqVDgnFM
	9lCU2XsqLeclReFjQoRjOqW6sdumr78e/9qkDpjaXyah6SmOTqxXXLfu
X-Gm-Gg: AeBDiettceZhARazCdnPo2b812vDquH7albQvHjrN2fBu6QbuGf9q9fdR1YbKF5M3wn
	kT+Q6etONG18kDEMAydb4JgkjVXWeSej9kaiih+lF+41EvL5kDMeVgv00gnF7i5DgFNNhRzUxMC
	yw7Tw2zOO1MLeaM/lrGCQNj07IRs348CvZnUEHxZWSZLqvGCQHqeTTK4MtbjtBTNJ2da/DwNLUm
	s8DJdE4N5MDsxOSq5t6jtaTqopz7oRpDSphDycTqXnT1ul6F3PbANtRM0BskCRwSOAqvgR2sHmp
	zIpNEy8Am/X6sVOaj4rLUwbIbEnGYE4uyilnTCzIO3OmH0L0qS+BV4fUN6bruUqTNw7yS3ioIGn
	whXKw3RI9uLMCHq3oIW/+BpcOYZhF3dLQ4cl579eDaqIUk4kqbauYVE8OIQoKloHo0sIX2yxq6o
	YrgJsN0hbi0dA7028JxVoML90FxpdViMjGqa939NW69GbAIrqvUmP34Bnja3doyshNVMj+mGve
X-Received: by 2002:a05:600c:3b0f:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-48a77afec2amr120292835e9.11.1777467067978;
        Wed, 29 Apr 2026 05:51:07 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5c00sm5724200f8f.25.2026.04.29.05.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in
 rtw_btcoex.h
From: Linus Probert <linus.probert@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Dan Carpenter <error27@gmail.com>, 
 Linus Probert <linus.probert@gmail.com>, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <5103B748-E9AE-4164-B81F-CB24326F3F7D@linux.dev>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
 <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
 <177745958799.1254637.4289009650997698120.b4-reply@b4>
 <FD718F1D-8156-4E27-BEE7-23E66D045A2E@linux.dev>
 <afH0RlRIDQdC08dV@stanley.mountain>
 <5103B748-E9AE-4164-B81F-CB24326F3F7D@linux.dev>
Date: Wed, 29 Apr 2026 14:51:06 +0200
Message-Id: <177746706634.1273374.11369919005007087628.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=711;
 i=linus.probert@gmail.com; h=from:subject:message-id;
 bh=rEwAHwTPmlzCRoONDTTNU58hSyIOkk5ytMkK3WdZJbA=;
 b=owGbwMvMwCV2OqdW0O/i2pmMp9WSGDI//tt1ycWm7Y0V4ynhldzTP6We2ev7+Cr/n7fLJ3Yf5
 /vAtnr/3Y5SFgYxLgZZMUWW/Z2RXI3zV/bWXkCYw8oEMoSBi1MAJtItzPBX/EG1qn5f7MGYSZ3h
 6tx5xd4p767HpvSkhe05++/c7jJLhv9FUvKtUxSsOBYXJbTLfT3KvUOrNWZmy0O+1uM9JmvPneM
 EAA==
X-Developer-Key: i=linus.probert@gmail.com; a=openpgp;
 fpr=CFFA060FD5CF9FCB9E3637DC640993AF63BF6854

On 2026-04-29 14:18:55+02:00, Luka Gejak wrote:
> On April 29, 2026 2:06:30 PM GMT+02:00, Dan Carpenter <error27@gmail.com> wrote:
> 
> >On Wed, Apr 29, 2026 at 01:34:41PM +0200, Luka Gejak wrote:
> >
> >Greg has said in the past he prefers them all as separate changes the
> >way this patchset does it.  He recently asked somone to split up a
> >typedef patch into one typedef per patch.
> >
> >regards,
> >dan carpenter
> 
> Thanks for that information Dan, I wasn't awear of that.
> Best regards,
> Luka Gejak

Thanks, then I did understand your suggestion correctly. Just wasn't
sure. As Dan stated I've learnt that Greg prefers one commit per function
for these cases.

Thanks,
Linus

