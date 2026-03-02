Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5F23909AF
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772485947; cv=none; b=d68MNqVMbsjld663mfIOQEGJ4T+f0cFd1WUobBzvgMJPp0m+seraJ8Rmo8Waa6KNg+11V3qHe+w46j/AscJYtcKBfmIVBz/OlG8FeNZmxedY1Yxzn83iPOtQEFtmWRg+yQ+KOW4YZgccWpKB924d7pEM8Mbab6X/BocSfTccLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772485947; c=relaxed/simple;
	bh=2xFHj/UE82dqOU8pH0QS7JyYvEMtTH3P1lQF2rciO5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QcFio3TU9/E/pcR1wd2WSuEWcRahBa6Ts4zgHq6560X5bcxVoDjo/uBtPbaWQptcxKMrMphozcaxfp/DjmwmxDemRpDGilQbl6LSHE45FlL3sQQ0v7gNl6te84Lx9q6aHCK+rgL/cG5hQVoo+PSPQqWpkl5DYJZg+pI8xV0JrvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxkHjRN6; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxkHjRN6"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64caaacb9bcso4682531d50.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772485945; x=1773090745; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBja4YTvutTMTWbavEca/yFJrkw/+ippPZq5wl27/UY=;
        b=cxkHjRN6BcYVaKh51lP67cmUTKOX39rP37BjIg2IJdsL1m5+uiPXBA2AdVFfx3VoHr
         TF/If49+iXbm9ARWzaIZnsF7eA1qlrceuE10+Bl1TQTWcZ316Ku0pKZFC/pw4LV2YOkV
         yW0Le3yc9pni9OxHlP03yeYBfDHuRtoQuACYzUWcU/Tnrym9e1VPKlK4h5Bun5VkQZtH
         InefV4cDucbzLX0hRUUWwz1C/l5EdcbgcXEJwnfCinor3eDmNUIIl+CJYValANGEQlYh
         Da3zMD0ToT11Brds+Yr/bMygt9m6iVpYAjnGS7Xnk7+Hg4zA9/ew6TcJMhzHUtHsR92S
         gDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485945; x=1773090745;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBja4YTvutTMTWbavEca/yFJrkw/+ippPZq5wl27/UY=;
        b=FcIgFYLWNljcCyQWQzFs38pbgQEzSIdEboYw9dOFE6+LenIzd9GoAR8gmZ9wYXCl1H
         gdxey808Ljtgia2msarccrUmG+OEaJXyCj0Vl/w7Am5AOvawwISjEbjcgGdyOrYX/9ZR
         hfP/Y8JKK8FDUOALcXM7J4QGR3fNKDoaQbnk4OVCBbmVhYxWXdvOeP9xnLACFxyHIyZp
         fGMRQ81Xgt/UG2U1mx6XAis9trdEHXxpPyHFfIa46tK51zide8t8xwsD9+cxw78h92MD
         L4vlDTsiQj1o+LKKqwmT1xfvdZItkQhuVZ7PuRNLYEghH9gdWHg0XaM2YrVPJDKXxXxp
         GRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeMtIu4v3hzet2d2AEmH6gCazkLFd4VoTzR3HJiLjcEWLnnJsRPAx0c696AOFQk+wKoPDQBaoJM0oAdMX6@lists.linux.dev
X-Gm-Message-State: AOJu0YztGL7bsxZfd/KWoYSwc9M2kKZcjzXq6V1ShHRSGhHyCMs+eYlP
	FERynVZUckwMaOJD7+3RwZzdK98puZYOUIC2QhvLvTxFceuz0JF+nzD/
X-Gm-Gg: ATEYQzwSAG1JXOs0FF7IDbVs7WpAbJjqN1F0Pk7DdU85Vaz1XkUQRhvHLMnXpjYhtkF
	QHexR1p8bFY5jJIS6bQEMR10XG9Sglb4oIY7T43cWLQ15D7sIhiYg+9CFzW3SxGW3rxef0DPDDe
	dXlik7wnrEN8PQ48wL3PrJPhHyUORBYJ9Eh7QisQib2Hv/l7MjaKnK2TSDTz9uy75WBsXfMF2+N
	F1iOGftIMUy/T7SGxGEcXHlA+NvTWFkBtws/LunbUT4XMK0D6K3az95CIz4/imVoDP95IlZEaMG
	eeOJxPcu6kB2Gmp7+Qx5fhWYWdz6kjb5s7p5eutcp6JDMx0082ek9bpNO7zpRl8zHHGNHUzF2Et
	GpIFIYP7ePEQjGnnqzp0RyouBUp/9xzvGPKazs4bVkSz+55uux2oSVQmtAYosSSVs72PXgDBCk3
	OD1IXqiDU4fg6Pq6aPa2xZeFFRkak997JkVocIq4eHiQceTvIgeVfuvFBIgr8EKMmFT58F0ULwN
	aZltYy82agaW/GehLOTMwFrwDP9c4Q2
X-Received: by 2002:a53:e319:0:b0:646:a1ba:7168 with SMTP id 956f58d0204a3-64cc22cd0c4mr8569028d50.67.1772485944721;
        Mon, 02 Mar 2026 13:12:24 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7650ac4sm6009842d50.21.2026.03.02.13.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:12:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:12:05 -0600
Message-Id: <DGSLTL0V29WY.10JGCNINX01CP@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, "Navaneeth K" <knavaneeth786@gmail.com>,
 "Nikolay Kulikov" <nikolayof23@gmail.com>, "Bryant Boatright"
 <bryant.boatright@proton.me>, "Tanjim Kamal" <tanjimkamal1@gmail.com>,
 "William Hansen-Baird" <william.hansen.baird@gmail.com>, "Artur Stupa"
 <arthur.stupa@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix bitwise OR operator spacing
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302185340.61540-1-azpijr@gmail.com>
In-Reply-To: <20260302185340.61540-1-azpijr@gmail.com>

On Mon Mar 2, 2026 at 12:53 PM CST, Jose A. Perez de Azpillaga wrote:
> Fix spaces between bitwise OR operations rtw_action_frame_parse() for
> better readability.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/sta=
ging/rtl8723bs/core/rtw_ieee80211.c
> index dbd4bcc8cd28..446e4051b9ae 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
> @@ -1123,8 +1123,8 @@ int rtw_action_frame_parse(const u8 *frame, u32 fra=
me_len, u8 *category, u8 *act
> =20
>  	fc =3D le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control=
);
> =20
> -	if ((fc & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE))
> -		!=3D (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)
> +	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE))
> +		!=3D (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION)
>  	) {
>  		return false;
>  	}

Since you're editing this if statement it's preferred that you tidy it
up according to kernel standards that'd be:

	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE)) !=3D
	    (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION))
	    	return false;

Thanks,

ET
