Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0456371D0D
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775484639; cv=none; b=XodKVBUgzwEW9C17ZqKkxp4frmOoerlDXEg7fmVDxD+uIOvgFM25iP50QaBINRI5l2OxoyUBc1U679ByC8NNxRHbTx+O9KSRsNBee81j6xIes9buvc9EYURss6w3ziaflpO7aSD/5TRsr+hto51GKJBa0b8HDU0gGTIKJvNJhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775484639; c=relaxed/simple;
	bh=WsHjgXnvDrE9pk40jE8qlW1uuW0KdiItS96lKx/Kjgk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=G2kp0U6H6jQQh+5urG0yvz6gmla6x86anmmGYfgHllanf3uLuJdUlOyKeaVZvHTSPwKVaKX6Q9H9E4jGGoul9yjc2a8NAeLS/YFTwyLGXOUxNWT/GSMG/4RuoDhKEPAJej4FhtHRRfMb2o+dfcehTjielz15VdV05wnmpD06idk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1EW4Cu/; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1EW4Cu/"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-650152687c8so3687553d50.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775484636; x=1776089436; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZU933U73DBF9ZYWuwmOoSw7AnVg8tqJ96a3q6H+Qo=;
        b=E1EW4Cu/02LGjafk3IQImIMT0tmMg6/412faBJttALujpfP5D/wbeZdz9uhHkvG8sQ
         84MtygB3YTCeeUMlU7uoQ/ehOyKHGTbiyxTvlXTjmjWUmRcuUjIL6oE0Gz0KGRka9nA/
         J8N5ZOpCyZEocBl5QJ0FMCZcGu3OsnrHkptixAe41CNlfApLQMq67OCGtWm/ReE/ZkSj
         Mh0+4W4mBjtoAAeDP2cihTWKX84UpZdih/L39Kpx+GAmYIvUI+F4GeObbcdUEC+EDKRM
         oXcFrihWSQzxRhp5TQQILyqoQPjYKkHWYETzW3GayRaroj+r6qqFHQeGzIS3+GtFq+xc
         S2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775484636; x=1776089436;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPZU933U73DBF9ZYWuwmOoSw7AnVg8tqJ96a3q6H+Qo=;
        b=nc3/+LzMCaG5OPy2w+m3QPRyCOELsZDknIilrkiBHz8HOC3Rb0MwGDJ5/AG5azf/Ul
         i4KulG/55Lt12bqJx8Nyd9loqbI43h/a3v2xg8LXsKSddum5O1qo/dOIUY6RoTbkw2v6
         YZAxdzHIx1E3GPbsoZaOwI4mJyrzfkBDF4skz+QbFBa7Jcn6eP7dm9Ffw8uVSx78/LOr
         sDkWgYsytoAxjSjdR5jI5UVrj+2+zsZR0aKGn6fBKUZb/25n9UY7GxtBH7t7h/gpco8e
         dY2abNiys0uNSy5OdvfvjdqZZxLyKw8yyC2QOUEs4JnARUh/4S5NrdoRUnMcwFzzOlvM
         nEtw==
X-Forwarded-Encrypted: i=1; AJvYcCW6VAA1Po9s13W3+LeyPFxocO/8C3DPT6YvlY/tkhAZMXlH4j32E9HqxasjnZOAS9r9tEQ2gSEz6CfkAUkd@lists.linux.dev
X-Gm-Message-State: AOJu0YwjAEhDR2/oCOjnLPh7eWmvzBa7qiU69JwQVPORjrwJYxiSIFc5
	uASjIxlPotlHMoqO/J5fmDveaDPb2VN4VSzgeLNug6sK07mcfcIk/aRo4oexkA==
X-Gm-Gg: AeBDietBOtYTcHvfi5OrGuLYSp1eIUgR0JdH9M8zzC36iWjXKa0XvmMB3E7TeD5+VJi
	u0xd9S1+/HxZrHox0LFbl13XUBZ7OT79EJPoaVpDtjXE27L5czdRzLZpN8CrWV57kjOZe524ZIb
	6Ua0Fw5b1PRa+xZQcQbz7oZlSrfrEqOymZPqjMQEvBYqEGy9UTo2HbH5wsrH5P29VpioIQ6z/gn
	usq5Yy6hheX7MpPpSEtc/C1bxhqPFzTE8Tp70abukKleoP8ZhOmNDRUrHzgr+kjEVgTfFfBFv/C
	HL/f/3fHIeRmnnew++OxsyT1W5bUt3I+hgMq2cQNDqwDW/C2w3z3BBV16QL8vRaPOz8fgJyb0QD
	5h492611iP2bR3P63qsaFOGaEYThiBGRlu9xiYp3vuxLgWKvV2swIpt53bB4ZVh8bdCIl3rdP6z
	RmGMYonGg3fBy65dbUCm+ulajded+v4egw
X-Received: by 2002:a05:690c:660e:b0:79e:1fe4:80d7 with SMTP id 00721157ae682-7a4d5d5d907mr120518567b3.48.1775484635445;
        Mon, 06 Apr 2026 07:10:35 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df16aasm52801837b3.40.2026.04.06.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant boolean
 comparisons
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: dhpatel1@proton.me
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260405211758.45598-1-dhpatel1@proton.me>
References: <20260405211758.45598-1-dhpatel1@proton.me>
Date: Mon, 06 Apr 2026 17:10:26 +0300
Message-Id: <177548462679.6937.477162685936326993.b4-review@b4>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775484632; l=2658;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=WsHjgXnvDrE9pk40jE8qlW1uuW0KdiItS96lKx/Kjgk=;
 b=KoI9WfS35bzoDEutj6IiKvKp91HxqTICOBPpkp9BF2lILBqTXXsBbdz/rMOYZpkEaPWOtWvEY
 mrqXgO9cnuhDRlZbIVi/XAVNZC+F66LzPGrcIVDhelrEoi5U0nvyGGC
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

On Sun, 05 Apr 2026 21:19:34 +0000, dhpatel1@proton.me <dhpatel1@proton.me> wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 7bce0343d59f..f4c918b9ad31 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -386,7 +386,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>  	} else {
>  		while (true) {
>  			/* IOT action */
> -			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
> +			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
> +			    (pattrib->ampdu_en) &&

Are those parentheses around 'pattrib->ampdu_en' really neccessary?

> @@ -719,7 +720,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>  		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
>  			res = _FAIL;
>  			goto exit;
> -		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
> +		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
> +			  !(psta->state & _FW_LINKED)) {

Here it is worth aligning in the same way as in the previous change:

	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) &&
		   !(psta->state & _FW_LINKED)) {

> @@ -901,7 +903,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  	SetFrameSubType(fctrl, pattrib->subtype);
>  
>  	if (pattrib->subtype & WIFI_DATA_TYPE) {
> -		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
> +		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {

Why not also remove the extra space before 'WIFI_STATION_STATE' here...

> @@ -915,7 +917,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (pqospriv->qos_option)
>  				qos_option = true;
> -		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
> +		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {

and before 'WIFI_AP_STATE' here?

> @@ -924,8 +926,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (pattrib->qos_en)
>  				qos_option = true;
> -		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
> +		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
> +		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {

Align the second condition the same way as the first one, just like you
did at the beginning.

-- 
Nikolay Kulikov <nikolayof23@gmail.com>
