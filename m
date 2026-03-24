Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255683876B7
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320465; cv=none; b=p/JyCAALh8/j2l9nhSqV49zXCBKbPXT4+M9ljDQfIcQPZA1zHAx9EGlVDOo7A9VH96sVqLti0dUJRpnmEkhhSTB3ys1zW2pf1xbplRk6UQgSDGeZndQKDKV2xJxfugJhNobW7RC2AHPsQl/NBwh1KGVSl6DZUNKInNBUTUe/+Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320465; c=relaxed/simple;
	bh=yeeCIoqZ+lYu/DvgKoHsQT9AtGbfF2MWmD4iMNl3Y2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mt9JptiqBNwnxIC8OTKHiMA2dKxX55nGFbCQFNVfNxT7IdyfrPKVHqpxktrMeUgszoACRo5vmLYikThyG++cnvPvMCdr2VP5nCZkp6IqUP+DZr0UAmrlHf2h8lkgdKyo+JaQXQ98qdjKHFtk/IyxQgn/4JfDMN+rJJm40BrB2gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK2pYW65; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK2pYW65"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a60975dc5so9528207b3.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774320463; x=1774925263; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7EiGPUnrspLxPPAsH9F/JNfnic9cFN4hpn5/2DF05k=;
        b=WK2pYW65XfjBjE7yu4UqwB8+dAbb/OMmB2M1BWcDkDiP3LfWWr1ZcCM7PBGF+uwdfK
         YdcT7QI60QSJxoTHhj4h08gdM1nMVuX+VpLWnpzcN+UYK4+JKTDAhtHdfqNndHHAmjbW
         b2/0+Nw2zjR9JiLfa048VKNnS8DlVj+iwShchsy99WeaChA7tEQ00+Ceczy3egUl1EeH
         8RwC5eTkDJ1uhYDZUQikvCpVgjMi/KLMB5bHm2hPVfLQHrjUTJkLsngYAXoncx4eFCcz
         cOpLueBWqBoNZCOPu3k5s/9oD63L4GDQWr0W3Qxst+B6aHxVNsdFEm4G2JcJN1aa9/sa
         Nr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774320463; x=1774925263;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M7EiGPUnrspLxPPAsH9F/JNfnic9cFN4hpn5/2DF05k=;
        b=Kml30IK4qJbUctPtBZ6hP3579OiIUmlOFKcypxOH1vd4ggsEOh9qgjf+Itv9IGFzAj
         karHGkHRP3ZFfmoDDsFNWN1Mhncq/Q7WfGJeZSYFTTphfbcd59jnOTNOFjsSbFuSEGmL
         4brErgFNKjwey7FjnEH4Q+EJj7qlmn934AmKn8PVmPKa0FU1bPjiQwkjzrejNgQ/gbzI
         WkY1B7omPFgyxVRvxmJ+OpgmoaOWcNmWyS0ppk91qw5UMtAj719S01UvhXgBgpaqkj1L
         e2tyqqY9JxLbvG2TzeoctyTJJxILZwFOkHShraVJIhM4hkuGya1SQWCi0eDiDmtxK1T0
         UmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXquCE+bM6NZOj1O5G/G2DG6FJIhdmrRLbzVyxkL2b1/+jf657eqFAldSnQ9Dmv2oxAeDDELyyN3J3cCyKe@lists.linux.dev
X-Gm-Message-State: AOJu0YyP4Bo/VMKnB8GS7AnhKQNUiAB25NMoATcHQG7jJnazqFE4wZCi
	n5qVM5n0qYc4qLUIiZHHGGXhJ3tYcf0+UNA54n0vfnI49ZKnywodumNP
X-Gm-Gg: ATEYQzweriCKol7MgSyjncD37D4VCfnIYAJKnwY+bw70FuN2URgqJ920u6OCK2PzXk0
	o84lSqlc4RmhDhmRQ6tGWD3aDx3pFBCBMHIMc3GYR+WsovrTNoivUh6G+Wt4g39BdRhpZ0gKjQz
	EfJR62LhAGS//ks1DvutHgHOayXn7tCEhKrsl08icMzCHKptQ5H8kcaVNdThB6KQb3xtENBXCni
	WzEZlrwBM1mLR/EUN0XsLLj22h+zX7t+F9HNCev+URYNlJJ1IFQHYkxgwHA4AMwtKBE2gDKe5rm
	Zyb00e/lpGGsR9l0gE+sNfnknd6fZgDxk+0vjM5mQo9QeYfdY279z8hO+upN04gIwhaeO2WnKOG
	E+ZBFUvMekXGKdLTDTzJzsQfU8V+OY9XOLwBnEUsxXzA17pNuhl2Ytzez4FPp/wYQbcns7KCPji
	hJujajGdoM/Sc3uTpYvNF4q6DFZCzF2csoN2HNZ/WXXCplTZmvp08OyM1oShpY4snNMhpUqRUat
	v6qo00wlBIdTr5QxaobmmIDRMFe54nP
X-Received: by 2002:a05:690c:102:b0:79a:7e0a:57fd with SMTP id 00721157ae682-79a90bf7b42mr150149137b3.45.1774320463207;
        Mon, 23 Mar 2026 19:47:43 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a2bc6sm66847307b3.5.2026.03.23.19.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 19:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 21:47:42 -0500
Message-Id: <DHAO3ZQ8EPCF.RAJ0TUZ6QEX0@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "sajal90" <sajal2005gupta@gmail.com>, <gregkh@linuxfoundation.org>,
 <s9430939@naver.com>
Cc: <andriy.shevchenko@intel.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: tidy logical continuations in
 xmit_linux.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260323191501.40269-1-sajal2005gupta@gmail.com>
In-Reply-To: <20260323191501.40269-1-sajal2005gupta@gmail.com>

On Mon Mar 23, 2026 at 2:15 PM CDT, sajal90 wrote:
> ---
You must have a SOB here above this line with your real name. Also, you
must have a patch note.

...

> -	if (!rtw_mc2u_disable
> -		&& check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true
> -		&& (IP_MCAST_MAC(pkt->data)
> -			|| ICMPV6_MCAST_MAC(pkt->data)
> -			)
> -		&& padapter->registrypriv.wifi_spec =3D=3D 0) {
> +	if (!rtw_mc2u_disable &&
> +		check_fwstate(pmlmepriv, WIFI_AP_STATE) =3D=3D true &&
> +		(IP_MCAST_MAC(pkt->data) ||
> +		 ICMPV6_MCAST_MAC(pkt->data)) &&
> +		padapter->registrypriv.wifi_spec =3D=3D 0) {
>  		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
>  			res =3D rtw_mlcst2unicst(padapter, pkt);
>  			if (res)

 You fixed the logical continuation problem but the alignment is still
 wrong. It should be something like:

	if (!rtw_mc2u_disable &&
	    check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
	    (IP_MCAST_MAC(pkt->data) ||=20
	     ICMPV6_MCAST_MAC(pkt->data)) &&
	    !padapter->registrypriv.wifi_spec) {

As you can see I removed the "=3D=3D true" and the "=3D=3D 0". Since you're
editing the line it's best to remove other checkpatch.pl warnings.
Mention these are removed in your patch notes aswell.

Thanks,

ET
