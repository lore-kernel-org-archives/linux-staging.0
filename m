Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A930DD16
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 03:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780425; cv=none; b=dZWU+aCrPZgQ+3078WYfbFJi3geGCfeKj2MPMT7a81O2MQFjuNPtjpWA8fWH+lsBR90ZVA7NPQhWwUnfRaRn7mzhQQA6IXFaexKhMlmsREdWlBsEaufuWNRMVHVi4Gd34Zgk7zPTNVrrxysN1aSq1yIjpHzbx62MdmKlpAz6pNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780425; c=relaxed/simple;
	bh=gLlohk1hM8dYTljLbj1pIKzl18cU6MDglJaze3Q1z4o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DBBIIajVzAanuvOjjK+mGAborApl4owN87mK4ZimQBFJKhkpP8v9uB1WORqQxdmpdmc8XZjyVAr+xRVDFVML4Lc2/PcsemswRqdrRY5AHXeWFaupO984VGz8p0yTa7BLMLJ9MumrdyyrtzZiLJXRi+K2nZoVF+41jWfDCT7DBgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/ns7+wf; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/ns7+wf"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7950881727cso10790777b3.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 19:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780422; x=1771385222; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKoCmVrrSKursSlU1GLGZdDvYA7k9AT9IwetYLGcTXI=;
        b=L/ns7+wfuNq/mN/8EZc0nzuBrxjzgprAVjnZ7Q7G0PVGr6V7Jbaco5NI800uqIwwZ5
         becmwNTWbZunh8qrNfomF0Rc4cHRBLDcPEVMcisHVZA4MepzSCvlC75dQcOVxDouHSGQ
         bfd9zkHbnxAXZlEjs650sIpKZ4iUxleWREen6Pd33VQNyGrUVX4slkDqbkrSgm4cYfIz
         I9b9+dZ5ZskC2U/AJk7y/QfAuQ8X3g8NzlL5jbz/UIKTfHJLNcqeTQqgA488jut5Edi/
         3UYAEAMjmpWJGWjnVk+3OGAnzR1gcNgSfXZqRMUKv7lB91iCzhA41yM1Dxfs1NN91PNB
         cdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780422; x=1771385222;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKoCmVrrSKursSlU1GLGZdDvYA7k9AT9IwetYLGcTXI=;
        b=b4d8IMk3tUBjNP8MFn15GltUfFRJkMUWUlUm6l3ejlgcZmwRB9sFT0gMKxetFSJxPg
         nJG/22KyGq1EEcLd9eLv4ualkN9LfnRSDN0zmmZpVKI9t1SnG2+loGkInFoATQE7IHoV
         +ObjMq0ucn3ybveMgYtQ4T6+TsWZhzDqTBti9tSwrTbUsr63jbb+EyhZEjdp3f8GJOIj
         74Hftvya9q1+mcdP+J+cj/NylRG+EXa4wzeHCXzKAf6HU5WKt4w1/OI/orhMlyOLZcer
         Sh1aSHnRcCnd72OVKvbVVCPlV73LxRgBqe+ptRJuvihsxz6obY1yLE//9sw+afI69XZ1
         pTPA==
X-Gm-Message-State: AOJu0Yy5SCdYpL3AMCQCNMoruRw3eQ37lo8FUnfBvy4N843JIQJYsrQu
	79sgm5boCzFUOMtWsB4988Cy5e+du499rl12aiDq82AwS+7xmP/Aiz54
X-Gm-Gg: AZuq6aJCMdARtbimFU1Io5MWeA/B5rYPE2tORdfbG9cRo05b5uOJYwZKhOugbEKginq
	m/Koz5a4ivfrK7rzDImkBoXAlZQKqLR91Q3Vd3nsCcbjngDD7px54o81MjAhU3vgr1gAqFMrQD2
	m95geYsZMUKonJ18Rw27NFtuErAJ02sEgZV/NWbFDPj0+HwRZhXCpo1BJyIO0kpZXeXSMhq1wet
	ASPbk1P14s9hhGoBnrZmM8BGyz1kXb1znzU9/KXI/LZnr7nv/zCJJz44mI3zRgIdBBSdKeDFiD0
	p3RPsSCCQ6BEPLF+ReGY5NgRAu7cMVJFQt3NHj+0SRnJrkdMJjU36HBauorgzMXkBlJmpqDgFQG
	EnH2kpal+AmMJihD/1pu7YGak5YHv4qe1P4e+0N+WZvEc6iK3R9viluew6766ufs0u1veIacWbk
	WfJx3Rq5YRpcB5h5rQnI+/yAUal0C0W6ikzZHJk0P+a/oD6UZ75NiCgDSVvxzuFKkokBQxCgnGP
	bhbwLNu/sAnTO3XmjNYNkhX0rlbDOU9
X-Received: by 2002:a05:690c:c50c:b0:796:371c:caa4 with SMTP id 00721157ae682-796371cce0amr228355477b3.52.1770780421489;
        Tue, 10 Feb 2026 19:27:01 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254d5asm5290087b3.43.2026.02.10.19.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 19:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 21:26:44 -0600
Message-Id: <DGBT9JBFPRLY.PQX59G71WEAM@gmail.com>
To: "Ethan Luna" <trunixcodes@zohomail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove NDIS_802_11_RATES typedef
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260211024115.31339-1-trunixcodes@zohomail.com>
In-Reply-To: <20260211024115.31339-1-trunixcodes@zohomail.com>

On Tue Feb 10, 2026 at 8:41 PM CST, Ethan Luna wrote:
> The kernel coding style discourages typedefs, especially those that hide
> array types. Remove the NDIS_802_11_RATES typedef and replace its users
> with explicit unsigned char arrays.
>
> No functional changes.
>
> Signed-off-by: Ethan Luna <trunixcodes@zohomail.com>
> ---

You sent the exact same patch twice. As far as I can tell I don't see a
difference between them? However, had this been a revision, please only
send them every 24 hours.

>  drivers/staging/rtl8723bs/include/wlan_bssdef.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/st=
aging/rtl8723bs/include/wlan_bssdef.h
> index eb38594c8f5c..6ad73d4de6bf 100644
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -16,7 +16,7 @@
>  #define NDIS_802_11_LENGTH_RATES_EX     16
> =20
>  typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
> -typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];    =
    /*  Set of 8 data rates */
> +unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  =
Set of 8 data rates */
>  typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX=
];  /*  Set of 16 data rates */
> =20
>  struct ndis_802_11_ssid {

By removing the typedef you made this a global char array, just remove
the line entirely. And actually replace the users of this typedef. Which
you said you did in your patch notes?

Thanks,

ET
