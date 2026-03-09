Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0BF375F93
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090711; cv=none; b=AaN27Km6zIy5v1IRSpj+ktIBVDeSr2V2bNjagtXbiYybW4Y8YDja/G8m1qI4VxKqrXUeGj7xH1AtXAyfsUo4G6Zmfkfoju/HpL+0hZYjxQp5orGDLbldr8EaNF4t8Y7v8zteIDbnxyzr3xnLeqvNtw/0bjTmefC+ImN5ROUreK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090711; c=relaxed/simple;
	bh=JzACS/y1Q9WyfZ+fCL65P842e1xal/u28TSBofD3CVU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MAfYw20SoO1T4BPL+MSzjuRc05myO2pNB17sIt4Rn2DxWYkdeec3DixHsAiZ43vqUXQ/RBtHsl5FoQyTFZ/2B3gKc6Wz8r0/mERT09LHf1x8V89D+oH1usT+Znm4cwaFC1i+oqyaYI1QPprx87o6yaTANud3uWZ0ZlggTiaCCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdiKivOV; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdiKivOV"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ca6595c8aso11938932d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773090709; x=1773695509; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak/4eqY34fIX7PaTZaLR/pZY6pvpRLz49msMdLlkqPk=;
        b=ZdiKivOV+Wyiszhi5iOFjPph+UM+qVRzvsPB0RBxd30zBidJyKl3xIl0bV6/JyLdOs
         BzGhcyfn8bAgtz2MQOW3qQ9SuCXVdsRboRNLJVWJGDUmlCL+otdWp+mnLY9Fg2+EjyKQ
         /9z+oSgxo7JgSx11rFxgdh3xYvIbWtA81pob8gk0OW0IQEVW6sxHO9Lk8mudxeTfzPUA
         ipYGcjXkjThwzdavBoHa5TETsRacGx7NvDs0TWWbuqRni3tJhG69da+jRmK3SsqpBrdR
         vwfnPoHSvstZ5cZxxNfgMCsgUM3zha+/2dHGJKifNw8TRbcHLDDg1pHFHSRH0r3H1pQ1
         NA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090709; x=1773695509;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ak/4eqY34fIX7PaTZaLR/pZY6pvpRLz49msMdLlkqPk=;
        b=bPx+D1Xq4sivDsJ6zSt4HF3wF6oOVZZ0eTTQ0OW1L5Sy08JaS75GdH9KqAFHWpa3wh
         Gnl++RoOP2Lq8gw0kVtLO2O/piaX79/MYJ7RE5NbB4ah3IJ/tLMIcsabobWFTBTtgkQW
         TQCIy5VimErmSrP8mUMGTrmz/ppxRmQmhD+VDY6ahSWEC9VByozaC7l7RZ7KTf0QSFXx
         veoMfAkLXgfAporckZIel0ZPz2S1ef2cJm7cIWSqBtwB92jueXg3fKRWKQXI3edKPqRy
         MYG2D15p4hOHuJXvZAK7dy0/j+dYHRe//054j+sH0jg8yb/YptFFoiBSItmjohyr+mCf
         po5g==
X-Forwarded-Encrypted: i=1; AJvYcCWPNc3WNTW5av6sDcFLYdAAP7gqEK2Vv/ot6ETm4pktiNvrGl0R4guyRk571nsSF714737/YbqobOHLaBND@lists.linux.dev
X-Gm-Message-State: AOJu0YzAnjsyPdzu0ejm0sGyk0msz0FjYQcL2SyZL5VD6OaLUfCYTVG7
	Yuyi0UmfBpKbtfplU7YkscMUDO+DxZVmeKIXKycFxQcWuKdvd0AjnBZQ
X-Gm-Gg: ATEYQzy95H8VhC8CKNMiEEEwISztTRwgWptqTkL3ZD/XkuKnV4H25KvyVqX6LRhajuG
	5S9ZWRsU4l3oa0Oh8KjRB/K0JfKzoGD2kZka/hVKZ3+3J3RnlNrwRlpEFGwejVXqtjSgh90u+5M
	2c4r2TNCMT2xYvNSxwhDjGuVZvKupjN/99s8f5o+DVLujkWhHhoJoZzo3X9bJ+5wlnqUjqfT5/Q
	S/U5W+Pb6vYtwmYct+t+GVbg5tVcFBxlKSrDz51Ub9tonewMq2sJvMgASAsqOe431GqfkWCoLvC
	rYOhFZ99ZssNJxfljT0q5XuM+QQ6fUuVkC4YK048ycwuaKpj83lErh3/2y9tDkpVoXBW009QmFY
	Ajij+X/f8y7zltlQLwRC80vfMAAaCeHD19yzlc6K26KfGIgJituMXS9Czjg3yP//Icxf38RUOtk
	zqBd3sQ9668CTzIunDERZQka4QbB91rpGEe3vq37+pYbf52pyFWjqVRUyQ0ITMR/y6SnpfBl9wG
	OmgJkQ3eyRIIjajkDgISUun/LNDhvfX
X-Received: by 2002:a05:690e:16e1:b0:64a:e61f:a6f7 with SMTP id 956f58d0204a3-64d1432b31dmr9585720d50.71.1773090709393;
        Mon, 09 Mar 2026 14:11:49 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176dbf6asm5153461d50.19.2026.03.09.14.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 14:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 16:11:30 -0500
Message-Id: <DGYK6Y3WZS4S.SNIAS3Q1W6A4@gmail.com>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ayan Mahmood" <ayanmahmood249@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309202118.10589-1-ayanmahmood249@gmail.com>
In-Reply-To: <20260309202118.10589-1-ayanmahmood249@gmail.com>

On Mon Mar 9, 2026 at 3:21 PM CDT, Ayan Mahmood wrote:
> Refactor lines exceeding 100 characters in rtw_pwrctrl.c to
> comply with kernel coding style as noted in the driver TODO.
>
> Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>

...

>  			hal_btcoex_LpsNotify(padapter, ps_mode);
>  		}
>  	} else {
> -		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI=
_ASOC_STATE)) ||
> +		if ((PS_RDY_CHECK(padapter) &&
> +		     check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
>  		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(pada=
pter)))
>  			) {

Go ahead and put the ) { in the correct spot:

  		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padap=
ter)))) {

Thanks,

ET
