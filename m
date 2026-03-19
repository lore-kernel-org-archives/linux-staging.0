Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314C34C808
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946762; cv=none; b=a5aqzS+V2rOoBOpA22G5kioGQZ2SK/Wkz68jemn/epnVIhg7PgXTArvlrJLT5KYVT/i9daF4+2+c2By95juQSKCY0KPMINHl3C53dJQHfJBtFN9eA3HKgQvVE+sloHUzojUtdlyk7V+zKsvtrR6yXCWmV2qDFWuPXLB+fYyIWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946762; c=relaxed/simple;
	bh=5Qv91/fKnY0aUvT4i94q4+GUJqSYf7Ahhq07SFOt2UQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FgjS5BamgmNW0++H6eieZrYv6CHW5/QgcgYpCb5rbOCIEIcM9gp/mgM5uiF4ZGccOtw2/JfOCSw070cUWHoRN4QXq2YJvC8h+290Q7k/NpTUtrizYeH/N1NxfMgGnYkzr6XjCMGlnWencnm25/NaLBS1ADq7NT2VDc/+mE5fF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJJ9Nc7+; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJJ9Nc7+"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797ab169454so15431417b3.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773946760; x=1774551560; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qv91/fKnY0aUvT4i94q4+GUJqSYf7Ahhq07SFOt2UQ=;
        b=cJJ9Nc7+VR8CDY9+ZuF5n+SJON3vAALXk13YVFGBHFVXJvOa+rM0hLUoVy/kxMpcbp
         OCKFmRm7/+XnNA+Nnf2Fo7RXEPHRIYJgJ67H5nOJ7ZINt0dXX+KsyiZWlPtYp9lrmxHY
         klXRx9LcALh997mhKAPivKQxikRLqb8z9iezG9KxctRd486k9GE5c85nKDrGh3e1auUS
         DmGjqoLDghpD59DftWClo/Khlsbi0O4eKSPU29L4C1DQto35kG1bnKX4n/0MLj0znQKu
         TqPYUtkcARwIHlfjG/6npHXmk2szqPILNdfzNbhSxKDJ9yNA3MYH8IIrd0WwFGPei8Xc
         NCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946760; x=1774551560;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Qv91/fKnY0aUvT4i94q4+GUJqSYf7Ahhq07SFOt2UQ=;
        b=J+7WZPX5a/HllvAd3gSwF32bDFqL7MTJ/se1SuVv/PtcxRE4spDfrRb7Uj9hH2a8Wp
         Jz8rOL5m5HlxlmscbRhwovcYPMevVQkHUu+QX/y7zXV7GwSoESHrj0UHAA8kTnDomvuo
         U/Y7jkEuIumz5Fbp8hKASA2MYGovVmb4l7iLcnN3PxzJHeSCUQ0m6uL8CaWBvjVARoms
         PkSxkpHY5eLJ54+EYhKD+zrRq749eD/4/iSQDhDT+StjuTCOXgu+BGUuK2eSeMSVGkWE
         9+G20OzllDqEp1Z/4OBECxthtzM4akY/kMcPxtGpEdci5UgIW+NgJc9Wpvw3HQoJJ3Nj
         mCMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9NDlw3GVUhB7HTThw7Wbny8rawAxSCdKgtBxhANyA3VNRoub2BtucNFU4V13HutZSaY/l9BsrAdmdUSqq@lists.linux.dev
X-Gm-Message-State: AOJu0YyqsdHbhWJgSKRlSBY5SWcTp8/znqFhHcXMnOg8HMRWiddALnnX
	lp9mfEbIb1mAZaYzWtNLN4h6BlS/vhGJkHmIP1wND64uJtZ3d5ZE2ANqb2ZIJfG2
X-Gm-Gg: ATEYQzx+fQ30cwGsROKiXOlJ8Y7FnPFBYhN8Pt+FteC57Ts2Qdc7SFiMxekxABjQaqU
	rTbLIX9UWEuLAebD2NF6oxMRKayyztsDK4hyP29tt4pcBPhSAEWpml+XG2XDo+lcoRTne1eZ9XD
	MhkHPgAjLhooAlrLZuAJiTZoPgtk6E43Slwr68BJ/L7Epi7ZCsUYi8i0XbjrpwKImh0bIW23cr6
	n/VuykEAsOgqXtu3eZ9j1khARGNeAD5sj7tySWqRsKpWPR0ZGcMVuRQzFkstmZbWE6Fttqnz12d
	ufyy0LsUA+Xiqjr6OFNbkTqOxw8mUy7hCS/P6RJZzapQu3Mteb8uwiWqlSJV6oidSqHrCU7f+qO
	U1m93XaZIzSA9OxUcci0jeRjJ9qEkBc5rjniKMqZPhtUstkgPtcU+yfA0ICFfPgD0G/7XCf+/Oj
	mJJipTheB8ulkfDLEESH+jYZqzMD9TN1Yx2DmhrrYtVfVbk7BuaizLxa2Hp7n1nu8HGbIDkQc71
	8tXQf/RFk69EOFJ4L5+D4nEgO+2Fm5V
X-Received: by 2002:a05:690c:348a:b0:79a:167a:c0d1 with SMTP id 00721157ae682-79a90c2db1fmr2281717b3.54.1773946760399;
        Thu, 19 Mar 2026 11:59:20 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057c7c4sm1949727b3.34.2026.03.19.11.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 13:59:19 -0500
Message-Id: <DH6ZN6U0R690.O0V7T8PKOJUQ@gmail.com>
Cc: <luka.gejak@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: break long lines in rtw_sta_mgt.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "MalavyaRaval"
 <malavyaraval@gmail.com>, <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260319174229.62021-1-malavyaraval@gmail.com>
 <DH6ZMB4R4HJN.3M9JIY3LOU8DT@gmail.com>
In-Reply-To: <DH6ZMB4R4HJN.3M9JIY3LOU8DT@gmail.com>

On Thu Mar 19, 2026 at 1:58 PM CDT, Ethan Tidmore wrote:
> On Thu Mar 19, 2026 at 12:42 PM CDT, MalavyaRaval wrote:
>> The original patch attempted to use the preferred sizeof(*ptr) style,
>> but since the target variable is a u8 pointer, this caused a buffer
>> overflow. Reverting to sizeof(struct sta_info) ensures the correct
>> allocation size while satisfying the line-splitting requirement.

Also this commit message is totally unrelated to the change.

Thanks,

ET

>>
>> Signed-off-by: MalavyaRaval <malavyaraval@gmail.com>
