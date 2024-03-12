Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F45C7A726;
	Tue, 12 Mar 2024 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710252981; cv=none; b=Nf2VbUopUPxLc58MIdBXWK/OHXFFXXNICsOSStmq75EUuPBe7AK2RfWb5eK7YHbKiuZSlQNBXzYXERgN88u2G3ywH6H2rv3F2lyY102An4LmrktveP8ZtQt7WdpIRFCiIJIdJJR5oeBSxg8esWNBbUDlOVK3O2F3SuF0bwb7mAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710252981; c=relaxed/simple;
	bh=Xe2jflIWmBOCrDgKu8vTJunMCy3V4P/f2yAusY6t6o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCZ5N67lMaovS/h8wOornSdn32gfSdwJ4CENqEMXZqII/xd+7oD1Soe1+FDvCcRnVFwP8gfzMVQGmRPKx0fBS2+4qaPzxkA6/D+VvsrZeH5osJW39R/w+CLAz7DN5Fm43ikAuW2a8w4gNUyP3NknNbbMfp97VuWutfQV7t5PTCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTf2vCpr; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTf2vCpr"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a0932aa9ecso2121289eaf.3;
        Tue, 12 Mar 2024 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710252979; x=1710857779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PryMCW430H3sBQTt6N5uSE32FN3q7uZNf3BrOahNno=;
        b=MTf2vCprvHIMyo5ZmnCyEc1dh0Holz5Gu3jJ/wGYXJtkppX7gXIxE/NdSzRMO/pVfp
         BiQpTl9hj4LHnduEl9VP/JyijSu+MLbwku6uCFxelwjwJ1dCB7DPkO9LrTxues5lo1Pv
         y59UmZ90FjbfmSglDyZoEN1TleiZ7HoPKPa3VMogx2T10tEv8UkD0f4qf6XHstV82+iQ
         Y07PmXXMkVahKgDBaN62n1JVmlL4wIcz/Kil6hgJLTJGc3IsRtAgcdR88jFWAKehtEF6
         n6XFdgIDLJd4XSZftk0bwq5nhZOnlarXa/Kg2639R4pIYJj9UaxR2hj8c+j4fCCb+lCl
         p3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710252979; x=1710857779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PryMCW430H3sBQTt6N5uSE32FN3q7uZNf3BrOahNno=;
        b=d2RHcjh7523w/DAh75gnCq9OMtXWREHyyN9Y3Tyc2AtBsQJBW3TWhVI0Lec8+0saD0
         8hswao/7WTDoVIZ5ZVZSjfIqrLq3sE/pEg7VX+9FiTAmhxsyCB2izQMS391GCYz7NFYc
         kqm/BBFd+YMiS0+1u2heoY/KVO0fChMAIFARU6PK6G26cOcRvwp9nYN2wTHoWX7lIpk6
         nuadJ4MLXdWR+R7NZm7ogsmyd0sjK7EtWyjF3rR+hTYD851Pt/snRRuBuVkHlZ01m488
         okz0KsPy66gwUpypvZq5jYWG/hXabkhR4GYJUWMIV9UGVuFw7p/coNNG8jsrYLNY12wh
         03QA==
X-Forwarded-Encrypted: i=1; AJvYcCXiyXRGF9QPWizH7WuEs82udL0f9bYZ6tJfy4eSTCZE1Qpwg+cCusXeDn+KGKbQTyZA5T2vwgULlwCgxJ7pyF5lzF7MTCFrJjvyW/bIG5JIzyfBJ0C+IzGsKuI4pEfcLqn4pQviKSkqEg==
X-Gm-Message-State: AOJu0YwI6Nz56KqbMg/7yMSyoO+QQgfJRAlu0ps8GagMUDvVDA0iuuQp
	NdeIlVTDFRedYX98B6LFTwR4OxWTFaxBTmlim1XPxVVReN89Np0p7V9n9ZT7RTFmCXjH5P7DuOk
	X8nED9neaNrTNo5zPDX6h9fpPEU4=
X-Google-Smtp-Source: AGHT+IF8Wor4/RSzrG4762PBaDFxHtLXlGGWfOsP3m2qd2261gWNpqZ12XUJCqDKQXTWZZrsxTwAhWYeM6fi6QbhPNQ=
X-Received: by 2002:a05:6870:b24d:b0:221:7a96:9ca2 with SMTP id
 b13-20020a056870b24d00b002217a969ca2mr10818593oam.32.1710252979327; Tue, 12
 Mar 2024 07:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ze9Ie67PCSvBU+og@MOLeToid> <9bffd12a-afae-45cd-a4f3-451872146bf3@moroto.mountain>
In-Reply-To: <9bffd12a-afae-45cd-a4f3-451872146bf3@moroto.mountain>
From: Felix Kimbu <felixkimbu1@gmail.com>
Date: Tue, 12 Mar 2024 15:16:08 +0100
Message-ID: <CAK=vLxJLOsqECJn+c=Mo0kY2878u1bhRzYEWo+yZZEUbqEee7g@mail.gmail.com>
Subject: Re: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 10:03=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> With the rename the indenting did need to be updated, yes.  However it
> should have been:
>
>                 decrypt_check =3D wep_encrypt(wlandev, skb->data, p80211_=
wep->data,
>                                             skb->len,
>                                             wlandev->hostwep & HOSTWEP_DE=
FAULTKEY_MASK,
>                                             p80211_wep->iv, p80211_wep->i=
cv);
>
> [tab][tab][tab][tab][tab][space][space][space][space]skb->len,
>
> See my blog for how to resend a patch:
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> regards,
> dan carpenter

Thank you for the feedback, Dan, let me correct that.
