Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664468;
	b=Z+yiha5H5QWKWokAn2vmD9beETvJbG5/NJk750G6kEhcUIPAB+j4r0GM7bIAjA5gXYvm
	 ppWlNoV4lvB/NHG1Gksp5EfZEYTQFbltgO83uTFmwlQgqDAc/sZfyL696EVCbQK9u/Hna
	 2WePnRnX9DqxgtuzeNeycBuB5yZ+iFBwb607pgSGFk8ItaYvRwZdILEaiIt9ySrpyfNDI
	 sG44hdCxQaBqIJaN/0mxTbkuiFO+KkjSFk5tgd1XKEaigW1plaWKtdoGaDOrUnr8LUE+S
	 t1BJTAm+hR/AWnBfPeSp9yIiW1zrcL1So1Ewe6Z01ZnAEvRnYcBvyJ4nHWnf9ZRhPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
	b=kR8XMvRtDOtJGki7DsxRmxW87Z45ro/HxSccPbnS9szKmBo6+wq+AIeweCALqX9/+38t
	 ncTk9Ewlwhz6PxTQU1XXlgVDrZx8T8ZBV5plJ8tu7Zw9uw4we+k1patIYriqKH3Ho7gZS
	 bhlTw9yjqcEK7kYCNnEIR3vN4sMa3Qsc7wwQwxuZxjoaKl8gkrhU8wIwWy4P2Ky3EGthT
	 YPY73GqShvM3uXNx5A8Ey+JoR93FMAFDj8O0mmKvnzGbnSX2PQ9x6Z5DgTpJxiZZ4H2W3
	 RQ4ArUJDnFLH/X1qfW0a6sQUmrIsI3hxbRDWBZ7OKqhDY0ZwIm0wQds8dnCRIQiqX3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VC0gWJBN;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F46606A327
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F46606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VC0gWJBN
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-18cdcfc05ffso4295411c88.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664467; x=1794269267; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
        b=VC0gWJBNxEpYHTCchjQbUQaVKpx7ImcmXChC3w4N+w87Ma6FLtYcGpNd3jOv/Kl0Y9
         vCpFJBajXnknReyASiiQff1p6apQgzBx4k8/AMOoBcG13TlWPD6aI432o4IApFyMb0L0
         CKukFSo0f212JQ2uiBmraQBhISSmWb/TD2+SBhlzMso2E/ofjl4SeNFZD03BC5w1n++s
         dM+OXZnlEiw0b50vHxkbgCyZQTLQssmB6EYkU/NkWfDKiKgHMimfFYQ2iI7V317UJQ1J
         z02pT2WFBPrV/mxBGI6Po9HL1qpV9mCx1h6XMlPFo6xFK0wM21t7l4OovQPkveowEgdQ
         sQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664467; x=1794269267;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TvykTUk4R7T/uqrKjXDjIuLrA+PfKRZ6+JNOrXkof4M=;
        b=ZZ8q16ul255nqfzmPnN+8Vtevay85+zopcoS8Sg7whc8PrB8p3Qa86O+dRZRScVLfN
         LY0kVXzRe2p3I10Mz8sXC5x6p97KsFfaRuWTRggHv5Phf1JUaBsSjkOKaQapKlSPGe+i
         rQE6DwaJbVqdjH32Z+uIEw5UW5dtljr1znaM8vHUNb087q720fuFt/uAiWIzq0ueazQP
         Q1KiB/KteABmzyKMcbDWA6xH5aFihZJFjXerQua8JeTSTQaY+a7s6yVcv7bjRhJPMiPY
         2WOOAkpExIVJWikVrcHJBbwWGAGnlc4coQH/9c/Va1QIkW9QPG2uIJ3mjrZLTHOaRFsA
         PGXA==
