Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD536403A
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213919; cv=none; b=P5KEeQ7ui05yr0N7F94FB9J6OEdKFrXh1rgSya+BUf+zGM/ESF/EsojeBz8uLtc2Db0Q05q0ogkn4MdccFz7FTJwxsIZSoLqeckTUjmvds+P21MZ9QW96y8qNLN/mRRNXCvcvAZQxLhAHPsxpbZqzboUpv8EdU7kTW3x90ZibuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213919; c=relaxed/simple;
	bh=JgWkM+uEV2lwkiQY40RjWEios8esQgOTX/UGObMD1Hk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LO4VkZ1up2mcBoSvlSKJE8S5pApa9myNWqj70MtCWIrowPDCWDIfCXswaWNUh7zgpTaU3jQRagWpkRgNR9sRWKUMgkBp9ejOG0JYgdKhziEP4mbu+LZq7JgN6qn3HYOhJg02WiSjbeuoKy8TJxYbeyRCE3uDfLWX8wmNr94RzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAu5uVL3; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAu5uVL3"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-797ab169454so22902967b3.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 09:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213918; x=1772818718; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSLmoBuJXthn/+NxOdql7N7JeAVNLr6U4qCqgckTUdE=;
        b=TAu5uVL3HweZVu/PLezBJauVA4xvDP6vTcFLgRpmzh73TBkardjlwRITqM4aee9wcR
         Km1qKaRyGiyijuCSPClpwWr+h5UK2/4Cs/7sJDnQ2INEh6fCPPNCEnAQonxyl46CGaFp
         6OGgeDvK9n8VSSs95bFIrT5ThhOvuFuAMDHzfhiUfVguO6A4nKNEjW9MwCyqwZWbbvE2
         ZVuR7H4rfvy+dWBherXvRKEcAyYmtAocIa3ifLakS2M8A1uBQ3BPqe4/Z61Zqt1Tcd/e
         0LGl33uqrlDtGPMWMl0n8lc3x9UWyRyJhpl+Uv8VOLsHWhf+VmzFFnqSq0w09pHgL1hq
         dXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213918; x=1772818718;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSLmoBuJXthn/+NxOdql7N7JeAVNLr6U4qCqgckTUdE=;
        b=ZO6XfCsuFBCWo0bfD4k7/hJD10DKUyF2I+rzsQZR9OAXtOcXYUl+vqErrexk7DTJkd
         NvxWC6qqbSFDBzz3IdrJJ7GMrJscro9TWAjsWQt1KxQqdSsLrCyah93J7SKXlKEikYMV
         Hwkc/dWi5G4KVpjCwr0jlwd/JMBEoTvQ3XeeSxaRDon5eooVEhxm699Jb5/PuwmZLTNc
         pDo2T6HylXzvOvLMicAds2o2kY0BUoNJ9cvI0YH97IpM1JtO9cTiS4e+mKgbf3O9SSTC
         Gvwm2aZWAGqBhRx74TbJgOs+IC209nNycYM9AI9S5TOY8VonwPNmRz6Rh9Gszaf7LSc/
         8imA==
X-Forwarded-Encrypted: i=1; AJvYcCVwZ1cqyf5Ia/CLPAzQq32okP+wJSFc3dxJEqYRcymhZvQ8Qw5Qqrh7uHKSIooQ7fNPTR6jYrdS6+RGmCHx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+j+ApdgJz0Zp9ZMgYJ5QVVbPY1NDw7t0ZsDw7ULUU7387s+eV
	o5KzfdR1srEwedEvIeOYeR7CJqobuDDZl9sby2RuXBa1FuwlpPv6/qCv
X-Gm-Gg: ATEYQzxMmis++5CakdhA7UgpdpXbSjZ5XQoOo4feNXa3SlKx2eIniTQ58KH4FVNhj22
	ipUUD8+GxjIlY/0MuiC9/+QHg9NvFra1RIi/o0Poqn8epaZtJjAKPkTb8OkRva0WijLj8CGYbaJ
	NolQ7c0EguGd8IPvYvn8XUn3wLWOH0kp6E6Gzd8GfHk4tVb1ijn6X9SRjNjLTQ42kcNLRZ47kHg
	SCLytXRK0f4dJfA2T8ohbHs7sbFgRPAxl6tLFyRZf2Q1bZ2rq3nGtb1ZbXAUFshPoDZObvPPNnH
	X7i7jWxCVACvR1/k0R93DIraqYUar2h3W5yNXQD/WvrSPsZLCY0skeduI706h8uoG0ycLHg8ytj
	fZbEaaLljtAlytohlM4H/zuzJBCoRoiibID8Njh/xzqQ3SNBm5rL6o0LhbFuPjBGFe42FYU4nwz
	pZjbGWul0LBSjOBf/m4HEE5oX0MG+WZqJsJty7C7X6gLGbsmGn/9eOwa2GcajFDxMQ1rPPy6l4X
	DS95dCWHO+XxftZpogdI/efaeZKNnQW
X-Received: by 2002:a05:690c:3507:b0:796:39c2:bccb with SMTP id 00721157ae682-7988564cec1mr37161737b3.63.1772213917583;
        Fri, 27 Feb 2026 09:38:37 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c7e223sm23738297b3.43.2026.02.27.09.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 09:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 11:38:19 -0600
Message-Id: <DGPXE9UVQNON.YKGOJU2LYQX9@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused 'ratelen' parameter
 from rtw_check_network_type()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226141333.9909-1-nikolayof23@gmail.com>
 <DGP0F87MHPIS.1IE1IQAR5Z8QB@gmail.com> <aaG3mJqfNxZui8lw@archlinux>
In-Reply-To: <aaG3mJqfNxZui8lw@archlinux>

On Fri Feb 27, 2026 at 9:26 AM CST, Nikolay Kulikov wrote:
> On Thu, Feb 26, 2026 at 09:47:57AM -0600, Ethan Tidmore wrote:
>> On Thu Feb 26, 2026 at 8:10 AM CST, Nikolay Kulikov wrote:
>> > The rtw_check_network_type() function takes a 'ratelen' parameter, but
>> > does not use it in any way. Also remove the local variable in rtw_ap.c
>> > created just to pass a value to this unused parameter.
>> >
>> > Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
>> > ---
>>=20
>> ...
>>=20
>>=20
>> > @@ -890,7 +887,7 @@ int rtw_check_beacon_data(struct adapter *padapter=
, u8 *pbuf,  int len)
>> >  		support_rate_num +=3D ie_len;
>> >  	}
>> > =20
>> > -	network_type =3D rtw_check_network_type(support_rate, support_rate_n=
um, channel);
>> > +	network_type =3D rtw_check_network_type(support_rate, channel);
>>=20
>> I think you can delete support_rate_num in this function too.
>
> Is it possible to remove it completely? It's used as a temporary buffer
> for 'ie_len', so perhaps just the last line that increments
> 'support_rate_num' can be removed:
>
>> >  		support_rate_num +=3D ie_len;
>
> since this value is not used anywhere below.

You are right, we can remove support_rate_num entirely, but removing
this would be nice.

Thanks,

ET
