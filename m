Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0B366542
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611729; cv=none; b=YWUyE6E3uaHbI+sGuBJ1/T1kKRvNDiQmixDd0R/Cl9PSMFBsvS/ybiF6e+RYuyFd7Z9X2rBkwSoNUmtMnZPZti8B1XDyXUEAf7/KIbp4j7rzUTqQdhWxgGbIx2OMapFL4VXEO6BISRCBA+tWT8ZrXoOPeAaGnzhacLaodhw2oCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611729; c=relaxed/simple;
	bh=B7+NetcyTlHJlDO6jI51PKu0q3N/I3aF+y2aDBXrUhk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NQOrtlrfOnr/IaXLu5LnWxGAhVkGzYlgKrVoQS+zMO0NOtmqAp/5WzpzouODk2PkmZkQYhXeU4qR8MoXsiHGYETJvjekFLe/6qTmC89bp7yLPNb3t+MU+utl08Kia4kOqpLJKJpcUo0whyv29CFp6pBdU0ci0ya6YW2K7DAVlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9o6VAS0; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9o6VAS0"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79801df3e42so32570747b3.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 10:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771611727; x=1772216527; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRJAjAB0tvSGDPDKDKa+7ILRcDXflM4/W2+T4Ei/YOY=;
        b=k9o6VAS0r+/SlVZiIsjK9GcgOq1BzzvWkrUuX/iTwwIGI4kWS0WryMyENQGbjyl+iP
         AwRp7jG9mjzpM7JK2CdRorhiRq9pj7rDQhqkY7f9MjupFtrzyQBelG5qLVJJLoEPbKAl
         ZrBe8SbJ2PD7u5dnbY4HxL55jxV8SrAsiOotYK6YgHj1XU1IHQCIx80H63b4MfqFA8m0
         6R/2LONRZ5tODS4pvx4w9dFGo6WYOXCVOn8VXcQXbZ4V8hv9YJD+VqjPPTzfOz05PcwB
         uFvsZUduJzI7LiGQa6vTVkSxlKl+akeX6wnPpGB6g2xIQs+ALq9qA5xLxGD8pJnixTJf
         5kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771611727; x=1772216527;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRJAjAB0tvSGDPDKDKa+7ILRcDXflM4/W2+T4Ei/YOY=;
        b=EeifQrV+TL6P+mDMhkpDgcAwU7+KRLVQVberHXq3i36o6nDD0iRZAqa8a0v9y2wb1y
         BuTRrlTiwIZ5ForPMiiuKlltOlr5g6UIQ+P52/NBeXORG3oRITyADYjqT8f6Kp3jFQGv
         Dg9ODmqxF6p9mbx1A/aEPdRf1d7sKMqKtbvtb6waCSBNyOkKcKpAJ6v3U9wqU/lXR1u2
         wBn/6wa+mNKqWLSeDpPf5UFGo7GzEI351i5om6gszY+j2Jz16LVAcsUN+XeK1DpsX5bv
         1W7ENh32sC42PtPEfPKCXk1HURuixjrkCJf325xRZMS1mmJKpnSd0NtPQ/LWogroyQOK
         qR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwZ+gaFCpKJo+PVhUELi75fU6zs8Q86EgJVwll6LEyOVTwPi0cSC1YOwv2LiCEeTb/pA1FJjPrJInRFM0+@lists.linux.dev
X-Gm-Message-State: AOJu0YzmwVkZ2iVXlSbM/Fffw+S0iy6zjMVd/f6yB3FvaUF1Mtq+ozfE
	s5u3XDETZDdl/oxKzeQ9LjIsRsy6jm32kqcSxL5Nmycjt15JTZP6o8oL
X-Gm-Gg: AZuq6aLbb9LILzDejhXDVvi3JlqvwcXuHzfFNNc+peglUld6mBC2zDpf9qg7wK+LOuk
	0afuAE0gNMYnbqX7A3Jr0J5wvC0AhL9EmHESSfA7oitveTT6+u5dMk6F9HmQtQ/7vsqgNm09vYz
	N0GqdFlI5q2gwCN0hFeund0JUwhTsUsCmqG6l9lSGh/T/ef0YMzbVi+t89UkcApp82xkJH57dqP
	o4tulLWflX//wSruQKmAK5uPdVWJ15W2qDHczzDDK/ZpJe99bKJisIh1kMQIKit9A6i0TVo3mhh
	389v4qwjk+0DnlqkWQF5PIjwUExscuXpKRAo/gsgmP4WX2pBUVDrPzcnTv+xoO7IPmHj/YSU9B9
	5e+jADjtxKclc7/QB+nhXLEs6y5sOQ5A/D73ceoD1WwpMgIKu+Mnbm6l+79r/j9TQ2rS9K+Z+i6
	aWhX233TKXAcd97MjH9fx1W5mdfAcilB92FfEtnYM9MgAuP5gN4unaO/vjyNCHRmlWiRw16axkC
	Xu7dxP9qtbJSg570SY804QuKYfOzUolzpYsFmDqjIBqI9UjmMo=
X-Received: by 2002:a05:690c:6388:b0:795:e46:4eef with SMTP id 00721157ae682-79807b4b733mr54589757b3.0.1771611726996;
        Fri, 20 Feb 2026 10:22:06 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c23f251sm146499947b3.24.2026.02.20.10.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 10:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:21:50 -0600
Message-Id: <DGJZXS0ZURKI.13IEI2NXCMESQ@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix spaces around binary operators
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218113229.9171-1-nikolayof23@gmail.com>
 <DGIAYPXFFQ1Q.1J195CKVQVKWI@gmail.com> <aZbVOzEgj6ljtfqf@archlinux>
In-Reply-To: <aZbVOzEgj6ljtfqf@archlinux>

On Thu Feb 19, 2026 at 3:17 AM CST, Nikolay Kulikov wrote:
> On Wed, Feb 18, 2026 at 12:34:56PM -0600, Ethan Tidmore wrote:
>>=20
>> Logical continuations should be on the previous line:
>>=20
>> while (cnt < in_len) {
>> 	if (eid =3D=3D in_ie[cnt] &&
>> 		(!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
>>=20
> ...
>>=20
>> Alignment should match open parenthesis:
>>=20
>> if ((*wpa_ie !=3D WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) !=3D (u8)(=
wpa_ie_len - 2)) ||
>> 	(memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
>
> Hi, i saw these issues when i was fixing the spaces, but i intentionally
> didn't fix the indentation to avoid merging different changes into one
> patch. I'm ready to send a sepatate patch with indentation fixes.

I understand, but here since you're already editing the line, it's best to
just fix both whitespace problems at the same time.

Thanks,=20

ET