X-Forwarded-Encrypted: i=1; AKwUvBwymNmORt6rXI65F0C5wUYZLo5zIyVTK46fG//m++hsgVU+okrwGNPWidaHWRU8/2RF12RsktvFGeJxjtkf@lists.linux.dev
X-Gm-Message-State: AFq9FYLABVCIBy227PgdRGRRC/ATXl6kj+057Tanq64R/dXheaDkAsKY
	O/GQLIsV0inmwbEl6yJ1FOOdA7SjfSlb2d/0D5PQNVuzCvvqmby/9um3
X-Gm-Gg: AYBFou3iWXax+N+5GelmKj6wi9WVIHRqxskzfWPPGsQ/F+ut9tCuaD8vPg8KBvGtu7k
	T57WZbKBKKj+nYfEyDuAeMZ/NvWWRKNjKYxB5rQ/Mv18VKVHfUmOSpDJUaPz2h70t3IbvVQ2OlD
	rSTYBm+DWAJtBEyxpO1YdmqmdCtd0R4jn1nUVYUMdvVCAhp0e3qdFbpInrVQTu2JJzkesUVLFlG
	g1vYFntZSBfCJ/dnXd9pKh5ErCuFBDRMXDcG6AWmGAfTJ6/estKHaYlZezoXmvQG2MBP/aUuYKx
	gua0/0u9r8AsNMOMCesWiqmogp7CZq83eRaw28x3vkqzSOgYBtEFJQ71VfWc4Lrzi4R52teqrS8
	mZcR95PlYkHzTrvYvAaD5JwB6Rlbxm+16lY+0IhoqRSvGDMVWZ5uphmDmOZVgvFWhW+SMA83O5k
	ViAcHQR8XpPqoOt4ZU4Og0OHd0mBHxbK84ef3e+QYVPXz5+DdNrSxqN60CRJ7+s8Z8HL4EhrnPZ
	K9rBVAm9BqfB2QdQkdzOYKeRoEps7BS/xNKWgm61kuPJ5/C2NIg5EJzM9QfjLf1u552jRKk4diW
	xWvO2ZQ96k7O3GWB5JO4DCZSV0gbkyYodyc=
X-Received: by 2002:a05:7022:92b:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1ac5bda7dd8mr22231405c88.8.1793664466566;
        Mon, 02 Nov 2026 16:07:46 -0800 (PST)
Received: from smtpclient.apple ([5.34.220.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm63335030c88.10.2026.11.02.16.07.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 16:07:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] staging: fbtft: fix space prohibited before that close
 parenthesis
From: Eric Lee <eric.lee0305@gmail.com>
In-Reply-To: <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
Date: Tue, 3 Nov 2026 08:07:31 +0800
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D7B3C1FA-32F4-4771-BC2D-F97D07CBFFE5@gmail.com>
References: <20261031042315.1122699-1-eric.lee0305@gmail.com>
 <CAHp75VcvKkOmFTtJDHuKCNVUMXgjZLiNqmGcHFKT__dtTt_QJg@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)

On Nov 3, 2026, at 04:44, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>=20
> It's not a fix, it does not fix anything.
> Also study the mailing list archive (lore.kernel.org) to see what
> happened to the similar patches in the past.

Thanks for your feedback. I did check the mailing list archive for the =
same
Checkpatch error in staging/fbtft.

They either removed the extra space between =E2=80=98,=E2=80=99 and =
=E2=80=98)=E2=80=99 that caused another
checkpatch error =E2=80=9Cspace required after that =E2=80=98,=E2=80=99=E2=
=80=9D,
or removed both =E2=80=98,=E2=80=99 and extra space before =E2=80=98)=E2=80=
=99 that caused build error.

The key difference in my change here is to make that argument =
=E2=80=9Cmodifier=E2=80=9D as
variable argument, not a positional argument anymore. After that, I =
could
safely remove both =E2=80=98,=E2=80=99 and extra space before  =E2=80=98)=E2=
=80=99, without further checkpatch
error.

It passed my build and verificaton based on the file "fbtft-bus.i=E2=80=9D=
.

It is fine for me if you think that it is not worth removing that =
checkpatch error.

--
Best Regard,
Eric LI=
